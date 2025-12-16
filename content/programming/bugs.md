---
title: real world bugs are not so simple
date: 2025-07-28
---

some of these bugs don't show up when testing with a dummy document,
or testing in a developer environment. these bugs are quite hard to
reproduce. other bugs might trigger in certain conditions on only
certain systems.

bit flags cause quite some headaches specially in languages like
c and c++ which don't even complaint about such errors. types are
another concern in such languages as you can often use wrong type like
equating/assigning to/from different sized integers. these are also a
nightmare to debug.
