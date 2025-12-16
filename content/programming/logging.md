---
title: logging macros and programming
date: 2025-08-13
---

recently i happened to write some code which i think was beautiful,
not because the code had something special about it, but the logging
macros were a sight to behold. they make the code rock solid, if
logging is on and the condition fails, it would be logged on the
stderr, or to a file making it much easier for the developers to find
what's wrong. they won't have to spend time to find where the issue
is.

this reminds me of the verbose switch, a developer should include a
verbose flag in their logger implementation so that enabling various
levels of logging is a piece of cake, both for other developers and
the users of the software.

```cpp
case SID_NAVIGATOR_SELECT_COMMENT:
{
    const SfxPoolItem* pItem;
    if (pArgs && pArgs->HasItem(FN_PARAM_1, &pItem))
    {
        OUString aCommentString = static_cast<const SfxStringItem*>(pItem)->GetValue();
        if (SfxChildWindow* pWin = GetViewFrame().GetChildWindow(SID_NAVIGATOR))
        {
            SwNavigatorWin* pNavWin = static_cast<SwNavigatorWin*>(pWin->GetWindow());
            if (pNavWin->m_xNavi && pNavWin->m_xNavi->m_xContentTree)
                pNavWin->m_xNavi->m_xContentTree->BringCommentToAttention(aCommentString);
        }
        else
            SAL_WARN("sw.ui", "GetChildWindow(SID_NAVIGATOR) == nullptr");
    }
    else
        SAL_WARN("sw.ui", "failed to extract FN_PARAM_1 i.e. CommentNumber");
}
break;
default:
    assert(false && "wrong request method");
    break;
```
