---
title: the natural way of expressing things
date: 2025-07-31
---

each function or logical block of code has a direction, it calls some
functions on objects, gets some data, operates on that data. there are
multiple ways of expressing this flow, not all being good.

[this] commit demonstrates it pretty well, instead of checking `if
(vUrls.empty())` and returning, we check for the favourible case and
thus connect the logical chain with the previous statement i.e. `get
the urls` -> `if not empty, open them all`. when written the bad way,
it reads like `get the urls` -> `return if empty` -> `if not empty,
open them all`, there`s redundent logic in this chain of thought.

[this]: https://gerrit.libreoffice.org/c/core/+/188621
