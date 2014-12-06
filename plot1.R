## reminders
## setwd("~/Coursera/4-Exploratory Data Analysis/CourseProject1/ExData_Plotting1")
## library(dplyr)
## library(tidyr)

plot1 <- function() {
    ## read household power consumption data
    hpc <- read.table("../household_power_consumption.txt",nrows=2100000,sep=";",header=TRUE,na.strings="?")
  
    ## filter out all unneeded rows (keep only Feb 1-2, 2007)
    hpc_feb12 <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")
    
    #first plot
    png("./plot1.png",width=480,height=480)
    hist(hpc_feb12$Global_active_power, 
         col="red", 
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    dev.off()
    
}