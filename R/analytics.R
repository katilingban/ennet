################################################################################
#
#'
#' Count the number of topics by theme and by date
#'
#' @param topics A tibble of topics by theme from en-net forum produced through
#'   a call to `get_themes_topics`.
#' @param by_date Should topics be counted by month of the year or just by
#'   year?
#'
#' @return A tibble of topic counts by theme and by specified date format
#'
#' @examples
#' library(magrittr)
#' x <- get_themes()[4, ] %>% get_themes_topics()
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
#' @param by_date Should topics be counted by month of the year or just by
#'   year?
#'
#' @return A tibble of topic views by theme and by specified date format
#'   arranged in descending order
#'
#' @examples
#' library(magrittr)
#' x <- get_themes()[4, ] %>% get_themes_topics()
#' x %>% arrange_topics(by_date = "month_year")
#'
#' @export
#'
#'
#
################################################################################

#x %>%
#  group_by(Theme) %>%
#  arrange(desc(Views), .by_group = TRUE) %>%
#  ungroup()
