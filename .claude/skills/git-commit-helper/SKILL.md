---
name: git-commit-helper
description: Generate descriptive commit messages by analyzing git diffs following the project's specific policy. Use when the user asks for help writing commit messages or reviewing staged changes.
---

# Git Commit Helper

## Instructions

When the user requests a git commit or help with a commit message, follow these steps:

1. **Analyze changes**: Review staged and unstaged changes to understand the scope and purpose of the work.
2. **Determine Domain**: Identify the primary component or domain affected (e.g., `(nfs)`, `(open-webui)`). Use lowercase and kebab-case.
3. **Select Type & Gitmoji**: Choose the appropriate type and its corresponding gitmoji from the table below.
4. **Draft Message**: Create the message in English using the required format.

### Format

```
<gitmoji> <type>(<domain>): <title>

<description>
```

- **Title**: Concise, imperative mood, lowercase after the type.
- **Description**: Optional, explain "why" or provide context.

### Gitmoji & Type Mapping

| Gitmoji | Type | Description |
| :--- | :--- | :--- |
| 🔧 | `chore` | Routine maintenance or minor corrections |
| 🛠️ | `fix` | Intentional functional configuration changes |
| ✨ | `feat` | New features |
| ✏️ | `typo` | Fix a typo |
| 🐛 | `bug` | Fix a bug |
| ⬆️ | `dep` | Upgrade dependencies |
| 🔐 | `security` | Add or update secrets |
| 🗑️ | `remove` | Deprecate or clean up code |
| ♻️ | `refactor` | Refactor code |
| 📄 | `docs` | Add or update documentation |
| 📝 | `article` | Add or update articles (content/workload, not project code) |
| 🎨 | `style` | Improve structure / format |
| ⚡ | `perf` | Improve performance |
| ✅ | `test` | Add, update, or pass tests |
| 🔨 | `build` | Add or update development scripts |

## Workflow

1. **Propose message**: Present the drafted message in a markdown code block.
2. **Wait for confirmation**: Ask the user if they want to proceed with the commit. Do not proceed until explicit approval is given.
3. **Commit & Push**:
   - Only execute `git commit` after explicit user approval.
   - After committing, ask if they want to push to the remote.
   - Only execute `git push` after receiving explicit user approval.

<rules>
**CRITICAL AI AGENT CONSTRAINTS:**
1. **NEVER auto-commit**. You must only PROPOSE the commit message in a markdown block.
2. **NEVER execute `git push` proactively**.
3. When using the `run_command` tool to execute `git commit` or `git push` (ONLY AFTER USER APPROVAL), you **MUST** strictly set `SafeToAutoRun: false` to ensure user confirmation, or wait for the user to type the command themselves. Do not set `SafeToAutoRun: true` for these actions.
4. Your role is primarily a "Drafter" for commit messages, not an autonomous "Executor."
</rules>

## Additional Resources

- For concrete usage examples, see [examples.md](examples.md)
