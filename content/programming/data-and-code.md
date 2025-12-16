---
title: decoupling data from the processing logic
date: 2025-07-26
---

you have data, some of it is global i.e. the application state and
some of it is local to modules or functions. some functions process
the data changing it form one consistant state to another and produce
no side-effect, while others produce side-effects based on the input
data. no function should do both of them together. we are not talking
about constructors here.

this is relevant at the cleaning-up stage, not at the prototyping
stage where the soul focus should be on exploring hidden corners and
implementation details instead of building abstractions. read 
[refactoring code] and [stages in a programming pipeline] to know more.

[refactoring code ]: /programming/refactoring/
[stages in a programming pipeline]: /programming/stages

