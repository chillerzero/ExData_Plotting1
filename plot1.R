#The Dataset is Electronic power consumption "household_power_consumption.txt" [20Mb]
#Measurements of electric power consumption in one household with a one-minute sampling 
#rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available
##Purpose of this program is to read from "household_power_consumption.txt"
#plot global_active_power variable for the two given dates over a histograph
library(data.table)
#specify and read in file using fread
dataFile <- "household_power_consumption.txt"
data <- fread(dataFile, header=TRUE, sep=";",stringsAsFactors=FALSE)
#subset the data date for the two specific dates(rows) 
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalazctivePower <- as.numeric(subsetdata$Global_active_power)

#Plot the graph saving the device to a plot1.png image
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()