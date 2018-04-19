
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/m8FNhQR.png" align="right" height=88 /> fgeo.data

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo.data)](https://cran.r-project.org/package=fgeo.data)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.data.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo.data)

**fgeo.data** provides open datasets of
ForestGEO.

## [See datasets](https://forestgeo.github.io/fgeo.data/reference/index.html)

## Installation

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo.data")

For details on how to install packages from GitHub, see [this
article](https://goo.gl/dQKEeg).

## Example

(See columns definitions with `?data_dictionary`.)

``` r
library(fgeo.data)
```

### ViewFullTable (`vft`)

``` r
vft <- luquillo_vft_4quad

# Show first few columns to save space.
str(vft, give.attr = FALSE, list.len = 5)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    3302 obs. of  32 variables:
#>  $ DBHID           : int  384550 384553 466764 384554 466765 611446 384555 466766 611447 384556 ...
#>  $ PlotName        : chr  "luquillo" "luquillo" "luquillo" "luquillo" ...
#>  $ PlotID          : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ Family          : chr  "Rubiaceae" "Urticaceae" "Urticaceae" "Urticaceae" ...
#>  $ Genus           : chr  "Psychotria" "Cecropia" "Cecropia" "Cecropia" ...
#>   [list output truncated]

lapply(vft, function(x) head(unique(x)))
#> $DBHID
#> [1] 384550 384553 466764 384554 466765 611446
#> 
#> $PlotName
#> [1] "luquillo"
#> 
#> $PlotID
#> [1] 1
#> 
#> $Family
#> [1] "Rubiaceae"  "Urticaceae" "Araliaceae" "Salicaceae" "Lauraceae" 
#> [6] "Meliaceae" 
#> 
#> $Genus
#> [1] "Psychotria" "Cecropia"   "Schefflera" "Casearia"   "Ocotea"    
#> [6] "Guarea"    
#> 
#> $SpeciesName
#> [1] "berteroana"   "schreberiana" "morototoni"   "arborea"     
#> [5] "leucoxylon"   "guidonia"    
#> 
#> $Mnemonic
#> [1] "PSYBER" "CECSCH" "SCHMOR" "CASARB" "OCOLEU" "GUAGUI"
#> 
#> $Subspecies
#> [1] NA
#> 
#> $SpeciesID
#> [1] 184  74 196  70 161 117
#> 
#> $SubspeciesID
#> [1] NA
#> 
#> $QuadratName
#> [1] "721" "621" "722" "622"
#> 
#> $QuadratID
#> [1] 327 326 343 342
#> 
#> $PX
#> [1] 126.98 129.51 126.95 129.88 128.56 126.50
#> 
#> $PY
#> [1] 404.11 404.53 405.74 408.94 409.08 411.04
#> 
#> $QX
#> [1] 6.98 9.51 6.95 9.88 8.56 6.50
#> 
#> $QY
#> [1]  4.11  4.53  5.74  8.94  9.08 11.04
#> 
#> $TreeID
#> [1] 692 698 706 711 714 725
#> 
#> $Tag
#> [1] "100768" "100774" "100781" "100786" "100789" "100799"
#> 
#> $StemID
#> [1] 851 858 866 871 874 885
#> 
#> $StemNumber
#> [1] 0
#> 
#> $StemTag
#> [1] 100768 100774 100781 100786 100789 100799
#> 
#> $PrimaryStem
#> [1] NA
#> 
#> $CensusID
#> [1] 4 5 6
#> 
#> $PlotCensusNumber
#> [1] 4 5 6
#> 
#> $DBH
#> [1]  NA 185 341 370 375 167
#> 
#> $HOM
#> [1]   NA 1.30 1.28 1.95 1.43 1.33
#> 
#> $ExactDate
#> [1] "2006-11-21" "2012-01-31" "2006-11-20" "2016-07-28" "2016-07-29"
#> [6] "2006-11-22"
#> 
#> $Date
#> [1] 17126 19023 17125 20663 20664 17127
#> 
#> $ListOfTSM
#> [1] "MAIN;DEADT"      "MAIN;A"          "MAIN;DEADT;R;ST" "MAIN;A;T"       
#> [5] "MAIN;A;C"        "MAIN;DEADT;B"   
#> 
#> $HighHOM
#> [1] 1
#> 
#> $LargeStem
#> [1] NA
#> 
#> $Status
#> [1] "dead"         "alive"        "broken below" "stem dead"
```

## Information

  - [Getting help](SUPPORT.md).
  - [Contributing](CONTRIBUTING.md).
  - [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

## Acknowledgements

  - Thanks to Suzanne Lao and Shameema Jafferjee Esufali for sharing
    their knowledge of the structure of ForestGEO’s database.

  - Thanks to Jess Zimmerman for sharing data from Luquillo.
