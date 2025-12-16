---
title: self documenting code is a lie, write comments!
date: 2025-07-26
---

comments should explain why the code is this way. this helps the
readers of the code quickly get clues about what is going on so that
they don't have to goto the definition of each call and figure things
out. header files should have doxygen comments to describe the api
and the internals of a struct like why it exists. 

here are a few code snippets from [sanjay ghemawat]'s (a well known
google enginner) code, one can read the code with comments like prose.

[sanjay ghemawat]: https://github.com/ghemawat

```go
// findfilter is a filter that produces matching nodes under a filesystem
// directory.
type findfilter struct {
    dir       string
    ifmode    func(os.filemode) bool
    skipdirif func(string) bool
}

// find returns a filter that produces matching nodes under a
// filesystem directory. the items yielded by the filter will be
// prefixed by dir. e.g., if dir contains subdir/file, the filter
// will yield dir/subdir/file. by default, the filter matches all types
// of files (regular files, directories, symbolic links, etc.).
// this behavior can be adjusted by calling findfilter methods
// before executing the filter.
func find(dir string) *findfilter {
    return &findfilter{
        dir:       dir,
        ifmode:    func(os.filemode) bool { return true },
        skipdirif: func(d string) bool { return false },
    }
}
