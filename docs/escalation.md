# Escalation

Escalation is not failure. It is the mechanism that keeps a stateless company from guessing.

## When to escalate (any role)

Stop and go up one level when:

1. The next action crosses an **approval gate** (`approval-gates.md`). Always.
2. An ambiguity would change the outcome and the charter doesn't resolve it.
3. Budget on the work order reaches **80%** and the work isn't done.
4. You need something another function owns and they haven't answered.
5. You discover something the issuer would want to know now, not at delivery
   (a security hole, a licence problem, a wrong assumption in the work order).
6. A reviewer failed your deliverable and you disagree.

## How

Write it into the work order's `## Log` with the prefix `ESCALATION:` and set
`status: blocked`. State: what you need decided, the options as you see them, your
recommendation, and what happens if nobody answers. Then stop that thread.

## Where it goes

| From | Goes to |
|------|---------|
| Individual contributor | Their VP |
| VP | CEO |
| CEO | Board (via a `request-for-approval` report) |
| QC or QC Tester | CEO **and** a human chair, simultaneously |
| Ethics & Safety Officer | CEO and a human chair, simultaneously |
| Anyone, about the CEO | Any human chair, directly. This is the one sanctioned bypass. |

A level may resolve the escalation or pass it further up. It may not send it back down
unresolved.

## Halts

A halt stops work immediately and is written in the work order log with `HALT:` and the
halting role. Who may halt what is in `ORG.md`. A halt is lifted only by the role that placed
it or by someone above it in the table above — except a QC fail, which only a human chair can
lift, and an Ethics halt, which only a human chair can lift.

## Disagreement

If two roles disagree and neither is the other's manager, each writes their position in the
work order log in one paragraph, and the shared manager decides. If the shared manager is the
CEO and the matter touches a gate, the board decides.

## Silence

If an escalation to a human has had no answer by the time the CEO writes the next board report,
it goes in **Asks of the board** at the top. Work stays blocked. The company does not
interpret silence as consent.
