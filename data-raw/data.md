---
title: "md and themed html documents"
subtitle: Subtitle
author: "Your name"
date: "2018-04-05"
output:
  html_document:
    toc: yes
    toc_depth: '3'
    theme: united
    keep_md: true
---



---
Reuse the style and options of this document

The yaml header and the setup chunk of this document come from a template. To access this template, install __fgeo.templates__ (see [how](https://forestgeo.github.io/fgeo.templates/#installation)).

![](https://i.imgur.com/zAf37YI.png)

---

# Source

* On Mon, Mar 19, 2018 at 11:31 PM, Lao, Suzanne <LAOZ@si.edu>
* On Mon, Mar 19, 2018 at 11:34 PM, Lao, Suzanne <LAOZ@si.edu>

See https://github.com/forestgeo/fgeo.opendata/issues/1.

# Setup


```r
library(here)
#> here() starts at C:/Users/LeporeM/Dropbox/git_repos/fgeo.opendata
library(tidyverse)
#> -- Attaching packages ------------------------------------------- tidyverse 1.2.1 --
#> v ggplot2 2.2.1     v purrr   0.2.4
#> v tibble  1.4.2     v dplyr   0.7.4
#> v tidyr   0.8.0     v stringr 1.3.0
#> v readr   1.1.1     v forcats 0.3.0
#> -- Conflicts ---------------------------------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(fgeo.tool)
```

# Data

(The complexity of this path is explained at https://github.com/forestgeo/fgeo.opendata/issues/2.)


```r
dir_path <- "data-raw/database-output/data-raw"
```

## vft_bci_taxa

`vft_bci_taxa`: Complete ViewTaxonomy table.

### Load

Reading tab delimited data, with strict specification of expected column type. 
If the imported data is parsed as expected, the output should be silent (should print no message).


```r
path_taxa <- here::here(dir_path, "ViewTaxonomy.csv")
vft_bci_taxa <- read_tsv(path_taxa, col_types = fgeo.tool::type_taxa())
```

### Clean


```r
glimpse(vft_bci_taxa)
#> Observations: 1,428
#> Variables: 21
#> $ ViewID         <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, ...
#> $ SpeciesID      <int> 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,...
#> $ SubspeciesID   <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ Family         <chr> "Fabaceae-mimosoideae", "Fabaceae-mimosoideae",...
#> $ Mnemonic       <chr> "pit1ba", "acacco", "acacme", "acac1", "acaldi"...
#> $ Genus          <chr> "Abarema", "Acacia", "Acacia", "Acacia", "Acaly...
#> $ SpeciesName    <chr> "barbouriana", "collinsii", "melanoceras", "sp....
#> $ Rank           <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ Subspecies     <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ Authority      <chr> "(Standl.) Barneby & J.W. Grimes", "Saff.", "Be...
#> $ IDLevel        <chr> "species", "species", "species", "genus", "spec...
#> $ subspMnemonic  <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ subspAuthority <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ FieldFamily    <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ Lifeform       <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ Description    <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ wsg            <dbl> 0.566750, 0.774541, 0.774541, 0.774541, 0.30000...
#> $ wsglevel       <chr> "genus", "genus", "genus", "genus", "genus", "g...
#> $ ListOfOldNames <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ Specimens      <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
#> $ Reference      <chr> "NULL", "NULL", "NULL", "NULL", "NULL", "NULL",...
```

Replacing literal "NULL" by a representation of missing text-values (`NA_character_`).


```r
vft_bci_taxa <- fgeo.tool::replace_null(vft_bci_taxa)
glimpse(vft_bci_taxa)
#> Observations: 1,428
#> Variables: 21
#> $ ViewID         <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, ...
#> $ SpeciesID      <int> 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,...
#> $ SubspeciesID   <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ Family         <chr> "Fabaceae-mimosoideae", "Fabaceae-mimosoideae",...
#> $ Mnemonic       <chr> "pit1ba", "acacco", "acacme", "acac1", "acaldi"...
#> $ Genus          <chr> "Abarema", "Acacia", "Acacia", "Acacia", "Acaly...
#> $ SpeciesName    <chr> "barbouriana", "collinsii", "melanoceras", "sp....
#> $ Rank           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ Subspecies     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ Authority      <chr> "(Standl.) Barneby & J.W. Grimes", "Saff.", "Be...
#> $ IDLevel        <chr> "species", "species", "species", "genus", "spec...
#> $ subspMnemonic  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ subspAuthority <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ FieldFamily    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ Lifeform       <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ Description    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ wsg            <dbl> 0.566750, 0.774541, 0.774541, 0.774541, 0.30000...
#> $ wsglevel       <chr> "genus", "genus", "genus", "genus", "genus", "g...
#> $ ListOfOldNames <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ Specimens      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...
#> $ Reference      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,...

vft_bci_taxa
#> # A tibble: 1,428 x 21
#>    ViewID SpeciesID SubspeciesID Family   Mnemonic Genus SpeciesName Rank 
#>     <int>     <int> <chr>        <chr>    <chr>    <chr> <chr>       <chr>
#>  1      1         1 <NA>         Fabacea~ pit1ba   Abar~ barbouriana <NA> 
#>  2      2         3 <NA>         Fabacea~ acacco   Acac~ collinsii   <NA> 
#>  3      3         4 <NA>         Fabacea~ acacme   Acac~ melanoceras <NA> 
#>  4      4         5 <NA>         Fabacea~ acac1    Acac~ sp.1        <NA> 
#>  5      5         6 <NA>         Euphorb~ acaldi   Acal~ diversifol~ <NA> 
#>  6      6         7 <NA>         Euphorb~ acalma   Acal~ macrostach~ <NA> 
#>  7      7         8 <NA>         Cactace~ acante   Acan~ tetragonus  <NA> 
#>  8      8         9 <NA>         Euphorb~ acidni   Acid~ nicaraguen~ <NA> 
#>  9      9        10 <NA>         Fabacea~ acospa   Acos~ panamense   <NA> 
#> 10     10        11 <NA>         Arecace~ acropa   Acro~ aculeata    <NA> 
#> # ... with 1,418 more rows, and 13 more variables: Subspecies <chr>,
#> #   Authority <chr>, IDLevel <chr>, subspMnemonic <chr>,
#> #   subspAuthority <chr>, FieldFamily <chr>, Lifeform <chr>,
#> #   Description <chr>, wsg <dbl>, wsglevel <chr>, ListOfOldNames <chr>,
#> #   Specimens <chr>, Reference <chr>
```

## One hectare of data for hectare: px>=700 and px<800 and py>=100 and py<200. The data includes only those records from census 2005 and census 2010.









## 1000 randomly chosen trees from the whole plot. Only included data from census 2005 and census 2010.


```r
file_path <- here::here(dir_path, "ViewFullTable_random.csv")
vft_bci_ <- read_csv(file_path, col_types = fgeo.tool::type_vft())

vft_reference <- yosemite::ViewFullTable_yosemite

(nms_vft_reference <- names(vft_reference))

(nms_vft_bci_20182003 <- names(vft_bci_20182003))

setdiff(nms_vft_reference, nms_vft_bci_20182003)
```

