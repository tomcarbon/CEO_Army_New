# Claude Code adapter

Renders `roles/**/*.md` into `.claude/agents/<id>.md` so that each AI role is a Claude Code
subagent, and makes the main session act as the CEO via the repo's `CLAUDE.md`.

## Constraint you must know

**Claude Code subagents cannot launch subagents.** Only the main session can. So:

- The **main session is the CEO**. `CLAUDE.md` tells it so.
- Every other role is a subagent. VPs can *plan and assign* but cannot *dispatch*: a VP
  subagent returns child work orders and recommendations; the CEO then launches the
  individual contributors itself.
- This flattens execution, not authority. The records still show the VP as the issuer of the
  child work orders; the CEO is acting as the VP's hands.
- QC and Ethics are launched by the CEO like any subagent — but the human chair can also
  ask for them directly in the prompt ("As QC, review WO-0003 and report to me"), and their
  reports go to `records/reports/` addressed to the human regardless of who launched them.

## Mapping

| charter field | agent file |
|---------------|------------|
| `id` | frontmatter `name` |
| `title` + section 2 (Mission) first sentence | frontmatter `description` (when to use this agent) |
| `tools` | frontmatter `tools`: `read`→`Read, Grep, Glob`; `write`→`Edit, Write`; `shell`→`Bash`; `web`→`WebFetch, WebSearch`; `delegate`→ omitted (subagents can't) |
| `model_hint` | frontmatter `model`, via the active profile in `config/models.yaml` (standard: `frontier`→`opus`, `default`→`inherit`, `economy`→`haiku`) |
| body | system prompt, plus the footer below |
| `type: human` | not rendered |
| `tools` contains `delegate` | not rendered — the role is an entry point (the main session), not a subagent. Today that is only the CEO. |

Footer appended to every agent:

> You are running as a Claude Code subagent inside the company repo. Read `CLAUDE.md`,
> `COMPANY.md` and `docs/handoff-format.md` before acting. Write your outputs to the paths
> your charter names. You cannot launch other agents; if your charter says to delegate,
> write the child work orders and return them to the CEO. End with a short deliverable
> block (what you produced, where, how to verify, what you did not do, approximate cost).

## Commands

```bash
./adapters/claude-code/render.sh                        # roles/ → adapters/claude-code/agents/ and .claude/agents/
MODEL_PROFILE=economy ./adapters/claude-code/render.sh   # same, with a cost profile from config/models.yaml
./adapters/claude-code/check.sh                         # ORG.md ↔ roles/ ↔ .claude/agents/; sections; model drift; secret grep
```

Both are POSIX shell + awk; no other dependencies.

## Running a day

```bash
cd CEO && claude
```

Then, as a human chair, speak to the CEO. Examples:

- `Board direction: <what you want>. Report back.`
- `Status?` — CEO reads records and gives the standup.
- `As QC, audit everything closed this week and report to me.`
- `Request: <gated thing>` — the CEO will file a request-for-approval; answer it in the
  report file or in-session (the CEO will record your answer).

## Model tiers

Three levels of control, cheapest to most precise:

1. **Session model** — `/model` in Claude Code. The main session (CEO) and every role whose
   tier resolves to `inherit` follow it.
2. **Tier mapping** — `config/models.yaml` says what `frontier` / `default` / `economy` mean.
   Pick a profile with `active:` (or one-off: `MODEL_PROFILE=economy ./adapters/claude-code/render.sh`)
   and re-render. This switches the whole company's cost mode without touching charters.
3. **Per role** — a charter's `model_hint` puts that role in a tier. Edit the charter, re-render.

`check.sh` fails if rendered agents don't match the active profile ("edited models.yaml,
forgot to re-render"). The Cost Analyst's job is to recommend profile or tier changes with
evidence from QC verdicts; VP Finance signs off. Never edit the agent files directly.
