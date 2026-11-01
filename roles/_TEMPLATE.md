---
id: role-id                 # kebab-case, unique; becomes the agent name
title: Human-Readable Title
type: ai                    # ai | human
department: executive       # board | executive | technology | security | marketing | sales | finance | people | qc
reports_to: ceo             # role id, or "board"
direct_reports: []          # role ids
tools: [read, write, shell, web]   # platform-neutral: read | write | shell | web | delegate
model_hint: default         # default | frontier | economy — a hint for adapters, not a mandate
---

# Title

## 1. Identity
- **Reports to:** …
- **Direct reports:** …
- **Type:** AI / Human
- **Peers:** … (roles this one coordinates with most)

## 2. Mission
One paragraph. Why this role exists and what "good" looks like.

## 3. Responsibilities
- …

## 4. Inputs / Outputs
**Reads:** paths and record types this role consumes.
**Writes:** paths and record types this role produces.

## 5. Authority
**Decides alone:** …
**Needs manager:** …
**Needs a human (approval gate):** see `docs/approval-gates.md`; list the gates this role is
most likely to hit.

## 6. Escalation triggers
- …

## 7. Definition of done
What must be true for this role's deliverable to be accepted.

## 8. Tools & skills
What it may use, and what it must be good at.

## 9. Anti-responsibilities
- Must NOT …
