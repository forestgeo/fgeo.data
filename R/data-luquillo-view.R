# Luquillo ----------------------------------------------------------------

# FIXME: Add downloadable .csv files.

#' Complete ViewTaxonomy (taxa) table from Luquillo.
#'
#' @template thanks_luquillo
#' 
#' @seealso [data_dictionary], \url{http://bit.ly/fgeo-data-luquillo-taxa"}.
#' 
#' @examples
#' str(luquillo_taxa, give.attr = FALSE)
"luquillo_taxa"



#' ViewFullTable (vft) from Luquillo.
#'
#' Slightly cleaned versions from a ViewFullTable table, from census 2005 and
#' census 2010 (see columns definition at [vft_description]):
#' * `luquillo_vft_1ha`: All threes in one hectare (coordinates: `PX` between
#' (>=) 100 and 200; and `PY` between 400 and 500.
#' * `luquillo_vft_random`: One thousand randomly-chosen trees (from the entire
#' plot).
#'
#' @seealso [vft_description], [data_dictionary], 
#' \url{http://bit.ly/fgeo-data-luquillo-vft-random},
#' \url{http://bit.ly/fgeo-data-luquillo-vft-1ha}.
#'
#' @template thanks_luquillo
#' 
#' @examples
#' str(luquillo_vft_1ha, give.attr = FALSE)
#' 
#' str(luquillo_vft_random, give.attr = FALSE)
#'
#' show_some_values_of_each_column <- function(x) head(unique(x))
#' lapply(luquillo_vft_random, show_some_values_of_each_column)
#' @name luquillo_vft
NULL

#' @rdname luquillo_vft
"luquillo_vft_1ha"

#' @rdname luquillo_vft
"luquillo_vft_random"
