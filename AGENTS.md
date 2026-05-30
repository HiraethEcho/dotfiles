# archdot — AGENTS.md

Personal Arch Linux dotfiles repo. Managed with **GNU Stow**.

## Deployment

Each top-level directory is a stow package. Run from repo root:
```
stow <package>         # e.g. stow zsh, stow wm
stow -D <package>      # remove
```

## Packages

| Package | Contents |
|---------|----------|
| `arch` | System `/etc/`, `/usr/` configs (systemd units, pacman.conf, mkinitcpio, iptables, X11) |
| `bin` | `~/.local/bin/` scripts: status bar blocks, rofi menus, utility scripts |
| `config` | User configs + **aconfmgr** at `~/.config/aconfmgr/` managing `/etc/` |
| `data` | Misc data configs |
| `dev` | Dev tooling: mcphub, npm, stew (brew-like), uv |
| `git` | Git, jj (jujutsu), lazygit |
| `opencode` | OpenCode IDE config (`opencode.jsonc`) |
| `pacman` | makepkg.conf, paru.conf, yay config |
| `terminal` | alacritty, foot, ghostty, kitty, wezterm |
| `tools` | ~40 tools: yazi, tmux, rofi, newsboat, btop, mpd, dunst, taskwarrior |
| `wm` | **niri** (active), plus dwm, hypr, i3, sway — most are stale |
| `zsh` | `.zshrc`, aliases, starship.toml |

## Key facts

- **aconfmgr** manages `/etc/`. Edit scripts in `config/.config/aconfmgr/`, then `aconfmgr save`.
- Zsh plugins installed via pacman (`/usr/share/zsh/plugins/`) — not vendored. Uses: starship, zoxide, atuin, fzf-tab, fast-syntax-highlighting, zsh-autosuggestions.
- All configs follow XDG: `pkg/.config/<app>/` → `~/.config/<app>/`.
- Commits are auto-timestamped: `backup at 26/05/29-21:19:41`.
- No tests, no CI, no linters — personal backup config.

## Gotchas

- **`arch/` and `config/` overlap** on `/etc/` files. `arch/` has raw copies, `config/` uses aconfmgr. Don't stow both without understanding which is authoritative.
- `bin/.local/bin/xgetrootname` is owned by root — prebuilt binary checked in.
- Many WMs (cwmrc, openbox) are legacy — niri is the current active WM.
