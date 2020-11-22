## Load libraries
library(magrittr)

## Create themes dataset
x <- get_themes()
ennet_themes <- x

usethis::use_data(ennet_themes, overwrite = TRUE, compress = "xz")


## Create topics dataset
x <- get_themes() %>% get_themes_topics()
ennet_topics <- x

usethis::use_data(ennet_topics, overwrite = TRUE, compress = "xz")
