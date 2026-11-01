# Organisation

## Chart

```
BOARD OF CHAIRPERSONS
├── Chair (Human) — Tom                          roles/board/chair-human.md
├── Chair (Human) — to be named                  roles/board/chair-human.md
├── Chair (AI)                                   roles/board/chair-ai.md
└── Board Secretary (AI, non-voting)             roles/board/board-secretary.md

CEO (AI)                                         roles/executive/ceo.md
├── Chief of Staff (AI)                          roles/executive/chief-of-staff.md
├── Ethics & Safety Officer (AI) — advisory      roles/executive/ethics-safety-officer.md
├── VP Technology (AI)                           roles/technology/vp-technology.md
│   ├── Principal Architect (AI)                 roles/technology/principal-architect.md
│   ├── Product Manager (AI)                     roles/technology/product-manager.md
│   ├── Project Manager (AI)                     roles/technology/project-manager.md
│   ├── Software Developer (AI)                  roles/technology/software-developer.md
│   ├── Software Developer in Test (AI)          roles/technology/sdet.md
│   ├── DevOps / Release Engineer (AI)           roles/technology/devops-release.md
│   └── Technical Writer (AI)                    roles/technology/technical-writer.md
├── VP Cyber Security (AI)                       roles/security/vp-cyber-security.md
│   ├── Security Reviewer / Red Team (AI)        roles/security/security-reviewer.md
│   └── Compliance & Licensing (AI)              roles/security/compliance-licensing.md
├── VP Marketing & Art Direction (AI)            roles/marketing/vp-marketing-art.md
│   ├── Art Director (AI)                        roles/marketing/art-director.md
│   ├── Copywriter (AI)                          roles/marketing/copywriter.md
│   ├── Image Creation (AI)                      roles/marketing/image-creation.md
│   ├── Video Creation (AI)                      roles/marketing/video-creation.md
│   └── Music & Sound (AI)                       roles/marketing/music-sound.md
├── VP Sales (AI)                                roles/sales/vp-sales.md
│   └── Customer Success / Support (AI)          roles/sales/customer-success.md
├── VP Finance (AI)                              roles/finance/vp-finance.md
│   └── Cost Analyst (AI)                        roles/finance/cost-analyst.md
└── VP People & Knowledge (AI)                   roles/people/vp-people-knowledge.md
    └── Archivist (AI)                           roles/people/archivist.md

QC (AI) — reports to CEO AND to any human chair  roles/qc/qc.md
└── QC Tester (AI)                               roles/qc/qc-tester.md
```

## Reporting lines, in words

- The **Board** directs the **CEO**. The CEO is the only channel between board and company,
  except that **QC** reports to human chairs directly.
- **VPs** own a function and report to the CEO. They plan, assign, and review within their
  function. Their direct reports are individual contributors.
- **Chief of Staff** is the CEO's operating arm: queue, decision log, draft board reports.
- **Ethics & Safety Officer** is advisory to the CEO but holds an independent halt.
- **Product Manager** decides *what and why*; **Project Manager** decides *when and who*.
  They are peers under VP Technology.

## Who may halt what

| Role | May halt |
|------|----------|
| Any human chair | Anything, immediately |
| CEO | Any company work except a QC verdict or an Ethics halt |
| QC | Release or hand-off of any deliverable it has failed. Only a human chair can lift it. |
| Ethics & Safety Officer | Any external-facing output or data use, pending human review |
| VP Cyber Security | Any deployment, credential use, or dependency add it deems unsafe, pending CEO + human review |
| VP Finance | Any spend that would cross a `config/budgets.yaml` line, pending human approval |
| A VP | Work inside their own function |

## Independence rules

- QC's fail verdict cannot be overruled by the CEO. Appeal goes to a human chair.
- An Ethics halt is lifted only by a human chair.
- No role reviews or QC-passes its own deliverable.
- Security Reviewer reviews Software Developer output; SDET tests it; QC Tester verifies it
  again from the work order's definition of done. Three different eyes.

## Adding, changing or retiring a role

VP People & Knowledge proposes; CEO approves; the change is a decision in
`records/decisions/`. The charter is added/edited in `roles/`, this file is updated, and the
adapters are re-rendered.
