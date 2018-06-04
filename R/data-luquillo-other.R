#' Species table from Luquillo.
#' 
#' @examples 
#' str(luquillo_species, give.attr = FALSE)
"luquillo_species"

#' Elevation data from Luquillo.
#'
#' This dataset can be downloaded directly from
#' \url{http://bit.ly/fgeo-data-luquillo-elevation}.
#' 
#' @seealso \url{https://forestgeo.si.edu/sites/north-america/luquillo}.
#'
#' @examples
#' str(luquillo_elevation, , give.attr = FALSE)
#' 
#' sapply(luquillo_elevation, class)
#' 
#' str(luquillo_elevation$col, give.attr = FALSE)
"luquillo_elevation"


#' Habitat data from luquillo.
#' 
#' Habitat data from luquillo created by dividing elevation data in multiple
#' chunks.
#' 
#' @seealso
#' * luquillo_elevation.
#' * `fgeo.tool::fgeo_habitat()`.
#' * \url{https://forestgeo.si.edu/sites/north-america/luquillo}.
#' 
#' @examples
#' str(luquillo_habitat)
"luquillo_habitat"
