## Load libraries
library(magrittr)
library(stringr)

## Create themes dataset
x <- get_themes()
ennet_themes <- x

usethis::use_data(ennet_themes, overwrite = TRUE, compress = "xz")


## Create topics dataset
x <- get_themes() %>% get_themes_topics()

## replace UTF-8 strings
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "é|ê|è|ë", replacement = "e")
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "É", replacement = "E")
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "à", replacement = "a")
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "ü", replacement = "u")
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "Ñ|ñ", replacement = "n")
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "œ", replacement = "oe")
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "Ó", replacement = "o")
#x$Topic <- stringr::str_replace_all(string = x$Topic,
#                                    pattern = "ó", replacement = "o")

x <- x %>%
  mutate(Topic = iconv(x$Topic, from = "UTF-8", to = "ASCII"),
         Author = iconv(x$Author, from = "UTF-8", to = "ASCII"))

ennet_topics <- x

usethis::use_data(ennet_topics, overwrite = TRUE, compress = "xz")


## Create hourlies sample data for December 2020
ennet_hourlies <- create_db_topics_hourlies(.date = "2020-12-31")

ennet_hourlies <- ennet_hourlies %>%
  mutate(Topic = iconv(x$Topic, from = "UTF-8", to = "ASCII"),
         Author = iconv(x$Author, from = "UTF-8", to = "ASCII"))

usethis::use_data(ennet_hourlies, overwrite = TRUE, compress = "xz")

## Create dailies sample data
ennet_dailies <- create_db_topics_dailies(hourlies = ennet_hourlies)

usethis::use_data(ennet_dailies, overwrite = TRUE, compress = "xz")
