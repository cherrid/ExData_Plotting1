# Plot the global active power against time from power consumption data
# found at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
# for the dates 1-Feb and 2-Feb 2007.
# uses dplyr

library(dplyr)

power <- tbl_df(read.table("household_power_consumption.txt", sep = ";", 
                           stringsAsFactors=FALSE, na.strings="?", header=TRUE))
power <- mutate(power, Date=as.Date(Date, "%d/%m/%Y"))
feb_set <- filter(power, (Date=="2007-02-01" | Date=="2007-02-02"))
 
feb_set <- mutate(feb_set, new_time=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

png("plot2.png")
plot(feb_set$new_time, feb_set$Global_active_power, type="l", main="", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.off() 
