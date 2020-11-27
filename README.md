
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rfunc2

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/bwd29/Rfunc2.svg?branch=master)](https://travis-ci.com/bwd29/Rfunc2)
<!-- badges: end -->

The goal of Rfunc2 is to provide functions for changepoint detection.

## Installation

You can install the released version of Rfunc2 from
[CRAN](https://CRAN.R-project.org) with:

``` r
remotes::install_github(“bwd29/Rfunc2”)
```

## Example

This is a basic example of binseg and changepoint:

``` r
library(Rfunc2)
## basic example code
Rfunc2::BINSEG(c(1,2,3,4,5,6),2)
#>      [,1] [,2]
#> [1,]    3 10.5
#> [2,]    5  2.5

Rfunc2::CHANGEPOINT(c(1,2,3,4,5,6))
#> [1]  3.0 10.5
```
