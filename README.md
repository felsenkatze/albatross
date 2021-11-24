# Albatross

A simple pandoc template for use with markdown documents inspired by [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) but built from scratch. The default options are ones that I think are good for documents, but the requirements of my school can easily be fulfilled by supplying the additional metadata file [school.yaml](school.yaml). The current status of school requirement fulfillment can be found in [ROADMAP.school.md](ROADMAP.school.md).

# Usage

Compile your markdown documents with this template calling

```sh
pandoc -f markdown input.md -t latex --template albatross.tex -o output.pdf --pdf-engine=xelatex
```

Instead of `xelatex`, `lualatex` can be used. But it is not possible to use `pdflatex` because it does not support custom fonts.

For use with school requirements, call

```sh
pandoc -f markdown input.md -t latex --template albatross.tex -o output.pdf --pdf-engine=xelatex --metadata-file school.yaml
```

To use the biblatex package, it is necessary to convert the markdown file first to `.tex` and then compile it with `xelatex` and `biber`:

```sh
pandoc -f markdown input.md -t latex --template albatross.tex -o output.tex
xelatex output.tex
biber output
xelatex output.tex
xelatex output.tex
```

# Custom Vars

| var              | values                   | purpose                                                                  |
| ---------------- | ------------------------ | ------------------------------------------------------------------------ |
| bibliography     | url                      | 1. include package biblatex, 2. add bibliography resource 'bibliography' |
| bib-style        | biblatex-style options   | defaults to authoryear-ibib                                              |
| bib-maxcitenames | integer                  | max names to cite in text                                                |
| bib-maxbibnames  | integer                  | max names in bibliography                                                |
| bib-autocite     | autocite style           | defaults to 'plain'                                                      |
| bib-block        | block options (biblatex) | defaults to 'none'                                                       |
| bib-timezone     | true, false              | defaults to false, if true, print the time zone in bibliography          |
| bib-itemskip     | true, false              | set the space between bibliography entries                               |
| bib-et-al        | true, false              | use 'et al.' instead of the lang default                                 |
| bib-sorting      | biblatex sort options    | set the sorting of citations in the bibliography                         |
| bib-doi          | true, false              | print doi                                                                |
| bib-nourl        | true, false              | do not print url                                                         |
| bib-isbn         | true, false              | print isbn                                                               |

| var          | values             | purpose                                                             |
| ------------ | ------------------ | ------------------------------------------------------------------- |
| flush-left   | true, false        | flush-left orientation of text in whole document, defaults to false |
| font-size    | integer + pt       | defaults to 12pt                                                    |
| paper-format | latex paper format | defaults to 'a4paper'                                               |

| var  | values                  | purpose                             |
| ---- | ----------------------- | ----------------------------------- |
| lang | babel languages (array) | languages that babel should support |

| var              | values                                     | purpose                                            |
| ---------------- | ------------------------------------------ | -------------------------------------------------- |
| preamble-include | latex statements to be put in the preamble | include exotic packages, or other things           |
| include-before   | text, latex, whatever                      | insert text before the document inserted by pandoc |
| include-after    | text, latex, whatever                      | insert text after the document inserted by pandoc  |
| appendix         | text, latex, whatever                      | inserted after document and before include-after   |
| appendix-before  | text, latex, whatever                      | inserted directly before appendix                  |
| appendix-after   | text, latex, whatever                      | inserted directly after appendix                   |

| var               | values                                | purpose                                               |
| ----------------- | ------------------------------------- | ----------------------------------------------------- |
| caption-options   | options for cation package            | define options for caption package                    |
| pagestyle         | pagestyle name defined in preamble    | set the default pagestyle                             |
| csquotes-commands | commands to be inserted near csquotes | insert custom commands, i.e. quote style declaration  |
| h<n>-size         | font size                             | set the font size for heading on n level (h1, h2, h3) |
| pdfpages          | true, false                           | usepackage pdfpages                                   |
| titletoc          | true, false                           | usepackage titletoc (customize TOCs)                  |

Information on optional titlepage:

| var       | values           | purpose                          |
| --------- | ---------------- | -------------------------------- |
| titlepage | true, false      | whether to print a titlepage     |
| subject   | string           | display the school subject       |
| course    | string           | specific school course           |
| semester  | string, integer  | semester of school               |
| email     | string           | authors email                    |
| teacher   | string           | teacher who gives marks for work |
| tutor     | string           | personal tutor                   |
| date      | string           | date of last document edit       |
| institute | array of strings | print the location of school     |
| location  | string           | location of author               |

| var               | values      | purpose                                                      |
| ----------------- | ----------- | ------------------------------------------------------------ |
| dot-after-section | true, false | whether to print a dot after the section number, e.g. 1., I. |

# Limitations

- titlepage table entries only in german
  - should be easy to change
  - if you know how to add different language support, create a pull request or email me
