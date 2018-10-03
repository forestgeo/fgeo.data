context("data-luquillo.R")

library(dplyr)
library(rlang)

taxa <- fgeo.data::luquillo_taxa
vft_1ha <- fgeo.data::luquillo_vft_4quad
elev <- fgeo.data::luquillo_elevation
hab <- fgeo.data::luquillo_habitat
tiny <- fgeo.data::luquillo_stem_random_tiny

test_that("data has expected class", {
  expect_true(any(grepl("data.frame", class(taxa))))
  expect_true(any(grepl("data.frame", class(vft_1ha))))
  expect_true(any(grepl("data.frame", class(elev$col))))
  expect_true(any(grepl("list", class(elev))))
  expect_true(any(grepl("data.frame", class(hab))))
  expect_true(any(grepl("data.frame", class(tiny))))
})

test_that("data has expected names", {
  skip_if_not_installed("fgeo.tool")
  expect_equal(names(taxa), names(fgeo.tool::type_taxa()))
  expect_equal(names(vft_1ha), names(fgeo.tool::type_vft()))
})

test_that("data creation can be reproduced", {
  skip_if_not_installed("fgeo.tool")
  stored <- hab
  update <- fgeo.tool::fgeo_habitat(
    fgeo.data::luquillo_elevation, gridsize = 20, n = 4, only_elev = FALSE,
    edgecorrect = TRUE
  )
  expect_equal(stored, update)
  expect_is(stored, "fgeo_habitat")
})



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

test_that("vft and census have just 1 treeid per tag and 1 tag per treeid", {
  expect_equal(nrow(multiple_tag(vft_1ha)), 0)
  expect_equal(nrow(multiple_tag(fgeo.data::luquillo_stem5_random)), 0)
  expect_equal(nrow(multiple_tag(fgeo.data::luquillo_tree5_random)), 0)
  
  expect_equal(nrow(multiple_treeid(vft_1ha)), 0)
  expect_equal(nrow(multiple_treeid(fgeo.data::luquillo_stem5_random)), 0)
  expect_equal(nrow(multiple_treeid(fgeo.data::luquillo_tree5_random)), 0)
})
