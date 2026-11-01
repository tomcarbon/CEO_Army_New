# Glossary

Plain-English definitions of the terms used across this company. Written for the human
chairs. If a term here is unclear, that's a bug — ask the CEO to fix it.

**Adapter** — Instructions (and eventually scripts) that turn the platform-neutral role
charters into agents a specific AI platform can run. The Claude Code adapter is the first.

**Agent** — A running instance of an AI playing one role. Agents are stateless: they start
each task knowing nothing except what they read from files and their prompt.

**Anti-responsibility** — Something a role must *not* do, even if asked, listed in its charter.
Example: a developer must not mark their own work as QC-passed.

**Approval gate** — An action that needs a human's yes before it happens. See
`approval-gates.md`. Money, the outside world, credentials, deletions, new providers.

**Board / Chairperson** — The people (and one AI) who direct the company and receive its
reports. You. The CEO answers to the board.

**Budget** — A ceiling on what a task, role or project may consume: tokens, dollars, or time.
Set in `config/budgets.yaml`. Crossing a line is an approval gate.

**Charter** — The one-page definition of a role: mission, responsibilities, authority,
escalation, definition of done, tools, anti-responsibilities. Lives in `roles/`.

**Decision record** — A short file in `records/decisions/` saying what was decided, when, by
whom, and why. The company's long-term memory of its own reasoning.

**Definition of done** — A checklist in a work order that a stranger could verify. If it
isn't checkable, it isn't a definition of done.

**Deliverable** — The write-up that accompanies finished work: what was made, where, how to
verify it, what wasn't done, what it cost, and where it came from.

**Escalation** — Passing a question or blocker up one level instead of guessing.

**Halt** — An order to stop work immediately. Who can halt what is in `ORG.md`. Only a
human can lift a QC fail or an Ethics halt.

**Legal guidelines** — `docs/legal-guidelines.md`: the few habits we keep now and the
trip-wires (money, outsiders, publishing) that would make it time to involve a lawyer.

**IC (individual contributor)** — A role that does the work rather than managing others.
Developer, Copywriter, Image Creation, etc.

**Provenance** — Where something came from: which role, which inputs, which tool or provider,
which prompt, which licence. Required for every generated asset.

**Provider** — An external service the company might use to generate images, video, music or
voice (or to run models). Candidates are listed in `config/providers.yaml`; using one for the
first time is an approval gate.

**QC (Quality Control)** — The independent role that checks deliverables against their
definition of done. Reports to the CEO *and* directly to human chairs. Its fail verdict cannot
be overruled by the CEO.

**Report** — A dated file in `records/reports/` from one role to another, most often
CEO → board. Always includes what was done, what's blocked, what it cost, and what is being
asked of the reader.

**Role** — A job in the company. One charter each. May be filled by an AI or a human.

**Separation of duties** — The rule that the person who makes something is never the only
person who checks it.

**Standing approval** — A human decision that a whole class of gated actions may proceed
without asking each time. Recorded as a board resolution.

**Subagent** — In Claude Code, a separate AI worker that the main session launches for one
task. Each role except the CEO runs as a subagent. Subagents cannot launch subagents.

**Token** — The unit AI models are billed in, roughly ¾ of a word. Budgets are often in tokens.

**Work order** — The file that defines a task: who owns it, what done looks like, what it may
cost, who must review it. Nothing is worked on without one.
