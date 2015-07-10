#The Dataset is Electronic power consumption "household_power_consumption.txt" [20Mb]
#Measurements of electric power consumption in one household with a one-minute sampling 
#rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available
##Purpose of this program is to read from "household_power_consumption.txt"
#plot 4 different plots from the given data/plots

library(data.table)
#specify and read in the file using fread
dataFile <- "household_power_consumption.txt"
system.time(data <- fread(dataFile, header=TRUE,stringsAsFactors=FALSE))

#plot x axis as Days and Global Active Power as y axis
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subetdata with the 2 dates), use strptime convert D/T variables to D/T classes to subset the pasted data as d,m,y h,m,s
#Convert to D/T classes to get days 
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Subset the data variables for the 4 plots 
globalazctivePower <- as.numeric(subsetdata$Global_active_power)
globalreactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)

#Plot the line graph using date time specified and global_active_power
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plot 1 Global Active Power
plot(datetime, globalazctivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot 2 Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot 3 Energy sub metering
plot(datetime, Sub_metering_1, type = "l", ylab= "Energy sub metering", xlab="")
lines(datetime,Sub_metering_2, col="red")
lines(datetime,Sub_metering_3, col = "blue")
legend("topright", lty=, lwd=2.5, bty="n", pch = "_", ce=0.8, col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"))

#Plot 4 Global_reactive power
plot(datetime, globalreactivePower, type="l", xlab="", ylab="Global_reactive power")
dev.off()