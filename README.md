# openbox-dotfiles

## TODO

- Make speedy script for my use-case (set up symbolic links).
- **DONE** Fix the GTK3/qt radio-button and check marks.

## Badwolf gtk theme

Badwolf is a theme I forked from [DarK by sixsixfive](https://gitlab.com/sixsixfive/DarK-theme). It looked nice and I wanted to make a badwolf color variant.

Currently the GTK3 or possibly qt framework doesn't like radio-buttons and check marks. Looking into fixing it.

### Note Regarding Badwolf.

I figured out the issue with Badwolf and the radio/check buttons. Sixsixfive lists on their gitlab the reason behind the issue. It's from the icons for gtk3 being stored seperately from the main directory that I used (I incorrectly thought that it was just icons for applications). I tried using that directory to fix the issue several times (copying it into `/usr/share/themes`, `/usr/share/icons`, `~/.themes`, `~/.icons`, installing from sixsixfive's install script) but nothing fixed the issue when I re-applied the theme or restarted lxsession. As such, I am no longer using Badwolf and just using Adwaita. It is not desirable but I would rather invest time in making a userChrome.css for Firefox. Just in case sixsixfive sees this, I doubt it is anything to do with your theme, just me messing up something in the install process. In case anyone like's the Badwolf color variant of DarK, and doesn't mind the messups or would like to try fixing them, I am going to leave Badwolf in this repo.

## config

All my specific files for `~/.config/`, which is currently my openbox key-mapping, neofetch config, ranger (needs some updating), some beautification for rofi, and badwolf zathura "theme."

## Mistral-Openbox-Theme

The window decoration theme I am using. I think I modified it about 2018.02 for Badwolf color theme.

## rofi-themes

Badwolf theme for rofi. I used arc-red to make it.

## spacemacs

My spacemacs config. Build spacemacs with minimal install and ivy, only modifications are the font (Hack) and the theme (Badwolf).

## Xdefaults

Am using one of Luke Smith's Xdefaults that I modified to create mine. Unsure which of his I used (from a while ago).

## xinitrc

Not using this at the moment, will use in future use cases for launching bpswm.

## Xmodmap

Just remaps caps_lock and escape. It works fine, but getting lxde to launch it on startup is a pain.
