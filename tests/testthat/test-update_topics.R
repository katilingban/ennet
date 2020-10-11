x <- update_topics()

test_that("output is tibble", {
  expect_is(x, "tbl")
})
