################################################################################
#
#'
#' Get list of thematic areas from en-net.org
#'
#' @param base Base URL of the en-net site. Set to \url{https://www.en-net.org/}
#'
#' @return A tibble containing the thematic areas from en-net.org and the
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
  labs <- xml2::read_html(x = x) %>%
    rvest::html_nodes(css = "h3 a") %>%
    rvest::html_text()

  ## Get the thematic area links
  links <- xml2::read_html(x = x) %>%
    rvest::html_nodes(css = "h3 a") %>%
    rvest::html_attr(name = "href") %>%
    xml2::url_absolute(base = x)

  ## Concatenate to a tibble
  thematic_areas <- tibble::tibble(labs, links)

  ## Return thematic_areas
  return(thematic_areas)
}
