test_that("parse_lateness parses hms to s", {
  expect_equal(parse_lateness("1:00:00", unit="seconds"), 3600)
})

test_that("parse_lateness parses hms to m", {
  expect_equal(parse_lateness("1:00:00", unit="minutes"), 60)
})

test_that("parse_lateness parses hms to h", {
  expect_equal(parse_lateness("1:00:00", unit="hours"), 1)
})
