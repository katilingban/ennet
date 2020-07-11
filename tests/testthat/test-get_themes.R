
x <- get_themes()

test_that("output is a tibble", {
  expect_is(x, "tbl")
})

test_that("output has 2 columns", {
  expect_equal(ncol(x), 2)
})

test_that("output has correct names", {
  expect_equal(names(x), c("themes", "links"))
})
