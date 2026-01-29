# Dotfiles 📁

My personal dotfiles for Linux configuration. 🐧

<video controls src="Video.webm" type="video/webm" style="max-width: 100%;"></video>

![Nvim](nvim.jpg)


## Included Configurations ⚙️

### Window Manager / Desktop 🖥️
- 🪟 Hyprland (hypr/)
- 📊 Waybar (waybar/)
- 🔔 SwayNC (swaync/)

### Terminal 💻
- 🖥️ Alacritty (alacritty/)
- 🧩 Zellij (zellij/)
- 🐚 Zsh (.zsh, .zshrc, .p10k.zsh)

### Editors ✏️
- 📝 Helix (helix/)

### Media 🎬
- 🎵 MPV (mpv/)

### Utilities 🛠️
- ℹ️ FastFetch (fastfetch/)
- 🔊 CAVA (cava/)

## Installation 🛠️

These dotfiles are meant to be symlinked to their respective locations.

### Quick setup script (optional) 🖥️

```bash
#!/bin/bash
# Symlink .config directories
for dir in alacritty cava fastfetch helix hypr mpv swaync waybar zellij; do
    ln -sfn ~/dotfiles/.config/$dir ~/.config/$dir
done

# Symlink home files
ln -sfn ~/dotfiles/home/.zsh ~/.zsh
ln -sfn ~/dotfiles/home/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/home/.p10k.zsh ~/.p10k.zsh
```

## Notes 📝

- This repository is personal and may contain custom configurations.
- Feel free to fork and adapt to your own needs.

## License ⚖️

GNU General Public License v3.0