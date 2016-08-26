<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Org mode setup file to make (La)TeX definitions work</a>
<ul>
<li><a href="#sec-1-1">1.1. Usage</a></li>
<li><a href="#sec-1-2">1.2. Contributing</a></li>
<li><a href="#sec-1-3">1.3. License</a></li>
</ul>
</li>
</ul>
</div>
</div>

# Org mode setup file to make (La)TeX definitions work<a id="sec-1" name="sec-1"></a>

This is an Org mode Literate Program, which is tangled (by pressing
`C-c C-v t`, in the default keymap with the `.org` file loaded) to an
Org mode setup file named `define.setup`.  The program uses Org mode's
builtin macros, which (apparently) have an undocumented feature of
executing any Emacs Lisp code they contain (tested in Emacs 24.5.1,
Org mode 8.2.9), to define a generic macro `when-fmt` for including
code in only specified export formats (and any formats derived from
them).  It then uses this to define a `preamble` macro for inserting
preamble code in HTML and LaTeX formats, and finally several macros
for each definition command supported by both MathJax and (La)TeX.

## Usage<a id="sec-1-1" name="sec-1-1"></a>

To use the setup file, you must copy the `define.setup` file (or a
regenerated version of it, if you modify the SRC blocks in the `.org`
program file) somewhere Emacs can access, then put the following near
the beginning of your own `.org` file:

    #+SETUPFILE: path/to/define.setup

After that, you can use the `def` or `newcommand` (and friends)
macros, which are all named after the standard (La)TeX commands.  You
do *not* need to update a dynamic block, duplicate the definitions, or
any other craziness, and the definitions will work *almost* anywhere
in a file.  (It will *not* work if you try to define it after its
first use, however.)

All of the commands which can take optional parameters (that is, the
LaTeX `newcommand` and friends) have the optional parameters *at the
end* of the command (instead of between the first and second mandatory
parameters, as in LaTeX).  I did this because it's much easier to make
an Org mode macro parameter optional at the end than elsewhere.

There are some simple usage examples at the end of the program itself,
and the examples/ directory currently contains one extended example:

-   **rotation.org:** An explanation of how [rotation matrices](https://en.wikipedia.org/wiki/Rotation_matrix) can be
    derived by purely algebraic methods.

## Contributing<a id="sec-1-2" name="sec-1-2"></a>

If you have some good examples &#x2014; either simple or extended, but in
any case relatively short (use the existing examples as a guide for
what I mean) &#x2014; you'd like to add, pull requests are welcome!  I
would particularly like to add some simple demos of the macros which
do not yet have any.  (They are marked with the TODO tag in the Org
mode source.  If you write one, I would prefer you simply remove the
TODO tag rather than marking it DONE.)

## License<a id="sec-1-3" name="sec-1-3"></a>

This program is licensed under the GNU GPLv3+.
