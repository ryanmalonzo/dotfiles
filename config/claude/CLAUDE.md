# General instructions
- Never spawn subagents for code exploration unless explicitly asked.
- Only add comments over non-obvious pieces of code that does not follow an existing pattern; well-written code should be self-explanatory.
- Always use idiomatic, full-length variable names; never use abbreviations.
- Never commit changes yourself, let the user do it.
- Keep exploration scoped to the given context: search/read only what's relevant to the task, don't sweep unrelated files or directories "just in case". If scope is unclear, ask before broadening.
- When spotting code that needs fixing but unrelated to the task at hand, never act on it unprompted, just mention it to the user.
- If I remove a code comment following your changes, don't add it back unless the behavior or implementation genuinely changed.

# Code navigation (Serena)
Before any grep or Read on code, ask: is this a symbol question (where is X defined, what uses X, what's in this file, what does X look like)? If yes, use Serena, not grep, Read, or Bash (`cat`/`head`/`sed`). This includes conceptual questions like "where is the auth middleware?".

## Setup (once per session, before the first Serena call)
- If Serena's tools are deferred, load them via ToolSearch.
- Call `initial_instructions`; its output states which project is active (there is no `activate_project` tool in this setup).

## Usage
- Always pass `relative_path` (narrowest likely directory or file) to `find_symbol`.
- No exact name known: guess likely names first. If using `substring_matching`, also pass `max_matches` and `exclude_kinds` for Property (7) and Field (8) so nested object keys (e.g. `headers/authorization` in tests) don't drown the results. Avoid `include_kinds`: type aliases are reported as Variable and default exports as Constant, so a Class/Function filter would drop them.
- Run `get_symbols_overview` before Reading a whole file.
- Edit code with Serena's tools (`replace_symbol_body`, `insert_before_symbol`, `insert_after_symbol`, `replace_content`, `replace_in_files`, `rename_symbol`, `safe_delete_symbol`); use the built-in Edit only for non-code files. The built-in Edit denies edits on content read through Serena.
- Serena line numbers are 0-based.
- To read one function/class/type, use `find_symbol` with `include_body`, not Read on the whole file.
- For callers and usages use `find_referencing_symbols`; for renames use `rename_symbol`; for deletions use `safe_delete_symbol`.
- Serena cannot find files by name or list directories; use Glob or `ls` for that.

## When Serena returns too much, nothing, or errors
- Too broad: narrow with `relative_path`, `exclude_kinds`, or an exact name, then retry.
- Empty: check the name path and `relative_path` (a malformed pattern like `/` returns `[]`), try `get_symbols_overview` on the most likely file, then retry once with a different name.
- Only then fall back to grep/Read.

## When grep/Read is acceptable
- Plain text: strings, comments, config values, logs.
- Call-site patterns that are not symbols (e.g. `addHook(`, a literal route path).
- Non-code files, or Serena is unavailable or failing.
- Before running the fallback, say in one line why Serena doesn't fit.

# Auto mode
- Never use WRITE `gh` commands such as, but not limited to, creating a comment on a Pull Request, without being explicitly asked.
- When faced with an implementation decision, always prefer following existing patterns rather than introducing new ones.

# Linting
- Only run linting/type checking commands on code you've explicitly touched. The rest will be caught during CI.

# Running tests
- Avoid running costly test/build commands (e.g. full service or integration suites); prefer asking the user to run them themself. Unit tests are fine to run.
