#' Subset Gradebook by Assignment Titles
#'
#' @param df The data frame from which to select assignment columns
#' @param assignments Assignment titles to select
#' @param student_cols The list of columns that identify students in the gradebook
#'
#' @returns A data frame of columns that match assignment titles, in order, alongside identifying student information
#' @export
#'
#' @examples
#' gradebook <- data.frame(
#'                `Name` = c("Carter Zenke", "Rongxin Liu"),
#'                `SID` = c("12345678", "87654321"),
#'                `Email` = c("test1@cs50.harvard.edu", "test2@cs50.harvard.edu"),
#'                `Sections` = c("Zenke", "Zenke"),
#'                `Problem Set 0` = c(9, 10),
#'                `Problem Set 0 - Max Points` = c(10, 10),
#'                `Problem Set 1` = c(2, 10),
#'                `Problem Set 1 - Max Points` = c(10, 10)
#'               )
#' pset0 <- gradebook |> select_assignments("Problem Set 0")
#' problems <- gradebook |> select_assignments(c("Problem Set 0", "Problem Set 1"))
select_assignments <- function(df, assignments, student_cols = c("Name", "SID", "Email", "Sections")) {

  # Select student columns by exact match, assignment columns if contain assignment title
  new <- df |>
    dplyr::select(
      student_cols,
      dplyr::contains(assignments)
    )

  return(new)
}
