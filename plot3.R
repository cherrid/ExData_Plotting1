# Plot the sub-metering values against time from power consumption data
# found at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
# for the dates 1-Feb and 2-Feb 2007.
# uses dplyr

library(dplyr)

power <- tbl_df(read.table("household_power_consumption.txt", sep = ";", 
                           stringsAsFactors=FALSE, na.strings="?", header=TRUE))
power <- mutate(power, Date=as.Date(Date, "%d/%m/%Y"))
feb_set <- filter(power, (Date=="2007-02-01" | Date=="2007-02-02"))
 
feb_set <- mutate(feb_set, new_time=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

png("plot3.png")
plot(feb_set$new_time, feb_set$Sub_metering_1, type="l", main="", 
     xlab="", ylab = "Energy sub metering")
lines(feb_set$new_time, feb_set$Sub_metering_2, col="red")
lines(feb_set$new_time, feb_set$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off() 
