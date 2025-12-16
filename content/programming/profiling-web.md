---
title: profiling code in browser
date: 2025-10-23
---

browsers have a performance tab in the developer tools console.
it usually has a button which when clicked starts recording the
performance statistics, then you perform the activity and hit stop
recording.

after that it presents you a nice ui with call-trees, flame-graphcs
and screenshots. you can then find out the action which you want to
profile and look through it. you do it twice, once with your changes
and once without your chanes and see if your changes made it worst
somehow.
