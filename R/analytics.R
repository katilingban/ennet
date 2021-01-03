################################################################################
#
#'
#' Count the number of topics by theme and by date
#'
#' @param topics A tibble of topics by theme from **en-net forum** produced
#'   through a call to [get_themes_topics()].
#' @param by_date Should topics be grouped by month of the year or just by
#'   year or overall? Default is to group by month of the year.
#' @param .sort Logical. Should output be sorted by count frequencies? Default
#'   is *TRUE*.
#'
#' @return A tibble of topic counts by theme and by specified date format
#'
#' @author Ernest Guevarra
#'
#' @examples
#' library(magrittr)
#' ennet_topics %>% count_topics(by_date = "month_year")
#'
#' @export
#'
#
################################################################################

count_topics <- function(topics,
                         by_date = c("month_year", "year", "all"),
                         .sort = TRUE) {
  ## Deprecation message
  .Deprecated(new = "count_topics_theme",
              package = "ennet",
              msg = paste(
                strwrap(x = "This function is now deprecated and will be removed
                             in the next version of the package. Consider using
                             the function ennet::count_topics_theme() instead.",
                        width = 80),
                collapse = "\n"),
              old = "count_topics")

  by_date <- match.arg(by_date)
  x <- topics %>%
    dplyr::mutate(Month = factor(x = month.abb[lubridate::month(Posted)],
                                 levels = month.abb),
           Year = lubridate::year(Posted)) %>%
    dplyr::group_by(Theme)

  ## by_date == "month_year"
  if(by_date == "month_year") {
    x <- x %>%
      dplyr::count(Month, Year)

    ## check if need to sort
    if(.sort) {
      x <- x %>%
        dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
    }

    ## ungroup
    x <- x %>% dplyr::ungroup()
  }

  ## by_date == "year"
  if(by_date == "year") {
    x <- x %>%
      dplyr::count(Year)

    ## check if need to sort
    if(.sort) {
      x <- x %>%
        dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
    }

    ## ungroup
    x <- x %>% dplyr::ungroup()
  }

  ## by_date == "all"
  if(by_date == "all") {
    x <- x %>%
      dplyr::count()

    ## check if need to sort
    if(.sort) {
      x <- x %>% dplyr::arrange(dplyr::desc(n))
    }

    ## ungroup
    x <- x %>% dplyr::ungroup()
  }

  ## Return
  return(x)
}


################################################################################
#
#'
#' Arrange topics based on number of views
#'
#' @param topics A tibble of topics by theme from **en-net forum** produced
#'   through a call to [get_themes_topics()].
#' @param by_theme Logical. Should topics be grouped by theme?
#'   Default is *TRUE*.
#' @param by_date Should topics be grouped by month of the year or just by
#'   year or overall? Default is to group by month of the year.
#'
#' @return A tibble of topic views by theme and by specified date format
#'   arranged in descending order
#'
#' @author Ernest Guevarra
#'
#' @examples
#' library(magrittr)
#' ennet_topics %>% arrange_views()
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
    ## by_date == "month_year"
    if(by_date == "month_year") {
      x <- x %>%
        dplyr::group_by(Theme, Month, Year)
    }

    ## by_date == "year"
    if(by_date == "year") {
      x <- x %>%
        dplyr::group_by(Theme, Year)
    }

    ## by_date == "all"
    if(by_date == "all") {
      x <- x %>%
        dplyr::group_by(Theme)
    }
  } else {
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
  }

  ## Arrange by descending number of views
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
#' @param topics A tibble of topics by theme from **en-net forum** produced
#'   through a call to [get_themes_topics()].
#' @param by_theme Logical. Should topics be grouped by theme?
#'   Default is *TRUE*.
#' @param by_date Should topics be grouped by month of the year or just by
#'   year? Default is to group by month of the year.
#'
#' @return A tibble of topic views by theme and by specified date format
#'   arranged in descending order
#'
#' @author Ernest Guevarra
#'
#' @examples
#' library(magrittr)
#' ennet_topics %>% arrange_replies()
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
    ## by_date == "month_year"
    if(by_date == "month_year") {
      x <- x %>%
        dplyr::group_by(Theme, Month, Year)
    }

    ## by_date == "year"
    if(by_date == "year") {
      x <- x %>%
        dplyr::group_by(Theme, Year)
    }

    ## by_date == "all"
    if(by_date == "all") {
      x <- x %>%
        dplyr::group_by(Theme)
    }
  } else {
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
  }

  ## Arrange by descending number of views
  x <- x %>%
    dplyr::arrange(dplyr::desc(Replies), .by_group = TRUE) %>%
    dplyr::filter(!is.na(Replies)) %>%
    dplyr::ungroup()

  ## Return
  return(x)
}


