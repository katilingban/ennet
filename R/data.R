################################################################################
#
#'
#' Themes from en-net forum retrieved on 17 January 2021
#'
#' @format A tibble with 18 rows and 2 columns:
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | `themes` | Thematic areas in the en-net forum |
#' | `links` | URL of the thematic area |
#'
#' @examples
#' ennet_themes
#'
#' @source https://www.en-net.org
#'
#
################################################################################
"ennet_themes"


################################################################################
#
#'
#' Topics from en-net forum retrieved on 17 January 2021
#'
#' @format A tibble with 3045 rows and 7 columns:
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | `Theme` | Thematic areas in the en-net forum |
#' | `Topic` | Short description of the topic/question being discussed/raised |
#' | `Views` | Number of views of the topic/question being discussed/raised |
#' | `Author` | Name of person who raised the topic/question |
#' | `Posted` | Date topic/question was posted on en-net forum |
#' | `Link` | URL of the topic/question being discussed/raised |
#' | `Replies` | Number of replies to topic/question being discussed/raised |
#'
#' @details Please note that this dataset is made available in the package
#'   primarily as a guide for the user and as testing data for the code. Users
#'   are advised not to use this dataset for actual analysis or reporting and
#'   instead make a call to [get_theme_topics()] or to [get_themes_topics()].
#'   This is because some topics and some author names have been converted to NA
#'   as they contain non-ASCII characters which are not allowed as a text
#'   encoding format for packaged data.
#'
#' @examples
#' ennet_topics
#'
#' @source https://www.en-net.org
#'
#'
#
################################################################################
"ennet_topics"


################################################################################
#
#'
#' Hourly extracts of topics dataset from en-net online forum
#'
#' @format A tibble with 643844 rows and 8 columns:
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | `Theme` | Thematic areas in the en-net forum |
#' | `Topic` | Short description of the topic/question being discussed/raised |
#' | `Author` | Name of person who raised the topic/question |
#' | `Posted` | Date topic/question was posted on en-net forum |
#' | `Link` | URL of the topic/question being discussed/raised |
#' | `Interaction` | Type of interaction. Either *Views* or *Replies* |
#' | `Extraction` | Date and time when data was extracted |
#' | `n` | Number or count |
#'
#' @examples
#' ennet_hourlies
#'
#' @source https://www.en-net.org
#'
#
################################################################################
"ennet_hourlies"


################################################################################
#
#'
#' Daily extracts of topics dataset from en-net online forum
#'
#' @format A tibble with 90 rows and 7 columns:
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | `Theme` | Thematic areas in the en-net forum |
#' | `Topic` | Short description of the topic/question being discussed/raised |
#' | `Author` | Name of person who raised the topic/question |
#' | `Posted` | Date topic/question was posted on en-net forum |
#' | `Link` | URL of the topic/question being discussed/raised |
#' | `Interaction` | Type of interaction. Either *Views* or *Replies* |
#' | `Extraction` | Date and time when data was extracted |
#' | `n` | Number or count |
#' | `Extraction Date` | Date when data was extracted |
#'
#' @examples
#' ennet_dailies
#'
#' @source https://www.en-net.org
#'
#
################################################################################
"ennet_dailies"
