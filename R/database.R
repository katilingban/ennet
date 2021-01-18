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
#' Create various topics dataset for the ennet_db
#'
#' @param gh A character value of the GitHub user and repository name
#'   combination identifying the GitHub location for ennet_db. Default is
#'   `katilingban/ennet_db`.
#' @param .date A character value or vector of date/dates for which to create
#'   a topics dataset for the ennet_db
#' @param fn A character value or vector of filenames for hourly topics dataset
#'   found in ennet_db
#' @param hourlies A tibble of topics data usually produced by using the
#'   [create_db_topics_hourlies()] function
#' @param dailies A tibble of topics data usually produced by using the
#'   [create_db_topics_dailies()] function
#'
#' @return A tibble of specified topics dataset created from data in the
#'   ennet_db
#'
#' @author Ernest Guevarra
#'
#' @examples
#' ##
#' fn <- c("ennet_topics_2021-01-17_00:54:48.csv",
#'         "ennet_topics_2021-01-17_02:48:38.csv",
#'         "ennet_topics_2021-01-17_03:57:46.csv")
#'
#' create_db_topics_daily(.date = "2021-01-17", fn = fn)
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


################################################################################
#
#'
#' @examples
#' create_db_topics_monthly()
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

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


################################################################################
#
#'
#' @examples
#' create_db_topics_hourlies(.date = "2020-12-31")
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

create_db_topics_hourlies <- function(gh = "katilingban/ennet_db",
                                      .date = Sys.Date()) {
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

  ## Check .date is not earlier than December 2020
  if (lubridate::month(.date) != 12 & lubridate::year(.date) <= 2020) {
    stop(
      paste(
        strwrap(x = "Earliest dataset available from ennet_db is for December
                     2020. Please provide .date value for December 2020 or
                     later.",
                width = 80),
        collapse = "\n"
      )
    )
  }

  ## Get current month and year
  current_year <- .date %>% lubridate::year()
  current_month <- .date %>% lubridate::month()

  if (current_month == 12 & current_year == 2020) {
    all_months_years <- "December_2020"
  } else {
    ##
    all_months_years <- c("December_2020",
                          paste(month.name[1:current_month],
                                current_year, sep = "_"))
  }

  ##
  fn <- paste("ennet_topics_", all_months_years, ".csv", sep = "")

  ## Concatenating data.frame
  hourlies <- data.frame()

  ##
  for (i in fn) {
    x <- try(
      read.csv(
        paste("https://raw.githubusercontent.com/",
              gh, "/main/data/", i, sep = "")
      ),
      silent = TRUE
    )

    if (class(x) == "data.frame") {
      ## Check if try is not an error
      names(x) <- names(x) %>%
        stringr::str_replace(pattern = "_", replacement = " ")

      ## Tidy the dataset and conver to long format
      x <- x %>%
        tidyr::pivot_longer(cols = dplyr::starts_with(match = c("Views",
                                                                "Replies")),
                            names_to = c("Interaction", "Extraction"),
                            names_sep = " ",
                            values_to = "n") %>%
        dplyr::mutate(Extraction = lubridate::ymd_hms(Extraction))

      ## Concatenate
      hourlies <- rbind(hourlies, x)
    } else break
  }

  ## Convert to tibble
  hourlies <- hourlies %>%
    dplyr::mutate(n = ifelse(is.na(n), 0, n))

  ## Return hourlies
  return(hourlies)
}


################################################################################
#
#'
#' @examples
#' create_db_topics_dailies(hourlies = ennet_hourlies)
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

create_db_topics_dailies <- function(hourlies) {
  ## Process dailies topics data
  dailies <- hourlies %>%
    dplyr::group_by(Theme, Topic, Author, Posted, Link, Interaction,
                    `Extraction Date` = as.Date(Extraction)) %>%
    dplyr::filter(Extraction == max(Extraction, na.rm = TRUE)) %>%
    dplyr::ungroup()

  ## return dailies
  return(dailies)
}

################################################################################
#
#'
#' @examples
#' create_db_topics_daily_interactions(dailies = ennet_dailies)
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

create_db_topics_daily_interactions <- function(dailies) {
  ## Tally daily views
  x <- dailies %>%
    dplyr::group_by(Theme, Interaction, `Extraction Date`) %>%
    dplyr::count(Posted, name = "nPosts") %>%
    dplyr::summarise(nPosts = sum(nPosts), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction, values_from = nPosts) %>%
    dplyr::select(Theme:Replies) %>%
    dplyr::rename(nPosts = Replies)

  ## Tally daily interactions
  daily_interactions <- dailies %>%
    dplyr::group_by(Theme, Interaction, `Extraction Date`, .add = TRUE) %>%
    dplyr::summarise(nInteractions = sum(n), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction,
                       values_from = nInteractions) %>%
    dplyr::group_by(Theme) %>%
    dplyr::mutate(`New Replies` = c(0, diff(Replies, 1)),
                  `New Views` = c(0, diff(Views, 1))) %>%
  ## Merge views with daily interactions
    dplyr::full_join(x) %>%
    dplyr::ungroup()

  ## Return daily interactions
  return(daily_interactions)
}


