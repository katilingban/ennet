################################################################################
#
#'
#' Utilities to Extract Text Data From EN-NET
#'
#' en-net is the go to online forum for field practitioners requiring prompt
#' technical advice for operational challenges for which answers are not readily
#' accessible in current guidelines. The questions and the corresponding answers
#' raised within en-net can provide insight into what the key topics of
#' discussion are within the nutrition sector. This package provides utility
#' functions for the extraction, processing and analysis of text data from the
#' online forum.
#'
#' @docType package
#' @keywords internal
#' @name ennet
#' @importFrom magrittr %>%
#' @importFrom rvest html_nodes html_attr html_text
#' @importFrom xml2 read_html url_absolute
#' @importFrom tibble tibble
#' @importFrom dplyr bind_rows mutate rename first
#' @importFrom stringr str_replace str_detect str_extract_all str_to_lower
#'   str_replace_na str_remove_all
#' @importFrom tidyselect contains
#'
#
################################################################################
"_PACKAGE"
