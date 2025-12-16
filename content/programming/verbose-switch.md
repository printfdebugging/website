---
title: the verbose switch
date: 2025-07-28
---


every program has some kind of verbose switch, specially those which
run as daemons/clients/listeners. it enables various levels of
logging which helps us understand what's actually going on and fix our
issues.

while writing your own programs, it's quite important to add such log
statements at key points such as conditionals and data state check
points so that if anything goes wrong, the users of your program get
to know exactly what's going on.

