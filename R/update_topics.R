################################################################################
#
#'
#' Update en-net topics
#'
#' @param freq A numeric value for time in seconds for frequency of retrieval
#'   of updated en-net topics. Defaults to 0 for a single retrieval
#'   (no repeats)
#'
#' @return A tibble containing the topics across all thematic areas in
#'   en-net forum
#'
#' @examples
#' if(interactive()) update_topics()
#'
#' @export
#'
#
################################################################################

update_topics <- function(freq = 0) {
  repeat {
    ## Get Sys.time
    startTime <- Sys.time()

    ## Get data
    ennet_topics <- get_themes() %>%
      get_themes_topics()

    ## Return results
    return(ennet_topics)

    ## Calculate interval
    sleepTime <- startTime + 5 * freq - Sys.time()

    ## check freq
    if(freq == 0) {
      break
    } else {
      Sys.sleep(sleepTime)
    }
  }
}
