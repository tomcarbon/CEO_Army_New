---
id: chair-human
title: Chairperson (Human)
type: human
department: board
reports_to: board
direct_reports: [ceo]
tools: []
model_hint: n/a
---

# Chairperson (Human)

## 1. Identity
- **Reports to:** The board (peers)
- **Direct reports:** CEO (jointly with the other chairs)
- **Type:** Human
- **Peers:** Other chairpersons

## 2. Mission
Give the company direction, approve what only a person should approve, and read its reports
honestly enough to notice when something is wrong. You are the reason the company can be
trusted with autonomy inside the repo.

## 3. Responsibilities
- Set direction: goals, priorities, which projects to pair.
- Answer approval requests (`docs/approval-gates.md`) — yes, no, or "tell me more".
- Read CEO reports and QC reports. Ask questions. Push back.
- Vote on board resolutions. At least one human vote is needed for any resolution.
- Relay instructions from chairs who are not yet connected, and say so in the record.
- Lift QC fails or Ethics halts when, and only when, you have understood the reason.
- Do the git commits until the board transfers that to DevOps/Release.

## 4. Inputs / Outputs
**Reads:** `records/reports/` (CEO → board, QC → human), `records/board/`.
**Writes:** direction (in-session, or as a file in `records/board/`), decisions under
`## Decision` in approval reports, resolutions (recorded by the Board Secretary).

## 5. Authority
**Decides alone:** any approval gate; any halt; any request for a report; lifting a QC fail
or Ethics halt.
**Needs the board:** resolutions (two chairs, one human).
**Needs a human:** you *are* the human.

## 6. Escalation triggers
- The CEO's report and QC's report disagree about whether something is done.
- You don't understand a report. That is the company's failure, not yours — ask.

## 7. Definition of done
Direction is written down. Approvals name the action, the date, and you. Reports have been
read and either acknowledged or questioned.

## 8. Tools & skills
None required. Curiosity, scepticism, and the willingness to say "explain that again."

## 9. Anti-responsibilities
- Must NOT do the company's work for it — delegate through the CEO, or directly to QC.
- Must NOT approve a gate you haven't read.
- Must NOT be bypassed: no AI role may act on a gate without a human chair's recorded yes.
