## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  error = FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(ennet)
library(dplyr)

## ----count_day1, echo = TRUE, eval = FALSE------------------------------------
#  count_topics_day()

## ----count_day1a, echo = FALSE, eval = TRUE-----------------------------------
ennet_topics %>%
  count_topics_day()

## ----count_day2, echo = TRUE, eval = FALSE------------------------------------
#  count_topics_day(.sort = TRUE)

## ----count_day2a, echo = FALSE, eval = TRUE-----------------------------------
ennet_topics %>%
  count_topics_day(.sort = TRUE)

## ----count_time, echo = TRUE, eval = FALSE------------------------------------
#  ## Count topics/questions by week
#  count_topics_week()
#  
#  ## Count topics/questions by month
#  count_topics_month()
#  
#  ## Count topics/questions by year
#  count_topics_year()

## ----count_theme1, echo = TRUE, eval = FALSE----------------------------------
#  count_topics_theme()

## ----count_theme1a, echo = FALSE, eval = TRUE---------------------------------
ennet_topics %>%
  count_topics_theme()

## ----count_theme2, echo = TRUE, eval = FALSE----------------------------------
#  count_topics_theme(.sort = TRUE)

## ----count_theme2a, echo = FALSE, eval = TRUE---------------------------------
count_topics_theme(.sort = TRUE)

## ----count_theme_day1, echo = TRUE, eval = FALSE------------------------------
#  count_topics_theme_time(by_time = "day")

## ----count_theme_day1a, echo = FALSE, eval = TRUE-----------------------------
ennet_topics %>%
  count_topics_theme_time(by_time = "day")

## ----count_theme_day2, echo = TRUE, eval = FALSE------------------------------
#  ## Count topics/questions by theme by week
#  count_topics_theme_time(by_time = "week")
#  
#  ## Count topics/questions by theme by month
#  count_topics_theme_time(by_time = "month")
#  
#  ## Count topics/questions by theme by year
#  count_topics_theme_time(by_time = "year")

## ----count_author1, echo = TRUE, eval = FALSE---------------------------------
#  count_topics_author()

## ----count_author1a, echo = FALSE, eval = TRUE--------------------------------
ennet_topics %>%
  count_topics_author()

## ----count_author2, echo = TRUE, eval = FALSE---------------------------------
#  count_topics_author(.sort = TRUE)

## ----count_author2a, echo = FALSE, eval = TRUE--------------------------------
ennet_topics %>% count_topics_author(.sort = TRUE)

## ----count_author_day1, echo = TRUE, eval = FALSE-----------------------------
#  count_topics_author_time(by_time = "day")

## ----count_author_day1a, echo = FALSE, eval = TRUE----------------------------
ennet_topics %>%
  count_topics_author_time(by_time = "day")

## ----count_author_day2, echo = TRUE, eval = FALSE-----------------------------
#  ## Count topics/questions by author by week
#  count_topics_author_time(by_time = "week")
#  
#  ## Count topics/questions by author by month
#  count_topics_author_time(by_time = "month")
#  
#  ## Count topics/questions by author by year
#  count_topics_author_time(by_time = "year")

## ----usage12, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_views()

## ----usage12a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_views()

## ----usage13, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_views(by_date = "year")

## ----usage13a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_views(by_date = "year")

## ----usage14, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_views(by_date = "all")

## ----usage14a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_views(by_date = "all")

## ----usage15, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_views(by_theme = FALSE)

## ----usage15a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_views(by_theme = FALSE)

## ----usage16, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_replies()

## ----usage17a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_replies()

## ----usage18, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_replies(by_date = "year")

## ----usage18a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_replies(by_date = "year")

## ----usage19, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_replies(by_date = "all")

## ----usage19a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_replies(by_date = "all")

## ----usage20, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    arrange_replies(by_theme = FALSE)

## ----usage20a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  arrange_replies(by_theme = FALSE)

