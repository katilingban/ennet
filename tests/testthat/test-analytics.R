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

test_that("output is in correct order", {
  expect_true(all(diff(y[y$Theme == "Adolescent nutrition", ]$n) <= 0))
})

y <- x %>%
  count_topics(.sort = FALSE)

test_that("count_topics output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Month", "Year", "n")))
})

test_that("count_topics deprecation", {
  expect_warning(count_topics(x), NULL)
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

test_that("output is in correct order", {
  expect_true(
    all(diff(y[y$Theme == "Announcements & Nutritionists needed", ]$n) <= 0)
  )
})

y <- x %>%
  count_topics(by_date = "year", .sort = FALSE)

test_that("count_topics output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Year", "n")))
})

##
y <- x %>%
  count_topics(by_date = "all")

test_that("count_topics output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Year", "n")))
})

test_that("output is in correct order", {
  expect_true(
    all(diff(y[y$Theme == "Announcements & Nutritionists needed", ]$n) <= 0)
  )
})

y <- x %>%
  count_topics(by_date = "all", .sort = FALSE)

test_that("count_topics output is tibble", {
  expect_is(y, "tbl")
})

test_that("output has correct names", {
  expect_true(all(names(y) %in% c("Theme", "Year", "n")))
})

## count_topics_day

y <- x %>% count_topics_day()

test_that("output is tibble", {
  expect_is(y, "tbl")
})

y <- x %>% count_topics_day(.sort = TRUE)

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output is in correct order", {
  expect_true(
    all(diff(y$n) <= 0)
  )
})

## count_topics_week

y <- x %>% count_topics_week()

test_that("output is tibble", {
  expect_is(y, "tbl")
})

y <- x %>% count_topics_week(.sort = TRUE)

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output is in correct order", {
  expect_true(
    all(diff(y$n) <= 0)
  )
})

## count_topics_month

y <- x %>% count_topics_month()

test_that("output is tibble", {
  expect_is(y, "tbl")
})

y <- x %>% count_topics_month(.sort = TRUE)

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output is in correct order", {
  expect_true(
    all(diff(y$n) <= 0)
  )
})

## count_topics_year

y <- x %>% count_topics_year()

test_that("output is tibble", {
  expect_is(y, "tbl")
})

y <- x %>% count_topics_year(.sort = TRUE)

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output is in correct order", {
  expect_true(
    all(diff(y$n) <= 0)
  )
})

## count_topics_theme

y <- x %>% count_topics_theme()

test_that("output is tibble", {
  expect_is(y, "tbl")
})

y <- x %>% count_topics_theme(.sort = TRUE)

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output is in correct order", {
  expect_true(
    all(diff(y$n) <= 0)
  )
})

## count_topics_theme_time - by day

y <- x %>% count_topics_theme_time(by_time = "day")

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output names are correct", {
  expect_true(all(names(y) %in% c("Theme", "day", "n")))
})

## count_topics_theme_time - by week

y <- x %>% count_topics_theme_time(by_time = "week")

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output names are correct", {
  expect_true(all(names(y) %in% c("Theme", "week", "week_name", "n")))
})

## count_topics_theme_time - by month

y <- x %>% count_topics_theme_time(by_time = "month")

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output names are correct", {
  expect_true(all(names(y) %in% c("Theme", "month", "month_name", "n")))
})


## count_topics_theme_time - by year

y <- x %>% count_topics_theme_time(by_time = "year")

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output names are correct", {
  expect_true(all(names(y) %in% c("Theme", "year", "year_name", "n")))
})

## count_topics_author

y <- x %>% count_topics_author()

test_that("output is tibble", {
  expect_is(y, "tbl")
})

y <- x %>% count_topics_author(.sort = TRUE)

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output is in correct order", {
  expect_true(
    all(diff(y$n) <= 0)
  )
})

## count_topics_author_time

y <- x %>% count_topics_author_time(by_time = "day")

test_that("output is tibble", {
  expect_is(y, "tbl")
})

test_that("output names are correct", {
  expect_true(all(names(y) %in% c("Author", "day", "n")))
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

z <- y %>%
  filter(Theme == "Adolescent nutrition",
         Month == "Jun",
         Year == "2018")

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

