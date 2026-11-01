# Approval Gates

Actions that require a **human chair's** explicit approval before they happen. These exist so
that the AI company can be fully trusted inside the repo precisely because it cannot act
outside it without a person.

## The gates

| Gate id | Triggered by |
|---------|--------------|
| `spend` | Any action that would take cumulative spend past a line in `config/budgets.yaml` (per work order, per role, per project, or company total). |
| `external-publish` | Anything that leaves the repo: publishing a site or package, posting, emailing, messaging, opening a PR on an external repo, submitting to a store or marketplace, uploading media. |
| `credentials` | Creating, reading, storing, or using any secret, API key, token, password, or account login. Includes "just testing" the key. |
| `delete` | Deleting or overwriting files outside the current work order's own outputs; deleting records; rewriting git history; force-pushes. |
| `new-provider` | Opening an account with, or first use of, any external service or generative provider. |
| `personal-data` | Collecting, storing, or processing data about identifiable people. |
| `dual-use` | Any output the Ethics & Safety Officer flags as potentially harmful if misused. |

## How to request approval

1. Set the work order `status: blocked` and list the gate in `gates:`.
2. Write a `request-for-approval` report to `records/reports/` (template in
   `handoff-format.md`) stating: the action, the gate, why it's needed, the cost, the risk,
   what happens if declined, and your recommendation.
3. Stop. Do not prepare the action "so it's ready" if preparing it would itself cross a gate.

## How approval is given

A human chair writes their decision in the report file under `## Decision`, with their name and
date, or says it in the session and the Board Secretary records it. The approving chair's
name goes in the work order log. An approval covers exactly the action described — not the
next one like it.

## Standing approvals

The board may grant standing approval for a *class* of action (e.g. "publish to the staging
site without asking"). These are recorded as board resolutions in `records/board/` and listed
here when adopted:

- *(none yet)*

## Legal

There is deliberately no `legal` gate. This is a friendly project; `docs/legal-guidelines.md`
lists the handful of habits to keep now and the trip-wires that would make it time to add one.

## What is NOT gated

Everything else. Reading, writing and organising files in this repo; running tests and
local builds; opening and closing work orders; drafting anything; spending within budget
lines; calling subagents. The company should move fast inside the fence.
