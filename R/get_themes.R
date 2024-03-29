################################################################################
#
#'
#' Get list of thematic areas from en-net.org
#'
#' @param base Base URL of the en-net site. Set to
#'   [https://www.en-net.org/](https://www.en-net.org/)
#'
#' @return A tibble containing the thematic areas from **en-net forum** and the
#'   corresponding URLs for each thematic area
#'
#' @examples
#' get_themes()
#'
#' @export
#'
#
################################################################################

get_themes <- function(base = "https://www.en-net.org") {
  ## Get the thematic area labels
  themes <- xml2::read_html(x = base) %>%
    rvest::html_nodes(css = "h3 a") %>%
    rvest::html_text()

  ## Get the thematic area links
  links <- xml2::read_html(x = base) %>%
    rvest::html_nodes(css = "h3 a") %>%
    rvest::html_attr(name = "href") %>%
    xml2::url_absolute(base = base)

  ## Concatenate to a tibble
  thematic_areas <- tibble::tibble(themes, links)

  ## Return thematic_areas
  return(thematic_areas)
}


################################################################################
#
#'
#' Get theme topics
#'
#' @param link URL of a specific thematic area
#'
#' @return A tibble of all topics for the specified thematic area.
#'
#' @examples
#' themes <- ennet_themes
#' get_theme_topics(link = themes$links[4])
#'
#' @export
#'
#
################################################################################

get_theme_topics <- function(link) {
  ## Get HTML page
  page <- xml2::read_html(x = link)

  if (stringr::str_detect(link, pattern = "11")) {
    topics <- page %>%
      rvest::html_nodes(css = "#pagebody table") %>%
      rvest::html_table() %>%
      do.call(rbind, .)

    names(topics) <- c("Theme", "Topic", "Views", "Author", "Posted")

    topics <- topics %>%
      dplyr::mutate(
        Replies = NA_integer_,
        .before = Author
      )
  } else {
    ##
    topics <- page %>%
      rvest::html_nodes(css = "#pagebody table") %>%
      rvest::html_table() %>%
      do.call(rbind, .)
  }

  ##
  if (!is.null(topics)) {
    names(topics) <- c("Theme", "Topic", "Views", "Replies", "Author", "Posted")
    topics <- topics %>%
      #dplyr::rename(Theme = ``) %>%
      dplyr::mutate(
        Theme = page %>%
          rvest::html_nodes(css = "#pagebody h1") %>%
          rvest::html_text(),
        Views = stringr::str_remove_all(Views, pattern = ",") %>%
          as.integer(),
        Posted = as.Date(Posted, format = "%d %b %Y"),
        Link = page %>%
          rvest::html_nodes(css = "#pagebody table .title a") %>%
          rvest::html_attr(name = "href") %>%
          xml2::url_absolute(base = "https://www.en-net.org/")
      ) %>%
      tibble::tibble()
  } else {
    topics <- NULL
  }

  ##
  return(topics)
}

################################################################################
#
#'
#' Get topics from multiple themes
#'
#' @param themes A tibble containing thematic areas and URLs for thematic area
#'   pages
#'
#' @return A tibble of all topics across all thematic areas with their
#'   respective URLs
#'
#' @examples
#' themes <- ennet_themes
#' get_themes_topics(themes = themes[4, ])
#'
#' @export
#'
#
################################################################################

get_themes_topics <- function(themes = get_themes()) {
  ## Get links
  links <- themes$links

  ## Get topics per thematic area
  allTopics <- lapply(X = links, FUN = get_theme_topics)

  ## Unlist allTopics
  allTopics <- dplyr::bind_rows(allTopics)

  ## Return allTopics
  return(allTopics)
}
