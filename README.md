# Dotfiles

![](/rice.png)

##### This is my personal collection of dotfiles for my Dell XPS 15 9570 running Bedrock Linux.

I've been searching for a distro for what seems like forever now, but I finally feel like I've found a setup that perfectly fits both my needs _and_ my preferences. Before I turned this into a Bedrock system, it was running Void linux (musl), which, while I personally loved, it was challenging or outright impossible to run certain software that I either needed for university, or wanted personally. This repository contains both my dotfiles, and my opinions on Bedrock Linux.  Mainly, why I believe it is a great fit for myself, and possibly for others who have a hard time completely agreeing with the philosophies and standards of an individual distribution of Linux/Unix.


##### Here is some info about my setup:


+ **OS**: [Bedrock Linux](http://bedrocklinux.org) --> [more details below](#bedrock-linux)
+ **WM**: [Personal build of DWM](https://github.com/jiv222/dwm)
+ **Terminal**: [Personal build of St](https://github.com/jiv222/st)
+ **Font**: [Cherry](https://github.com/turquoise-hexagon/cherry)
+ **Icons in bar**: [Siji](https://github.com/stark/siji)


## Use my dotfiles

I use the **GNU Stow** program to backup and restore my dotfiles, so adding them to your system is extremely simple:
    
Simply download stow, clone this repository, and stow can easily create symlinks to each file's proper location.
I have them grouped in related categories so, for example, run:
    
```shell
stow suckless
```
    
This will symlink everything inside of my `suckless` directory to a matching tree of files inside your home directory, meaning you will now have a `.suckless` directory
inside of your home directory containing my build of dwm, st, dmenu, dwmblocks status bar and a script I sometimes use to identify names of window classes. 
    
* *The `root` directory is the only one you should probably avoid running stow on, as this is just where I keep system files that I later place somewhere in the root filesystem.*
* *Make sure to install the needed dependencies if you want to build any of these for yourself.*
* *Also, the dwmblocks statusbar is from [Luke Smith's github](https://github.com/LukeSmithxyz/dwmblocks), just customized for my preferences and my system.*


* *There's a good chance,unless you are running a very similar device as me, you'll have to edit some of the scripts and commands both inside dwm and dwmblocks.*
    *  *For example, I use [light](https://github.com/haikarainen/light) to control my laptop's backlight, and have dwm keybindings specifically to do so.*
    *  *Look at Luke's repo to understand how dwmblocks works. I have my scripts under `~/.local/bin/dwmblocks/.`*

At the very least, these should serve as a starting ground and/or inspiration, especially if you've never used dwm before.


## Bedrock Linux

#### How my system is _currently_ configured and how I use it:
*I can typically break down my needs of an OS in three groups.*  

**1. School and Work**

Number one, and most importantly, I need to be able to run the software I need for university. 
I'm _okay_ with having to jump some hurdles sometimes to get things to work (otherwise I'd be on Windows lol), but for the most part, I don't want my OS to prevent me
from getting my schoolwork done.  Void with musl is kind of in a gray area here, as most of what my school uses can be accessed on any Linux or Windows system. The only 
real trouble I've had is getting zoom installed for online classes, so that's where the Arch strata came into play.  I'm able to easily run a `yay -S zoom` and it's ready
for me.  This just wasn't possible on a solely musl OS (without chroot trickery). This also applies to some things that span outside of the scope of my school, as I 
frequently test and experiment with new blockchain and cryptocurrenty related software.  If a new project catches my eye, I don't want to have to jump through hurdles 
just to get a binary.

**2. Trust, Comfort, Stability**

Next, I'd like to feel comfortable with and have trust in an OS, in the sense that I won't have to take time away from what I am actively working on to fix a buggy bleeding edge
piece of software.  While I am running Arch and a few programs from the Arch repos, I typically prefer to install a package with xbps in void if it is available.  Void has, personally,
never died on me, and I have a much better sense of control and understanding of my system.  For example, I currently have 9 active services running, 3 of which are tty's.  If there is a 
problem, which there hardly ever is, I know it is something I probably caused and can fix it without having to dive into crazy systemd documentation.  Also, I find xbps is smarter
in handling updates, where as to Arch, it is solely up to the user to avoid things such as partial upgrades.  Keeping the majority of the system in void, and only using pacman
and the AUR when I have to compile some program with glibc, makes due for a much more stable OS, so I can focus on what I really want to.

**3. Choice, Preferences, Philosophy**

Finally, I like to enjoy my OS.  Looking back at the previous point, I'd say I already spend a pretty good amount of time configuring my linux machines and exploring new software. While I love to do so, I do not love doing it when my (broken) system _makes_ me do so.  Honestly, I initially tried out QubesOS, NixOS, and even Void because I thought it would be
fun to do so.  While Nix just wasn't really my thing, and QubesOS is just a bit too immature and pressed for a refresh for me right now, I really enjoy using Void.  Throw Arch on top and the 
possiblilities are endless.  When I say I like to enjoy an OS, I mainly mean the OS itself, but also I don't want to be restricted to a core set of software, like in Qubes, and even distros like Debian. For as simple as Void is, I never find myself bored or frustrated with it, and find that I've learned a huge amount about Linux itself while using it. Comparing it to arch, I find that
fixing something that personally broke, is both more enjoyable, and more rewarding, then trying to deal with a inherently broken piece of software.  Personally, this is the biggest reason why I like Void more than 
a bleeding edge distro like Arch.  Being able to use the AUR and pacman when I **want to** is a huge positive for me in Bedrock.

Summing up these points, Bedrock allows me to have the enjoyment and **personal** preferences of the way Void Linux works.  I believe the Void developers often prioritize performance over
what is more common in the overall linux/unix community, especially when you look at their choice to offer a Musl buld and LibreSSL over OpenSSL.  However, being stuck with the limitations of these
two choices, especially as a student, the fact that Bedrock linux allows me to fallback to Arch and the "common" way of doing things is both a huge relief and boost in productivity.  Honeslty,
Arch and Void are two extremely similar distro's, so it might seem nonsensical to go through the trouble of Bedrock just to run both.  I'm sure some other configuratio of Bedrock
could be a totally different system, but the its ability to let me choose exactly what tools I need and prefer makes it perfect for me.  I understand this isn't too specific
in regards to _exactly_ what I use each strata for, but it is I would argue that I use it for the choice more than anything.  I can continue to use Void, since it is more stable and more
enjoyable for me than a standalone arch install, but also boot into Arch with systemd over runit, or access the AUR when my needs and responsibilities outweight the preferences of a developer or myself.

