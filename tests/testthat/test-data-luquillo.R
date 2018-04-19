context("data-luquillo.R")

taxa <- fgeo.data::luquillo_taxa
vft_1ha <- fgeo.data::luquillo_vft_4quad
elev <- fgeo.data::luquillo_elevation

test_that("data has expected class", {
  expect_true(any(grepl("data.frame", class(taxa))))
  expect_true(any(grepl("data.frame", class(vft_1ha))))
  expect_true(any(grepl("data.frame", class(elev$col))))
  expect_true(any(grepl("list", class(elev))))
})

test_that("data has expected names", {
  skip_if_not_installed("fgeo.tool")
  expect_equal(names(taxa), names(fgeo.tool::type_taxa()))
  expect_equal(names(vft_1ha), names(fgeo.tool::type_vft()))
})
