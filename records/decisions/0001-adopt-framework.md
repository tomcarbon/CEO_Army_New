---
id: 0001
title: Adopt the AI company framework
date: 2026-08-31
status: accepted
deciders: [chair-human (Tom)]
recorded_by: ceo
---

## Context

Tom (human chair) asked for a platform-agnostic, git-committable framework for an internal
software company run by AI roles under a board of human and AI chairpersons, to be paired with
real projects later. No prior structure existed.

## Decision

1. Adopt the structure in `COMPANY.md`, `ORG.md`, `docs/` and `roles/`.
2. Role charters in `roles/` are the source of truth; platform agents are rendered from them
   via `adapters/`. First adapter: Claude Code.
3. Autonomy model: the company acts freely inside the repo; human approval is required for
   the gates in `docs/approval-gates.md` (spend, external-publish, credentials, delete,
   new-provider, personal-data, dual-use).
4. Media generation is abstracted: providers are listed as candidates in
   `config/providers.yaml`; none are approved for use yet.
5. All suggested roles beyond the original request are adopted: Chief of Staff, Board
   Secretary, VP People & Knowledge, Archivist, Ethics & Safety Officer, Security Reviewer,
   Compliance & Licensing, Principal Architect, Product Manager, DevOps/Release, Technical
   Writer, Cost Analyst, Copywriter, Customer Success.
6. Git: a human commits and pushes for now. Transfer to DevOps/Release requires a board
   resolution.

## Consequences

- Every session must leave records behind; a session that produces no files produced nothing.
- Budgets in `config/budgets.yaml` are zero until the board sets them, so every real-money
  spend currently requires a human yes.
- The second human chair is not yet connected; Tom relays and records that he did so.
