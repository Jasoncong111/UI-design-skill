---
name: ui-design-skill
description: Run a branched frontend design intake, help the user choose a concrete UI direction, then turn the result into one complete prompt for downstream UI generation and implementation. Use when a user wants to design a personal website, conversion page, product website, application UI, dashboard, or redesign and needs structured style choices instead of open-ended prompt writing.
---

# UI Design Skill

Use a compact, branched UI selection flow that narrows the design direction before writing prompts.

## Core behavior

- Start with universal questions only.
- After the page type is clear, switch to the correct branch.
- Ask shared questions only once.
- Only ask branch-specific questions that materially change the final prompt.
- Prefer compact grouped questions over long one-question-at-a-time interviews when clarity is not lost.
- Use concrete UI choices, not vague mood questions.
- Avoid pairs of questions that ask nearly the same thing with different wording.
- After the flow, output a clean design handoff.

## Workflow

1. Ask the universal questions from `references/usage-rules.md`.
2. Ask the shared design questions from `references/optimized-questionnaire.md`.
3. Ask only the matching branch add-on questions from `references/optimized-questionnaire.md`.
4. Summarize the chosen UI direction in plain language.
5. Generate one complete `Final Prompt`.
6. Add short build notes that reflect the actual choices.

## Privacy and safety

- Treat Variant as a third-party visual exploration tool.
- Do not include secrets, private URLs, internal metrics, customer lists, unpublished roadmap details, or personal contact details in the Variant prompt unless the user explicitly wants that.
- If the user shares confidential product details, sanitize the Variant prompt and keep the visual brief generic.
- Use placeholders for missing brand assets, screenshots, or copy instead of inventing sensitive details.
- Do not present Variant output as production-ready code.

## Universal questions

Always ask these first:
1. page type
2. main goal
3. target audience

Then use the compact shared questions and one branch add-on set from `references/optimized-questionnaire.md`.

## Branches

### Branch A — Personal website
Ask only the personal-site add-on questions.

### Branch B — Conversion page / product website
Ask only the marketing-site add-on questions.

### Branch C — Application UI / dashboard
Ask only the app-UI add-on questions.

### Branch D — Redesign existing page
Ask only the redesign add-on questions.

## Output

After the branch flow, produce:

### Selected UI direction
A compact summary of the actual selected direction.

### Final Prompt
One complete prompt that captures the selected direction clearly enough to be reused in downstream design or implementation tools.

### Build notes
Only practical notes implied by the chosen branch and selections.

## Resources

- Read `references/usage-rules.md` first for flow rules, branch mapping, output shape, and privacy boundaries.
- Read `references/optimized-questionnaire.md` for the current recommended question list and answer options.
- Read `references/shared-style-library.md` only if you need extra examples or want to expand a style choice.
- Older branch files exist for reference, but the optimized questionnaire is the default system.
