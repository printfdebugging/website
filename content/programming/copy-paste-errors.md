---
title: the risks of copy pasting code
date: 2025-07-28
---

every now and then you might copy some code from here and paste it
there forgetting to update to pasted code and the worst thing is that
it might still work :).

then you get to know about this in production. worst when someone else
pushes a patch titled copy paste error and adds you as the reviewer,
have been there myself, not a good place to be in.

if you have such copy-paste errors in your code, that means that you
are not reading the code properly. one should first go through the
code token by token and only as they parse the token in their head,
they should think of it's high level meaning and where it fits in the
mental model. 

while parsing each token, ask yourself, is this the right token? does
this belong here? is it used correctly? and based on that decide
whether a token should be there or should be removed. this should be
done while writing the code, while copy-pasting code and while code
reviewing.
