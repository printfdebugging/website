---
title: comments are better than separate file worklogs
date: 2025-10-11
---

a worklog is a journal, but for projects. you write things you found
during investigation like weird error messages, approaches which don't
work and build a mental model of the problem on paper (a text file).
but there's a problem with this separate file approach, it makes you
switch context quite too often and that adds overhead as you come back
and pickup from where you left.

comments solve this issue. with multiline comments, you can add as
much information as you want next to the code without any context
switch. you can number those comments to leave a trail which you can
backtrack on. it also comes in handy when you want others to look at
your code and suggest changes as you don't have to share a separate
log file to communicate your observations and reasoning as you log
that right next to the code you change. later you can just remove the
unneccessary comments and keep the important ones.
