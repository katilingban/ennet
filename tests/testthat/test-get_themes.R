
x <- ennet_themes

test_that("output is a tibble", {
  expect_is(x, "tbl")
})

test_that("output has 2 columns", {
  expect_equal(ncol(x), 2)
})

test_that("output has correct names", {
  expect_equal(names(x), c("themes", "links"))
})

themes <- ennet_themes
x <- get_theme_topics(link = themes$links[1])

test_that("output is a tibble", {
  expect_is(x, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(x) %in% c("Theme", "Topic", "Views",
                                  "Author", "Posted", "Link")))
})

themes <- ennet_themes
x <- get_themes_topics(themes = themes[1:3, ])

test_that("output is a tibble", {
  expect_is(x, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(x) %in% c("Theme", "Topic", "Views",
                                  "Author", "Posted", "Link", "Replies")))
})

