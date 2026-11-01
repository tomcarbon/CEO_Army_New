# Adapters

An adapter turns the platform-neutral charters in `roles/` into agents a specific platform can
run. Charters are the truth; adapter output is derived and should be regenerated, not edited.

## What a charter gives you

Front-matter fields every adapter can rely on:

| field | meaning |
|-------|---------|
| `id` | unique kebab-case name; use as the agent name |
| `title` | human-readable |
| `type` | `ai` — render an agent; `human` — skip (or render a description for the humans) |
| `department` | grouping |
| `reports_to` / `direct_reports` | the hierarchy, by id |
| `tools` | platform-neutral capability list: `read`, `write`, `shell`, `web`, `delegate` |
| `model_hint` | `frontier` / `default` / `economy` — map to your platform's model tiers |

The body (sections 1–9) is the system prompt. Append a platform-specific footer telling the
agent where it is and how to hand off.

## Capability mapping

| neutral | meaning |
|---------|---------|
| `read` | read files, search the repo |
| `write` | create/edit files |
| `shell` | run local commands (tests, builds, scripts) |
| `web` | fetch pages / search the web |
| `delegate` | launch other agents. Usually only the top of the hierarchy has this. |

Grant nothing the charter doesn't list. Least privilege is part of the design, not a
platform detail.

## Writing a new adapter

1. Create `adapters/<platform>/README.md` describing the mapping and any platform constraints
   (e.g. "agents can't spawn agents", "no shell", "tool names").
2. Provide `render.sh` (or equivalent) that reads `roles/**/*.md` and writes the platform's
   agent files. Keep it dependency-free where possible so any machine can run it.
3. Provide `check.sh` that verifies every AI charter has a rendered agent and vice-versa.
4. Document how the hierarchy is exercised on that platform: who is the entry point, how
   multi-level delegation happens, where records get written.
5. Record the adapter's adoption as a decision.

## Existing adapters

- `claude-code/` — Claude Code subagents. Main session = CEO.
