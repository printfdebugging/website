+++
title = "Project Report LibreOffice Themes GSoC '24"
date = 2024-09-15
description = ""
taxonomies.tags = [ "GSoC" ]
+++

> **I plan to rewrite it as soon as the patches are merged.**

# About the Project

The project was about enabling color customization of the application, so that the
users can change the application's UI  colors as per their tastes. Additionally it
should be possible to  use extensions as themes to set  the UI colors. LibreOffice
uses VCL, which interfaces with various  widget toolkits. So actually the task was
to color  customize all  the `VCL_PLUGINS`  (like GTK3, QT...)  in a  uniform way.
[Heiko] and  [Rafael] were  my mentors for  this project, and  thanks to  them the
project was completed on time (code review still in progress as of 2024-09-18, but
it works!).

[Heiko]: mailto:heiko.tietze@documentfoundation.org
[Rafael]: mailto:rafael.palma.lima@gmail.com

# Various Challenges

## I had to Buy a New Computer

I faced quite a few challenges during the project. The first challenge was that my
laptop just  couldn't make  it, it  has 4 cores,  and I  found myself  waiting for
around 3 hours after  adding a getter, and a setter in  the `settings.hxx` file. I
bought  a  top-of-the-line computer  (7950x,  64G,  RX6600), which  compiled  such
changes in under 15 minutes.

## Getting MacOs VM to Work

I had to implement themes for gtk, qt, osx, win. I dualbooted windows and linux to
work on gtk, qt,  win, but I didn't have access to a  mac machine. The only option
was to use  a mac VM. I tried [Quickemu]  I first tried it when I  didn't have the
GPU, and it was barely usable back  then, clicking on a button hung everything for
a second, the screen had a lot  of tearing... Then I tried various other solutions
like [OSX-KVM], and  [macOS-Simple-KVM], and none worked. The  macos versions were
not the latest, and update mechanism was broken.

[Quickemu]: https://github.com/quickemu-project/quickemu
[OSX-KVM]: https://github.com/kholia/OSX-KVM
[macOS-Simple-KVM]: https://github.com/foxlet/macOS-Simple-KVM

I thought of trying GPU passthrough, and  bought a GPU(RX6600) for that. After 4-5
days of failed attempts at passthrough, I  went back to Quickemu. This time it was
a lot smoother as I allocated large amount  of resources to the VM + the GPU might
have something to do with it, it was usable.

## Closed Source VCL_PLUGINS

Another challenge was  the closed source VCL_PLUGINS. I don't  have any experience
of working  with widget toolkits,  and the  only skills I  have are some  C++, and
reading other's code. For  plugins like Qt which are open-source  I could read the
sourcecode and figure out what's going on, but it was very different for win32 and
osx's APIs. On top of that C# made things a little more difficult.

