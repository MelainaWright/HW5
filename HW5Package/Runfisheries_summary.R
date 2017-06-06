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
#"DataName" is supposed to not be commented out,needs to be same name as datafile


setwd("C:/Users/melai/Documents/BrenSpring2017/ESM262/HW5Package")
#document(), then help(PbData)


fisheries_summary(fishprice=fishprice, fishnumber=fishnumber, graph="true") #test basic funciton of package


##########################################################
#testing package

library(testthat)

#test based on what you expect the function should equal
#create new folder called tests first
#test_dir("tests") #doesn't work. saves in test subdirectory of the package, run this line to see if messed up the function when edited it, make test subdirectory has same level as R subdirectory


#create an R file in the tests folder and then do the test_file to see what the result is
test_file("tests/IfAddingWorks.R")

test_file("tests/IfPbWorks.R")

test_file("tests/If_fisheries_summary_works.R") #won't work this way. have to run manually, line by line in the test code because the way the fisheries_summary saves things and how a mock data frame saves things is different


#########################################################
#give package to others

# When you work on the defining the package you use the project of the same name To give the package to others - (who will simply be using it)
#
# build a source package (see build directory)
#
# this will create an *.gz file that you can distribute
#
# the user will then install this package in order to have access to functions and data in your package
