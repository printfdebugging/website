---
title: stages in a programming pipeline
date: 2025-08-24
---

## understanding the problem
the first stage involves `reading/preparation` before you jump
into the code. you read the ticket in this issue and take notes
about what's the problem and what are the proposed solutions, who's
mentoring the project etc.

## rapid prototyping
once you understand the request, the `prototyping and exploration`
stage starts. this involves trying different approaches and code
reading. the goal is to cover the most breadth in the least amount
of time. read [approaching big projects], [comments are better than
separate file worklogs] and [refactoring code] to learn more. during
this stage, you sit down with your mentors and iterate on the ideas
quickly and find what works.

[approaching big projects]: /programming/abstractions
[refactoring code]: /programming/refactoring/
[comments are better than separate file worklogs]: /programming/worklogging/

## refactoring and code cleanup
after prototyping, you fill in the imprtant details to cover the edge
cases. once that is done and all the asks were implemented, you start
refactoring the code, to make it readable read. now is the time to remove
the project log comments from the code. [be the first reviewer before
pushing the changes].

[be the first reviewer before pushing the changes]: /programming/review/

## testing
tests are scary but they are important. once you push the change for a
final review, you start putting together a follow-up patch with tests.
code constructs and comments can express some assumptions but code
changes over time and comments are at a risk of becoming obsolete.
tests make sure that certain assumptions hold true and they will fail
if some change far away violates those assumptions.
