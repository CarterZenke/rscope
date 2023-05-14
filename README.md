
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `rscope`

<!-- badges: start -->
<!-- badges: end -->

`rscope` is an R package to simplify working with Gradescope rosters in
R.

## Installation

You can install the development version of rscope from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("CarterZenke/rscope")
```

## Examples

`rscope` comes with 3 helper functions for working with gradebooks:
`parse_lateness`, `find_and_parse_lateness`, and `select_assignments`.

### `parse_lateness`

Use `parse_lateness` to convert from Gradescope’s `[H]H:MM:SS` format to
seconds, minutes, or hours.

``` r
library(rscope)
parse_lateness("1:00:00", unit = "seconds")
#> [1] 3600
parse_lateness("12:30:10", unit = "minutes")
#> [1] 750.1667
parse_lateness("3:15:04", unit = "hours")
#> [1] 3.251111
```

### `find_and_parse_lateness`

Use `find_and_parse_lateness` to convert *all* of a roster’s lateness
columns to seconds, minutes, or hours.

``` r
library(rscope)
gradebook <- data.frame(`Problem Set 0: Scratch - Lateness (H:M:S)` = c("0:00:00", "1:32:11", "0:14:34"))
gradebook <- gradebook |> find_and_parse_lateness()
gradebook <- gradebook |> find_and_parse_lateness(unit = "minutes")
gradebook <- gradebook |> find_and_parse_lateness(unit = "hours")
```

By default, `find_and_parse_lateness` looks for “Lateness (H:M:S)” to
identify a column as a lateness column, as this is Gradescope’s default
identifier. You can, though, adjust the regular expression yourself.

``` r
library(rscope)
gradebook <- data.frame(`pset0_scratch_late` = c("0:00:00", "1:32:11", "0:14:34"))
gradebook <- gradebook |> find_and_parse_lateness(regex = "late", unit = "seconds")
```

### `select_assignments`

Use `select_assignments` to return all columns that match an
assignment’s (or multiple assignments’) title, in order, alongside the
information that identifies students in your grade book.

``` r
library(rscope)
gradebook <- read.csv("tests/_datasets/gradescope_big_raw.csv", check.names = FALSE)
pset0 <- gradebook |> select_assignments("Problem Set 0")
problems <- gradebook |> select_assignments(c("Problem Set 0", "Problem Set 1", "Problem Set 2", "Problem Set 3"))
labs <- gradebook |> select_assignments(c("Lab 0", "Lab 1", "Lab 2", "Lab 3"))
```
