# UI Design Skill Usage Rules

Use this file first.

## Interview rules

- Start with the universal questions before any branch questions.
- Use the compact questionnaire in `optimized-questionnaire.md` as the default.
- Present questions in Chinese plus English when user-facing clarity matters.
- Keep question wording short, professional, and concrete.
- Prefer grouped option-based questions when they reduce total rounds without creating ambiguity.
- Do not mix branches.
- Do not ask unnecessary follow-up questions once the user has given enough signal.
- Avoid asking two questions that both try to capture the same decision.

## Universal questions

### Step 1｜Page type

Ask the user to choose one:

1. Personal website
2. Conversion page
3. Product website
4. Dashboard / admin panel
5. Application UI
6. Redesign an existing page

### Step 2｜Main goal

Ask the user to choose one:

1. Present a personal brand
2. Present work or projects
3. Capture signups, leads, or contact requests
4. Explain a product and how it works
5. Help users view data or complete tasks
6. Improve the professionalism and visual quality of an existing page

### Step 3｜Target audience

Ask the user to choose one:

1. Recruiters or hiring managers
2. Consumers
3. Clients or partners
4. Internal teams
5. Investors
6. Developers or designers

## Branch mapping

- `Personal website` -> `references/branch-personal-website.md`
- `Conversion page` or `Product website` -> `references/branch-marketing-site.md`
- `Dashboard / admin panel` or `Application UI` -> `references/branch-app-ui.md`
- `Redesign an existing page` -> `references/branch-redesign.md`

## Variant boundary

- Treat Variant as an external visual ideation tool.
- Keep the Variant prompt focused on layout, visual language, interface structure, and mood.
- Remove or generalize confidential details unless the user explicitly approves sharing them.
- Prefer placeholders for internal screenshots, user data, pricing, unreleased features, or customer names.

## Output format

After the intake, always produce these sections:

## Selected UI direction

Summarize the actual choices in compact bullets.

## Final Prompt

Write one complete prompt. It should be detailed enough to reuse in Variant, Codex, GPT-5.4, CLI tools, or later implementation workflows. Include:

- what to build
- page type
- audience
- main goal
- the chosen layout direction
- the chosen visual system
- hierarchy direction
- imagery direction
- section-level expectations
- responsive expectations
- interaction and motion constraints
- any branch-specific requirements
- any privacy-safe placeholders that should be preserved

## Build notes

Only include practical notes implied by the choices.

## Default flow

Use this order unless the user explicitly wants a slower interview:

1. Universal questions
2. Shared design questions
3. One branch add-on set
4. Final prompt and build notes
