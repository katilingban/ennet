################################################################################
#
#
# Retrieve full en-net dataset
#
# @return A tibble containing the topic discussions for all topics across all
#   thematic areas in en-net forum up to current point in time
#
# @examples
# if(interactive()) retrieve_ennet()
#
#
#
################################################################################

retrieve_ennet <- function() {
  ## Get full dataset
  ennet <- get_themes %>%
    get_themes_topics() %>%
    get_topics_discussions()

  ## Return dataset
  return(ennet)
}


################################################################################
#
#
# Update full en-net dataset
#
# @param freq A numeric value for time in seconds for frequency of retrieval
#   of updated en-net dataset. Defaults to 0 for a single retrieval
#   (no repeats)
#
# @return A tibble containing the topic discussions for all topics across all
#   thematic areas in en-net forum
#
# @examples
# if(interactive()) update_ennet()
#
#
#
################################################################################

update_ennet <- function(freq = 0) {
  repeat {
    ## Get Sys.time
    startTime <- Sys.time()

    ## Get data
    ennet <- get_themes() %>%
      get_themes_topics() %>%
      get_topics_discussions()

    ## Return results
    return(ennet)

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
