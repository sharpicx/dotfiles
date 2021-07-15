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
This repo is my personal dofiles configuration of all the programs i used on Arch such as daily. and i decided to make the repo public for now so anyone can access it easily and try it to get how impressive it is. this rice is too comfortable and stable as first creature created so you can try it without any bugs or problems found on it, so chill out.

## Components
|Program|Name|
|---|---|
|GNU/Linux Distro|[Arch Linux](https://archlinux.org)|
|Window Manager|[bspwm](https://github.com/baskerville/bspwm)|
|Compositor|[picom](https://github.com/jonaburg/picom)(fork)|
|Bar|[polybar](https://github.com/polybar/polybar)|
|File Manager|[ranger](https://github.com/ranger/ranger) & thunar|
|Terminal|[kitty](https://github.com/kovidgoyal/kitty)|
|Shell|[zsh](https://github.com/zsh-users/zsh)|
|Program Launcher|[rofi](https://github.com/davatorium/rofi)|
|Notification-Daemon|[dunst](https://github.com/dunst-project/dunst)|
|Code Editor|[vim](https://github.com/neovim/neovim) & [vscode](https://archlinux.org/packages/community/x86_64/code/)|
|Music Player|[cmus](https://github.com/cmus/cmus)|
|Video Player|[mpv](https://github.com/mpv-player/mpv)|
|Scrot Program|[flameshot](https://github.com/flameshot-org/flameshot)|
|Web Browser|[Google Chrome](https://aur.archlinux.org/packages/google-chrome/)|
|GTK Theme|[Arc-Darkest-Nord-Frost](https://www.pling.com/p/1319331/)|
|GTK Icon|[Arc-Darkest-Frost-Numix-Flat](https://www.pling.com/p/1333968/startdownload?file_id=1574546516&file_name=Arc-Darkest-Frost-Numix-Flat_1.4.2.zip&file_type=application/zip&file_size=12915285)|

a small bit shit, i got blackarch repo installed in my machine. <br/>
i will tell you how i did the installation.

just follow this step..
```sh
$ curl -O https://blackarch.org/strap.sh
$ chmod +x strap.sh
$ ./strap.sh
```
if you got some trouble after installation like, keyring error or something like that, idk i was forget lol.
follow this step again.
```
# pacman-key --init
# pacman-key --populate
# pacman-key --refresh-keys
# pacman -Syyu
```
or if that step didnt work. you can add this `Server = https://blackarch.org/` at the bottom of your mirrorlist file `/etc/pacman.d/mirrorlist`.
after that, run this command `pacman -Syy`. done.

To check the blackarch repo installed in your machine do this command
```
$ pacman -Sgg | grep blackarch
```

## Screenshot
<img id="scrot" src="https://github.com/sharpicx/dotfiles/blob/main/screenshots/mylove.png">

## Credits
* [r/unixporn](https://reddit.com/r/unixporn)
* [Linuxer Desktop Art](https://www.facebook.com/groups/303997109715275)
* [Dotfiles Indonesia](https://t.me/dotfiles_id)
* [Aditya Shakya](https://github.com/adi1090x) thanks for your great work!
* [Rizqi Nur Assyaufi](https://github.com/bandithijo) for arch installation.
* [Harry Elrc](https://github.com/owl4ce) for inspiring me about linux rice at his blog.
