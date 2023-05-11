test_that("parse_lateness parses hms to s", {
  expect_equal(parse_lateness("1:00:00", unit="seconds"), 3600)
})

test_that("parse_lateness parses hms to m", {
  expect_equal(parse_lateness("1:00:00", unit="minutes"), 60)
})

test_that("parse_lateness parses hms to h", {
  expect_equal(parse_lateness("1:00:00", unit="hours"), 1)
})

test_that("parse_lateness parses hms to s by default", {
  expect_equal(parse_lateness("1:00:00"), 3600)
})

test_that("parse_lateness throws error for incorrect value of unit", {
  expect_error(parse_lateness("1:00:00", unit="milliseconds"))
})

test_that("parse_lateness throws warning given empty value", {
  expect_warning(parse_lateness(NA))
})

test_that("parse_lateness returns empty value given empty value", {
  expect_equal(parse_lateness(NA), NA)
})

test_that("parse_lateness throws warning given integer", {
  expect_warning(parse_lateness(10000))
})

test_that("parse_lateness returns integer as given", {
  expect_equal(parse_lateness(10000), 10000)
})

test_that("parse_lateness throws warning given float", {
  expect_warning(parse_lateness(50.0))
})

test_that("parse_lateness returns float as given", {
  expect_equal(parse_lateness(50.0), 50.0)
})

test_that("parse_lateness throws warning when character string", {
  expect_warning(parse_lateness("oops"))
})

test_that("parse_lateness returns character string as given", {
  expect_equal(parse_lateness("oops"), "oops")
})

test_that("parse_lateness throws warning given empty segments", {
  expect_warning(parse_lateness("::"))
})

test_that("parse_lateness returns empty segments as given", {
  expect_equal(parse_lateness("::"), "::")
})

test_that("parse_lateness throws warning given 2 empty segments", {
  expect_warning(parse_lateness("::50"))
})

test_that("parse_lateness returns 2 empty segments as given", {
  expect_equal(parse_lateness("::50"), "::50")
})

test_that("parse_lateness throws warning given 1 empty segment", {
  expect_warning(parse_lateness(":20:50"))
})

test_that("parse_lateness returns 1 empty segment as given", {
  expect_equal(parse_lateness(":20:50"), ":20:50")
})

test_that("parse_lateness throws warning given MM:SS", {
  expect_warning(parse_lateness("20:50"))
})

test_that("parse_lateness returns MM:SS as given", {
  expect_equal(parse_lateness("20:50"), "20:50")
})
