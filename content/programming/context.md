---
title: think at the global scope as you modify some local scope
date: 2025-11-12
---

reading other's code and modifying it can be tricky, there might be
some code somewhere which uses the code you just modified and you have
no idea about it. therefore as you read/modify some code, ask yourself

1. is this required?
2. how does this relate to the other code, some of which i just read and some which i have no idea about.

don't keep the mental model limited to the local scope (file or
module), zoom out a bit and try to understand the code you are
reading/modifying in the bigger picture (series of events).

just asking "what does it do and how" isn't enough. you also need to
ask what other code uses this code, how does changing this code change
the behavior of that code, and other similar questions.

like while doing some code cleanup, ask yourself whether the code you
are removing/moving is used by some code somewhere which you aren't
aware of? i made some changes to the checkbox widget code and that
introduced some bugs in the dialog checkboxes, had i not checked
that, the bug would have made it to the release (but some tests are
failing, so thanks to the dev who wrote those tests).

<!-- vim:tw=70:ts=4:sw=4:et:ft=markdown:norl:iskeyword+=-,.: -->
