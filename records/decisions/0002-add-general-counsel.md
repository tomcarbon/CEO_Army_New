---
id: 0002
title: Add General Counsel role and the `legal` approval gate
date: 2026-08-31
status: superseded by 0003
deciders: [chair-human (Tom)]
recorded_by: ceo
---

## Context

Tom asked whether the framework had a legal aspect. It had Compliance & Licensing (licences,
provider terms) under VP Cyber Security, and gates for data and publishing, but no role owned
entity/liability, IP ownership of AI-generated output, advertising claims, AI-disclosure
duties, accessibility obligations, or contracts. Nothing stopped "the AI said it was fine"
from being the last word.

## Decision

1. Add **General Counsel** (`roles/legal/general-counsel.md`), reporting to the CEO with a
   direct line to human chairs. It identifies issues, drafts questions and documents for a
   licensed human lawyer, and can place a **legal hold** that only a human chair lifts. It
   never gives legal advice, signs, or agrees to anything.
2. Move **Compliance & Licensing** under General Counsel (`roles/legal/`).
3. Add the **`legal`** approval gate (`docs/approval-gates.md`): contracts, terms, licences
   we grant, pricing, privacy notices, public claims, use of names/brands/likenesses.
4. Seed `records/legal/register.md` and `records/legal/POSTURE.md`.

## Consequences

- VP Sales' proposals and pricing now cross `legal` before a human sees them.
- The company has a standing recommendation to the board: consult a licensed attorney
  about entity, IP and liability before anything outward-facing is done for real.
- General Counsel is a frontier-tier role; cost is accepted because its errors are expensive.

## Superseded

Walked back the same day — see `0003-legal-guidelines-not-a-role.md`. Kept as a record of
what the fuller design looked like, for the day a trip-wire fires.