################################################################################
#
#'
#' @examples
#' create_db_topics_weekly_interactions(dailies = ennet_dailies)
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

create_db_topics_weekly_interactions <- function(dailies) {
  ## Process weeklies topics data
  weeklies <- dailies %>%
    dplyr::group_by(Theme, Topic, Author, Posted, Link, Interaction,
                    `Extraction Week` = cut(`Extraction Date`,
                                            breaks = "1 week",
                                            start.on.monday = FALSE) %>%
                      as.Date()) %>%
    dplyr::filter(Extraction == max(Extraction, na.rm = TRUE)) %>%
    dplyr::ungroup()

  ## Tally weekly views
  x <- dailies %>%
    dplyr::group_by(Theme, Interaction,
                    `Extraction Week` = cut(`Extraction Date`,
                                            breaks = "1 week",
                                            start.on.monday = FALSE) %>%
                      as.Date()) %>%
    dplyr::count(Posted, name = "nPosts") %>%
    dplyr::summarise(nPosts = sum(nPosts), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction, values_from = nPosts) %>%
    dplyr::select(Theme:Replies) %>%
    dplyr::rename(nPosts = Replies)

  ## Tally weekly interactions
  weekly_interactions <- weeklies %>%
    dplyr::group_by(Theme, Interaction, `Extraction Week`, .add = TRUE) %>%
    dplyr::summarise(nInteractions = sum(n), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction,
                       values_from = nInteractions) %>%
    dplyr::group_by(Theme) %>%
    dplyr::mutate(`New Replies` = c(0, diff(Replies, 1)),
                  `New Views` = c(0, diff(Views, 1))) %>%
    dplyr::full_join(x) %>%
    dplyr::ungroup()

  ## Return weekly_interactions
  return(weekly_interactions)
}


################################################################################
#
#'
#' @examples
#' create_db_topics_monthly_interactions(dailies = ennet_dailies)
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

create_db_topics_monthly_interactions <- function(dailies) {
  ## Process monthlies topics data
  monthlies <- dailies %>%
    dplyr::group_by(Theme, Topic, Author, Posted, Link, Interaction,
                    `Extraction Month` = cut(`Extraction Date`,
                                             breaks = "1 month") %>%
                      as.Date()) %>%
    dplyr::filter(Extraction == max(Extraction, na.rm = TRUE)) %>%
    dplyr::ungroup()

  ## Tally monthly views
  x <- dailies %>%
    dplyr::group_by(Theme, Interaction,
                    `Extraction Month` = cut(`Extraction Date`,
                                             breaks = "1 month") %>%
                      as.Date()) %>%
    dplyr::count(Posted, name = "nPosts") %>%
    dplyr::summarise(nPosts = sum(nPosts), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction, values_from = nPosts) %>%
    dplyr::select(Theme:Replies) %>%
    dplyr::rename(nPosts = Replies)

  ## Tally monthly interactions
  monthly_interactions <- monthlies %>%
    dplyr::group_by(Theme, Interaction, `Extraction Month`, .add = TRUE) %>%
    dplyr::summarise(nInteractions = sum(n), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction, values_from = nInteractions) %>%
    dplyr::group_by(Theme) %>%
    dplyr::mutate(`New Replies` = c(0, diff(Replies, 1)),
                  `New Views` = c(0, diff(Views, 1))) %>%
    dplyr::full_join(x) %>%
    dplyr::ungroup()

  ## Return monthly_interactions
  return(monthly_interactions)
}


################################################################################
#
#'
#' @examples
#' create_db_topics_yearly_interactions(dailies = ennet_dailies)
#'
#' @export
#' @rdname create_db
#'
#
################################################################################

create_db_topics_yearly_interactions <- function(dailies) {
  ## Process yearlies topics data
  yearlies <- dailies %>%
    dplyr::group_by(Theme, Topic, Author, Posted, Link, Interaction,
                    `Extraction Year` = cut(`Extraction Date`,
                                            breaks = "1 year") %>%
                      as.Date()) %>%
    dplyr::filter(Extraction == max(Extraction, na.rm = TRUE)) %>%
    dplyr::ungroup()

  ## Tally yearly views
  x <- yearlies %>%
    dplyr::group_by(Theme, Interaction,
                    `Extraction Year` = cut(`Extraction Date`,
                                            breaks = "1 year") %>%
                      as.Date()) %>%
    dplyr::count(Posted, name = "nPosts") %>%
    dplyr::summarise(nPosts = sum(nPosts), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction, values_from = nPosts) %>%
    dplyr::select(Theme:Replies) %>%
    dplyr::rename(nPosts = Replies)

  ## Tally yearly interactions
  yearly_interactions <- yearlies %>%
    dplyr::group_by(Theme, Interaction, `Extraction Year`, .add = TRUE) %>%
    dplyr::summarise(nInteractions = sum(n), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = Interaction,
                       values_from = nInteractions) %>%
    dplyr::group_by(Theme) %>%
    dplyr::mutate(`New Replies` = c(0, diff(Replies, 1)),
                  `New Views` = c(0, diff(Views, 1))) %>%
    dplyr::full_join(x) %>%
    dplyr::ungroup()

  ## Return yearly_interactions
  return(yearly_interactions)
}
