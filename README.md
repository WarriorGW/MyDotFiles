<h1 align='center'>My Dotfiles</h1>

## Components

Window Manager: [Hyprland](https://hypr.land)

Bar: [Waybar](https://github.com/Alexays/Waybar) - Deprecated

Notification daemon: [swaync](https://github.com/ErikReider/SwayNotificationCenter)

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
- [x] Save Wi-Fi passwords and allowing automatic connection
- [x] Solve problem when accessing the other disk from dolphin
  - Terminal -> sudo pacman -S hyprpolkitagent
  - Hyprland.conf -> exec-once = systemctl --user start hyprpolkitagent
- [x] Solve dolphin issue when using "Open with"
  - Terminal -> sudo pacman -S archlinux-xdg-menu
  - Terminal -> XDG_MENU_PREFIX=arch- kbuildsycoca6
  - Hyprland.conf => env = XDG_MENU_PREFIX,arch-
- [ ] Implement Hyprlidle
- [x] Implement Plymouth
  - Append `quiet splash` to GRUB_CMDLINE_LINUX_DEFAULT under /etc/default/grub
  - Copy the plymouth theme to /usr/share/plymouth/themes
  - To verify the theme exists -> sudo plymouth-set-default-theme -l
  - To select the theme -> sudo plymouth-set-default-theme theme-name
  - Rebuild (in my case) dracut -> sudo dracut-rebuild
- [ ] Install Minecraft
- [ ] Install Osu
- [x] Customize SDDM
  - Used [Hyprland-kath](https://github.com/Keyitdev/sddm-astronaut-theme)
- [x] Make SDDM be able to use fingerprint
  - Terminal -> sudo pacman -S fprintd
  - /etc/pam.d/sddm add at the top:
    - auth [success=1 new_authtok_reqd=1 default=ignore] pam_unix.so try_first_pass likeauth nullok
    - auth sufficient pam_fprintd.so
  - Terminal -> sudo systemctl restart sddm
- [ ] Unify theme/cursor for GTK and Qt
- [ ] Animated wallpaper (GIF/video) integrated with quickshell wallpaper changer
- [x] Set password wallet for certain apps (Brave, VSCode, etc.)
  - Used gnome-keyring with libsecret
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
