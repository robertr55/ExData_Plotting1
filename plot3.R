## reminders
## setwd("~/Coursera/4-Exploratory Data Analysis/CourseProject1/ExData_Plotting1")
## library(dplyr)
## library(tidyr)

plot3 <- function() {
    ## read household power consumption data
    hpc <- read.table("../household_power_consumption.txt",nrows=2100000,sep=";",header=TRUE,na.strings="?")
  
    ## filter out all unneeded rows (keep only Feb 1-2, 2007)
    hpc_feb12 <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")
    
    ## create new timestamp column combining date+time, convert from string to datetime
    hpc_feb12 <- mutate(hpc_feb12, timestamp=(paste(Date, Time)))
    hpc_feb12 <- transform(hpc_feb12, timestamp=strptime(timestamp,"%d/%m/%Y %H:%M:%S"))
    
    #third plot
    plot_names <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    plot_colors <- c("black","red","blue")
    png("./plot3.png",width=480,height=480)
    plot(hpc_feb12$timestamp,hpc_feb12$Sub_metering_1,
         type="l",
         xlab="",
         ylab="Energy sub metering")
    lines(hpc_feb12$timestamp,hpc_feb12$Sub_metering_2,col="red")
    lines(hpc_feb12$timestamp,hpc_feb12$Sub_metering_3,col="blue")
    legend("topright", plot_names, col=plot_colors, cex=1.0, lty=c(1,1,1),lwd=c(1,1,1))
    dev.off()
    
}