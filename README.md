
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qmdtemplate

## Installation

You can install the development version of `qmdtemplate` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("elizabethjump/qmdtemplate")
```

You should also make sure you have an up to date version of Quarto (the
program, not the package) installed. Download that
[here](https://quarto.org/docs/blog/posts/2024-11-25-1.6-release/).

------------------------------------------------------------------------

## Overview

This R package has one function: `create_qmd()`. This function will
create a new Quarto document that has been pre-formatted using Typst.
Usage:

``` r
library(qmdtemplate)

create_qmd(file_name = "Quarterly",
           ext_type = "typst_pdf")
```

You can watch this video to see the expected behavior:

![](images/function-demo.mp4)

If you’d like to create your own package that does something similar,
you can copy the R code and folder structure from this package. The
example included here is for a Quarto doc formatted with Typst but you
can adjust that as desired. If you’ve never built an R package before, I
suggest you follow the instructions in the [R Packages
(2e)](https://r-pkgs.org/) book.

## Resources

- [Quarto and Typst](https://quarto.org/docs/output-formats/typst.html):
  Posit overview for formatting Quarto documents with Typst
- [Typst website](https://typst.app/docs/): has an overview of Typst,
  tutorials and guides to functions
- [Quarto Typst
  templates](https://github.com/quarto-ext/typst-templates): repo of
  Quarto Typst templates from the Typst team
- [SMC
  resources](https://github.com/San-Mateo-County-Health-Epidemiology/Helpful-Code-Bits/blob/main/typst/typst-template.typ.md):
  our repo we made with some lessons learned from formatting with Typst

## Attributions

Huge shoutout to Meghan Hall who did something similar and shared her
work at
[Posit::conf(2024)](https://www.youtube.com/watch?v=VJEBg1Ke0lE&feature=youtu.be).
Her presentation is the inspiration for this project.
