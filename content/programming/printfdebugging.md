---
title: printf-debugging
date: 2025-11-01
---


printf-debugging is pretty useful in situations where you want to
understand the behavior of a function or a group of functions over a
certain action. in such cases, you can't really use a debugger and
set breakpoints specially if the interaction involves cursor as the
debugger will keep breaking at the set breakpoints and you would have
to either change window focus or move your cursor to the debugger
controls.

for javascript, looking at the the logs in the console below while
interacting with the user interface elements is a nice way to see
the state of various variables in real time. though one needs to
carefully decide what they want to log and what not because these logs
pile up really fast. ideally i prefer 5-6 lines of logs per
interaction "while trying to understand/debug".
