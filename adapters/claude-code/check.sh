#!/usr/bin/env sh
# Consistency checks: ORG.md ↔ roles/ ↔ .claude/agents/; charter sections; secret patterns.
set -u
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/../.." && pwd)
FAILS="$ROOT/.check-fails.tmp"; : > "$FAILS"
say() { echo "FAIL: $*"; echo x >> "$FAILS"; }

# 1. Every charter path listed in ORG.md exists; every charter is listed in ORG.md.
grep -o 'roles/[a-z]*/[a-z-]*\.md' "$ROOT/ORG.md" | sort -u > "$ROOT/.check-org.tmp"
(cd "$ROOT" && ls roles/*/*.md | grep -v _TEMPLATE | sort -u) > "$ROOT/.check-fs.tmp"
comm -23 "$ROOT/.check-org.tmp" "$ROOT/.check-fs.tmp" | while read -r p; do say "ORG.md lists $p but it does not exist"; done
comm -13 "$ROOT/.check-org.tmp" "$ROOT/.check-fs.tmp" | while read -r p; do say "$p exists but is not in ORG.md"; done

# 2. Every AI charter has a rendered agent; every agent has a charter.
for f in "$ROOT"/roles/*/*.md; do
  case "$f" in *_TEMPLATE.md) continue;; esac
  type=$(awk -F': *' '$1=="type"{print $2; exit}' "$f")
  id=$(awk -F': *' '$1=="id"{sub(/ *#.*$/,"",$2); print $2; exit}' "$f")
  tools=$(awk -F': *' '$1=="tools"{print $2; exit}' "$f")
  case "$tools" in *delegate*) ;; *)
    if [ "$type" = "ai" ] && [ ! -f "$ROOT/.claude/agents/$id.md" ]; then say "no agent for $id (run render.sh)"; fi;;
  esac
  # 3. All nine sections present.
  for n in 1 2 3 4 5 6 7 8 9; do
    grep -q "^## $n\. " "$f" || say "$f missing section $n"
  done
done
for a in "$ROOT"/.claude/agents/*.md; do
  [ -f "$a" ] || continue
  id=$(basename "$a" .md)
  grep -rlq "^id: $id\$" "$ROOT"/roles/*/ || say "agent $id has no charter (stale — run render.sh)"
done

# 3b. Model profile: config/models.yaml exists, active profile complete, rendered models match it.
MODELS="$ROOT/config/models.yaml"
if [ ! -f "$MODELS" ]; then say "config/models.yaml missing"; else
  PROFILE=${MODEL_PROFILE:-$(awk -F': *' '$1=="active"{sub(/ *#.*$/,"",$2); print $2; exit}' "$MODELS")}
  tier() { awk -v p="$PROFILE" -v t="$1" '
    /^profiles:/ {inp=1; next}
    inp && /^  [a-zA-Z0-9_-]+:/ { cur=$1; sub(/:$/,"",cur); next }
    inp && cur==p && /^    [a-z]+:/ { k=$1; sub(/:$/,"",k); if (k==t) { v=$2; sub(/ *#.*$/,"",v); print v; exit } }
  ' "$MODELS"; }
  M_FRONTIER=$(tier frontier); M_DEFAULT=$(tier default); M_ECONOMY=$(tier economy)
  for pair in "frontier:$M_FRONTIER" "default:$M_DEFAULT" "economy:$M_ECONOMY"; do
    [ -n "${pair#*:}" ] || say "config/models.yaml profile '$PROFILE' missing tier '${pair%%:*}'"
  done
  for f in "$ROOT"/roles/*/*.md; do
    case "$f" in *_TEMPLATE.md) continue;; esac
    id=$(awk -F': *' '$1=="id"{sub(/ *#.*$/,"",$2); print $2; exit}' "$f")
    a="$ROOT/.claude/agents/$id.md"; [ -f "$a" ] || continue
    hint=$(awk -F': *' '$1=="model_hint"{sub(/ *#.*$/,"",$2); print $2; exit}' "$f")
    case "$hint" in frontier) want=$M_FRONTIER;; economy) want=$M_ECONOMY;; *) want=$M_DEFAULT;; esac
    have=$(awk -F': *' '$1=="model"{print $2; exit}' "$a")
    [ "$have" = "$want" ] || say "agent $id has model '$have' but profile '$PROFILE' says '$want' (re-run render.sh)"
  done
fi

# 4. Rendered agents match adapter output (no drift between the two copies).
for a in "$HERE"/agents/*.md; do
  [ -f "$a" ] || continue
  cmp -s "$a" "$ROOT/.claude/agents/$(basename "$a")" || say "$(basename "$a") differs between adapters/claude-code/agents and .claude/agents"
done

# 5. Secret-looking strings.
if grep -rInE '(sk-[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY|ghp_[A-Za-z0-9]{30,}|xox[abp]-[A-Za-z0-9-]{10,})' "$ROOT" --exclude-dir=.git --exclude='*.tmp' --exclude='check.sh' >/dev/null 2>&1; then
  say "secret-looking string found (see grep above)"
  grep -rInE '(sk-[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY|ghp_[A-Za-z0-9]{30,}|xox[abp]-[A-Za-z0-9-]{10,})' "$ROOT" --exclude-dir=.git --exclude='*.tmp' --exclude='check.sh'
fi

fail=$(wc -l < "$FAILS" | tr -d ' ')
rm -f "$ROOT/.check-org.tmp" "$ROOT/.check-fs.tmp" "$FAILS"
[ "$fail" -eq 0 ] && echo "OK: org chart, charters, agents, model profile and secrets check pass"
[ "$fail" -eq 0 ]
