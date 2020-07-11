
links <- get_theme_topics(link = get_themes()$links[4])
x <- get_topic_discussions(link = links$Link[1])

links <- get_theme_topics(link = get_themes()$links[1])
y <- get_topic_discussions(link = links$Link[1])

test_that("output is a tibble", {
  expect_is(x, "tbl")
  expect_is(y, "tbl")
})


links <- get_theme_topics(link = (get_themes()$links)[4])
x <- get_topics_discussions(link = links[1:3, ])

test_that("output is a tibble", {
  expect_is(x, "tbl")
})

test_that("topics is 3", {
  expect_equal(length(unique(x$topic)), 3)
})
