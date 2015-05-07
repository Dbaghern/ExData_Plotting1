#loading in file
epc <- read.table(file.choose(), sep=";", header=FALSE, skip = 66637, nrows = 2880)
colnames(epc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

#Reformatting Data
epc$Datetime <- paste(epc$Date, epc$Time, sep =' ')
epc$Datetime <- strptime (epc$Datetime, "%Y-%m-%d %H:%M:%S")
epc$Global_active_power<-as.numeric(as.character(epc$Global_active_power))


#Fourth graph
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 4, 2))

#First Plot
with(epc, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"), xlab=NULL)

#Second Plot
with(epc, plot(Datetime, Voltage, type = "l", ylab = "Global Active Power (kilowatts)"), xlab=NULL)

#Third Plot
with(epc, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering"), xlab=NULL, type = "n")
with(epc, lines(Datetime, Sub_metering_2, type = "l", col = "red"))
with(epc, lines(Datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1, bty="n")


#Fourth Plot
with(epc, plot(Datetime, Global_reactive_power, type = "l", ylab = "Global Active Power (kilowatts)"), xlab=NULL)

dev.off()