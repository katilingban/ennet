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

## ----usage6, echo = TRUE, eval = FALSE----------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    count_topics()

## ----usage6a, echo = FALSE, eval = TRUE---------------------------------------
ennet_topics %>%
  count_topics()

## ----usage7, echo = TRUE, eval = FALSE----------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    count_topics(by_date = "year")

## ----usage7a, echo = FALSE, eval = TRUE---------------------------------------
ennet_topics %>%
  count_topics(by_date = "year")

## ----usage8, echo = TRUE, eval = FALSE----------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    count_topics(by_date = "all")

## ----usage8a, echo = FALSE, eval = TRUE---------------------------------------
ennet_topics %>%
  count_topics(by_date = "all")

## ----usage9, echo = TRUE, eval = FALSE----------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    count_authors()

## ----usage9a, echo = FALSE, eval = TRUE---------------------------------------
ennet_topics %>%
  count_authors()

## ----usage10, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    count_authors(by_date = "year")

## ----usage10a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  count_authors(by_date = "year")

## ----usage11, echo = TRUE, eval = FALSE---------------------------------------
#  get_themes() %>%
#    get_themes_topics() %>%
#    count_authors(by_date = "all")

## ----usage11a, echo = FALSE, eval = TRUE--------------------------------------
ennet_topics %>%
  count_authors(by_date = "all")

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

