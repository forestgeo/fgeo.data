context("data-census.R")

test_that("don't have unwanted columns", {
  stem_unwanted <- c(
    "agb",
    "CensusID", 
    "pom",
    "countPOM"
  )
  expect_false(any(names(bci_stem6_1ha) %in% stem_unwanted))
  
  tree_unwanted <- c(
    "agb", 
    "ba", 
    "CensusID", 
    "pom", 
    "DFstatus"
  )
  expect_false(any(names(bci_tree6_1ha) %in% tree_unwanted))
})

