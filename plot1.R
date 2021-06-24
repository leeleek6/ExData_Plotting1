##read data
hpc <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
##format Date as date and Global_active_power as numeric
hpc$Date <- dmy(hpc$Date)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
##subset into required dates
hpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
##create png
png("plot1.png")
##create plot
hist(hpc$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
##close connection
dev.off()
