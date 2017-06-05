#################################################
#ESM 262
#HW5
#running the fisheries_summary function

######################################################
#have to save R scripts at the same level as the package.Rproj file. Need to save functions in the "R" folder

#need to reload changes we made to R function periodically
library(devtools)

devtools::load_all(".") #load all functions in R

#type document() on command line to update documentation for function and help page will come up for function
#know if works if you do help(nameoffunction)


#name function same as PbFunction.R so should be Pb.R if function is called Pb
#may need to install RTools package and start from scratch to generate the package


########################################################
#adding data to package

#set working directory one level up from where package directory is then do:
setwd("C:/Users/melai/Documents/BrenSpring2017/ESM262/HW5")
fishnumber <- read.csv("fishnumber.csv")
use_data(fishnumber, pkg="HW5Package")

fishprice <- read.csv("fishprice.csv")
use_data(fishprice, pkg="HW5Package")




#put documentation at top of R file into a help file
library(roxygen2)


#documentation with data is not stored with data. it goes into the R folder (aka subdirectory)
#make new script in R folder with proper format
#"PbData" is supposed to not be commented out,needs to be same name as datafile


setwd("C:/Users/melai/Documents/BrenSpring2017/ESM262/HW5Package")
#document(), then help(PbData)


fisheries_summary(fishprice=fishprice, fishnumber=fishnumber, graph="true") #test basic funciton of package



#########################################################
#give package to others

# When you work on the defining the package you use the project of the same name To give the package to others - (who will simply be using it)
#
# build a source package (see build directory)
#
# this will create an *.gz file that you can distribute
#
# the user will then install this package in order to have access to functions and data in your package


##########################################################
#testing package

library(testthat)

#test based on what you expect the function should equal


#the example function:
surge_to_damage = function(surge, surge.min, base, K) {
  flood = ifelse(surge > surge.min, surg-surge.min, 0)
  damage = K*flood+base
  return(damage)
}


#simple test example:
test_that("nameoftest", {

  expect_that(nameoffunctionandfollowingarevariablevalues(surge=0,

                                                          surge.min=900,base=40,K=20),

              equals(0)) })


#another example:
test_that("spring.summary.works" ,
          {clim.data = as.data.frame(cbind(month=c(1:4), day=rep(1, times=4), year=rep(1,times=4),
                                           rain=rep(0, times=4), tmax=c(2,2,1,1), tmin=rep(0, times=4)))

          expect_that(spring.summary(clim.data, spring.months=4)$mean.springP, equals(0))
          expect_that(spring.summary(clim.data, spring.months=4)$mean.springT, equals(0.5))
          expect_that(spring.summary(clim.data, spring.months=1)$mean.springT, equals(1))
          expect_true(spring.summary(clim.data, spring.months=c(1:4))$coldest.spring > 2)
          })

#create new folder called tests first
test_dir("tests") #saves in test subdirectory of the package, run this line to see if messed up the function when edited it, make test subdirectory has same level as R subdirectory


#trying it out myself:

IfAddingWorks <- test_that("IfAddingWorks" ,
                           {

                             expect_that(Adding(x=4, y=6), equals(10))
                           })


test_file("tests/IfAddingWorks.R")


#for fish catch, do data and function and documentation and tests that can run, fish market function with documentation as a package
