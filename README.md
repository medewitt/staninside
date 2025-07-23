
<!-- README.md is generated from README.Rmd. Please edit that file -->

# staninside

<!-- badges: start -->

[![R-CMD-check](https://github.com/medewitt/staninside/actions/workflows/R-CMD-check.yaml/badge.svg?branch=main)](https://github.com/medewitt/staninside/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/medewitt/staninside/branch/main/graph/badge.svg)](https://app.codecov.io/gh/medewitt/staninside?branch=main)
[![CRAN
status](https://www.r-pkg.org/badges/version/staninside)](https://CRAN.R-project.org/package=staninside)
<!-- badges: end -->

The goal of staninside is to facilitate the use of
[CmdStanR](https://mc-stan.org/cmdstanr/) and packages leveraging
[Stan](https://mc-stan.org/) code.

## Installation

From Github:

``` r
remotes::install_github("medewitt/staninside")
```

Alternatively, try
[r-universe](https://medewitt.r-universe.dev/#builds):

``` r
# Enable this universe
options(repos = c(
    medewitt = 'https://medewitt.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))

install.packages('staninside')
```

## Motivation

CmdStanR is a fantastic resource for interacting with Stan. The benefits
include using the latest version of Stan and associated feature (which
may not be available to RStan), no need for Rcpp dependencies, and
licensing (BSD vs GPL3). Personally, the ability to ship packages with
the raw Stan code allows users to directly interact with the code and
update it based on their needs.

One issue that staninside seeks to solve is the prohibition by CRAN of
manipulating a user’s files:

> Packages should not write in the user’s home filespace (including
> clipboards), nor anywhere else on the file system apart from the R
> session’s temporary directory (or during installation in the location
> pointed to by TMPDIR: and such usage should be cleaned up). Installing
> into the system’s R installation (e.g., scripts to its bin directory)
> is not allowed.

Per <https://cran.r-project.org/web/packages/policies.html>

Staninside seeks to resolve this issue by providing a framework for
package authors who wish to use Stan and CmdStanR to stay in compliance
with CRAN Policies. This is done by providing helper functions with
write and compile Stan code from within a package to the user’s package
cache using the `rappdirs` package.

## Code of Conduct

Please note that the staninside project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
