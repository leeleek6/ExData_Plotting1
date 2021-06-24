##read data
hpc <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
##format date and global active power
hpc$Date <- dmy(hpc$Date)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
#subset to proper dates
hpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
##create combined datetime
hpc$DateTime <- ymd_hms(paste(hpc$Date,hpc$Time))
##create png, make plot, and close connection
png("plot2.png")
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()