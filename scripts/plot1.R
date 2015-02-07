
plot1 <- function() {

#read the data in from your working directory (data and time as charaters, the rest as numeric)
heatingData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))  

#add a new column with Date in Date format
heatingData$AsDate <- as.Date(heatingData$Date, "%d/%m/%Y")

#subset the data to include only relevant dates
heatingDataS <- subset(heatingData, heatingData$AsDate > as.Date("2007-01-31", format="%Y-%m-%d"))
heatingDataS2 <- subset(heatingDataS, heatingDataS$AsDate < as.Date("2007-02-03", format="%Y-%m-%d"))

#create file and the desired plot in it. 
png(file = "plot1.png", width = 480, height = 480)
with(heatingDataS2, hist(Global_active_power, col="pink", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

}