Then there  were some cases  where the existing code  was using the  colors wrong,
[this  patch's] commit  message explains  it quite  well. There  were quite  a few
patches  and, I  often found  myself juggling  between various  VCL_PLUGINS, which
arguabelly slowed things down a little.

[this patch's]: https://gerrit.libreoffice.org/c/core/+/171916

## Regression in the Desktop ENV Theme

While working on the  QT based VCL_PLUGIN, an episode happened  where at first the
menubar customization was  working, but then suddenly it stopped  working. I tried
some approaches/workarounds, but I couldn't get it to work. Later after trying and
failing at other approaches, I realized that it  wasn't a bug in my code, but some
regression on the  theme's side. I forgot  to take into account the  fact that the
theme and the desktop environments can change as well.

I filed a [bug report] regarding this issue .

[bug report]:  https://bugs.kde.org/show_bug.cgi?id=493550

## This was My First Big Project

This  was  my  first  big/serious/official   project  with  predefined  goals  and
deadlines. I often scribbled on my  rough notebook how the data/control flows, and
I had to go through some iterations of  `plan --> does it work? --> plan again..`.
Luckily I started in the correct sequence of first managing how the colors will be
saved and accessed (the base patch),  and implementing the plugin patches over the
base patch.

Inspite of all these  challenges it was a good experience, and I  felt like a real
developer as  I was  changing a  lot of  the old  code, adding  things of  my own.
Looking back I feel  that I could have utilized the community  bonding period in a
better way,  but I didn't  know all the  things from the  get go, like  the laptop
won't be  enough, or macos vm  won't work etc etc.  I also feel the  need to learn
project planning formally.

# About the Code

The code is  divided into 2 parts,  the first part being the  part[1] patch, which
makes  the  system  colors  accessible  to  various  `VCL_PLUGINS`  via  a  static
object `StyleSettings::mxThemeColors;`. `mxThemeColors` gets  it's colors from the
registry,  which  is managed  by  the  `ColorConfig_Impl`  objects. Any  UI  color
customization travels via the `registry --> ThemeColors --> VCL_PLUGINS` route.

The      `ColorConfig::SetupTheme()`      function      is      something      you
should     start     with    in     order     to     expand    to     the     rest
of    the     logic    in     `ColorConfig::LoadRegistryColorsFromSystem()`    and
`ColorConfig::LoadThemeColorsFromRegistry()`. The state  of the ThemeColors object
is managed using flags `LOADED`, `NOT_LOADED`, and `RESET`. The VCL_PLUGIN related
code uses  these to check  whether the  colors are loaded  or not, or  whether the
colors have been changed (reset or change), or whether themes is enabled or not.

GTK customizes  it's widgets  using css,  whereas qt  uses `QPalette`,  `QSS`, and
custom `QStyle` to customize it's widgets. I didn't have much info about win32 and
osx, as most of their code is closed source. Most of the widgets there aren't even
native,  so  I just  custom  drew  them  in the  respective  `drawNativeControl..`
functions. I don't know of any better approach than that, but would appreciate any
suggestions.

# Current State of the Project

The patches for the project are linked in the sources section of the blog. Michael
Weghorn has been reviewing the part 1 and part 3 (QT) patches, and there are a few
unresolved comments left which  I will try to resolve at  the earliest. Other VCLs
like GTK,  OSX and  Win32 still  need reviewers who  have experience  working with
those VCL_PLUGINS.

# Future Plans for the Project

This future starts once  all the patches from part 0 till 5  are merged. The first
idea  is  to  work  on  the  toolbar/notebookbar/menubar  customization  to  allow
gradient/image backgrounds.  Additionally custom drawing  the titlebar so  that it
can be color/image customized  as well. It just got me  thinking that custom drawn
titlebar opens  many possibilities for  implementing tabbed UI, something  which I
have been wanting to work on for quite some time.

It would be nice  if the `AppBackground` which is the area  behind the document is
also gradient/image customizable.  I expect a lot tickets related  to the project,
and will try my best to solve them quickly.

# Sources

- [Program Project | Google Summer of Code](https://summerofcode.withgoogle.com/programs/2024/projects/M5PxrB9V)
- [Libreoffice Theme Part 0: Read correct colors from qt based VCL_PLUGINS (171916)](https://gerrit.libreoffice.org/c/core/+/171916/17)
- [Libreoffice Theme Part 1: Make registry colors accessible from VCL (168016)](https://gerrit.libreoffice.org/c/core/+/168016/49)
- [Libreoffice Theme Part 2: GTK Color Customization (168829)](https://gerrit.libreoffice.org/c/core/+/168829/10)
- [tdf#158943 Libreoffice Theme Part 3: Qt Color Customization (168901)](https://gerrit.libreoffice.org/c/core/+/168901/35)
- [Libreoffice Theme Part 4: Windows Color Customization (170840)](https://gerrit.libreoffice.org/c/core/+/170840/5)
- [Libreoffice Theme Part 5: OSX Color Customization (171239)](https://gerrit.libreoffice.org/c/core/+/171239/3)

[1]: https://gerrit.libreoffice.org/c/core/+/168016/49

# Gallery

Please don't take these  as an implication that the project  is complete. It still
is a very much  WIP project, and only after thorough testing by  the users one can
know.  Like  while taking  these  screenshorts,  I  found  that the  writer's  app
background needs some work, that's why that screenshot is not included. I will add
more of these in future with links to the themes.

## Plasma KDE

{{ gallery() }}
