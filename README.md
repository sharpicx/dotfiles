```sh
   ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
   ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
   ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
   ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
   ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
   ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
-- sharpicx personal dotfiles --

```
# Prologue
This repository is based in Indonesia and made by me. I did this because i need to backup all of my dotfiles to keep off reconfiguration. I don't wanna get crash or something error that should be fixed which was where i have to do is setting up the configuration again. and tbh, the easily way to say is i just need to download the dots from this repo and store it myself step by step like a pro when i've got a new device or something else. and feel free for you to use it. idfc about copy paste or wot. because as you need to know, in this world everything is about ATM (Amati Tiru Modifikasi) it stands for (In English mode) Observe, Copy, Modification. dont need to say much, let's get in.

#  Components

|Program|Name|
|---|---|
|GNU/Linux Distro|[Arch Linux](https://archlinux.org)|
|init system|[systemd](https://systemd.io/)|
|Window Manager|[bspwm](https://github.com/baskerville/bspwm)|
|Network|[networkmanager](https://archlinux.org/packages/extra/x86_64/networkmanager/)|
||[iwd](https://archlinux.org/packages/?name=iwd)|
|Fonts|nerdfonts|
||notofonts|
|Display Manager|[LightDM](https://archlinux.org/packages/?name=lightdm)|
|Compositor|[picom](https://github.com/jonaburg/picom)-fork|
|Bar|[polybar](https://github.com/polybar/polybar)|
|File Manager|[ranger](https://github.com/ranger/ranger)|
|Terminal|[kitty](https://github.com/kovidgoyal/kitty)|
|Terminal Multiplexer|[tmux](https://github.com/tmux/tmux)|
|Shell|[zsh](https://github.com/zsh-users/zsh)|
|Program Launcher|[rofi](https://github.com/davatorium/rofi)|
|Notification-Daemon|[dunst](https://github.com/dunst-project/dunst)|
|Code Editor|[vim](https://github.com/vim/vim)|
||[neovim](https://github.com/neovim/neovim)|
|Music Player|[spotify](https://github.com/spicetify/)|
|Video Player|[mpv](https://github.com/mpv-player/mpv)|
|Scrot Program|[flameshot](https://github.com/flameshot-org/flameshot)|
||[maim](https://github.com/naelstrof/maim)|
||[imagemagick](https://github.com/ImageMagick/ImageMagick)|
|Web Browser|[Google Chrome](https://aur.archlinux.org/packages/google-chrome/)|
|GTK Theme|[Skueos GTK](https://github.com/daniruiz/skeuos-gtk)|
|GTK Icon|Arc|
||Archcraft-Dark|
||Tela-dark|
||[Tela-pink-dark](https://www.pling.com/p/1279924)|


# Troubles

this part explicates about how i already completed solving some trouble issues when i'm trying to reconfig or taking a new configuration on some irking program, so freaking sense.

* ## Display Manager
  This one is just reminder-like for me, about a small issue: <https://github.com/manilarome/lightdm-webkit2-theme-glorious/issues/32>.

* ## Repository Error
  All you have to do is
  ```bash
  ~# rm -rf /etc/pacman.d/gnupg
  ~# pacman --init
  ~# pacman --populate archlinux blackarch
  ~# pacman --update --keyserver keyserver.ubuntu.com
  ```
* ## Blocked-sites
   I dont know if there had a blocked-site issue because i live in Indonesia where the country have a weird regime and freakin policy, If you wanna take a internet-freeing aka surving free and maybe watch a porn on the internet or something like illegal accesses, just replace [this file](https://github.com/bebasid/bebasid/blob/master/releases/hosts/) into your own, that's all.

* ## Neovim 
   * ### Lua
      about how i configured neovim, first of all u need to understand yourself lua.
      * <https://moys.gov.iq/upload/common/Programming_in_Lua%2C_4th_ed._%282017%29_.pdf>
      * <https://link.springer.com/content/pdf/bbm%3A978-1-4020-9920-5%2F1.pdf>
      * <https://xp-soaring.github.io/xplane/library/FlyWithLua_Manual_en.pdf>
      * <https://github.com/LewisJEllis/awesome-lua>
   * ### Github Copilot
      soon.

* i will add more soon... if i had problem on my own.

## Scrot
![gambar](https://i.ibb.co/fpyXVFc/26-04-22-05-29.png)

## Credits
* [r/unixporn](https://reddit.com/r/unixporn) 
  thanks for the dotfiles provided in the community.
* [Aditya Shakya](https://github.com/adi1090x) 
  thanks for your great work!
* [Rizqi Nur Assyaufi](https://github.com/bandithijo) 
  thanks for teaching me about the arch installation, now i already have sharpened my knowledge because of your article, that's cool!
* [Harry Elrc](https://github.com/owl4ce) 
  inspired me up about how linux ricing looks like, even tho the firstly part was so confusing!
