```sh
   ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
   ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
   ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
   ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
   ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
   ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
-- sharpicx personal dotfiles --

```
## Prologue
This dotfiles is based in Indonesia and made by me. I did this because i need to backup all of my dotshits to keep off reconfiguration. I don't want to get crash or something which is where i have to do is setting up the configuration again. i just need to download the dots from this repo and store it step by step like a pro. and feel free for ya to use it. idfc about copy paste or wot. because as you need to know, in this world everything is about ATM (Amati Tiru Modifikasi) it stands for (In English mode) Observe, Copy, Modification.

## Some trouble
* ### Display Manager
  This is just reminder for me about this issue: <https://github.com/manilarome/lightdm-webkit2-theme-glorious/issues/32>.

* ### BlackArch Repo
  All you have to do is
  ```bash
  # rm -rf /etc/pacman.d/gnupg
  # pacman --init
  # pacman --populate archlinux blackarch
  # pacman --update --keyserver keyserver.ubuntu.com
  ```
* I will add more later

## Components
|Program|Name|
|---|---|
|GNU/Linux Distro|[Arch Linux](https://archlinux.org)|
|Window Manager|[bspwm](https://github.com/baskerville/bspwm)|
|Display Manager|[LightDM](https://archlinux.org/packages/?name=lightdm) & lightdm-webkit2-greeter|
|Compositor|[picom](https://github.com/jonaburg/picom)(fork)|
|Bar|[polybar](https://github.com/polybar/polybar)|
|File Manager|[ranger](https://github.com/ranger/ranger) & [thunar](https://archlinux.org/packages/?name=thunar)|
|Terminal|[kitty](https://github.com/kovidgoyal/kitty)|
|Shell|[zsh](https://github.com/zsh-users/zsh)|
|Program Launcher|[rofi](https://github.com/davatorium/rofi)|
|Notification-Daemon|[dunst](https://github.com/dunst-project/dunst)|
|Code Editor|[vim](https://github.com/vim/vim)|
|Music Player|[cmus](https://github.com/cmus/cmus)|
|Video Player|[mpv](https://github.com/mpv-player/mpv)|
|Scrot Program|[flameshot](https://github.com/flameshot-org/flameshot)|
|Web Browser|[Google Chrome](https://aur.archlinux.org/packages/google-chrome/)|
|GTK Theme|[My Own Theme :3](https://github.com/sharpicx/dotfiles/tree/main/.theme)|
|GTK Icon|[Tela-icon-theme](https://www.pling.com/p/1279924)|

## Scrot
![gambar](https://i.postimg.cc/X3yV2rWf/image.png)

![skalasuci](https://imgshare.io/images/2021/11/20/2021-11-20_21-09_1.png)

![perdana](https://imgshare.io/images/2021/11/20/2021-11-20_21-09_2.png)

* NB: why the vim colors above are different?<br/>
The answer is: because i got stuck when i was trying to figure out which one was comfortable to use :).

## Credits
* [r/unixporn](https://reddit.com/r/unixporn) for the many dotfiles provided in the community.
* [Aditya Shakya](https://github.com/adi1090x) for your great work!
* [Rizqi Nur Assyaufi](https://github.com/bandithijo) teach me for the arch installation.
* [Harry Elrc](https://github.com/owl4ce) inspiring me up about linux ricing at his blog.
