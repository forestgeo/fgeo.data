context("data-luquillo.R")

test_that("data has expected structure", {
  skip_if_not_installed("fgeo.tool")
  
  taxa <- fgeo.data::luquillo_taxa
  expect_true(any(grepl("data.frame", class(taxa))))
  expect_equal(names(taxa), names(fgeo.tool::type_taxa()))
  
  vft_1ha <- fgeo.data::luquillo_vft_4quad
  expect_true(any(grepl("data.frame", class(vft_1ha))))
  expect_equal(names(vft_1ha), names(fgeo.tool::type_vft()))
})
