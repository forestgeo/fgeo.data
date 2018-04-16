context("data-census.R")

test_that("don't have unwanted columns", {
  expect_false(any(names(bci_stem6_1ha) %in% stem_unwanted()))
  expect_false(any(names(bci_tree6_1ha) %in% tree_unwanted()))
})

