---
title: don't write many conditions inside the conditional
date: 2025-07-26
---

often we find ourselves in situations where we are have many
conditions with `==` and `!=` and `&&` and `||` in various
combinations. in such cases we should refactor the code and create
boolean variables out of those conditions and then put those boolean
variables in the conditionals. this makes the code much more readable.

```ts
private adjustDocumentMarginsForComments(onZoomOrResize: boolean) {
    const commentSection = app.sectionContainer.getSectionWithName(
        app.CSections.CommentList.name,
    ) as cool.CommentSection;

    const cursorAtComment =
        commentSection.sectionProperties.selectedComment &&
        !commentSection.sectionProperties.selectedComment.isEdit();

    if (!onZoomOrResize && cursorAtComment) {
        commentSection.unselect();
    }

    const commentsHiddenOrNotPresent =
        commentSection.sectionProperties.show != true ||
        commentSection.sectionProperties.commentList.length == 0;

    if (commentsHiddenOrNotPresent) {
        this.recenterDocument();
        return;
    }

    if (this.documentCanMoveLeft()) {
        this.documentScrollOffset = this.documentMoveLeftByOffset();
        this.scrollHorizontal(this.documentScrollOffset, true);
    } else if (onZoomOrResize) {
        this.documentScrollOffset = 0;
    }
}
```

this typescript code is quit readable, the boolean variables which are
later used in the conditionals give meaning to the bunch of conditions
themselves and thus we don't need comments there to describe what the
conditional is there for or what the conditions represent.

there is no crouding in one place. had these conditions been placed
directly in the conditionals, the could would have been messy and
hard to understand as one wouldn't know what those conditions and
conditionals represent without some doing digging themselves.
