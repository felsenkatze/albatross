# Albatross

A simple pandoc template for use with markdown documents inspired by [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) but built from scratch. The default options are ones that I think are good for documents.

# Usage

Compile your markdown documents with this template calling

```sh
pandoc -f markdown input.md -t latex --template albatross.tex -o output.pdf --pdf-engine=xelatex
```

Instead of `xelatex`, `lualatex` can be used. But it is not possible to use `pdflatex` because it does not support custom fonts.

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

| var          | values             | purpose                                                             |
| ------------ | ------------------ | ------------------------------------------------------------------- |
| flush-left   | true, false        | flush-left orientation of text in whole document, defaults to false |
| font-size    | integer + pt       | defaults to 12pt                                                    |
| paper-format | latex paper format | defaults to 'a4paper'                                               |

| var  | values                  | purpose                             |
| ---- | ----------------------- | ----------------------------------- |
| lang | babel languages (array) | languages that babel should support |

| var              | values                                     | purpose                                  |
| ---------------- | ------------------------------------------ | ---------------------------------------- |
| preamble-include | latex statements to be put in the preamble | include exotic packages, or other things |
