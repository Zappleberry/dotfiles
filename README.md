# openbox-dotfiles

## TODO

- **Done** Make speedy script for my use-case (set up symbolic links).
- Fix the fonts.
- **Known Issue** Fix the GTK3/qt radio-button and check marks.

## Why directory is a bit of a mess

I am currently figuring out which theme I am happy with. I will clean it up once I am happy with what theme I want to stick with.

## Badwolf gtk theme

Badwolf is a theme I forked from [DarK by sixsixfive](https://gitlab.com/sixsixfive/DarK-theme). It looked nice and I wanted to make a badwolf color variant.

Currently the GTK3 or possibly qt framework doesn't like radio-buttons and check marks. Looking into fixing it.

Issue isn't going to be resolved simply, probably better to use DarK by sixsixfive. This section is no longer maintained.

### Note Regarding Badwolf.

I figured out the issue with Badwolf and the radio/check buttons. Sixsixfive lists on their gitlab the reason behind the issue. It's from the icons for gtk3 being stored seperately from the main directory that I used (I incorrectly thought that it was just icons for applications). I tried using that directory to fix the issue several times (copying it into `/usr/share/themes`, `/usr/share/icons`, `~/.themes`, `~/.icons`, installing from sixsixfive's install script) but nothing fixed the issue when I re-applied the theme or restarted lxsession. As such, I am no longer using Badwolf and just using Adwaita. It is not desirable but I would rather invest time in making a userChrome.css for Firefox. Just in case sixsixfive sees this, I doubt it is anything to do with your theme, just me messing up something in the install process. In case anyone like's the Badwolf color variant of DarK, and doesn't mind the messups or would like to try fixing them, I am going to leave Badwolf in this repo, I think DarK has a color configuration tool though.

## Mistral-Openbox-Theme

The window decoration theme I am using. I think I modified it about 2018.02 for Badwolf color theme. Since been changed, don't remember when or how I changed it thoguh.

## rofi-themes

Badwolf theme for rofi. I used arc-red to make it.

### NOTE

I have switched to dmenu because I can get more bang for my buck out of it and prefer it's appearance. As such rofi-themes are no longer useful, probably will delete in future.

## spacemacs

My spacemacs config. Build spacemacs with minimal install and ivy, only modifications are the font (Hack) and the theme (Base16-Ashes).

## .emacs.d.bak

My emacs configurations. Trying to switch back to normal emacs + evil as spacemacs is about twice as heavy. That or possibly starting emacs as a daemon on login. Maybe both.

## .vimrc

vim configuration file. WIP as I need more things to get it to work for my workflow. Might switch to vim from spacemacs/emacs due to the startup time of them.

## Xdefaults

Am using a base16-ashes theme, modified to use transparancy.

## xinitrc

Not using this at the moment, will use in future use cases for launching bpswm.

## Xmodmap

Just remaps caps_lock and escape.

## Fonts

Contains siji bitmap font. I know that it can be enabled by setting:
`/etc/fonts/conf.d/70-no-bitmaps.conf` to `/etc/fonts/conf.d/70-no-bitmaps.conf.old` (disabling the file)
However, when I do this, it just causes some fonts to loose their aliasing. I'm not sure what the solution is, but I am looking into it.
