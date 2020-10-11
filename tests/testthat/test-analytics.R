x <- ennet_topics
y <- x %>% count_topics()

test_that("count_topics output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Month", "Year", "n")))
})
