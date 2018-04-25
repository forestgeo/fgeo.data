commas <- function(...) paste0(..., collapse = ", ")

check_crucial_names <- function(x, nms) {
  stopifnot(is.character(nms))
  are_names_expected <- all(nms %in% names(x))
  if (are_names_expected) {
    return(invisible(x))
  }
  else {
    stop("Ensure your data set has these variables:\n", paste0(nms, 
      collapse = ", "), call. = FALSE)
  }
}



#' Factory to filter dataset names in a package matching some class.
#' @noRd
str_datasets_class <- function(.f = purrr::keep) {
  function(package, .class) {
    dts <- str_datasets(package)
    cls <- dts %>% 
      lapply(get) %>% 
      purrr::set_names(dts) %>% 
      purrr::map(class)
    out <- cls %>% .f(~any(grepl(.class, .x)))
      unlist(out)
  }
}

#' String datasets in a package.
#' @noRd
str_datasets <- function(package) {
  dinfo <- data(package = package)
  dinfo[["results"]][, "Item"]
}

# Keep and discard dataset names in a package that match a class.
#
# Examples
# keep_data_class_str("fgeo.data", "tbl")
# discard_data_class_str("fgeo.data", "tbl")
keep_data_class_str <- str_datasets_class(.f = purrr::keep)
discard_data_class_str <- str_datasets_class(.f = purrr::discard)
