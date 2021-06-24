##read data
hpc <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
##format date
hpc$Date <- dmy(hpc$Date)
#subset to proper dates
hpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
##create combined datetime
hpc$DateTime <- ymd_hms(paste(hpc$Date,hpc$Time))
##format submetering
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)
##creates png and plots, adds legend
png("plot3.png")
plot(hpc$DateTime,hpc$Sub_metering_1,type="l", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_2, type ="l", col = "red")
lines(hpc$DateTime,hpc$Sub_metering_3, type ="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = "solid", col = c("black","red","blue"))
##closes connection
dev.off()