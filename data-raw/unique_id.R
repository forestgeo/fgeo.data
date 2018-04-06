library(tibble)

# Source: https://github.com/forestgeo/bciex/issues/10
unique_id <- tibble::tribble(
  ~table,           ~column,
  "tree",          "TreeID",
  "stem",          "StemID",
  "ViewFullTable", "DBHID"
)
use_data(unique_id, overwrite = TRUE)

