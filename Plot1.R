#read the file
data1<-read.table(file.choose(), sep=";", header=T)



#subsetting data for the dates 1/2/2007 and 2/2/2007
data2<-data1[(data1$Date =="1/2/2007" | data1$Date=="2/2/2007"),]



#convert variable from chracter to number 
data2$Global_active_power<-as.numeric(data2$Global_active_power)

#create a histogram, plot 1
hist(data2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
