d<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2879,header=F,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
library(lubridate)
Date<-d$Date
Time<-d$Time
ftime <- paste(Date,Time)
ftime <-  parse_date_time(ftime,"dmy HMS") 
d$Formatted_Time<-ftime
par(mfrow=c(2,2))
with(d,plot(Formatted_Time,Global_active_power,type="l",xlab=NA,ylab="Global Active Power (kilowatts)"))
with(d,plot(Formatted_Time,Voltage,type="l",xlab="datetime"))
with(d,plot(Formatted_Time,Sub_metering_1,type="l",xlab=NA,ylab="Engergy sub metering"))
with(d,lines(Formatted_Time,Sub_metering_2,col="red"))
with(d,lines(Formatted_Time,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=.5)
with(d,plot(Formatted_Time,Global_reactive_power,type="l",xlab="datetime"))
dev.copy(png,file="plot4.png",height=480,width=480,units="px")
dev.off()