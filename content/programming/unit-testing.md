---
title: writing tests for your code
date: 2025-10-23
---

tests are very important, often 1 test is equivalent to 20 future bug
fixes. documentation gets outdated, comments get outdated, but tests
never get outdated. they document the behaviour and enforce it on each
change.

countless times it has happened that i pushed some code and someone
broke it. qa tagged me on that because they found my commit introduced
the now-buggy-feature. having tests ensures this never happens, when
you push a test, you are saying "don't break my code!".
