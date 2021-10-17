#read the file
data1<-read.table(file.choose(), sep=";", header=T)



#subsetting data for the dates 1/2/2007 and 2/2/2007
data2<-data1[(data1$Date =="1/2/2007" | data1$Date=="2/2/2007"),]


#adjusting data formats
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)



#create a line graph with three separate colors, plot 3
with(data2, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
