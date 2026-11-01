# Hand-off Formats

Two documents carry work between roles. Both are Markdown with YAML front-matter so they are
readable by humans and parseable by tools.

## Work order

File: `records/work-orders/open/WO-NNNN-short-slug.md` (move to `closed/` when done).

```markdown
---
id: WO-0012
title: Add rate limiting to the public API
parent: WO-0007          # optional
issued_by: vp-technology
owner: software-developer
reviewers: [sdet, security-reviewer, qc-tester]
opened: 2026-08-31
due: 2026-09-02          # optional
budget:
  usd: 5.00
  tokens: 400000
status: open             # open | in-progress | review | blocked | closed | declined
gates: []                # approval gates this crosses, e.g. [external-publish]
---

## Goal
One paragraph. Why this matters and what changes when it's done.

## Inputs
- `projects/foo/src/api/` — the code to change
- `records/decisions/0009-api-limits.md` — the limits agreed

## Definition of done
- [ ] Requests over 100/min per key receive HTTP 429 with a Retry-After header
- [ ] Tests cover the limit boundary and the reset window
- [ ] Docs updated in `projects/foo/docs/api.md`

## Constraints
- No new dependencies without Principal Architect sign-off
- Must not change existing response shapes

## Log
- 2026-08-31 vp-technology: opened
```

## Deliverable

Appended to the work order under a `## Deliverable` heading, or as a separate file in the same
directory named `WO-NNNN-deliverable.md` when large.

```markdown
## Deliverable
---
delivered_by: software-developer
delivered: 2026-09-01
cost:
  usd: 3.10
  tokens: 260000
verdict_requested_from: [sdet, security-reviewer, qc-tester]
---

### What was produced
- `projects/foo/src/api/ratelimit.py` — token-bucket limiter
- `projects/foo/tests/test_ratelimit.py` — 6 tests

### How to verify
```
cd projects/foo && pytest tests/test_ratelimit.py -v
```
Expected: 6 passed.

### Not done / out of scope
- Per-endpoint limits — deferred, see WO-0013

### Provenance
- Based on decision 0009. No external code copied. No new dependencies.

### Notes for reviewers
- The reset window uses monotonic time; see comment in ratelimit.py:14
```

## Review verdict

Appended under `## Reviews`:

```markdown
## Reviews
- 2026-09-01 sdet: **pass** — 6/6 tests pass locally; added edge case for zero limit.
- 2026-09-01 security-reviewer: **pass with notes** — key is logged at debug level; recommend masking (WO-0014).
- 2026-09-01 qc-tester: **fail** — Retry-After header absent on the 429 path. Repro: see log.
```

## Report

File: `records/reports/YYYY-MM-DD-<from>-<to>-slug.md`, e.g.
`records/reports/2026-08-31-ceo-board-daily.md` or `2026-08-31-qc-human-chair-wo0012.md`.

```markdown
---
from: ceo
to: board
date: 2026-08-31
type: daily      # daily | weekly | incident | qc | request-for-approval
---

## Summary
Three sentences maximum.

## Done
## In progress
## Blocked / needs a human
## Spend
## Decisions taken (with links)
## Asks of the board
```

## Media provenance note

Every generated asset gets a sibling `<asset>.provenance.md`:

```markdown
---
asset: hero-banner-v3.png
role: image-creation
provider: <from config/providers.yaml>
model: <provider model id>
prompt: |
  ...
seed: 12345
license: <provider terms + our usage rights>
reviewed_by: [art-director, compliance-licensing]
---
```

The asset itself is not committed (see `.gitignore`); the note is.
