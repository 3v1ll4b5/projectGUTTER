╔═ 3v1L T3chn0logies ═════════════════════════════════════════════════════╗
║ "Doin' the most good with evil."                                       ║
║                                                                        ║
║ Project GUTTER                                                         ║
║                                                                        ║
║ An offline-first Shadowrun Game Master system built on local LLM        ║
║ inference (Ollama), designed to operate at street level where the rain  ║
║ collects and the fallout settles. GUTTER narrates consequences without ║
║ owning the rules: all dice results are treated as authoritative player  ║
║ input, and the system will not invent mechanics, rolls, or modifiers.   ║
║                                                                        ║
║ Campaign state is persisted via structured, human-readable JSON         ║
║ memory. GUTTER remembers what matters, tracks unresolved heat, and      ║
║ surfaces past decisions when they come back to hurt. Character data    ║
║ may be injected for contextual assistance, but player agency is         ║
║ explicitly preserved—the system may suggest, never decide.             ║
║                                                                        ║
║ Architecturally, GUTTER is a local-first FastAPI backend wired to a     ║
║ self-hosted LLM runtime, with clear authority boundaries between        ║
║ narration, mechanics, and state. It exists to support storytelling,    ║
║ not automate it—and to live where the city puts the things it can’t     ║
║ ignore anymore.                                                        ║
║                                                                        ║
║ Project GUTTER is a GM that lives where the fallout does.               ║
╚════════════════════════════════════════════════════════════════════════╝

## Design Philosophy

Project GUTTER was built for street-level play.

Not epic prophecy. Not clean abstractions. GUTTER exists where deals go bad,
where consequences drip instead of explode, and where the city remembers long
after the sirens fade.

### Authority Boundaries

GUTTER does not own the game.

The system will never roll dice, invent modifiers, or resolve mechanics.
Dice results are treated as authoritative player input and are injected
verbatim into the narrative context. This boundary is intentional: trust at
the table depends on knowing exactly who decides what.

When character data is provided, GUTTER may suggest actions or perspectives
if explicitly requested, but it will not take actions on a player’s behalf.
Agency remains human, always.

### Memory as Fallout

GUTTER treats memory as fallout, not flavor.

Campaign state is persisted as structured JSON rather than opaque embeddings
or raw chat logs. This memory is inspectable, versionable, and debuggable by
humans. It is designed to remember outcomes, unresolved threats, and pressure
points—not trivia.

What GUTTER remembers is what the city remembers.

### Local-First by Design

All inference is performed locally via Ollama. This guarantees offline
operation, predictable performance, and player privacy. More importantly,
it keeps the system honest: no hidden API calls, no external state, no
uninspectable decision-making.

If something goes wrong, it can be found and fixed.

### Augmentation, Not Replacement

GUTTER does not aim to replace the Game Master.

It exists to reduce cognitive load where it is least fun—tracking heat,
remembering threads, surfacing past mistakes—and to amplify what matters:
tone, description, and consequence.

The goal is not to make decisions faster.

The goal is to make them stick.

### Why GUTTER

The gutter is where the city puts what it can’t clean up.
It’s where rainwater gathers, where blood dries, and where stories don’t end—
they wait.

Project GUTTER lives there.
