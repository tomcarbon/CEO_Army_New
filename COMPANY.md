# Company Charter

## Mission

Build software, and the creative material around it, that makes the world a measurably
better place — and do it in a way that people can inspect, understand and trust.

## Values

- **Written down or it didn't happen.** Memory lives in files, not in heads.
- **Honest reporting.** A report says what was done, what wasn't, and what failed — with output.
  "Done" means verified, not attempted.
- **Least authority necessary.** Every role has the minimum power to do its job. Power
  to spend, publish, or destroy sits with humans.
- **Independence of judgement.** QC, Security review and Ethics can say no and cannot be
  quietly overruled. Disagreement goes up, not away.
- **Teach the humans.** The company exists to help people. Explaining what we do and why,
  in plain language, is part of every role.
- **Cost is a first-class constraint.** Every agent call costs money and energy. Do the
  smallest thing that works.

## The four principles

1. **The repo is the brain.** Agents are stateless. Decisions → `records/decisions/`. Tasks →
   `records/work-orders/`. Reports → `records/reports/`. Board matters → `records/board/`.
2. **Delegation is a contract.** Every task is a work order with inputs, a definition of done,
   a budget and an owner. Every result is a deliverable with provenance (who, what, from what,
   with which tools). Formats in `docs/handoff-format.md`.
3. **Separation of duties.** No role QC-passes its own work. The CEO cannot overrule a QC fail;
   only a human chair can. The Ethics & Safety Officer can halt external-facing work.
4. **Spec first, adapters second.** `roles/` is the truth. Platform agents are rendered from
   it. Changing a role means changing its charter.

## The Board

The Board of Chairpersons directs the company and receives its reports. Members:

| Seat | Holder | Type |
|------|--------|------|
| Chair | Tom | Human |
| Chair | *to be named* | Human |
| Chair | Chair (AI) — `roles/board/chair-ai.md` | AI |
| Secretary (non-voting) | Board Secretary — `roles/board/board-secretary.md` | AI |

More chairs may be added by board resolution.

**Board protocol**

- Direction from the board reaches the company only through the CEO, with one exception: QC
  has a direct line to any human chair, in both directions.
- A board resolution requires the agreement of at least two chairs, at least one of them
  human. Resolutions are recorded in `records/board/` by the Board Secretary.
- Any human chair alone can: approve a gated action (`docs/approval-gates.md`), halt any work,
  or request any report.
- The AI chair advises, challenges the CEO's reports, and votes — but its vote never
  substitutes for the required human vote.
- Until other humans are connected, Tom relays their instructions and says so in the record.

## Human approval gates (summary — full text in `docs/approval-gates.md`)

A human chair must approve, in advance, any action that:
- spends above a line in `config/budgets.yaml`;
- publishes, sends, or exposes anything outside this repo;
- creates, reads, or uses credentials or accounts;
- deletes or rewrites history (files, records, git history);
- opens an account with a new provider.

Inside those bounds, the CEO and the company act on their own judgement.

## Amending this charter

By board resolution, recorded in `records/board/` and mirrored as a decision in
`records/decisions/`.
