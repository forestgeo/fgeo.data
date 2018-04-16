context("data-census.R")

test_that("don't have unwanted columns", {
  expect_false(
    any(names(bci_stem6_1ha) %in% fgeo.data:::census_unwanted()$stem)
  )
  expect_false(
    any(names(bci_tree6_1ha) %in% fgeo.data:::census_unwanted()$tree)
  )
})

