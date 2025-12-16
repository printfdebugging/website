---
title: writing code with a nicely* organized* context
date: 2025-10-31
---

code has a context it's written in like the various files/modules
it interacts with, the various cases it is triggered in and how it
handles them. code (data and data-processors == functions) moves from
an organized state towards chaos if you just keep adding code without
giving a critical thought to the context.

code readability doesn't mean just nice/understandable variable names.
the variable names should also represent the context in which they
are being written. the context tends to spread with time and just being
aware of this fact can help you avoid that. designing perfect code in
advance is almost impossible. in any real world setting, there are
invariants which you will know about only when you write code.

code too is written in iterations over the initial prototype and it
changes form with each commit. so the focus should be that with each
commit, the code should become more readable, readable such that when
someone new looks at that code, they get the whole picture, they
shouldn't later find out that this code handles some edge cases which
are not obvious from the code, which are not described using comments
or the commit message.

treating data and logic separately helps with this as then you think
of the data, the logic and the context that they interact in. then
you can keep an eye at each of these and improve things with each
iteration.

<!-- vim:tw=70:ts=4:sw=4:et:ft=markdown:norl:iskeyword+=-,.: -->
