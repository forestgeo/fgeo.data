
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 /> fgeo.data

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo.data)](https://cran.r-project.org/package=fgeo.data)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.data.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo.data)

**fgeo.data** provides open datasets of
ForestGEO.

## [See datasets](https://forestgeo.github.io/fgeo.data/articles/fgeo.data.html)

## Installation

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo.data")

For details on how to install packages from GitHub, see [this
article](https://goo.gl/dQKEeg).

## Example

``` r
library(fgeo.data)
```

### ViewFullTable (`vft`)

``` r
# Show first few columns to save space.
str(bci_vft_random, give.attr = FALSE, list.len = 5)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    2257 obs. of  32 variables:
#>  $ DBHID           : int  1621522 1619521 1632477 1630644 1077531 1074697 826469 823306 1006845 1003843 ...
#>  $ PlotName        : chr  "bci" "bci" "bci" "bci" ...
#>  $ PlotID          : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ Family          : chr  "Violaceae" "Violaceae" "Fabaceae-papilionoideae" "Fabaceae-papilionoideae" ...
#>  $ Genus           : chr  "Hybanthus" "Hybanthus" "Lonchocarpus" "Lonchocarpus" ...
#>   [list output truncated]
```

## Information

  - [Getting help](SUPPORT.md).
  - [Contributing](CONTRIBUTING.md).
  - [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

## Acknowledgements

Thanks to Suzanne Lao and Shameema Jafferjee Esufali for sharing their
knowledge of the structure of ForestGEO’s database.
