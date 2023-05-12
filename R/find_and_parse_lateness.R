#' Find and Parse HH:MM:SS lateness columns in a Gradescope gradebook
#'
#' @param df The dataframe (gradebook)
#' @param regex The regular expression with which to match the titles of lateness columns
#' @param unit The unit to which to parse HH:MM:SS, in "seconds", "minutes", or "hours"
#'
#' @return Returns a dataframe with lateness columns parsed to specified unit
#' @export
#'
#' @examples
#' gradebook <- gradebook |> find_and_parse_lateness()
#' gradebook <- gradebook |> find_and_parse_lateness(unit = "minutes")
#' gradebook <- gradebook |> find_and_parse_lateness(unit = "hours")
#' gradebook <- gradebook |> find_and_parse_lateness(regex = "late_work", unit = "hours")
find_and_parse_lateness <- function(df, regex="- Lateness", unit="seconds") {

  # Apply `parse_lateness`, row-wise, to each column that matches specified regular expression
  new <- df %>%
           dplyr::rowwise() %>%
           dplyr::mutate(
             dplyr::across(
               dplyr::matches(regex),
               ~ rscope::parse_lateness(., unit=unit)
             )
           )

  return(new)
}
