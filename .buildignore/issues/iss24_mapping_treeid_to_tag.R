# Relates to https://github.com/forestgeo/rtbl/issues/48.
# TODO: Update all tables from this new version of ViewFullTable:
path <- "data-raw/private/ViewFullTable_luquillo/ViewFullTable_luquillo.csv"
vft_good <- fgeo.tool::read_vft(here::here(path))

library(tidyverse)
library(fgeo.data)

multiple_treeid <- function(vft) {
  vft %>% 
    set_names(tolower) %>% 
    dplyr::select(treeid, tag) %>% 
    unique() %>% 
    arrange(tag) %>% 
    group_by(tag) %>% 
    summarize(n_treeid = n_distinct(treeid)) %>% 
    filter(n_treeid > 1)
}

multiple_tag <- function(vft) {
  vft %>% 
    set_names(tolower) %>% 
    dplyr::select(treeid, tag) %>% 
    unique() %>% 
    arrange(tag) %>% 
    group_by(treeid) %>% 
    summarize(n_tag = n_distinct(tag)) %>% 
    filter(n_tag > 1)
}

expect_equal(nrow(multiple_treeid(vft_good)), 0)
expect_equal(nrow(multiple_tag(vft_good)), 0)

vft <- sample_n(luquillo::ViewFullTable_luquillo, 2000)
expect_equal(nrow(multiple_tag(vft)), 0)
expect_equal(nrow(multiple_treeid(vft)), 0)



# vft ---------------------------------------------------------------------
# The viewfulltable is OK: 
# * Each treeid maps to a single tag.
# * `Date` and `ExactDate` have valid values (not all missing and with good
# format).

# OK
multiple_treeid(fgeo.data::luquillo_vft_4quad)
multiple_tag(fgeo.data::luquillo_vft_4quad)

# OK
head(fgeo.data::luquillo_vft_4quad$ExactDate)
head(fgeo.data::luquillo_vft_4quad$Date)



# census ------------------------------------------------------------------
# The derived datasets are not OK. 

stem <- fgeo.data::luquillo_stem6_1ha
expect_equal(nrow(multiple_tag(stem)), 0)
expect_equal(nrow(multiple_treeid(stem)), 0)
