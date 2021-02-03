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

## ----ennet-structure-1, echo = FALSE, eval = TRUE, out.width = "90%", fig.align = "center"----
knitr::include_graphics("../man/figures/ennet_structure.png")

## ----usage1, echo = TRUE, eval = FALSE----------------------------------------
#  ## Load ennet package
#  library(ennet)
#  
#  ## Get all thematic areas from en-net
#  get_themes()

## ----usage1a, echo = FALSE, eval = TRUE---------------------------------------
library(ennet)
get_themes()

## ----usage2, echo = TRUE, eval = FALSE----------------------------------------
#  ## Load dplyr to facilitate data manipulation
#  library(dplyr)
#  
#  ## Extract data from "Coverage assessment" theme
#  get_themes() %>%
#    filter(themes == "Coverage assessment") %>%
#    select(links) %>%
#    as.character() %>%
#    get_theme_topics()

## ----usage2a, echo = FALSE, eval = TRUE---------------------------------------
## Load dplyr to facilitate data manipulation
library(dplyr)

## Extract data from "Coverage assessment" theme
get_themes() %>%
  filter(themes == "Coverage assessment") %>%
  select(links) %>%
  as.character() %>%
  get_theme_topics()

## ----usage3, echo = TRUE, eval = FALSE----------------------------------------
#  ## Extract data from "Coverage assessment" theme and "Food assistance" theme
#  get_themes() %>%
#    filter(themes %in% c("Coverage assessment", "Food assistance")) %>%
#    get_themes_topics()

## ----usage3a, echo = FALSE, eval = TRUE---------------------------------------
## Extract data from "Coverage assessment" theme and "Food assistance" theme
get_themes() %>%
  filter(themes %in% c("Coverage assessment", "Food assistance")) %>%
  get_themes_topics()

## ----usage4, echo = TRUE, eval = FALSE----------------------------------------
#  get_themes() %>%
#    filter(themes == "Coverage assessment") %>%
#    get_themes_topics() %>%
#    filter(Topic == "Resources for coverage assessment") %>%
#    select(Link) %>%
#    as.character() %>%
#    get_topic_discussions()

## ----usage4a, echo = FALSE, eval = TRUE---------------------------------------
get_themes() %>%
  filter(themes == "Coverage assessment") %>%
  get_themes_topics() %>%
  filter(Topic == "Resources for coverage assessment") %>%
  select(Link) %>%
  as.character() %>%
  get_topic_discussions()

## ----usage5, echo = TRUE, eval = FALSE----------------------------------------
#  get_themes() %>%
#    filter(themes %in% c("Coverage assessment", "Food assistance")) %>%
#    get_themes_topics() %>%
#    get_topics_discussions()

## ----usage5a, echo = FALSE, eval = TRUE---------------------------------------
get_themes() %>%
  filter(themes %in% c("Coverage assessment", "Food assistance")) %>%
  get_themes_topics() %>%
  get_topics_discussions()

