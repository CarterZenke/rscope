# Helpers

#' Create a CSV and return its path
#'
#' @param df The data frame to write to a CSV
#'
#'
#' @examples
#' create_csv(data.frame(x = c(1, 2, 3)))
create_csv <- function(df) {
  # Create path for temporary CSV
  path <- tempfile(fileext = ".csv")

  # Write CSV to path based on df
  write.csv(df, path, row.names = FALSE)

  return(path)
}

#' Expect a data frame to match a snapshot of a CSV
#'
#' @param name The name of the file to match
#' @param df The data frame against which to match the CSV
#'
#'
#' @examples
#' original <- data.frame(x = c(1, 2, 3))
#' new <- original |> rscope::find_and_parse_lateness(unit = "minutes")
#' expect_snapshot_csv("snapshot", new)
expect_snapshot_csv <- function(name, df) {
  # Identify and announce snapshot file
  name <- paste0(name, ".csv")
  announce_snapshot_file(name = name)

  # Find path of created file
  path <- create_csv(df)

  # Compare generated file with snapshot file
  expect_snapshot_file(path, name)
}

# Tests

test_that("find_and_parse_lateness converts lateness columns to seconds", {
  original <- read.csv("../_datasets/gradescope_small_raw.csv", check.names = FALSE)
  new <- original |> rscope::find_and_parse_lateness(unit = "seconds")
  expect_snapshot_csv("output_small_seconds", new)
})

test_that("find_and_parse_lateness converts lateness columns to minutes", {
  original <- read.csv("../_datasets/gradescope_small_raw.csv", check.names = FALSE)
  new <- original |> rscope::find_and_parse_lateness(unit = "minutes")
  expect_snapshot_csv("output_small_minutes", new)
})

test_that("find_and_parse_lateness converts lateness columns to hours", {
  original <- read.csv("../_datasets/gradescope_small_raw.csv", check.names = FALSE)
  new <- original |> rscope::find_and_parse_lateness(unit = "hours")
  expect_snapshot_csv("output_small_hours", new)
})

test_that("find_and_parse_lateness works on large roster", {
  original <- read.csv("../_datasets/gradescope_big_raw.csv", check.names = FALSE)
  new <- original |> rscope::find_and_parse_lateness(unit = "seconds")
  expect_snapshot_csv("output_big_seconds", new)
})

test_that("find_and_parse_lateness ignores columns that don't match regex", {
  original <- read.csv("../_datasets/gradescope_small_raw.csv", check.names = FALSE)
  new <- original |> rscope::find_and_parse_lateness(regex = "Cat", unit = "seconds")
  expect_snapshot_csv("output_ignore", new)
})
