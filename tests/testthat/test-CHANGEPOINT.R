test_that("correct changepoint is found", {
  expect_equal(CHANGEPOINT(c(1,2,3,4,5,6))[1], 3.0)
})
