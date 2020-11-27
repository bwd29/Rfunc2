test_that("correct number of points found", {
  expect_equal(nrow(BINSEG(c(1,2,3,4,5,6), 2)), 2)
})