################################################################################
#
#'
#' Count the number of topics by author, by theme and by date
#'
#' @param topics A tibble of topics by theme from **en-net** forum produced
#'   through a call to [get_themes_topics()].
#' @param by_theme Logical. If *TRUE (default)*, count by theme.
#' @param by_date Should topics be counted by month of the year or just by
#'   year or total? Default is to count by month of the year.
#' @param .sort Logical. Should output be sorted by count frequencies? Default
#'   is *TRUE*.
#'
#' @return A tibble of topic counts by author, by theme and by specified date
#'   format
#'
#' @author Ernest Guevarra
#'
#' @examples
#' library(magrittr)
#' ennet_topics %>% count_authors()
#'
#' @export
#'
#
################################################################################

count_authors <- function(topics,
                          by_theme = TRUE,
                          by_date = c("month_year", "year", "all"),
                          .sort = TRUE) {
  ## Deprecation message
  .Deprecated(new = "count_topics_author",
              package = "ennet",
              msg = paste(
                strwrap(x = "This function is now deprecated and will be removed
                             in the next version of the package. Consider using
                             the function ennet::count_topics_author()
                             instead.",
                        width = 80),
                collapse = "\n"),
              old = "count_authors")

  by_date <- match.arg(by_date)
  x <- topics %>%
    dplyr::mutate(Month = factor(x = month.abb[lubridate::month(Posted)],
                                 levels = month.abb),
                  Year = lubridate::year(Posted))

  if(by_theme) {
    ## by_date == "all"
    if(by_date == "all") {
      x <- x %>%
        dplyr::count(Theme, Author)

      ## check if need to sort
      if(.sort) {
        x <- x %>%
          dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
      }
    }

    ## by_date == "month_year"
    if(by_date == "month_year") {
      x <- x %>%
        dplyr::count(Theme, Author, Month, Year)

      ## check if need to sort
      if(.sort) {
        x <- x %>%
          dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
      }
    }

    ## by_date == "year"
    if(by_date == "year") {
      x <- x %>%
        dplyr::count(Theme, Author, Year)

      ## check if need to sort
      if(.sort) {
        x <- x %>%
          dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
      }
    }
  } else {
    ## by_date == "all"
    if(by_date == "all") {
      x <- x %>%
        dplyr::count(Author)

      ## check if need to sort
      if(.sort) {
        x <- x %>%
          dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
      }
    }

    ## by_date == "month_year"
    if(by_date == "month_year") {
      x <- x %>%
        dplyr::count(Author, Month, Year)

      ## check if need to sort
      if(.sort) {
        x <- x %>%
          dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
      }
    }

    ## by_date == "year"
    if(by_date == "year") {
      x <- x %>%
        dplyr::count(Author, Year)

      ## check if need to sort
      if(.sort) {
        x <- x %>%
          dplyr::arrange(dplyr::desc(n), .by_group = TRUE)
      }
    }
  }

  ## Return
  return(x)
}


################################################################################
#
#' Count number of questions/topics posted on en-net by time
#'
#' @param topics A tibble of topics by theme, by author, and by posting date
#'   from **en-net** forum produced through a call to [get_themes_topics()]
#' @param .sort Logical. Should output be sorted by count frequencies? Default
#'   is *FALSE*
#'
#' @return A tibble of topic counts by specified time grouping
#'
#' @author Ernest Guevarra
#'
#' @examples
#' ## Get counts of topics by day
#' count_topics_day(topics = ennet_topics)
#'
#' @rdname count_topics_day
#' @export
#'
#
################################################################################

count_topics_day <- function(topics = get_themes_topics(),
                             .sort = FALSE) {
  ## Count
  x <- topics %>%
    dplyr::count(Posted, sort = .sort) %>%
    dplyr::rename(day = Posted)

  ## Return result
  return(x)
}


################################################################################
#
#'
#' @examples
#' ## Get counts of topics by week
#' count_topics_week(topics = ennet_topics)
#'
#' @rdname count_topics_day
#' @export
#'
#
################################################################################

count_topics_week <- function(topics = get_themes_topics(),
                              .sort = FALSE) {
  ## Count
  x <- topics %>%
    dplyr::mutate(week = cut(x = Posted,
                             breaks = "week",
                             start.on.monday = FALSE) %>%
                    as.Date()) %>%
    dplyr::count(week, sort = .sort) %>%
    dplyr::mutate(week_name = strftime(x = week,
                                       format = "Week %V %Y")) %>%
    dplyr::relocate(week_name, .before = n)

  ## Return result
  return(x)
}


################################################################################
#
#'
#' @examples
#' ## Get counts of topics by month
#' count_topics_month(topics = ennet_topics)
#'
#' @rdname count_topics_day
#' @export
#'
#
################################################################################

