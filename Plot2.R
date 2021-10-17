#read the file
data1<-read.table(file.choose(), sep=";", header=T)



#subsetting data for the dates 1/2/2007 and 2/2/2007
data2<-data1[(data1$Date =="1/2/2007" | data1$Date=="2/2/2007"),]


#adjusting data formats
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

#create a line graph, plot 2
plot(data2$Global_active_power~data2$Datetime,type = "l", ylab="Global Active Power (kilowatts)", xlab="")


dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
