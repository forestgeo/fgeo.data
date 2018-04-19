# Luquillo ----------------------------------------------------------------

#' Complete ViewTaxonomy (taxa) table from Luquillo.
#' 
#' Compared to the raw data in text format, this dataset replaced NULL values 
#' with missing values, and its columns have a specific type.
#'
#' @template thanks_luquillo
#' 
#' @seealso [data_dictionary], \url{http://bit.ly/fgeo-data-luquillo-taxa"}.
#' 
#' @examples
#' str(luquillo_taxa, give.attr = FALSE)
"luquillo_taxa"



#' Subset of a ViewFullTable (vft) from Luquillo.
#'
#' Subset of a ViewFullTable (vft) from Luquillo. Included are all trees in four
#' quadrats (coordinates: `PX` between (>=) 100 and 140; and `PY` between 400
#' and 440) of cencuses four through 6. For bigger datasets, including censuses
#' one through six, see links under section See also.
#' 
#' Compared to the raw data in text format, this dataset replaced NULL values 
#' with missing values, and its columns have a specific type.
#'
#' @seealso [vft_description], [data_dictionary], 
#' \url{http://bit.ly/fgeo-data-luquillo-vft-random},
#' \url{http://bit.ly/fgeo-data-luquillo-vft-1ha}.
#'
#' @template thanks_luquillo
#' 
#' @examples
#' str(luquillo_vft_4quad, give.attr = FALSE)
#'
#' show_some_values_of_each_column <- function(x) head(unique(x))
#' lapply(luquillo_vft_4quad, show_some_values_of_each_column)
"luquillo_vft_4quad"
