---
title: Developer Handbook
date: 2024-12-25
---

- **A patch is  a unit of change therefore it shouldn't do  more than one thing**.
That makes it really easy for the reviewer to understand the changes and give some
feedback quickly. And later if that change  is not required, then it can simply be
reverted. One way of  finding if the patch does more than one  thing is to look at
the commit message. If  the commit message talks about more  than one thing (which
can exist as separate patches), they should exist as separate patches.
