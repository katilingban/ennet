################################################################################
#
#'
#' Get the discussion and other details for a particular topic
#'
#' @param link URL for topic discussion
#'
#' @return A tibble containing the topic question
#'
#' @examples
#' links <- get_theme_topics(link = get_themes()$links[4])
#' get_topic_discussions(link = links$Link[1])
#'
#' @export
#'
#
################################################################################

get_topic_discussions <- function(link) {
  ## Read the link
  page <- xml2::read_html(x = link)

  ## Get the theme
  theme <- page %>%
    rvest::html_nodes(css = "#pagebody p a") %>%
    rvest::html_text() %>%
    dplyr::first()

  ## Get the topic
  topic <- page %>%
    rvest::html_nodes(css = "#pagebody h1") %>%
    rvest::html_text()

  ## Get the user
  user <- page %>%
    rvest::html_nodes(css = "#pagebody .post .data h3") %>%
    rvest::html_text()

  ## Get user code
  userCode <- page %>%
    rvest::html_nodes(css = "#pagebody .post .data h3 a") %>%
    rvest::html_attr(name = "href") %>%
    stringr::str_remove_all(pattern = "\\/|\\.aspx")

  ##
  details <- page %>%
    rvest::html_nodes(css = "#pagebody .post .data p") %>%
    rvest::html_text() %>%
    matrix(ncol = 3, byrow = TRUE) %>%
    data.frame()

  ##
  names(details) <- c("job", "role", "date_time")

  ## Is is a question or an answer
  type <- page %>%
    rvest::html_nodes(css = "#pagebody .post") %>%
    rvest::html_attr(name = "id") %>%
    stringr::str_extract(pattern = "Question") %>%
    stringr::str_to_lower() %>%
    stringr::str_replace_na(replacement = "answer")

  ## Code
  code <- vector(mode = "character",
                 length = page %>%
                   rvest::html_nodes(css = "#pagebody .post") %>%
                   length())

  code[1] <- stringr::str_extract(string = link,
                                  pattern = "[0-9]+")

  if(length(code) > 1) {
    ##
    code1 <- page %>%
      rvest::html_nodes(css = "#pagebody .post a") %>%
      rvest::html_attr(name = "name")

    code1 <- code1[stringr::str_detect(string = code1,
                                       pattern = "answer")] %>%
      stringr::str_extract_all(pattern = "[0-9]+", simplify = TRUE)

    code1 <- code1[!is.na(code1)]

    ##
    code[seq(from = 2, to = length(code), by = 1)] <- code1
  }

  ## Post
  post <- page %>%
    rvest::html_nodes(css = "#pagebody .body") %>%
    rvest::html_text()

  ## Concatenate
  discussion <- data.frame(theme, topic, user, userCode,
                           details, type, code, post)

  ## Convert to tibble
  discussion <- tibble::tibble(discussion)

  ## Return discussion
  return(discussion)
}


################################################################################
#
#'
#' Get the discussion and details of discussion for a set of topics
#'
#' @param links A tibble of topics containing URL of topic discussion. This
#'   is provided using a call to \code{get_theme_topics} or
#'   \code{get_themes_topics}
#'
#' @return A tibble containing the topic discussions for selected topic/s
#'
#' @examples
#' links <- get_theme_topics(link = get_themes()$links[4])
#' get_topics_discussions(link = links[1:3])
#'
#' @export
#'
#'
#'
#
################################################################################

get_topics_discussions <- function(links) {
  ## Get vector of links
  topicLinks <- links$Link

  ##
  discussions <- lapply(X = topicLinks,
                        FUN = get_topic_discussions) %>%
    dplyr::bind_rows()

  ## Return discussions
  return(discussions)
}
