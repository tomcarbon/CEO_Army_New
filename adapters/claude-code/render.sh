#!/usr/bin/env sh
# Render roles/**/*.md into Claude Code subagent files.
# Usage: ./adapters/claude-code/render.sh   (run from repo root or anywhere; paths resolved)
set -eu

HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/../.." && pwd)
OUT="$HERE/agents"
LIVE="$ROOT/.claude/agents"
MODELS="$ROOT/config/models.yaml"

# Resolve the model tier profile before touching any output.
[ -f "$MODELS" ] || { echo "error: $MODELS not found" >&2; exit 1; }
PROFILE=${MODEL_PROFILE:-$(awk -F': *' '$1=="active"{sub(/ *#.*$/,"",$2); print $2; exit}' "$MODELS")}
[ -n "$PROFILE" ] || { echo "error: no 'active' profile in $MODELS and MODEL_PROFILE unset" >&2; exit 1; }
tier() {  # tier <name> → model for that tier in $PROFILE
  awk -v p="$PROFILE" -v t="$1" '
    /^profiles:/ {inp=1; next}
    inp && /^  [a-zA-Z0-9_-]+:/ { cur=$1; sub(/:$/,"",cur); next }
    inp && cur==p && /^    [a-z]+:/ { k=$1; sub(/:$/,"",k); if (k==t) { v=$2; sub(/ *#.*$/,"",v); print v; exit } }
  ' "$MODELS"
}
M_FRONTIER=$(tier frontier); M_DEFAULT=$(tier default); M_ECONOMY=$(tier economy)
for pair in "frontier:$M_FRONTIER" "default:$M_DEFAULT" "economy:$M_ECONOMY"; do
  [ -n "${pair#*:}" ] || { echo "error: profile '$PROFILE' in $MODELS is missing tier '${pair%%:*}'" >&2; exit 1; }
done

mkdir -p "$OUT" "$LIVE"
rm -f "$OUT"/*.md "$LIVE"/*.md

FOOTER='---
You are running as a Claude Code subagent inside the company repo. Read `CLAUDE.md`, `COMPANY.md` and `docs/handoff-format.md` before acting. Write your outputs to the paths your charter names. You cannot launch other agents; if your charter says to delegate, write the child work orders and return them to the CEO. End with a short deliverable block (what you produced, where, how to verify, what you did not do, approximate cost).'

count=0
for f in "$ROOT"/roles/*/*.md; do
  case "$(basename "$f")" in _TEMPLATE.md) continue;; esac

  # Extract front-matter (between the first two '---' lines).
  fm=$(awk 'NR==1 && $0=="---"{inb=1; next} inb && $0=="---"{exit} inb{print}' "$f")
  body=$(awk 'NR==1 && $0=="---"{inb=1; next} inb && $0=="---"{inb=0; out=1; next} out{print}' "$f")

  get() { printf '%s\n' "$fm" | awk -v k="$1" -F': *' '$1==k{sub(/^[^:]*: */,""); sub(/ *#.*$/,""); print; exit}'; }
  id=$(get id); type=$(get type); title=$(get title); tools=$(get tools); hint=$(get model_hint)

  [ "$type" = "ai" ] || continue
  [ -n "$id" ] || { echo "skip (no id): $f" >&2; continue; }
  # Roles that delegate are entry points (the main session), not subagents.
  case "$tools" in *delegate*) echo "skip (entry point, has delegate): $id"; continue;; esac

  # Mission first sentence → description.
  mission=$(printf '%s\n' "$body" | awk '/^## 2\. Mission/{m=1; next} m && /^## /{exit} m && NF{print}' | tr '\n' ' ' | sed 's/  */ /g; s/^ //; s/\([.!?]\) .*/\1/')
  desc="$title. $mission Use for work that falls under this role's charter (roles/$(basename "$(dirname "$f")")/$(basename "$f"))."

  # Tools mapping.
  cc_tools=""
  add() { cc_tools="${cc_tools:+$cc_tools, }$1"; }
  case "$tools" in *read*)  add "Read, Grep, Glob";; esac
  case "$tools" in *write*) add "Edit, Write";; esac
  case "$tools" in *shell*) add "Bash";; esac
  case "$tools" in *web*)   add "WebFetch, WebSearch";; esac

  case "$hint" in frontier) model=$M_FRONTIER;; economy) model=$M_ECONOMY;; *) model=$M_DEFAULT;; esac

  {
    echo "---"
    echo "name: $id"
    echo "description: $desc"
    [ -n "$cc_tools" ] && echo "tools: $cc_tools"
    echo "model: $model"
    echo "---"
    echo
    echo "<!-- GENERATED from roles/$(basename "$(dirname "$f")")/$(basename "$f") by adapters/claude-code/render.sh — edit the charter, then re-render. -->"
    echo
    printf '%s\n' "$body"
    echo
    printf '%s\n' "$FOOTER"
  } > "$OUT/$id.md"
  cp "$OUT/$id.md" "$LIVE/$id.md"
  count=$((count+1))
done
echo "rendered $count agents (profile: $PROFILE — frontier=$M_FRONTIER default=$M_DEFAULT economy=$M_ECONOMY) → $OUT and $LIVE"
