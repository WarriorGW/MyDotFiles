<h1 align='center'>My Dotfiles</h1>

## Components

Window Manager: [Hyprland](https://hypr.land)

Bar: [Waybar](https://github.com/Alexays/Waybar) - Deprecated

Notification daemon: [Dunst](https://github.com/dunst-project/dunst)

App Launcher: [Rofi](https://github.com/davatorium/rofi)

Terminal: [Kitty](https://github.com/kovidgoyal/kitty)

Shutdown menu: [Wlogout](https://github.com/ArtsyMacaw/wlogout)

Screenshots: [Hyprshot](https://github.com/Gustash/Hyprshot)

(WIP) Widgets: [Quickshell](https://quickshell.org)

## Features

[████████████████████████████░░░░░░░░░░░░░░░░░░░░░░░] 55%

### General

- [x] Brightness control with `brightnessctl`
  - [x] Soften the change between 0% and 10%
    - Fix: Use `-e2`
- [x] Volume control with `pamixer`
  - [x] Automatic unmute when inccreasing the volume
    - Fix: Use `-u` when increasing the volume
- [x] Wlogout menu
- [x] Hyprshot for screenshots
- [ ] Save Wi-Fi passwords and allowing automatic connection
- [ ] Solve problem when accessing the other disk from dolphin
- [ ] Implement Hyprlidle
- [ ] Implement Plymouth
  - Append `quiet splash` to GRUB_CMDLINE_LINUX_DEFAULT under /etc/default/grub
- [ ] Install Minecraft
- [ ] Install Osu
- [ ] Customize SDDM
- [ ] Make SDDM be able to use fingerprint
- [ ] Unify theme/cursor for GTK and Qt
- [ ] Animated wallpaper (GIF/video) integrated with quickshell wallpaper changer
- [ ] Set password wallet for certain apps (Brave, VSCode, etc.)
- [ ] Solve dolphin issue when using "Open with"
- [ ] Battery Administrator (TLP, auto-cpufreq, etc)

### Quickshell

- [ ] Main bar
  - [x] Workspaces
  - [x] Volume
  - [ ] Media control
  - [x] Brightness
  - [x] Battery
  - [x] Date/Time
  - [ ] Bluetooth state
  - [ ] Netowork state
  - [x] Shutdown button
- [ ] App launcher
- [ ] Control panel like swaync
- [ ] On screen displays
  - [ ] Volume
  - [ ] Brightness
  - [ ] Caps Lock
  - [ ] Num Lock
- [ ] Configuration menu
- [ ] Wallpaper changer
- [ ] Screen lock
- [ ] Wlogout like power menu
