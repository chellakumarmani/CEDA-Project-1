plot3<-function(){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
  unzip(zipfile="household_power_consumption.zip")
  power<-read.table("household_power_consumption.txt",stringsAsFactors = FALSE,header=TRUE,sep=";")
  FullTimeDate <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  power <- cbind(power, FullTimeDate)
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  power$Time <- format(power$Time, format="%H:%M:%S")
  power$Global_active_power <- as.numeric(power$Global_active_power)
  power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
  power$Voltage <- as.numeric(power$Voltage)
  power$Global_intensity <- as.numeric(power$Global_intensity)
  power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
  power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
  power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)
  subpower<-subset(power,Date == "2007-02-01" | Date =="2007-02-02")
  png("plot3.png", width=480, height=480)
  with(subpower,plot(FullTimeDate,Sub_metering_1,type="l",xlab='Day',ylab="Energy sub metering"))
  lines(subpower$FullTimeDate, subpower$Sub_metering_2,type="l", col= "red")
  lines(subpower$FullTimeDate, subpower$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  dev.off()
}
  
  
  
  
  