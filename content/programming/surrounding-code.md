---
title: don't get lost in the surrounding code
date: 2025-07-28
---

there are a lot of classes around the code that you are trying to
debug and understand, and it's easy to get sidetracked by going to 
definition of class after class and digging into the specifics.

therefore one should make their way through the code to the core of
the problem, to the code which is causing the issue and then expand
from there as much as required. setting the right breakpoints helps,
using conditional breakpoints and printf statements helps. if it's a
crash then stack traces tell exactly where you should set the first
breakpoint.
