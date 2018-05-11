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



