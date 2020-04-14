## Dotfiles
![](/rice.png)

This is my personal collection of dotfiles for my Dell XPS 15 9570 running Bedrock Linux.

I've been searching for a distro for what seems like forever now, but I finally feel like I've found the perfect one for me.
Before I turned this into a Bedrock system, it was running Void linux (musl), which while I loved, made it very hard/impossible to install certain pieces of software.
While I could have easily switched back to Arch, I loved how fast and simple Void's runit and XBPS were.  Now I found a way to get the best of both worlds.


Here is some info about my setup:


+ **OS**: [Bedrock Linux](http://bedrocklinux.org/) --> [more details below](#Bedrock)
+ **WM**: [DWM](https://dwm.suckless.org/)
+ **Terminal**: [st](https://st.suckless.org/)
+ **Compositor**: [picom fork with dual_kawase blur and rounded corners](https://www.reddit.com/r/unixporn/comments/fs8trg/oc_comptonpicom_fork_with_both_tryone144s_dual/)
+ 

## Use my dotfiles
I use the **GNU Stow** program to backup and restore my dotfiles, so adding them to your system is extremely simple:
    Simply download stow, clone this repository, and stow can easily create symlinks to each file's proper location.
    I have them grouped in related categories so, for example, running:
    ```shell
    stow suckless
    ```
    will symlink everything inside of my suckless directory to a matching tree of files inside your home directory, meaning you will now have a `.suckless` directory
    inside of your home directory containing my build of dwm, st, dmenu, dwmblocks status bar and a tool I sometimes use to identify names of window classes.
    
*Make sure to install the needed dependencies if you want to build any of these for yourself*
*Also, the dwmblocks statusbar is from [Luke Smith's github](https://github.com/LukeSmithxyz/dwmblocks), just customized for my preferences and my system*
*There's a good chance,unless you are running a very similar device as me, you'll have to edit some of the scripts and commands both inside dwm and dwmblocks. Look at Luke's repo to understand how dwmblocks works. I have my scripts under `~/.local/bin/dwmblocks/.`*



## Bedrock Linux
I installed (or "hijacked") my Voidlinux system with Bedrock, then installed Arch alongside Void.  If you're interested in what made me want to do this, and why I think
it's so great, below I explain how and why I ended up extremely happy with this setup.

Looking back, I found myself in the same sort of loop with each distro I tried.  Arch was great, until I started spending more time maintaining the machine than doing
anything else on it.  Debian was rock solid, but as someone who loves to try new software, it ended up being a bit too slow to receive updates for my liking.  Next, I
tried NixOS, which seemed like it'd be a great combination of having stability as well as a wide amount of software available to me.  Unfortunately, I just didn't have
the time or desire to learn the nix language in order to make the most use out of it.  Then, I started to get sick of systemd, so I tried Void linux, which to this day,
is probably my favorite all around distro.  Runit is simpler and more lightweight that systemd, plus Void's XBPS was both fast and reliable.  Xbps-src gave me access to
nearly the same amount of software as Arch as well.  Most recently, I wanted to learn a bit about QubesOS, so I gave that a shot.  While I the security components of it,
it's current version is still running Fedora 25, so updated packages in it's main dom0 was either impossible or a huge pain to get working.  I ended up going back to Void,
this time trying out the musl version.  A distro without glibc pretty much means all proprietary software is thrown out the window, but other than that, my only other 
personal problem with Void was its choice to use LibreSSL over the more standard OpenSSL, making dotnet incompatible with it.  While they seemed to care more about 
performance than overall compatibilty, I agreed with them.  This is why, due to Void's faster init service, great package management, and overall lightweight 
footprint, I still think it is a better, yet very similar, version of Arch. 

When trying to figure out how to get a certain program to work in Void for my university, I stumbled upon Bedrock Linux and was immediately intruiged.  My first time 
installing it on my Void system ended up with a huge error relating to being unable to mount a btrfs subvolume, I got myself a fresh install of void-musl on ext4 and 
began tweaking.  For such new software, I've been really impressed, and can now install most core packages I need with XBPS, utilize the dead simple and fast runit system,
and the benefits of musl, while having arch and pacman at my immediate disposal to install the things I simply couldn't on a normal Void system.  Unlike Qubes,
the integration between OS's (or "strata" as they are called in Bedrock) is seamless, almost equally as light on system resources, and so much more convenient.  Yes, the 
security isn't even close to QubesOS's model, it's a trade-off I, currently, am more than happy to make.  I understand bedrock might not be a great fit for every user,
but for myself, it's as close to perfect as I think I'll ever get, so I figured I'd explain a little of my reasoning as to why I think so, and maybe display some of its
strengths for other users who are curious.
