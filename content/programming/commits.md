---
title: push changes in a series of clean atomic commits
date: 2025-07-26
---

each patch/commit that you create should do just one thing and
shouldn't do anything else. avoid unneccessary formatting changes and
cleanups in the middle of a feature commit as they just introduce
noise to the patch making it harder to review.

when someone is reviewing your patch, they don't know anything about
it, so they have to load your-change into their head and make sense
out of it and when they find that they loaded formatting changes, they
have to take it out which impedes the process of reviewing.

each commit should fix a subproblem and should be created as you fix
that subproblem. this way you don't have a lot of uncommited code at
later stages and thus avoid the risk of breaking something and not
knowing what broke, sure you can figure out, but that wastes time.
