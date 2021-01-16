################################################################################
#
#'
#' Retrieve data from ennet_db GitHub repository
#'
#' @param gh A character value of the GitHub user and repository name
#'   combination identifying the GitHub location for ennet_db. Default is
#'   `katilingban/ennet_db`.
#'
#' @return A tibble of the specified dataset
#'
#' @author Ernest Guevarra
#'
#' @examples
#' ## Retrieve daily topics dataset for 1 January 2021
#' get_db_discussions()
#'
#' @export
#' @rdname get_db
#'
#
################################################################################

get_db_discussions <- function(gh = "katilingban/ennet_db") {
  ## Retrieve discussions from main
  x <- try(
    read.csv(paste("https://raw.githubusercontent.com/",
                   gh, "/main/data/ennet_discussions.csv",  sep = "")),
    silent = TRUE
  )

  ## Retrieve discussions from master if error from main
  if (class(x) == "try-error") {
    x <- read.csv(paste("https://raw.githubusercontent.com/",
                        gh, "/master/data/ennet_discussions.csv",  sep = ""))
  }

  ## Convert to tibble
  x <- tibble::tibble(x)

  ## Return discussions
  return(x)
}

################################################################################
#
#'
#' Create a daily topics dataset for the ennet_db
#'
#' @param gh A character value of the GitHub user and repository name
#'   combination identifying the GitHub location for ennet_db. Default is
#'   `katilingban/ennet_db`.
#' @param .date A character value or vector of date/dates for which to create
#'   a topics dataset for the ennet_db
#' @param fn A character value or vector of filenames for hourly topics dataset
#'   found in ennet_db
#'
#' @author Ernest Guevarra
#'
#' @examples
#' ##
#' fn <- c("ennet_topics_2021-01-16_00:58:05.csv",
#'         "ennet_topics_2021-01-16_02:47:04.csv",
#'         "ennet_topics_2021-01-16_03:59:22.csv")
#'
#' create_db_topics_daily(.date = Sys.Date(), fn = fn)
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

create_db_topics_daily <- function(gh = "katilingban/ennet_db",
                                   .date = Sys.Date() - 1,
                                   fn = NULL) {
  ## Check .date
  if (is.na(lubridate::ymd(.date))) {
    stop(
      paste(
        strwrap(x = ".date values are not in the expected YYYY-MM-DD format.
                     Please check and try again.",
                width = 80),
        collapse = "\n"
      )
    )
  }

  ## Check fn is specified
  if (is.null(fn)) {
    stop(
      paste(
        strwrap(x = "fn has no default value but is required. Please specify
                     expected filenames of hourly topics datasets to be
                     searched from the ennet_db",
                width = 80
        ),
        collapse = "\n"
      )
    )
  }

  ## Convert .date
  .date <- as.Date(.date, format = "%Y-%m-%d")

  ## Detect filenames of hourly datasets in ennet_db required based on .date
  fn <- fn[fn %>% stringr::str_detect(pattern = paste(.date, collapse = "|"))]
  fn <- paste("https://raw.githubusercontent.com/",
              gh, "/main/data/", fn, sep = "")

  ## Create timestamp
  ts <- fn %>%
    stringr::str_remove_all(pattern = "ennet_topics_|.csv") %>%
    lubridate::as_datetime() %>%
    stringr::str_replace_all(pattern = " ", replacement = "_")

  ## Read first file in list
  x <- read.csv(file = fn[1])

  ## re-order columns and rename
  x <- x[c(1, 2, 4, 5, 6, 3, 7)]
  names(x)[6:7] <- paste(names(x)[6:7], ts[1], sep = "_")

  ## Read the rest of the files
  for (i in fn[2:length(fn)]) {
    y <- read.csv(file = i)

    ## Read next file
    y <- y[c(1, 2, 4, 5, 6, 3, 7)]
    names(y)[6:7] <- paste(names(y)[6:7], ts[fn == i], sep = "_")

    x <- dplyr::full_join(x = x, y = y,
                          by = c("Theme", "Topic", "Author", "Posted", "Link"))
  }

  ## Rename fields
  names(x) <- names(x) %>%
    stringr::str_replace_all(pattern = "\\-|\\:", replacement = "")

  ## Convert to tibble
  x <- tibble::tibble(x)

  ## Return x
  return(x)
}


#
#'
#' @export
#' @rdname create_db
#'
#
create_db_topics_monthly <- function(gh = "katilingban/ennet_db",
                                     .date = Sys.Date() - 1) {
  ## Check .date
  if (is.na(lubridate::ymd(.date))) {
    stop(
      paste(
        strwrap(x = ".date values are not in the expected YYYY-MM-DD format.
                     Please check and try again.",
                width = 80),
        collapse = "\n"
      )
    )
  }

  ## Convert .date
  .date <- as.Date(.date, format = "%Y-%m-%d")

  data_dates <- paste(year(.date),
                      stringr::str_pad(month(.date),
                                       width = 2,
                                       side = "left",
                                       pad = "0"),
                      stringr::str_pad(seq(from = 1,
                                           to = lubridate::days_in_month(.date),
                                           by = 1),
                                       width = 2,
                                       side = "left",
                                       pad = "0"),
                      sep = "-")

  ## Detect filenames of hourly datasets in ennet_db required based on .date
  fn <- paste("https://raw.githubusercontent.com/",
              gh, "/main/data/ennet_topics_", data_dates, ".csv", sep = "")

  x <- try(read.csv(file = fn[1]), silent = TRUE)

  if (class(x) == "try-error") {
    stop(
      paste(
        strwrap(x = "Specified file/s cannot be found in the ennet_db.
                     Please check and try again.",
                width = 80
        ),
        collapse = "\n"
      )
    )
  }

  ##
  for (i in fn[2:length(fn)]) {
    y <- try(suppressWarnings(read.csv(file = i)), silent = TRUE)

    if (class(y) != "try-error") {
      x <- dplyr::full_join(x = x, y = y,
                            by = c("Theme", "Topic",
                                   "Author", "Posted", "Link"))
    } else break
  }

  ##
  x <- tibble::tibble(x)

  ##
  return(x)
}
