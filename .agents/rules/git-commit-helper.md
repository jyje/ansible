---
trigger: model_decision
description: Generate descriptive commit messages by analyzing git diffs following the project's specific policy. Use when the user asks for help writing commit messages or reviewing staged changes.
---

# Git Commit Helper

You are an expert software engineer managing git commits. Whenever the user requests a git commit, asks for help with a commit message, or asks to review staged changes, you MUST adhere to the following strict guidelines and workflow.

## 1. Commit Message Format
All commit messages must strictly follow this format:
```
<gitmoji> <type>(<domain>): <title>

<description>
```

### Formatting Rules:
- **Gitmoji**: Must use one of the exactly specified emojis (see mapping below).
- **Type**: Must be lowercase, chosen from the mapping below.
- **Domain**: Must be enclosed in parentheses `()`. Identify the primary component or domain affected (e.g., `(nfs)`, `(open-webui)`). Use lowercase and kebab-case. 
- **Title**: A concise summary of the change in imperative mood. Must start with a lowercase letter directly after the colon and space.
- **Description**: (Optional) Use this to explain "why" the change was made or to provide further context.

---

## 2. Gitmoji & Type Mapping
Only use the following approved types and emojis:

| Gitmoji | Type       | Description |
| :------ | :--------- | :---------- |
| 🔧      | `chore`    | Routine maintenance or minor corrections |
| 🛠️      | `fix`      | Intentional functional configuration changes |
| ✨      | `feat`     | New features |
| ✏️      | `typo`     | Fix a typo |
| 🐛      | `bug`      | Fix a bug |
| ⬆️      | `dep`      | Upgrade dependencies |
| 🔐      | `security` | Add or update secrets |
| 🗑️      | `remove`   | Deprecate or clean up code |
| ♻️      | `refactor` | Refactor code |
| 📄      | `docs`     | Add or update documentation |
| 📝      | `article`  | Add or update articles (content/workload, not project code) |
| 🎨      | `style`    | Improve structure / format |
| ⚡      | `perf`     | Improve performance |
| ✅      | `test`     | Add, update, or pass tests |
| 🔨      | `build`    | Add or update development scripts |

---

## 3. Workflow Requirements
1. **Analyze changes**: Always review staged and unstaged changes first to understand the scope and purpose of the work.
2. **Propose message**: Present the drafted commit message to the user in a markdown code block.
3. **Request confirmation**: **DO NOT** commit immediately. Ask the user if they want to proceed with the proposed commit message.
4. **Commit & Push**:
   - Only execute `git commit` after explicit user approval.
   - After committing, ask the user if they want to push to the remote repository.
   - Only execute `git push` after receiving explicit user approval.

---

## 4. Examples

### Feature addition
```
✨ feat(n8n): add n8n application

Add n8n workflow automation application to the cluster.
```

### Intentional functional configuration change
```
🛠️ fix(nfs): rollback health probes and chart rename to fix distroless image compatibility

Revert recent changes including health probes and chart renaming because the
distroless image lacks 'sh' and other shell utilities required for probes.
```

### Routine maintenance
```
🔧 chore(helm): remove deprecated Helm chart versions and clean up configuration files

Remove old chart versions and clean up unused configuration files for homer applications.
```

### Bug fix
```
🐛 bug(open-webui): resolve inconsistencies in git commit policy rule

Fix three bugs in the git commit policy rule:
1. Translate Korean text to English to match the 'Always English' policy
2. Clarify gitmoji mapping conflicts
3. Add missing types to the Type list
```

### Dependency update
```
⬆️ dep(open-webui): update chart to 10.2.1 from 8.10.0

Upgrade open-webui Helm chart to latest version.
```

### Refactoring
```
♻️ refactor(nfs): rename custom Helm chart with -jyje suffix and add health probes

Rename Helm chart directory and add health probe configurations.
```

### Security
```
🔐 security(open-webui): add CORS_ALLOW_ORIGIN environment variable for enhanced security

Configure CORS settings to restrict allowed origins.
```

### Typo fix
```
✏️ typo(docs): fix typo in gitmoji standard reference

Correct "gitmodi" to "gitmoji" in documentation.
```

### Version update
```
⬆️ dep(claude): update claude version to latest

Upgrade the underlying Claude model or software version to the newest release.
```
