# Dotfiles 📁

My personal dotfiles for Linux configuration. 🐧

## About Omarchy 🐧

These dotfiles are configured for [Omarchy](https://omarchy.org/), a Linux distribution.
- **Homepage**: https://omarchy.org/
- **GitHub**: https://github.com/basecamp/omarchy

## Media 🎥

### Video Demo

https://github.com/user-attachments/assets/aebfe9c4-24d4-4125-ab3a-b4607d159b8d

### Screenshots
![Desk04](https://github.com/user-attachments/assets/4ce9708a-7c77-4629-96e0-24c65457886c)
![Desk03](https://github.com/user-attachments/assets/72e77c25-c245-4970-aae4-1c3cbca64b2a)
![Desk02](https://github.com/user-attachments/assets/870ab8ac-e91a-4e14-b71a-45ca058dc33e)
![Desk01](https://github.com/user-attachments/assets/f47e8da4-faa8-40e4-a65d-ab6d3d3f94e6)
<div align="center">
<table>
  <tr>
    <td><img src="Desk01.jpg" width="500" alt="Desk 1"></td>
    <td><img src="Desk02.jpg" width="500" alt="Desk 2"></td>
  </tr>
  <tr>
    <td><img src="Desk03.jpg" width="500" alt="Desk 3"></td>
    <td><img src="Desk04.jpg" width="500" alt="Desk 4"></td>
  </tr>
</table>
</div>

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

### Media Player 🎬
- 🎵 MPV (mpv/)

### Utilities 🛠️
- ℹ️ FastFetch (fastfetch/)
- 🔊 CAVA (cava/)

## Installation 🛠️

These dotfiles are configured for Omarchy Linux and are meant to be symlinked to their respective locations.

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
- These dotfiles are optimized for Omarchy Linux but may work on other distributions with adjustments.
- Feel free to fork and adapt to your own needs.

## License ⚖️

GNU General Public License v3.0