count_topics_month <- function(topics = get_themes_topics(),
                               .sort = FALSE) {
  ## Count
  x <- topics %>%
    dplyr::mutate(month = cut(x = Posted,
                              breaks = "month") %>%
                    as.Date()) %>%
    dplyr::count(month, sort = .sort) %>%
    dplyr::mutate(month_name = strftime(x = month,
                                        format = "%b %Y")) %>%
    dplyr::relocate(month_name, .before = n)

  ## Return result
  return(x)
}


################################################################################
#
#'
#' @examples
#' ## Get counts of topics by year
#' count_topics_year(topics = ennet_topics)
#'
#' @rdname count_topics_day
#' @export
#'
#
################################################################################

count_topics_year <- function(topics = get_themes_topics(),
                              .sort = FALSE) {
  ## Count
  x <- topics %>%
    dplyr::mutate(year = cut(x = Posted,
                             breaks = "year") %>%
                    as.Date()) %>%
    dplyr::count(year, sort = .sort) %>%
    dplyr::mutate(year_name = strftime(x = year,
                                       format = "%Y")) %>%
    dplyr::relocate(year_name, .before = n)

  ## Return result
  return(x)
}


################################################################################
#
#'
#' Count number of questions/topics posted on en-net
#'
#' @param topics A tibble of topics by theme, by author, and by posting date
#'   from **en-net** forum produced through a call to [get_themes_topics()]
#' @param by_time Should topics be counted by day, by week, by month or by year?
#'   Default is to count by day.
#' @param .sort Logical. Should output be sorted by count frequencies? Default
#'   is *TRUE*
#'
#' @return A tibble of topic counts by specified grouping
#'
#' @author Ernest Guevarra
#'
#' @examples
#' ## Get counts of topics by theme
#' count_topics_theme(topics = ennet_topics)
#'
#' @rdname count_topics_theme
#' @export
#'
#
################################################################################

count_topics_theme <- function(topics = get_themes_topics(),
                               .sort = TRUE) {
  ## Count
  x <- topics %>%
    dplyr::count(Theme, sort = .sort)

  ## Return results
  return(x)
}


################################################################################
#
#'
#' @examples
#' ## Get counts of topics by theme and by time
#' count_topics_theme_time(topics = ennet_topics)
#'
#' @rdname count_topics_theme
#' @export
#'
#
################################################################################

count_topics_theme_time <- function(topics = get_themes_topics(),
                                    by_time = c("day", "week", "month", "year"),
                                    .sort = TRUE) {
  by_time <- match.arg(by_time)

  count_function <- eval(
    expr = parse(
      text = paste("count_topics_", by_time, sep = "")
    )
  )

  ## Count
  x <- topics %>%
    dplyr::group_by(Theme) %>%
    count_function

  ## Sort
  if (.sort) {
    x <- x %>%
      dplyr::arrange(dplyr::desc(n)) %>%
      dplyr::ungroup()
  }

  ## Return result
  return(x)
}


################################################################################
#
#'
#' Count number of questions/topics posted on en-net by author
#'
#' @param topics A tibble of topics by theme, by author, and by posting date
#'   from **en-net** forum produced through a call to [get_themes_topics()]
#' @param by_time Should topics be counted by day, by week, by month or by year?
#'   Default is to count by day.
#' @param .sort Logical. Should output be sorted by count frequencies? Default
#'   is *TRUE*
#'
#' @return A tibble of topic counts by specified grouping
#'
#' @author Ernest Guevarra
#'
#' @examples
#' ## Get counts of topics by author
#' count_topics_author(topics = ennet_topics)
#'
#' @rdname count_topics_author
#' @export
#'
#
################################################################################

count_topics_author <- function(topics = get_themes_topics(),
                                .sort = TRUE) {
  ## Count
  x <- topics %>%
    dplyr::count(Author, sort = .sort)

  ## Return results
  return(x)
}


################################################################################
#
#'
#' @examples
#' ## Get counts of authors by author and by time
#' count_topics_author_time(topics = ennet_topics)
#'
#' @rdname count_topics_author
#' @export
#'
#
################################################################################

count_topics_author_time <- function(topics = get_themes_topics(),
                                     by_time = c("day", "week",
                                                 "month", "year"),
                                     .sort = TRUE) {
  by_time <- match.arg(by_time)

  count_function <- eval(
    parse(
      text = paste("count_topics_", by_time, sep = "")
    )
  )

  ## Count
  x <- topics %>%
    dplyr::group_by(Author) %>%
    count_function

  ## Sort
  if (.sort) {
    x <- x %>%
      dplyr::arrange(dplyr::desc(n)) %>%
      dplyr::ungroup()
  }

  ## Return result
  return(x)
}
