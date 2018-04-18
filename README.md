
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/m8FNhQR.png" align="right" height=88 /> fgeo.data

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

(See columns definitions with `?data_dictionary`.)

``` r
library(fgeo.data)
```

### ViewFullTable (`vft`)

``` r
vft <- luquillo_vft_random

# Show first few columns to save space.
str(vft, give.attr = FALSE, list.len = 5)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    5945 obs. of  32 variables:
#>  $ DBHID           : int  143 103518 217487 347333 439947 582850 158 103533 217498 384255 ...
#>  $ PlotName        : chr  "luquillo" "luquillo" "luquillo" "luquillo" ...
#>  $ PlotID          : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ Family          : chr  "Burseraceae" "Burseraceae" "Burseraceae" "Burseraceae" ...
#>  $ Genus           : chr  "Dacryodes" "Dacryodes" "Dacryodes" "Dacryodes" ...
#>   [list output truncated]

lapply(vft, function(x) head(unique(x)))
#> $DBHID
#> [1]    143 103518 217487 347333 439947 582850
#> 
#> $PlotName
#> [1] "luquillo"
#> 
#> $PlotID
#> [1] 1
#> 
#> $Family
#> [1] "Burseraceae" "Myrtaceae"   "Salicaceae"  "Meliaceae"   "Arecaceae"  
#> [6] "Araliaceae" 
#> 
#> $Genus
#> [1] "Dacryodes"  "Myrcia"     "Casearia"   "Guarea"     "Prestoea"  
#> [6] "Schefflera"
#> 
#> $SpeciesName
#> [1] "excelsa"    "splendens"  "arborea"    "guidonia"   "acuminata" 
#> [6] "morototoni"
#> 
#> $Mnemonic
#> [1] "DACEXC" "MYRSPL" "CASARB" "GUAGUI" "PREMON" "SCHMOR"
#> 
#> $Subspecies
#> [1] "NULL"
#> 
#> $SpeciesID
#> [1]  99 156  70 117 182 196
#> 
#> $SubspeciesID
#> [1] "NULL"
#> 
#> $QuadratName
#> [1] "113"  "1021" "921"  "821"  "213"  "413" 
#> 
#> $QuadratID
#> [1] 193 330 329 328 194 196
#> 
#> $PX
#> [1]  10.31 182.89 164.61 148.96  38.30 143.24
#> 
#> $PY
#> [1] 245.36 410.15 409.50 414.44 245.30 410.91
#> 
#> $QX
#> [1] 10.31  2.89  4.61  8.96 18.30  3.24
#> 
#> $QY
#> [1]  5.36 10.15  9.50 14.44  5.30 10.91
#> 
#> $TreeID
#> [1] 104 119 180 602 631 647
#> 
#> $Tag
#> [1] "10009"  "100104" "100171" "100649" "10069"  "100708"
#> 
#> $StemID
#> [1] 143 158 222 223 224 225
#> 
#> $StemNumber
#> [1] 0
#> 
#> $StemTag
#> [1]  10009 100104 100095 100096 100171 100174
#> 
#> $PrimaryStem
#> [1] "NULL" "main"
#> 
#> $CensusID
#> [1] 1 2 3 4 5 6
#> 
#> $PlotCensusNumber
#> [1] 1 2 3 4 5 6
#> 
#> $DBH
#> [1] 115 147 169 186 193 195
#> 
#> $HOM
#> [1] 1.20 1.30 1.40 1.45 1.25 1.26
#> 
#> $ExactDate
#> [1] "1991-06-11" "1996-01-08" "2001-03-29" "2006-08-01" "2011-11-02"
#> [6] "2016-04-20"
#> 
#> $Date
#> [1] 11484 13156 15063 17014 18933 20564
#> 
#> $ListOfTSM
#> [1] "MAIN;A"          "SPROUT;A"        "SPROUT;LS"       "MAIN;A;ST;T"    
#> [5] "MAIN;A;LS;B"     "MAIN;A;LS;DP;ST"
#> 
#> $HighHOM
#> [1] 1
#> 
#> $LargeStem
#> [1] "NULL"
#> 
#> $Status
#> [1] "alive"        "stem dead"    "broken below" "dead"
```

## Information

  - [Getting help](SUPPORT.md).
  - [Contributing](CONTRIBUTING.md).
  - [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

## Acknowledgements

  - Thanks to Suzanne Lao and Shameema Jafferjee Esufali for sharing
    their knowledge of the structure of ForestGEO’s database.

  - Thanks to Jess Zimmerman for sharing data from Luquillo.
