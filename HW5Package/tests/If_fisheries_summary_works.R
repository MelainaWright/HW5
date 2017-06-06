temp = fisheries_summary(fishprice = fishprice,
                         fishnumber = fishnumber)


Location = c("A","B","C", "Total")
totalRevenueByLocation = c("130","130","310","570")

ans1 = data.frame(Location,totalRevenueByLocation)
ans1$Location <- as.character(ans1$Location)
ans1$totalRevenueByLocation <- as.character(ans1$totalRevenueByLocation)


# all.equal(temp, ans1)
# #all.equal(target, current)

#when return(RevenueDF)

test_that("tests_totalRevenueByLocation_and_totalFisheriesSum" , {
  expect_that (temp,
    equals(ans1)
  )
})



