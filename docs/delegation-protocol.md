# Delegation Protocol

How a piece of work moves through the company. Every step leaves a file behind.

```
Board direction ──► CEO ──► Work order ──► Owner (VP or IC) ──► Deliverable
                                                                    │
                     Report ◄── Record ◄── Review (QC / Security / Ethics as applicable)
```

## 1. Direction

Direction arrives from the board (a human chair, or a resolution in `records/board/`) or is
generated internally (a VP proposes; the CEO agrees). The CEO decides whether it becomes work.

## 2. Work order

The CEO (or a VP, within their function) opens a work order in `records/work-orders/open/`
using the template in `handoff-format.md`. A work order is not valid without:

- an **owner** (one role — never "the team");
- a **definition of done** that a stranger could verify;
- a **budget** (tokens, USD, or wall-clock — whatever `config/budgets.yaml` measures);
- the **inputs** the owner needs, by path;
- the **reviewers** who must sign off before it closes.

Small tasks still get a work order. It can be five lines. The point is the trail.

## 3. Assignment

Managers delegate down one level at a time. A VP may re-scope a work order for their reports
by opening child work orders (`WO-0007.1`, `WO-0007.2`) that reference the parent. The parent
stays open until all children are closed.

The owner may **decline** a work order once, in writing, if the definition of done is
unverifiable, the budget is plainly insufficient, or it crosses an approval gate that hasn't
been cleared. Declining returns it to the issuer with reasons. A second decline goes up a level.

## 4. Execution

The owner works within their charter's authority. When they hit a boundary — an approval gate,
an ambiguity that changes the outcome, a budget nearing its line — they stop and escalate per
`escalation.md`. They do not guess through a gate.

Work in progress is fine to leave in the work order file as a running log. Keep it factual.

## 5. Deliverable

The owner writes a deliverable (template in `handoff-format.md`) that says what was produced,
where it is, how to verify it, what was *not* done, and what it cost. A deliverable that says
"done" without a verification path is returned.

## 6. Review

The reviewers named on the work order review the deliverable. Minimum reviewers by type:

| Deliverable type | Required reviewers |
|------------------|--------------------|
| Code | SDET (tests), Security Reviewer, QC Tester |
| External-facing text or media | Art Director or Copywriter (craft), Compliance & Licensing, Ethics & Safety Officer |
| Spend or contract | VP Finance |
| Architecture / dependency change | Principal Architect, VP Cyber Security |
| Anything the board will see | Chief of Staff (form), QC (substance) |

A reviewer returns one of **pass**, **pass with notes**, or **fail** with reasons. Fail returns
the work order to the owner. QC's fail is final unless a human chair lifts it.

## 7. Record and report

The Chief of Staff moves the work order to `records/work-orders/closed/`, notes any decision
made along the way in `records/decisions/`, and the CEO includes it in the next board report.

## Timeboxes

Nothing runs forever. Every work order has a budget; when 80% is consumed, the owner reports
status even if not done. When 100% is consumed, work stops and the work order returns to the
issuer with a status deliverable. Overruns are decided by the issuer, not the owner.
