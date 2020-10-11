################################################################################
#
#'
#' Count the number of topics by theme and by date
#'
#' @param topics A tibble of topics by theme from en-net forum produced through
#'   a call to `get_themes_topics`.
#' @param by_date Should topics be counted by month of the year or just by
#'   year? Default is by month of the year.
#'
#' @return A tibble of topic counts by theme and by specified date format
#'
#' @examples
#' library(magrittr)
#' x <- ennet_topics
#' x %>% count_topics(by_date = "month_year")
#'
#' @export
#'
#'
#
################################################################################

count_topics <- function(topics, by_date = c("month_year", "year")) {
  by_date <- match.arg(by_date)
  x <- topics %>%
    dplyr::mutate(Month = factor(x = month.abb[lubridate::month(Posted)],
                                 levels = month.abb),
           Year = lubridate::year(Posted)) %>%
    dplyr::group_by(Theme)

  ## by_date == "month_year"
  if(by_date == "month_year") {
    x <- x %>%
      dplyr::count(Month, Year) %>%
      dplyr::ungroup()
  }

  ## by_date == "year"
  if(by_date == "year") {
    x <- x %>%
      dplyr::count(Year) %>%
      dplyr::ungroup()
  }

  ## Return
  return(x)
}


################################################################################
#
#'
#' Arrange topics based on number of views
#'
#' @param topics A tibble of topics by theme from en-net forum produced through
#'   a call to `get_themes_topics`.
#' @param by_theme Logical. Should topics be grouped by theme? Default is TRUE.
#' @param by_date Should topics be grouped by month of the year or just by
#'   year or overall? Default is to group by month of the year.
#'
#' @return A tibble of topic views by theme and by specified date format
#'   arranged in descending order
#'
#' @examples
#' library(magrittr)
#' x <- ennet_topics
#' x %>% arrange_views()
#'
#' @export
#'
#'
#
################################################################################

arrange_views <- function(topics,
                           by_theme = TRUE,
                           by_date = c("month_year", "year", "all")) {
  by_date <- match.arg(by_date)
  x <- topics %>%
    dplyr::mutate(Month = factor(x = month.abb[lubridate::month(Posted)],
                                 levels = month.abb),
                  Year = lubridate::year(Posted))

  ## by_theme?
  if(by_theme) {
    x <- x %>%
      dplyr::group_by(Theme)
  }

  ## by_date == "month_year"
  if(by_date == "month_year") {
    x <- x %>%
      dplyr::group_by(Month, Year)
  }

  ## by_date == "year"
  if(by_date == "year") {
    x <- x %>%
      dplyr::group_by(Year)
  }

  ## Arrange by descening number of views
  x <- x %>%
    dplyr::arrange(dplyr::desc(Views), .by_group = TRUE) %>%
    dplyr::ungroup()

  ## Return
  return(x)
}


################################################################################
#
#'
#' Arrange topics based on number of replies
#'
#' @param topics A tibble of topics by theme from en-net forum produced through
#'   a call to `get_themes_topics`.
#' @param by_theme Logical. Should topics be grouped by theme? Default is TRUE.
#' @param by_date Should topics be grouped by month of the year or just by
#'   year? Default is to group by month of the year.
#'
#' @return A tibble of topic views by theme and by specified date format
#'   arranged in descending order
#'
#' @examples
#' library(magrittr)
#' x <- ennet_topics
#' x %>% arrange_replies()
#'
#' @export
#'
#'
#
################################################################################

arrange_replies <- function(topics,
                           by_theme = TRUE,
                           by_date = c("month_year", "year", "all")) {
  by_date <- match.arg(by_date)
  x <- topics %>%
    dplyr::mutate(Month = factor(x = month.abb[lubridate::month(Posted)],
                                 levels = month.abb),
                  Year = lubridate::year(Posted))

  ## by_theme?
  if(by_theme) {
    x <- x %>%
      dplyr::group_by(Theme)
  }

  ## by_date == "month_year"
  if(by_date == "month_year") {
    x <- x %>%
      dplyr::group_by(Month, Year)
  }

  ## by_date == "year"
  if(by_date == "year") {
    x <- x %>%
      dplyr::group_by(Year)
  }

  ## Arrange by descening number of views
  x <- x %>%
    dplyr::arrange(dplyr::desc(Replies), .by_group = TRUE) %>%
    dplyr::ungroup()

  ## Return
  return(x)
}


################################################################################
#
#'
#' Count the number of topics by author, by theme and by date
#'
#' @param topics A tibble of topics by theme from en-net forum produced through
#'   a call to `get_themes_topics`.
#' @param by_theme Logical. If TRUE (default), count by theme.
#' @param by_date Should topics be counted by month of the year or just by
#'   year or total? Default is to count by month of the year.
#'
#' @return A tibble of topic counts by author, by theme and by specified date
#'   format
#'
#' @examples
#' library(magrittr)
#' x <- ennet_topics
#' x %>% count_authors()
#'
#' @export
#'
#'
#
################################################################################

count_authors <- function(topics,
                          by_theme = TRUE,
                          by_date = c("month_year", "year", "all")) {
  by_date <- match.arg(by_date)
  x <- topics %>%
    dplyr::mutate(Month = factor(x = month.abb[lubridate::month(Posted)],
                                 levels = month.abb),
                  Year = lubridate::year(Posted))

  if(by_theme) {
    x <- x %>%
      dplyr::group_by(Theme)
  }

  ## by_date == "all"
  if(by_date == "all") {
    x <- x %>%
      dplyr::count(Author)
  }

  ## by_date == "month_year"
  if(by_date == "month_year") {
    x <- x %>%
      dplyr::count(Author, Month, Year)
  }

  ## by_date == "year"
  if(by_date == "year") {
    x <- x %>%
      dplyr::count(Author, Year)
  }

  ## ungroup
  x <- dplyr::ungroup(x)

  ## Return
  return(x)
}
