#' Complete ViewTaxonomy table from Barro Colorado Island.
#'
#' This is a slightly cleaned version of a ViewTaxonomy table. For a raw .csv
#' version see \url{http://bit.ly/fgeo-opendata-taxa-bci}.
#'
#' @examples
#' str(taxa_bci, give.attr = FALSE)
"taxa_bci"



#' All threes in one hectare from Barro Colorado Island..
#'
#' One hectare of data for hectare: `px >= 700` and `px < 800`; and `py >=100`
#' and `py < 200`. The data includes only those records from census 2005 and
#' census 2010.
#'
#' This is a slightly cleaned version from a ViewFullTable table.
#' For a raw .csv version see \url{http://bit.ly/fgeo-opendata-vft-1ha-bci}.
#'
#' @examples
#' str(vft_1ha_bci, give.attr = FALSE)
"vft_1ha_bci"



#' One Thousand trees selected at random from Barro Colorado Island.
#'
#' One Thousand, randomly chosen, trees from Barro Colorado Island (from the
#' whole plot). Only included data from census 2005 and census 2010.
#'
#' This is a slightly cleaned version from a ViewFullTable table.
#' For a raw .csv version see \url{http://bit.ly/fgeo-opendata-vft-random-bci}.
#'
#' @examples
#' str(vft_random_bci, give.attr = FALSE)
#'
#' show_some_values_of_each_column <- function(x) head(unique(x))
#' lapply(vft_random_bci, show_some_values_of_each_column)
"vft_random_bci"



#' Elevation data from Barro Colorado Island.
#'
#' This dataset can be downloaded directly from
#' \url{http://bit.ly/fgeo-opendata-elevation-bci}.
#'
#' @examples
#' str(elevation_bci)
#' sapply(elevation_bci, class)
#' str(elevation_bci$col)
"elevation_bci"
