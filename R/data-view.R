# BCI ---------------------------------------------------------------------

#' Complete ViewTaxonomy (taxa) table from Barro Colorado Island (bci).
#'
#' This is a slightly cleaned version of a ViewTaxonomy table. For a raw .csv
#' version see \url{http://bit.ly/fgeo-data-bci-taxa}.
#'
#' @examples
#' str(bci_taxa, give.attr = FALSE)
"bci_taxa"



#' ViewFullTable (vft) from Barro Colorado Island (bci).
#'
#' Slightly cleaned versions from a ViewFullTable table, from census 2005 and
#' census 2010 (see columns definition at [vft_description]):
#' * `bci_vft_1ha`: All threes in one hectare (coordinates: `px >= 700`, `px <
#'   800`, `py >=100`, `py < 200`). Raw .csv file available at
#' \url{http://bit.ly/fgeo-data-bci-vft-1ha}.
#' * `bci_vft_random`: One thousand randomly-chosen trees (from the whole plot).
#'   Raw .csv file available at \url{http://bit.ly/fgeo-data-bci-vft-random}).
#'
#' @seealso [vft_description], [data_dictionary].
#'
#' @examples
#' str(bci_vft_1ha, give.attr = FALSE)
#'
#' str(bci_vft_random, give.attr = FALSE)
#'
#' show_some_values_of_each_column <- function(x) head(unique(x))
#' lapply(bci_vft_random, show_some_values_of_each_column)
#' @name bci_vft
NULL

#' @rdname bci_vft
"bci_vft_1ha"

#' @rdname bci_vft
"bci_vft_random"



#' General description of a ViewFullTable (vft).
#'
#' Reproduced from \url{http://bit.ly/vft-definitions}:
#' > _ViewFullTable_ table. Merges all the relevant variables from the
#' corresponding tables in the database back into a flat file. Each record
#' represents one measurement and/or attribute of one stem of one tree of one
#' plot from one census. Because buttresses can grow, for trees with buttresses,
#' a stem may be measured at more than one height. So some stems may have more
#' than one measurement in a census, but at different hom.
#' 
#' @seealso [data_dictionary].
#' @name vft_description
NULL
