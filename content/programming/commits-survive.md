---
title: only commit messages (and tests) survive the test of time
date: 2025-10-23
---

commit messages and tests survive the test of time therefore should
have enough information for others to make sense. just having a good
commit title isn't enough, include reference to the commit hashes
which this commit builds on, not the immediate parents but the distant
ones if any.

the rule of thumb is to imagine some new dev (or yourself) reading
your code in future and by then you forgot everything about the code.
the commit message and the tests should have enough information for
the reader to quickly (in reasonable time) understand what's going on.
