#' Data Dictionary of the ForestGEO database.
#' 
#' This dataset is based on the Tree Database Data Dictionary available at 
#' \url{http://ctfs.si.edu/Public/DataDict/data_dict.php}.
#' 
#' @source \url{http://ctfs.si.edu/Public/DataDict/data_dict.php}.
#' 
#' @examples 
#' head(data_dictionary)
#' 
#' # Column names vary in subtle ways (e.g. SubSpeciesID vs. SubspeciesID)
#' pattern <- "^subspeciesid$"
#' matching <- grepl(pattern, data_dictionary$column, ignore.case = TRUE)
#' data_dictionary[matching, ]
#' @family metadata
"data_dictionary"

