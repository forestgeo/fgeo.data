context("test-vft_description.R")

test_that("Documented columns are as expected", {
  expect_equal(
    fgeo.data::vft_description$column, names(fgeo.tool::type_vft())
  )
})

