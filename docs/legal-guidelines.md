# Legal Guidelines

*For two friends playing a game that might grow. Not legal advice — a list of cheap habits
and the moments when it's worth asking someone who is qualified.*

## Where we are

Nobody is paying anyone. Nothing is published. Nobody outside the project uses anything it
makes. At this stage the legal risk is close to zero, and building legal machinery for it
would be play-acting. So: no legal role, no legal gate. This page instead.

## Habits worth keeping from day one (they're free, and they're the ones that are
painful to add later)

1. **No secrets in the repo.** API keys live in your shell, never in a file that gets
   committed. `check.sh` greps for the obvious patterns.
2. **Note where things came from.** Copied a snippet? Add a comment with the source and its
   licence. Generated an image? The provenance note (`docs/handoff-format.md`) already
   covers it. This is a one-line habit that makes "can we use this?" answerable later.
3. **Don't use real people.** No real names, faces, voices or likenesses in generated media.
   No cloning a voice, even your own, without writing down that you agreed to it.
4. **Don't collect people's data.** No email lists, no analytics on identifiable users, until
   the `personal-data` gate is deliberately opened.
5. **Only say true things about what we've built.** The Copywriter's charter already forbids
   invented claims; keep it that way when the thing is real.
6. **Write down who owns what between the two of you.** One paragraph in `records/board/`:
   "we each own half; we'll decide together if that changes." Friendships survive projects
   better with that paragraph than without it.

## Trip-wires — when it becomes worth a real conversation with a lawyer

Any one of these means the game has changed shape. The CEO is chartered to say so in the
board report when one is near; Compliance & Licensing watches for them too.

- **Money changes hands** in any direction — someone pays for it, you pay a contractor, you
  take a sponsorship.
- **Someone outside the project uses it** — even for free. Users bring terms of service,
  privacy obligations, and accessibility expectations with them.
- **You publish under a name** — a product name, a company name, a domain. Names can
  collide with trademarks; publishing is also the point at which "who owns this?" matters.
- **A third person joins** as a chair, a contributor, or a partner. Ownership between three
  people needs more than a paragraph.
- **You use a generative provider commercially.** Their terms decide what you may do with
  the output, and they differ a lot. Compliance & Licensing's summary at `new-provider`
  time is the first check; a lawyer is the second if money is involved.
- **You form an entity** (LLC, company, non-profit). Do this *with* advice, not before it.

## What to do when a trip-wire fires

1. The CEO opens a work order: "Prepare questions for a lawyer about X." Compliance &
   Licensing drafts them in plain language; Ethics adds anything about harm.
2. A human chair has the conversation. A real one, with a licensed person in the relevant
   jurisdiction.
3. The answer goes in `records/decisions/` like any other decision.
4. *Then*, if the answer says so, add a legal role and a `legal` gate. The charter template
   is in `roles/_TEMPLATE.md`; decision `0002` records what that looked like when we tried it
   early, so it needn't be designed from scratch.

## Things the AIs are told

- They do not give legal advice. When a question sounds legal, they say so and point here.
- They never sign, agree to, or accept terms on anyone's behalf — that is always a human,
  as themselves.
- "It's probably fine" is allowed at this stage. Writing down *why* it's probably fine is
  the habit.
