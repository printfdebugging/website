---
title: good code vs bad code (and documentation)
date: 2025-07-26
---

good code is very descriptive about itself, it doesn't present a
fragmented context/model of the problem to the reader but tries to
fill in as many details as possible, either through comments or by
using code constructs which make that aspect of the mental model
'obvious' at first look.

the reader knows at the first look where to go next. enums and data
structures are one way to do it, proper naming of functions and
structures help quickly understand what data is being transformed in
what way. but most of the code out there is not that good, some of it
is written by me ;).

documentation and manpages should have minimal examples so that the
users of the program/library have something to hold on to. maybe this
is what a tutorial is supposed to do. i hate man pages without any
examples at the end.
