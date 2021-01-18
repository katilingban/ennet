
x <- get_db_discussions()

test_that("x is a tibble", {
  expect_is(x, "tbl")
})

fn <- c("ennet_topics_2021-01-17_00:54:48.csv",
        "ennet_topics_2021-01-17_02:48:38.csv",
        "ennet_topics_2021-01-17_03:57:46.csv")

x <- create_db_topics_daily(.date = "2021-01-17", fn = fn)

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

x <- create_db_topics_hourlies(.date = "2020-12-31")

test_that("x is a tibble", {
  expect_is(x, "tbl")
})

x <- create_db_topics_dailies(hourlies = ennet_hourlies)

test_that("x is a tibble", {
  expect_is(x, "tbl")
})

x <- create_db_topics_daily_interactions(dailies = ennet_dailies)

test_that("x is a tibble", {
  expect_is(x, "tbl")
})


x <- create_db_topics_weekly_interactions(dailies = ennet_dailies)

test_that("x is a tibble", {
  expect_is(x, "tbl")
})


x <- create_db_topics_monthly_interactions(dailies = ennet_dailies)

test_that("x is a tibble", {
  expect_is(x, "tbl")
})


x <- create_db_topics_yearly_interactions(dailies = ennet_dailies)

test_that("x is a tibble", {
  expect_is(x, "tbl")
})


