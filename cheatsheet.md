# Hotkey Cheatsheet

## Keybinding Precedence
When in terminal + tmux + nvim, keybindings are processed in this order:
1. **Neovim** (when focused) - handles most keybindings
2. **Tmux** - `C-a` prefix commands and navigation (`C-h/j/k/l` via vim-tmux-navigator)
3. **Zsh** - `C-r` (atuin), `C-g` (navi), `C-y` (autosuggest), `C-f` (sessionizer)

Note: `C-p` and `C-n` are unbound in zsh so tmux can handle window navigation.

## Tmux (prefix = `C-a`)

| Key | Action |
|-----|--------|
| **Windows** ||
| `prefix + p` | Previous window |
| `prefix + n` | Next window |
| `M-H` / `C-p` | Previous window (no prefix) |
| `M-L` / `C-n` | Next window (no prefix) |
| **Panes** ||
| `prefix + \|` | Split horizontal |
| `prefix + -` | Split vertical |
| `prefix + z` | Zoom pane (fullscreen toggle) |
| `prefix + q` | Show pane numbers (press # to jump) |
| `prefix + h/j/k/l` | Resize pane |
| `C-h/j/k/l` | Navigate panes (vim-tmux-navigator) |
| **Sessions** ||
| `prefix + s` | Session picker |
| `prefix + S` | New session |
| `prefix + L` | Last session |
| `prefix + X` | Kill session |
| `prefix + t` | Session wizard |
| **Popups** ||
| `prefix + g` | Lazygit |
| `prefix + o` | Scratchpad (nvim) |
| `prefix + H` | Htop |
| `prefix + K` | K9s |
| `prefix + /` | This cheatsheet |
| **Copy Mode** (`prefix + [`) ||
| `v` | Start selection |
| `C-v` | Rectangle select |
| `y` | Yank |
| `C-d` / `C-u` | Half page down/up |
| `C-f` / `C-b` | Full page down/up |
| `g` / `G` | Top / bottom |
| `/` / `?` | Search forward / backward |
| `q` | Exit copy mode |
| **Other** ||
| `prefix + r` | Reload config |
| `prefix + v` | Paste buffer |
| `prefix + V` | Choose buffer |

## Neovim (leader = `<space>`)

| Key | Action |
|-----|--------|
| **File Navigation** ||
| `\` | Toggle NeoTree |
| `<leader>sf` | Search files |
| `<leader>sg` | Live grep |
| `<leader>s.` | Recent files |
| `<leader><leader>` | Open buffers |
| `<leader>/` | Fuzzy find in buffer |
| **Harpoon** ||
| `<leader>a` | Add file to harpoon |
| `<leader>e` | Harpoon menu |
| `<leader>1-4` | Jump to harpoon file 1-4 |
| `C-S-P/N` | Prev/next harpoon file |
| **LSP** ||
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>th` | Toggle inlay hints |
| **Git (gitsigns)** ||
| `]c` / `[c` | Next/prev hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff index |
| `<leader>gg` | LazyGit |
| `<leader>gf` | LazyGit current file |
| `<leader>tb` | Toggle line blame |
| **Search/Replace** ||
| `<leader>S` | Spectre toggle |
| `<leader>sw` | Search word (Spectre) |
| `<leader>sp` | Search in file |
| **AI (CodeCompanion)** ||
| `<leader>aa` | AI actions menu |
| `<leader>ac` | AI chat toggle |
| `<leader>ae` | AI explain selection (v) |
| `<leader>af` | AI fix selection (v) |
| `<leader>al` | AI LSP diagnostics |
| `<leader>at` | AI generate tests (v) |
| `<leader>ad` | AI generate docs (v) |
| `ga` | Add selection to AI chat (v) |
| **Inline AI (Avante)** ||
| `<leader>ia` | Avante: Ask AI |
| `<leader>ie` | Avante: Edit selection (v) |
| `<leader>ir` | Avante: Refresh |
| `<leader>it` | Avante: Toggle sidebar |
| `<leader>if` | Avante: Focus sidebar |
| `]]` / `[[` | Jump next/prev in Avante |
| **Testing (Neotest)** ||
| `<leader>nr` | Run nearest test |
| `<leader>nf` | Run tests in file |
| `<leader>nd` | Debug nearest test |
| `<leader>ns` | Stop test |
| `<leader>no` | Test output |
| `<leader>np` | Test output panel |
| `<leader>nm` | Test summary |
| `<leader>nw` | Watch file tests |
| `]n` / `[n` | Next/prev failed test |
| **Sessions** ||
| `<leader>wr` | Restore session |
| `<leader>ws` | Save session |
| `<leader>wl` | List sessions |
| `<leader>wd` | Delete session |
| **Other** ||
| `<leader>u` | Undotree |
| `<leader>q` | Diagnostic quickfix |
| `<leader>sk` | Search keymaps |
| `<leader>sh` | Search help |
| `<leader>sn` | Search nvim config |
| **Markdown** ||
| `<leader>tm` | Toggle markdown render |

## Shell (Zsh)

| Key | Action |
|-----|--------|
| `C-r` | Atuin history search |
| `C-g` | Navi cheatsheet |
| `C-y` | Accept autosuggestion |
| `C-f` | Tmux sessionizer |

## CLI AI Tools

| Command | Action |
|---------|--------|
| `sgpt "query"` | Quick AI query |
| `sgpt --code "desc"` | Generate code |
| `sgpt --shell "desc"` | Generate shell command |
| `cat file \| sgpt` | Pipe to AI |
| `llm "query"` | LLM CLI query |
| `llm -m claude-3 "q"` | Use specific model |
| `llm logs` | View conversation history |

## K9s Plugins

| Key | Action |
|-----|--------|
| `Ctrl-T` | Open terminal |
| `Ctrl-L` | Stern logs |
| `Ctrl-Y` | Copy name to clipboard |
| `Shift-D` | Debug container / Describe |
| `Shift-E` | Watch events |
| `Shift-A` | Get all resources |
| `Shift-F` | Port forward (8080) |
| `Shift-Y` | Get YAML |
| `Shift-R` | Restart rollout |
| `Shift-X` | EKS node viewer |
