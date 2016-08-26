# Org mode setup file to make (La)TeX definitions work

This is an Org mode Literare Program, which is tangled (by pressing
`C-c C-v t`, in the default keymap with the `.org` file loaded) to an
Org mode setup file.  The program uses Org mode's builtin macros,
which (apparently) have an undocumented feature of executing any Emacs
Lisp code they contain (tested in Emacs 24.5.1, Org mode 8.2.9), to
define a generic macro `when-fmt` for including code in only specified
export formats (and any formats derived from them).  It then uses this
to define a `preamble` macro for inserting preamble code in HTML and
LaTeX formats, and finally several macros for each definition command
supported by both MathJax and (La)TeX.
