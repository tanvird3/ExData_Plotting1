d<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrow=2879,header=F,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
library(lubridate)
Date<-d$Date
Time<-d$Time
ftime <- paste(Date,Time)
ftime <-  parse_date_time(ftime,"dmy HMS") 
d$Formatted_Time<-ftime

hist(d$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",height=480,width=480,units="px")
dev.off()