# The Company

An internal software company run by AI roles, governed by a board of human and AI chairpersons.

This repository is not an application. It is the company itself: who exists, who reports to
whom, how work moves, what the AIs may decide alone, what needs a human, and everything the
company has ever decided. Pair it with a real project and the roles go to work on that project.

## Why it looks like this

Three facts about AI agents shape every design choice here:

1. **Agents forget.** Each invocation starts from nothing. So the repo is the company's memory
   — decisions, tasks, budgets and reports live in `records/` as plain files. If it isn't
   written down, it didn't happen.
2. **Agents will do exactly what they're told, including the wrong thing.** So every role has a
   charter with explicit authority limits and anti-responsibilities, and there is an
   independent QC line that reports to a human.
3. **Platforms change.** So the charters in `roles/` are platform-neutral, and `adapters/`
   render them into whatever runtime you use. Today: Claude Code. Tomorrow: anything.

## Map

| Path | What it is |
|------|------------|
| `COMPANY.md` | Mission, values, the four principles, how the board works |
| `ORG.md` | The org chart, reporting lines, who can halt what |
| `docs/` | Protocols: delegation, hand-off formats, escalation, human approval gates, legal guidelines, glossary |
| `roles/` | One charter per role, all using the same nine sections (`roles/_TEMPLATE.md`) |
| `adapters/` | How charters become runnable agents on a given platform |
| `.claude/agents/` | Rendered Claude Code subagents (generated — edit the charter, not these) |
| `config/` | Provider candidates for media generation; budget ceilings. No secrets. |
| `records/` | The company's memory: decisions, board minutes, reports, work orders |
| `projects/` | How a paired project plugs in |

## Quick start (Claude Code)

```bash
cd CEO
claude
```

The main session *is* the CEO (see `CLAUDE.md`). Try:

> Board direction: propose a name and one-line mission for our first project. Report back.

The CEO will consult the relevant VPs as subagents, open a work order in
`records/work-orders/open/`, and write a board-ready report to `records/reports/`.

To talk to QC directly (as the human chair):

> As QC, review work order WO-0001 and report to me.

## Running a "day"

A day is one CEO session. Suggested rhythm:

1. **Standup** — CEO reads `records/work-orders/open/`, `records/board/` for new direction,
   and the last report in `records/reports/`.
2. **Dispatch** — CEO opens/updates work orders and delegates per `docs/delegation-protocol.md`.
3. **Review** — deliverables come back; QC reviews anything marked done.
4. **Report** — CEO writes the day's report to the board. Chief of Staff updates the
   decision log. Board Secretary files any resolutions.
5. **Commit** — a human commits (for now). Git ownership transfers to DevOps/Release per
   `records/decisions/0001-adopt-framework.md` when the board resolves it.

## Pairing a project

See `projects/_TEMPLATE/README.md`. A project may live inside `projects/<name>/` or in its own
repository referenced from there. Either way, work orders and reports about it live here.

## For the humans

You are chairpersons. You give direction, approve gated actions, and read reports. You do not
need to understand the internals to do that — `docs/glossary.md` defines every term used here,
and `roles/board/chair-human.md` describes what the company expects from you and what you can
expect back. Ask the CEO to explain anything; teaching you is in its charter.

To run the company cheaper or stronger, change `active:` in `config/models.yaml` and re-render
(`./adapters/claude-code/render.sh`); the file explains the trade-off.
