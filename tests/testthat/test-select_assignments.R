original <- read.csv("../_datasets/gradescope_small_raw.csv", check.names = FALSE)

test_that("select_assignments select student columns and Problem Set 0", {
  expect_equal(
    colnames(select_assignments(original, assignments = "Problem Set 0")),
    c(
      "Name",
      "SID",
      "Email",
      "Sections",
      "Problem Set 0: Scratch",
      "Problem Set 0: Scratch - Max Points",
      "Problem Set 0: Scratch - Submission Time",
      "Problem Set 0: Scratch - Lateness (H:M:S)"
    )
  )
})

test_that("select_assignments select student columns, Problem Set 0, and Quiz 5 in order", {
  expect_equal(
    colnames(select_assignments(original, assignments = c("Problem Set 0", "Quiz 5"))),
    c(
      "Name",
      "SID",
      "Email",
      "Sections",
      "Problem Set 0: Scratch",
      "Problem Set 0: Scratch - Max Points",
      "Problem Set 0: Scratch - Submission Time",
      "Problem Set 0: Scratch - Lateness (H:M:S)",
      "Quiz 5",
      "Quiz 5 - Max Points",
      "Quiz 5 - Submission Time",
      "Quiz 5 - Lateness (H:M:S)"
    )
  )
})

test_that("select_assignments omits columns it cannot find", {
  expect_equal(
    colnames(select_assignments(original, assignments = c("Problem Set 0", "Quiz 5", "Problem Set 11"))),
    c(
      "Name",
      "SID",
      "Email",
      "Sections",
      "Problem Set 0: Scratch",
      "Problem Set 0: Scratch - Max Points",
      "Problem Set 0: Scratch - Submission Time",
      "Problem Set 0: Scratch - Lateness (H:M:S)",
      "Quiz 5",
      "Quiz 5 - Max Points",
      "Quiz 5 - Submission Time",
      "Quiz 5 - Lateness (H:M:S)"
    )
  )
})

test_that("select_assignments finds renamed student columns", {
  original <- original |> dplyr::rename(
                            "student_name" = "Name",
                            "student_huid" = "SID",
                            "student_email" = "Email",
                            "section" = "Sections"
                          )
  expect_equal(
    colnames(select_assignments(original, assignments = c("Problem Set 0", "Quiz 5", "Problem Set 11"), student_cols = c("student_name", "student_huid", "student_email", "section"))),
    c(
      "student_name",
      "student_huid",
      "student_email",
      "section",
      "Problem Set 0: Scratch",
      "Problem Set 0: Scratch - Max Points",
      "Problem Set 0: Scratch - Submission Time",
      "Problem Set 0: Scratch - Lateness (H:M:S)",
      "Quiz 5",
      "Quiz 5 - Max Points",
      "Quiz 5 - Submission Time",
      "Quiz 5 - Lateness (H:M:S)"
    )
  )
})
