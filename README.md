## komaletter: Simple yet flexible Letters via the KOMA-Script LaTeX Bundle 

[![Travis build status](https://travis-ci.org/rnuske/komaletter.svg?branch=master)](https://travis-ci.org/rnuske/komaletter) 
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/rnuske/komaletter?branch=master&svg=true)](https://ci.appveyor.com/project/rnuske/komaletter) 
[![Package-License](http://img.shields.io/badge/license-GPL--3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html) 
[![CRAN](http://www.r-pkg.org/badges/version/komaletter)](https://cran.r-project.org/package=komaletter) 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1221316.svg)](https://doi.org/10.5281/zenodo.1221316)

### Motivation
Simple letters tend to look very much alike. They are either determined by a 
standard eg. window envelope style or writer's preferences. Thus, if the layout
is fix, they lend themselves to be written in R Markdown.

The [KOMA-Script LaTeX Bundle](https://www.komascript.de) provides layouts for
many common window envelope types (German, US, French, Japanese, ...) and the
possibility to define your own layout. The *komaletter* package also provides
it's own default layout loosely based on DIN 5008B.

This package is an adaptation of the
[linl](https://cran.r-project.org/package=rmarkdown) package
by Dirk Eddelbuettel and Aaron Wolen. Which leans on earlier work by 
Aaron Wolen in his [pandoc-letter](https://github.com/aaronwolen/pandoc-letter) 
repository and extends it for use from R via the
[rmarkdown](https://cran.r-project.org/package=rmarkdown) package.


### Examples

#### Skeleton
The skeleton creates a very simple letter as a starting point for your own
writing. Several formatting defaults for font, fontsize, indentation are in use.
See `vignette('intro', 'komaletter')` and `help(komaletter)` for a complete list
and default values. The following figure shows the complete source on the left
and the rendered pdf on the right.

![](./man/figures/skeleton.png)


#### Vignette
The vignette examples are a little more featureful and show how to include a
signature, choose a different layout and a few formatting settings.
All of these are driven by simple YAML headers as seen on the left.
The vignettes also contain a few lines of vignette metadata one would be
excluded from a normal letter.

![](./man/figures/letter_example1.png)


### Installation
As the package is on CRAN, you can use the standard incantation to install the
released version. A development version of komaletter can be installed from 
Github using the package devtools.

```r
# the easiest way is to install from CRAN
install.packages("komaletter")

# or get the development version from Github
# install.packages("devtools")
devtools::install_github("rnuske/komaletter")
```


### Usage
To start a new letter one can call the skeleton using the `rmarkdown::draft` or the RStudio menu: New File > R markdown... The document can be compiled to PDF via `rmarkdown::render` or the RStudio Knit button.

```r
# load rmarkdown
# komaletter enhances rmarkdown and doesn't need to be loaded
library(rmarkdown)

# start a new letter using the provided skeleton
draft("myletter.Rmd", template="pdf", package="komaletter", edit=FALSE)

# change myletter.Rmd to your liking

# turn Rmd into a beautiful PDF
render("myletter.Rmd")
```

### Requirements
Beyond the R package dependencies, a working `pandoc` binary and a LaTeX
distribution including KOMA-Script is needed. RStudio installs it's own copy of
pandoc, otherwise do what is needed on your OS. For LaTeX look for `texlive`
which is included in most Linux distributions or `MiKTeX` if you are using
Windows. KOMA-Script is part of all but the most bare bone LaTeX distributions.
Something like `sudo apt-get install pandoc pandoc-citeproc texlive` should provide everything needed on Debian/Ubuntu.

If you plan to write non-english letter, make sure you have the necessary 
language packs, _i.e_ `texlive-lang-german`.

### Authors
Robert Nuske, Dirk Eddelbuettel and Aaron Wolen.


### License
GPL-3 for this package, the work in [pandoc-letter](https://github.com/aaronwolen/pandoc-letter), 
as well as underlying Pandoc template.
