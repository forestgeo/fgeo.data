# Updates raw data in inst/database-output/ from data stored in data-raw/
# See https://github.com/forestgeo/fgeo.opendata/issues/2

library(fs)
library(here)

path <- "inst/database-output/data-raw"
data_raw_has_already_been_deleted <- !fs::dir_exists(path)
stopifnot(data_raw_has_already_been_deleted)

dir_copy(
  here("data-raw/database-output"),
  here("inst/database-output/data-raw")
)

message(
  "1. Remove any previous database-output.zip\n",
  "2. Manually send to compressed folder database-output.zip containing:\n",
  "    * data-raw/.\n",
  "3. Manually remove data-raw."
)
