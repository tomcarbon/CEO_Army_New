---
id: 0003
title: Legal: guidelines and trip-wires, not a role or a gate
date: 2026-08-31
status: accepted
supersedes: 0002
deciders: [chair-human (Tom)]
recorded_by: ceo
---

## Context

Decision 0002 added a General Counsel role, a `legal` approval gate, and a legal register.
Tom pointed out that this is a friendly project between two people playing a game and
seeing whether it can grow. Building legal machinery for a company that doesn't exist yet
is play-acting, and adds friction to every outward-facing task.

## Decision

1. Remove the General Counsel role, the `legal` gate, and `records/legal/`.
2. Compliance & Licensing returns to VP Cyber Security.
3. Add `docs/legal-guidelines.md`: six free habits to keep now (no secrets, note sources,
   no real people, no personal data, only true claims, a written line about who owns what
   between the two of you) and the trip-wires that mean it's time to talk to a lawyer
   (money, outside users, publishing under a name, a third person, commercial provider
   use, forming an entity).
4. The CEO and Compliance & Licensing are chartered to say in the board report when a
   trip-wire is near. Nothing else changes until one fires.

## Consequences

- Legal is handled by habit and by honesty in reports, not by a role. This is the right
  size for now.
- Decision 0002 stays in the log as a design to reach for later; it is not deleted.
- Board action item #6 is reworded from "consult an attorney before anything outward-facing"
  to "write the one-paragraph ownership note", which is the only legal thing worth doing today.
