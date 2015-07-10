#The Dataset is Electronic power consumption "household_power_consumption.txt" [20Mb]
#Measurements of electric power consumption in one household with a one-minute sampling 
#rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available
##Purpose of this program is to read from "household_power_consumption.txt"
#plot the 3 different sub_meterings variables for the two given dates over a line graph
#We need to convert the date/time into date/time classes from char to get the days in this plot 
#A legend is included in this plot 

library(data.table)
#specify and read in file using fread
dataFile <- "household_power_consumption.txt"
system.time(data <- fread(dataFile, header=TRUE,stringsAsFactors=FALSE))

#plot x axis as Days and Global Active Power as y axis
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subetdata with the 2 dates), use strptime convert D/T variables to D/T classes to subset the pasted data as d,m,y h,m,s
#Convert to D/T classes to get days 
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Grab the Global_active_power variable/col as numeric 
Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)

#Plot the line graph using date time specified and global_active_power
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type = "l", ylab= "Energy sub metering", xlab="")
lines(datetime,Sub_metering_2, col="red")
lines(datetime,Sub_metering_3, col = "blue")
legend("topright",lty=, lwd=2.5, bty="n", pch = "_", ce=0.8 ,col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"))

dev.off()