# Personal Claude Code Instructions

These are my global preferences for Claude Code across all projects.

## Communication Style

- Be direct and concise - skip pleasantries
- Use technical language appropriate for senior engineers
- When uncertain, ask rather than assume
- Provide working code, not pseudocode
- dont mention model name in commit, just coauthored by claude is fine

## Code Preferences

- Prefer functional approaches where appropriate
- Use modern language features (ES2022+, Go 1.21+, Python 3.11+)
- Follow existing project conventions over personal preferences
- Keep functions small and focused

## Tool Usage

- Prefer reading existing code before making changes
- Run tests after making changes when test commands are available
- Use git status/diff to understand current state before commits
- Use defuddle when you want to get infromation from a webpage

## Languages I Work With

- **Primary**: Go, TypeScript, Python
- **Secondary**: Rust, Shell/Bash
- **Frontend**: React, Next.js, Tailwind CSS

## Environment

- macOS with Homebrew
- Neovim as primary editor
- Ghostty terminal with tmux
- Kubernetes for deployments (k9s for management)

## Browser Automation

Use `agent-browser` for web automation. Run `agent-browser --help` for all commands.

Core workflow:
1. `agent-browser open <url>` - Navigate to page
2. `agent-browser snapshot -i` - Get interactive elements with refs (@e1, @e2)
3. `agent-browser click @e1` / `fill @e2 "text"` - Interact using refs
4. Re-snapshot after page changes
