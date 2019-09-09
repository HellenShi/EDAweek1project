##
setwd("/Users/Apple/data/couera4w1 project")##set data directory
data<-read.csv("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")##Read the data
names(data)
dim(data)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)
data1<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
dim(data1)

##plot1
par(mfrow=c(1,1))
plot1<-hist(data1$Global_active_power,data1$Voltage,col="red",breaks = 12,main = "Global Active Power",xlab = "Global Active Power(kilowatte)")
dev.copy(png,file="plot1.png",width = 480,height = 480)
dev.off()

##plot2
data2<-mutate(data1,Date=dmy(Date))
week<-paste(data2$Date,data2$Time,sep = " ")
week1<-as.POSIXct(week)
data3<-mutate(data2,week1)
head(data3,n=2)
plot(data3$week1,data3$Global_active_power,type = "l",xlab = " ",ylab = "Global Active Power(killowatts)")
dev.copy(png,file="plot2,png",width = 480,height = 480)
dev.off()
png("plot2.png",width = 480,height = 480)
dev.off

##plot3
plot(data3$week1,data3$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(data3$week1,data3$Sub_metering_2,type="l",col="red")
lines(data3$week1,data3$Sub_metering_3,type = "l",col="blue")
legend("topright",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),cex = 0.5)
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()

##plot4
par(mfrow=c(2,2))
first<-plot(data3$week1,data3$Global_active_power,type = "l",xlab = " ",ylab = "Global Active Power(killowatts)")
second<-plot(data3$week1,data3$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
#plot3
plot(data3$week1,data3$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(data3$week1,data3$Sub_metering_2,type="l",col="red")
lines(data3$week1,data3$Sub_metering_3,type = "l",col="blue")
legend("topright",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),cex = 0.5)
fourth<-plot(data3$week1,data3$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.copy(png,file="plot4.png")
dev.off()