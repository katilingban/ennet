
x <- get_db_discussions()

test_that("x is a tibble", {
  expect_is(x, "tbl")
})


fn <- c("ennet_topics_2021-01-16_00:58:05.csv",
        "ennet_topics_2021-01-16_02:47:04.csv",
        "ennet_topics_2021-01-16_03:59:22.csv")

x <- create_db_topics_daily(.date = Sys.Date(), fn = fn)

test_that("x is a tibble", {
  expect_is(x, "tbl")
})

test_that("error message show", {
  expect_error(create_db_topics_daily(.date = NA))
})

x <- create_db_topics_monthly(.date = Sys.Date())

test_that("x is a tibble", {
  expect_is(x, "tbl")
})

test_that("error message show", {
  expect_error(create_db_topics_monthly(.date = NA))
})
