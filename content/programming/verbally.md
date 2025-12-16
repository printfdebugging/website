---
title: programming verbally and thinking with language constructs
date: 2025-07-31
---

programming is an active process, you speak out what you see in your
head. just looking at the code is not enough to get things done in
reasonable time, you got to have a systematic approach. the processing
has to be on the conscious mind, not the subconscious. after a few hours
of verbal investigation, you understand what's going on.

this is specially relevant when you are dealing with a large codebase.
[comments are better than separate file worklogs]. a worklog helps you
externalize the mental model so that you can pick up where you left
the last time. an important use of worklog is hierarchies, parent-child
hierarchies and relationships of types with the others. so you add the
type to your hierarchy as you go on reading and at the end you have a
pretty clear picture of how things are laid out.

[comments are better than separate file worklogs]: /programming/worklogging/

while reading code, pay special attention to the types, and ask
yourself why is this type passed into this function, or in that
class's constructor. why this parent class instance keeps a reference
to the child etc. these help you build a mental model. thinking
in terms of functionality instead of parent-child terms helps as
parent-child analogy is just a language construct for who has what
functionality, code is always in terms of functionality.
