---
title: refactoring code
date: 2025-09-26
---

in [delay design decisions], we talked about not
refactoring ahead of time when you don't know what problems lie ahead.
that was all true, but that only applies to projects in their initial
stage. this doesn't apply to multi people projects which are past that
initial stage.

interfaces can also be used for refactoring, but it can be a little
tricky. interfaces introduce some assumptions and if the platform api
or the implementation api doesn't conform to those assumptions, it
becomes a complex mess pretty quickly.

so if you are working on multiple projects, then note that they may
require totally different approach to things as basic as refactoring.
the rules which apply to one might not apply to other. usually asking
the question "can this be improved" takes you to a crossroad where you
have all the options cached into your head to decide what's best.

[delay design decisions]: /programming/design-decisions
