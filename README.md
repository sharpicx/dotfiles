```sh
   ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
   ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
   ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
   ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██╗██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═╝╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
-- sharpicx personal dotfiles --

```

## Prologue
This is my personal configuration (dot) files of all the programs i use on a daily based on *GNU/Linux* which system distribution called *Arch Linux*. a little bit shit reason, I don't know why i picked up Arch as daily operating system, but in the fact i admit it if the user repository aka AUR has a lot of nice softwares or programs offers, provides to a user. and yeah some little shit challenge should i do when trying to install this one. I made this setup as comfortable and stable as possible for myself, and maybe for those of you that want to use it.

Here's the components of my setup.

## Components
|Program|Name|
|---|---|
|GNU/Linux Distro|[Arch Linux](https://archlinux.org)|
|Window Manager|[bspwm](https://github.com/baskerville/bspwm)|
|Compositor|[picom](https://github.com/jonaburg/picom)|
|Bar|[polybar](https://github.com/polybar/polybar)|
|File Manager|[ranger]() & thunar|
|Terminal|[kitty]()|
|Shell|[zsh]()|
|Program Launcher|[rofi]()|
|Notification-Daemon|[dunst]()|
|Code Editor|[nvim]() & [vscode]()|
|Music Player|[cmus]()|
|Video Player|[mpv]()|
|Scrot Program|[flameshot]()|
|Web Browser|[Google Chrome]()|
|GTK Theme|Arc-Darkest-Frost|
|GTK Icon|Arc|

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
Soon.

## Credits
* [r/unixporn](https://reddit.com/r/unixporn)
* [Linuxer Desktop Art](https://www.facebook.com/groups/303997109715275)
* [Dotfiles Indonesia](https://t.me/dotfiles_id)
* [Aditya Shakya](https://github.com/adi1090x) thanks for your great work!
* [Rizqi Nur Assyaufi](https://github.com/bandithijo) for arch installation.
* [Harry Elrc](https://github.com/owl4ce) for inspiring me about linux rice at his blog.
