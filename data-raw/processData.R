##
#x <- retrieve_ennet()
#ennet_dataset <- x

#usethis::use_data(ennet_dataset, overwrite = TRUE, compress = "xz")


## Create topics dataset
x <- get_themes() %>% get_themes_topics()
ennet_topics <- x

usethis::use_data(ennet_topics, overwrite = TRUE, compress = "xz")
