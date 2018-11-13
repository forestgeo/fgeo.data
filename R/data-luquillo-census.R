#' Tree and stem tables from Luquillo.
#'
#' Tree and stem tables from Luquillo produced with 
#' [__rtbl__ 0.0.0.9000](https://github.com/forestgeo/rtbl/releases/tag/0.0.0.9000). These is how to
#' interpret the names of the datasets:
#' * The number following 'tree' or 'stem' indicates that the data corresponds
#' to that specific census number.
#' * Datasets without a number contain multiple censuses.
#' * Datasets labeled with '1ha' contain all trees in only one hectare.
#' * Datasets labeled with 'random' contain a total of 1,000 trees chosen at
#' random from the entire plot.
#' * Datasets labeled with 'tiny' are cherry-picked to produce a tiny set of 
#' data useful for most examples.
#' 
#' For a general description see [census_description].
#'
#' @format See examples.
#'
#' @seealso 
#' * [luquillo_vft_4quad].
#' * [census_description].
#' * [data_dictionary].
#' * \url{https://forestgeo.si.edu/sites/north-america/luquillo}.
#'
#' @examples
#' # Save space
#' short_str <- function(x) {
#'   str(x, give.attr = FALSE, list.len = 5)
#' }
#' 
#' short_str(luquillo_tree6_random)
#' 
#' short_str(luquillo_tree5_random)
#' 
#' short_str(luquillo_tree6_1ha)
#' 
#' short_str(luquillo_stem_random)
#' 
#' short_str(luquillo_stem6_1ha)
#' 
#' short_str(luquillo_stem5_random)
#' 
#' short_str(luquillo_stem6_random)
#' 
#' short_str(luquillo_stem_random_tiny)
#' 
#' @family census tables
#' @name census_luquillo
NULL

#' @rdname census_luquillo
"luquillo_stem5_random"
#' @rdname census_luquillo
"luquillo_tree5_random"

#' @rdname census_luquillo
"luquillo_tree6_random"
#' @rdname census_luquillo
"luquillo_tree6_1ha"

#' @rdname census_luquillo
"luquillo_stem_random"

#' @rdname census_luquillo
"luquillo_stem6_1ha"
#' @rdname census_luquillo
"luquillo_stem6_random"

#' @rdname census_luquillo
"luquillo_stem_random_tiny"

