# UI Design Skill

UI Design Skill is a Codex skill for people who know the outcome they want, but do not want to start UI design from a blank prompt box.

Instead of asking for vague inspiration, it walks the user through a structured set of UI choices:

- page type
- audience
- main goal
- layout direction
- visual system
- typography
- imagery
- motion
- device priority

The result is a clearer design brief, a cleaner prompt, and a much faster path from idea to interface.

## What it does

UI Design Skill runs a branched intake flow for:

- personal websites
- conversion pages
- product websites
- app UIs
- dashboards
- redesign projects

It then turns the chosen direction into one complete output:

1. a `Final Prompt` that can be reused in Variant, Codex, GPT-5.4, CLI tools, or later implementation workflows

## Why this exists

Most UI prompt-writing workflows break down at the same point: users know they want something "clean", "premium", or "modern", but those words are too abstract to guide a strong build.

This skill solves that by replacing vague taste language with concrete design decisions. It helps users choose a direction before the model starts generating UI.

## Product value

- Faster alignment: users can pick from concrete UI directions instead of inventing prompt language.
- Better prompts: the final prompt is shaped by explicit hierarchy, layout, and style choices.
- Better handoff: one stronger prompt is easier to reuse across Variant, Codex, GPT-5.4, CLI tools, and later implementation steps.
- Safer sharing: the skill includes guidance for keeping sensitive product details out of third-party visual tools.

## Install

Recommended remote installer:

```bash
curl -fsSL https://raw.githubusercontent.com/Jasoncong111/UI-design-skill/main/install.sh | bash
```

If your CLI uses a custom skills directory:

```bash
curl -fsSL https://raw.githubusercontent.com/Jasoncong111/UI-design-skill/main/install.sh | bash -s -- --dest /path/to/skills
```

The installer auto-detects Codex via `$CODEX_HOME/skills` and tries a few OpenClaw-style locations as a best effort. If your environment is different, pass `--dest` explicitly.

## Workflow

1. Ask three universal questions.
2. Run the compact shared questionnaire.
3. Ask one short branch add-on set.
4. Summarize the selected UI direction.
5. Generate one complete reusable prompt.

## Privacy stance

UI Design Skill treats Variant as an external tool. It is designed to avoid pushing sensitive details into third-party prompts by default.

The skill encourages:

- sanitizing confidential product details
- removing internal URLs and metrics
- using placeholders for unreleased assets or screenshots
- keeping sensitive implementation details generic until the user is ready to use them downstream

## Repo structure

```text
ui-design-skill/
├── SKILL.md
├── README.md
└── references/
    ├── optimized-questionnaire.md
    ├── usage-rules.md
    ├── shared-style-library.md
    ├── branch-personal-website.md
    ├── branch-marketing-site.md
    ├── branch-app-ui.md
    └── branch-redesign.md
```

## Positioning

You can think of this skill as a frontend taste translator:

- users express intent through guided choices
- one complete prompt carries that direction into later design and implementation tools

## Language support

The optimized questionnaire is designed to work well for bilingual delivery. For public-facing usage, present the questions in Chinese plus English so both Chinese-speaking and overseas users can follow the same flow.
