---
title: log files are better than stdout
date: 2025-10-22
---

often error messages or verbose command outputs are big text walls
with densely packed information which is hard to navigate on the
stdout. redirecting it to a file and then reading that file helps as
then you can format the output, separate out important parts from
unimportant ones, save it for later review etc.

editors can be customized to highlight the keywords like `ERROR`,
`FAILURE`, the whole line with such words can be highlighted. you can
also grep out these words from the file. redirecting to a log file
makes life easy.
