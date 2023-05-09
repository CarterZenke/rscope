#' Parse HMS lateness to seconds, minutes, or hours
#'
#' @param hms A string of the form HH:MM:SS
#' @param unit The unit of time to be returned ("seconds", "minutes", or "hours")
#'
#' @return The converted time as a number
#' @export
#'
#' @examples
#' parse_lateness("1:00:00")
#' parse_lateness("1:00:00", unit="seconds")
#' parse_lateness("12:00:00", unit="minutes")
#' parse_lateness("0:10:00", unit="hours")
parse_lateness <- function(hms, unit="seconds") {

  # Check for incorrect unit value
  if (!(unit %in% c("seconds", "minutes", "hours")))
  {
    stop("unit must be one of \"seconds\", \"minutes\", or \"hours\"")
  }

  hms_list <- strsplit(hms, split=":")[[1]]
  time <- strtoi(hms_list[3], base=10) +
            (strtoi(hms_list[2], base=10) * 60) +
            (strtoi(hms_list[1], base=10) * 60 * 60)

  if (is.na(time))
  {
    return(hms)
  }

  if (unit == "minutes")
  {
    time <- time / 60
  } else if (unit == "hours")
  {
    time <- time / 60 / 60
  }

  return(time)
}
