---
title: how to fix your code after code reviews
date: 2025-11-12
---

usually the changes are in a series of commits one after the other.
start from first read all the comments and try to understand if they
suggest some small changes or something which spans multiple commits
and is related.

let's say there's no such big change suggested, which is ususally the
case, then you start from the very first commit in the series and
implement the suggested changes. don't mark the comment as resolved
yet as these suggestions don't just apply to one commit, make sure you
look through other commits to see if this suggestion applies there
and if it does, make the fixes in those commits and then resolve this
comment. do it for reach comment.

when you are fixing something, make sure that you test the fix on
top of the commit series and once it works there, you can just stash
the changes and apply and ammend them to a particular commit in
interactive rebase. the idea is to not checkout to a particular commit
and then implement the fix as that fix might not play well with the
following commits and then it would be just more work to test it
twice (and potentially fix it twice).
