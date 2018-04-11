context("test-vft_description.R")

test_that("Documented columns are as expected", {
  # Not importing fgeo.tool
  testthat::skip_if_not_installed("fgeo.tool")
  expect_equal(
    fgeo.data::vft_description$column, names(fgeo.tool::type_vft())
  )
})

