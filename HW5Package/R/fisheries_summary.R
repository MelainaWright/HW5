#' fisheries_summary
#'
#' This function computes the most frequently caught fish in each location, total revenue for each location, total fisheries sum, and graph revenue by location and add total to the plot if the user requests it.
#' @param fishprice is a table that has prices for different fish
#' @param fishnumber is a table that has the number caught for each fish species for each location. Each location is in a different column. Each fish is in a different row.
#'@author Melaina Wright
#'@examples fisheries_summary(fishprice=fishprice, fishnumber=fishnumber, graph="true")
#'@return most frequently caught fish in each location, total revenue for each location, total fisheries sum, and graph revenue by location and add total to the plot if the user requests it.


fisheries_summary = function(fishprice, fishnumber, graph="true") {

  # * most frequently caught fish in each location
  for(colName in names(fishnumber)){
    if(colName!="species"){
      maxCount = max(fishnumber[[colName]])
      maxFish = fishnumber$species[fishnumber[[colName]] == maxCount]

    }
  }


  # * total revenue for each location
  totalRevenueByLocation = c()
  for(colName in names(fishnumber)){
    if(colName !="species"){
      currentFishRevenue = 0
      for(species in fishnumber$species){
        price = fishprice$price[fishnumber$species==species]
        amount = fishnumber[[colName]][fishnumber$species==species]
        currentFishRevenue = currentFishRevenue + price*amount
      }
      totalRevenueByLocation = c(totalRevenueByLocation,currentFishRevenue)
    }
  }
  locs = names(fishnumber)
  locs = locs[-1]
  TotalRevenueByLocationDF = data.frame(Location=locs,totalRevenueByLocation, stringsAsFactors = FALSE)



  # * total fisheries sum
  TotalFisheriesSum=sum(TotalRevenueByLocationDF$totalRevenueByLocation)
  TotalFisheriesSumDF = c(Location="Total", TotalFisheriesSum=TotalFisheriesSum, stringsAsFactors = FALSE)

  RevenueDF = rbind(TotalRevenueByLocationDF, TotalFisheriesSumDF)


  # * if user requests it graph revenue by location and add total to the plot
  if(graph=="true"){
    RevenueGraph = ggplot(RevenueDF, aes(x=as.factor(Location), y=totalRevenueByLocation)) +
      geom_bar(stat = "identity") +
      labs(x="Location", y="Total Revenue") +
      ggtitle("Fisheries Revenue by Location")
    RevenueGraph

  }

return(RevenueDF)

}#end of function
