##

x <- retrieve_ennet()
ennet_dataset <- x

usethis::use_data(ennet_dataset, overwrite = TRUE, compress = "xz")
