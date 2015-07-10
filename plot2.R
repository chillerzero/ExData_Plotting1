#The Dataset is Electronic power consumption "household_power_consumption.txt" [20Mb]
#Measurements of electric power consumption in one household with a one-minute sampling 
#rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available
##Purpose of this program is to read from "household_power_consumption.txt"
#plot global_active_power variable for the two given dates over a line graph
#We need to convert the date/time into date/time classes from char to get the days in this plot 

library(data.table)
#specify and read in file using fread
dataFile <- "household_power_consumption.txt"
#All controls such as sep, colClasses and nrows are automatically detected.
#Dates are read as character currently. They can be converted afterwards using the excellent fasttime package or standard base functions.
system.time(data <- fread(dataFile, header=TRUE,stringsAsFactors=FALSE, dec="."))

#plot x axis as Days and Global Active Power as y axis
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subetdata with the 2 dates), use strptime convert D/T variables to D/T classes to subset the pasted data as d,m,y h,m,s
#delimited by a space
#Convert to D/T classes to get days 
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Grab the Global_active_power variable/col as numeric 
globalactivePower <- as.numeric(subsetdata$Global_active_power)

#Plot the line graph using date time specified and global_active_power
png("plot2.png", width=480, height=480)
plot(datetime,globalactivePower, type = "l", ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()