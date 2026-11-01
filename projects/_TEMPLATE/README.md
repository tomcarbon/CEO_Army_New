# Pairing a project

A paired project is anything the company works on. It can live here or elsewhere.

## Option A — inside this repo

```
projects/<name>/
├── README.md        what it is, how to run it
├── PRODUCT.md       Product Manager: users, problem, success measures, non-goals
├── BACKLOG.md       Product Manager + Project Manager
├── SECURITY.md      VP Cyber Security: threat model, secrets, dependency policy
├── LICENSES.md      Compliance & Licensing: dependency licence inventory
├── MARKETING.md     VP Marketing: audience, message, channels
├── BRAND.md         Art Director + Copywriter: look, sound, voice
├── GTM.md           VP Sales
├── SUPPORT.md       Customer Success: FAQ, known issues
├── RELEASING.md     DevOps/Release: how to build, tag, release, roll back
├── docs/adr/        Principal Architect: architecture decision records
├── docs/tech-debt.md
├── briefs/          Art Director briefs and media prompt packs
├── copy/            Copywriter output
└── src/, tests/ …   the actual project
```

## Option B — its own repository

Create `projects/<name>/README.md` here containing the repo URL, the branch the company works
on, and the same list of company documents (which then live in that repo under `company/` or
`docs/`). Work orders and reports about the project **always** live in this repo's `records/`.

## Onboarding steps (a work order, owned by the CEO)

1. Board chooses the project and records it in `records/board/`.
2. CEO opens `WO-NNNN-onboard-<name>` with child work orders:
   - Product Manager → `PRODUCT.md`
   - Principal Architect → first ADR (existing architecture, if any) + `tech-debt.md`
   - VP Cyber Security → `SECURITY.md`; Compliance & Licensing → `LICENSES.md`
   - SDET → test strategy; DevOps → `RELEASING.md`
   - VP Marketing → `MARKETING.md` and `BRAND.md` (if the project faces the public)
   - VP Finance → project budget line proposal
3. QC audits the onboarding; reports to the human chair.
4. Only then does feature work begin.

## Rules that carry over

Everything in `COMPANY.md`, `docs/` and `ORG.md` applies inside a paired project. A project's
own CLAUDE.md (if it has one) is read *in addition to* this company's, never instead of it.
