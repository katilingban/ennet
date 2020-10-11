library(magrittr)
library(dplyr)

x <- ennet_topics

y <- x %>%
  count_topics()

test_that("count_topics output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Month", "Year", "n")))
})

##
y <- x %>%
  count_topics(by_date = "year")

test_that("count_topics output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Year", "n")))
})

##
y <- x %>% arrange_views()

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Adolescent nutrition", Month == "Jun", Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_theme = FALSE)

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance",
                  Month == "Jan",
                  Year == "2011")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_date = "year")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance", Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_date = "year")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance", Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_date = "month_year")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance",
                  Month == "Feb",
                  Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_date = "all")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- z %>% filter(Theme == "Assessment and Surveillance")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_theme = FALSE, by_date = "year")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_theme = FALSE, by_date = "month_year")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Month == "Feb", Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Views) <= 0))
})

##
y <- x %>% arrange_views(by_theme = FALSE, by_date = "all")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

test_that("output is in correct order", {
  expect_true(all(diff(y$Views) <= 0))
})

## Replies #####################################################################

x <- ennet_topics

##
y <- x %>% arrange_replies()

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Adolescent nutrition",
                  Month == "Jun",
                  Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>% arrange_replies(by_theme = FALSE)

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance",
                  Month == "Jan",
                  Year == "2011")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>% arrange_replies(by_date = "year")

test_that("arrange_views output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance",
                  Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>% arrange_replies(by_date = "year")

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance",
                  Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>% arrange_replies(by_date = "month_year")

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Theme == "Assessment and Surveillance",
                  Month == "Feb",
                  Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>% arrange_replies(by_date = "all")

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- z %>% filter(Theme == "Assessment and Surveillance")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>% arrange_replies(by_theme = FALSE, by_date = "year")

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>% arrange_replies(by_theme = FALSE, by_date = "month_year")

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

z <- y %>% filter(Month == "Feb", Year == "2018")

test_that("output is in correct order", {
  expect_true(all(diff(z$Replies) <= 0))
})

##
y <- x %>%
  arrange_replies(by_theme = FALSE, by_date = "all")

test_that("arrange_replies output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Topic", "Views", "Author", "Posted",
                                  "Link", "Replies", "Month", "Year")))
})

test_that("output is in correct order", {
  expect_true(all(diff(y$Replies) <= 0))
})

## Count authors ###############################################################

y <- x %>%
  count_authors()

test_that("count_authors output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Author",  "Month", "Year", "n")))
})

##
y <- x %>%
  count_authors(by_date = "year")

test_that("count_authors output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Author", "Year", "n")))
})

##
y <- x %>%
  count_authors(by_date = "all")

test_that("count_authors output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Author", "n")))
})

##
y <- x %>%
  count_authors(by_theme = FALSE)

test_that("count_authors output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Author", "Month", "Year", "n")))
})

##
y <- x %>%
  count_authors(by_theme = FALSE, by_date = "year")

test_that("count_authors output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Author", "Year", "n")))
})

##
y <- x %>%
  count_authors(by_theme = FALSE, by_date = "all")

test_that("count_authors output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Author", "n")))
})

