# General instructions
- Never spawn subagents for code exploration unless explicitly asked.
- Only add comments over non-obvious pieces of code that does not follow an existing pattern; well-written code should be self-explanatory.
- Always use idiomatic, full-length variable names; never use abbreviations.
- Never commit changes yourself, let the user do it.
- Keep exploration scoped to the given context: search/read only what's relevant to the task, don't sweep unrelated files or directories "just in case". If scope is unclear, ask before broadening.
- Prefer Serena MCP over grep/Read for symbol navigation: definitions, callers, references, call hierarchies. Its symbol-graph tools return minimal context instead of whole files. Fall back to grep/Read for plain text search (strings, comments, config values) or when Serena has no project index available.
- When spotting code that needs fixing but unrelated to the task at hand, never act on it unprompted, just mention it to the user.
- If I remove a code comment following your changes, don't add it back unless the behavior or implementation genuinely changed.

# Auto mode
- Never use WRITE `gh` commands such as, but not limited to, creating a comment on a Pull Request, without being explicitly asked.
- When faced with an implementation decision, always prefer following existing patterns rather than introducing new ones.

# Linting
- Only run linting/type checking commands on code you've explicitly touched. The rest will be caught during CI.

# Running tests
- Avoid running costly test/build commands (e.g. full service or integration suites); prefer asking the user to run them themself. Unit tests are fine to run.
