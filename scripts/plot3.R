
plot3 <- function() {
  #read the data in from your working directory (data and time as charaters, the rest as numeric)
  heatingData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))  
  
  #add a new column with Date in Date format
  heatingData$AsDate <- as.Date(heatingData$Date, "%d/%m/%Y")
  
  #subset the data to include only relevant dates
  heatingDataS <- subset(heatingData, heatingData$AsDate > as.Date("2007-01-31", format="%Y-%m-%d"))
  heatingDataS2 <- subset(heatingDataS, heatingDataS$AsDate < as.Date("2007-02-03", format="%Y-%m-%d"))
  

  #create interim vector with the date and time in character format, then create a new column in the dataframe with date&time in date format
  dt <- paste(heatingDataS2$Date, heatingDataS2$Time, sep = " ")
  heatingDataS2$DateTime <- strptime(dt, format="%d/%m/%Y%H:%M:%S")
  
  #create file and the desired plot in it. 
  png(file = "plot3.png", width = 480, height = 480)
  
  with(heatingDataS2, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
  with(heatingDataS2, lines(DateTime, Sub_metering_2, col = "red"))
  with(heatingDataS2, lines(DateTime, Sub_metering_3, col = "blue"))
 
  
  dev.off()
  

}

