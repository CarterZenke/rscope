test_that("parse_lateness parses hms to s", {
  expect_equal(parse_lateness("1:00:00", unit="seconds"), 3600)
})

test_that("parse_lateness parses hms to m", {
  expect_equal(parse_lateness("1:00:00", unit="minutes"), 60)
})

test_that("parse_lateness parses hms to h", {
  expect_equal(parse_lateness("1:00:00", unit="hours"), 1)
})

test_that("parse_lateness throws warning when integer", {
  expect_warning(parse_lateness(10000))
})

test_that("parse_lateness returns integer as given", {
  expect_equal(parse_lateness(10000), 10000)
})

test_that("parse_lateness throws warning when character string", {
  expect_warning(parse_lateness("oops"))
})

test_that("parse_lateness returns character string as given", {
  expect_equal(parse_lateness("oops"), "oops")
})
