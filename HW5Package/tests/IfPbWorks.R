test_that("IfPbWorks", {
  expect_that(Pb(31752,0,60), is_identical_to(0))
})



test_that("IfPbWorks", {
  expect_that(Pb(31752,20,60) > 0, is_true())
})



test_that("IfPbWorks", {
  expect_that(Pb(31752,20,60), equals(179750.88))
})

