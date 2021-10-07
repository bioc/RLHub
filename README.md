# RLHub <img src="https://rlbase-data.s3.amazonaws.com/misc/assets/whitebgRLHub+Logo.png" align="right" alt="logo" width="240" style = "border: none; float: right;">

<!-- badges: start -->

[![BiocCheck](https://github.com/Bishop-Laboratory/RLHub/workflows/BiocCheck/badge.svg)](https://github.com/Bishop-Laboratory/RLHub/actions) [![Codecov test coverage](https://codecov.io/gh/Bishop-Laboratory/RLHub/branch/main/graph/badge.svg)](https://codecov.io/gh/Bishop-Laboratory/RLHub?branch=main) [![BioC status](http://www.bioconductor.org/shields/build/release/bioc/RLHub.svg)](https://bioconductor.org/checkResults/release/bioc-LATEST/RLHub)

<!-- badges: end -->


# Introduction

*RLHub* (part of [*RLSuite*](https://gccri.bishop-lab.uthscsa.edu/rlsuite/)) provides easy access to the processed R-loop mapping data stored in [RLBase](https://github.com/Bishop-Laboratory/RLBase). It is an *ExperimentHub* package with built-in accessors that streamline the data retrieval process. For example, to access data about R-loop binding proteins (RLBPs), simply execute the following:

```r
RLHub::rlbps()
```

All data sets in RLHub are documented in the package website [reference pages](https://bishop-laboratory.github.io/RLHub/reference/index.html)

## Installation

### From Bioconductor

```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("RLHub")
```

### From GitHub

1. Update to the `devel` version of bioconductor. 

```r
BiocManager::install(version = "devel")
```

2. Install **RLHub** with remotes.

``` r
remotes::install_github("Bishop-Laboratory/RLHub")
```

## Usage

For full documentation and data descriptions, please see the [getting started guide](https://bishop-laboratory.github.io/RLHub/articles/RLHub.html).

## Bugs and Issues

*RLHub* is a brand-new package and there may be bugs and issues which arise. If you encounter and issues or
unexpected behavior, please [open an issue](https://github.com/Bishop-Laboratory/RLHub/issues).
