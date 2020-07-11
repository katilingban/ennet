################################################################################
#
#'
#' Get the question for a particular topic
#'
#' @param link URL for topic discussion
#'
#' @return A tibble containing the topic question
#'
#' @examples
#' links <- get_theme_topics(link = get_themes()$links[4])
#' get_topic_question(link = links$Link)
#'
#'
#'
#
################################################################################

get_topic_question <- function(link) {
  page <- xml2::read_html(x = link)



  topic <- page %>%
    rvest::html_nodes(css = "#pagebody h1") %>%
    rvest::html_text()



  ##
  question <- page %>%
    rvest::html_nodes(css = "#pagebody #cphContent_pnlQuestion .body") %>%
    rvest::html_text() %>%
    stringr::str_split(pattern = "\r\n\r\n|\r\n") %>%
    unlist()

}


page %>% rvest::html_nodes(css = "#pagebody .post")

page %>% rvest::html_nodes(css = "#pagebody .post .data h3")

page %>% rvest::html_nodes(css = "#pagebody .post .data .datadetail")

page %>% rvest::html_nodes(css = "#pagebody .post .body")
