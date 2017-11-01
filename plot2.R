##download and unzip data
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "Fhousehold_power_consumption.zip")
download.file(URL, f)
unzip("Fhousehold_power_consumption.zip")

#read data
householdData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

##subset data 
subsetData <- householdData[householdData$Date %in% c("1/2/2007","2/2/2007") ,]

##convert data
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetData$Global_active_power)

##create plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()