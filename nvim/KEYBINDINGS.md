# Neovim <-> VSCode Cheat Sheet

This cheat sheet is derived from your current Neovim config in `nvim/` and your VSCode vim bindings in `vscode/settings.json` and `vscode/keybindings.json`.

Basics = core muscle memory (20-30 actions). Intermediate = daily power moves. Advanced = deep tooling.

## Basics (Core Muscle Memory)

| Action | Neovim | VSCode (Vim) |
| --- | --- | --- |
| Leader key | `<Space>` | `<Space>` |
| Save file | `<leader>w` | `<leader>w` |
| Close editor | `<leader>q` | `<leader>q` |
| Close all editors | `:qa` | `<leader>Q` |
| Find files | `<leader>ff` or `Ctrl+p` | `<leader>ff` or `Ctrl+p` |
| Live grep (project search) | `<leader>fg` | `<leader>fg` |
| Recent files | `<leader>fr` | `<leader>fr` |
| Toggle file explorer | `<leader>e` | `<leader>e` |
| Focus file explorer | `<leader>o` | `<leader>o` |
| New file (current dir) | `<leader>nf` | `Cmd+N` or `Cmd+P` then enter new name |
| New directory (current dir) | `<leader>nd` | Explorer `Shift+a` |
| Vertical split | `<leader>v` | `<leader>v` |
| Horizontal split | `<leader>s` | `Cmd+\\` (split editor) |
| Move between splits | `Ctrl+h/j/k/l` | `Ctrl+h` / `Ctrl+l` |
| Next buffer/tab | `Tab` | `Tab` |
| Previous buffer/tab | `Shift+Tab` | `Shift+Tab` |
| Close buffer | `<leader>x` | `Cmd+w` |
| Search in file | `/` then `n`/`N` | `Cmd+F` then `F3`/`Shift+F3` |
| Clear search highlight | `Esc` | `<leader>h` |
| Replace word in file | `<leader>s` | `Cmd+H` then Replace All |
| Replace selection in file | Visual select + `<leader>s` | Visual select + `Cmd+H` |
| Yank / cut / paste | `y` / `d` / `p` | `Cmd+C` / `Cmd+X` / `Cmd+V` |
| Comment toggle | `gcc` (line), `gc` (visual) | `Cmd+/` |
| Undo / redo | `u` / `Ctrl+r` | `Cmd+Z` / `Shift+Cmd+Z` |
| Go to definition | `gd` | `gd` |
| Hover docs | `K` | `gh` |
| Rename symbol | `<leader>rn` | `<leader>rn` |
| Code action | `<leader>ca` | `<leader>ca` |
| Word motion | `w` / `b` / `e` | `w` / `b` / `e` |
| Line motion | `0` / `^` / `$` | `0` / `^` / `$` |
| File motion | `gg` / `G` | `gg` / `G` |
| Find character | `f{char}` / `t{char}` then `;` / `,` | `f{char}` / `t{char}` then `;` / `,` |

## Intermediate (Daily Power Moves)

| Action | Neovim | VSCode (Vim) |
| --- | --- | --- |
| Find buffers | `<leader>fb` | `Cmd+P` then `>` or type buffer name |
| Help tags | `<leader>fh` | `Cmd+Shift+P` then search help |
| Telescope selection move | `Ctrl+j` / `Ctrl+k` | `Ctrl+j` / `Ctrl+k` (Quick Open) |
| Go to declaration | `gD` | `gD` |
| Go to implementation | `gi` | `gi` |
| Go to references | `gr` | `gr` |
| Signature help | `Ctrl+k` | `Cmd+Shift+Space` |
| Diagnostics float | `<leader>d` | `Cmd+Shift+M` then enter |
| Next/prev diagnostic | `]d` / `[d` | `F8` / `Shift+F8` |
| Format file or selection | `<leader>fm` | `<leader>rf` |
| Git hunk next/prev | `]c` / `[c` | `]c` / `[c` (if GitLens) |
| Git stage/reset hunk | `<leader>hs` / `<leader>hr` | Source control view |
| Replace current word | `*` / `#` then `n` / `N` | `Cmd+F` then `Enter` |
| Change inside word | `ciw` | `ciw` |
| Delete inside word | `diw` | `diw` |
| Change around parens | `ci(` / `ci)` | `ci(` / `ci)` |
| Change inside quotes | `ci"` / `ci'` | `ci"` / `ci'` |
| Select inside block | `vi{` / `va{` | `vi{` / `va{` |
| Move lines up/down | `J` / `K` (visual) | `J` / `K` (visual) |
| Repeat last change | `.` | `.` |

## Advanced (Deep Tooling)

| Action | Neovim | VSCode (Vim) |
| --- | --- | --- |
| Toggle inline blame | `<leader>tb` | GitLens toggle blame |
| Preview hunk | `<leader>hp` | GitLens hunk preview |
| Blame line | `<leader>hb` | GitLens blame line |
| DAP start/continue | `F5` | `F5` |
| DAP step over | `F10` | `F10` |
| DAP step into | `F11` | `F11` |
| DAP step out | `F12` | `Shift+F11` |
| DAP toggle breakpoint | `<leader>b` | `F9` |
| DAP REPL | `<leader>dr` | Debug Console |
| DAP run last | `<leader>dl` | Start Debugging |
| DAP terminate | `<leader>dt` | Stop Debugging |
| DAP toggle UI | `<leader>du` | VSCode debug view |
| Macro record/play | `q{register}` / `@{register}` | `q{register}` / `@{register}` |
| Global replace | `:%s/old/new/g` | `Cmd+H` then Replace All |
| Quickfix next/prev | `:cnext` / `:cprev` | Problems panel next/prev |
| Jump to mark | `ma` then `'a` | `ma` then `'a` |

## Notes

- Neovim leader is `<Space>` and system clipboard is enabled, so `y`/`p` use the system clipboard.
- Search workflow: `/pattern` then `n` and `N` to cycle occurrences.
- Replace workflow: `<leader>s` uses your current word or selection and pre-fills the replace command.
- For yanking a function quickly: place cursor inside the function and use `V` to line-select, then `}` / `{` to grow selection, then `y` to yank and `p` to paste.
