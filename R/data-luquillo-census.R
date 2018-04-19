#' Tree and stem tables from Luquillo.
#'
#' Tree and stem tables from Luquillo. These is how to interpret the names of 
#' the datasets:
#' * The number following 'tree' or 'stem' indicates that the data corresponds
#' to that specific census number.
#' * Datasets without a number contain multiple censuses.
#' * Datasets labeled with '1ha' contain all trees in only one hectare.
#' * Datasets labeled with 'random' contain a total of 1,000 trees chosen at
#' random from the entire plot.
#' 
#' For a general description see [census_description].
#'
#' @format See examples.
#'
#' @seealso [luquillo_vft_4quad], [census_description], [data_dictionary].
#'
#' @examples
#' # Save space
#' short_str <- function(x) {
#'   str(x, give.attr = FALSE, list.len = 5)
#' }
#' 
#' short_str(luquillo_tree6_random)
#' 
#' short_str(luquillo_tree6_1ha)
#' 
#' short_str(luquillo_stem_random)
#' 
#' short_str(luquillo_stem_1ha)
#' 
#' short_str(luquillo_stem6_1ha)
#' 
#' short_str(luquillo_stem6_random)
#'
#' @name census_luquillo
NULL

#' @rdname census_luquillo
"luquillo_tree6_random"
#' @rdname census_luquillo
"luquillo_tree6_1ha"

#' @rdname census_luquillo
"luquillo_stem_random"
#' @rdname census_luquillo
"luquillo_stem_1ha"
#' @rdname census_luquillo
"luquillo_stem6_1ha"
#' @rdname census_luquillo
"luquillo_stem6_random"
