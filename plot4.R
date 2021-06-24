##read data
hpc <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
##format date and global active power
hpc$Date <- dmy(hpc$Date)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
#subset to proper dates
hpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
##create combined datetime
hpc$DateTime <- ymd_hms(paste(hpc$Date,hpc$Time))
##format submetering
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

##create png
png("plot4.png")
##format layout
par(mfcol=c(2,2))
##plot2
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
##plot3
plot(hpc$DateTime,hpc$Sub_metering_1,type="l", xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_2, type ="l", col = "red")
lines(hpc$DateTime,hpc$Sub_metering_3, type ="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = "solid", col = c("black","red","blue"), bty = "n")
##final 2 plots
plot(hpc$DateTime,hpc$Voltage, type = "l", xlab = "datetime", ylab = "Volatge")
plot(hpc$DateTime,hpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
##close connection
dev.off()