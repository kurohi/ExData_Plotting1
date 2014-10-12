input = read.table("household_power_consumption.txt", sep=";", header=TRUE,skip=66600, nrows=10000)
inputnames = read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=1)
input = setNames(input,names(inputnames))
input$Datetime = strptime(paste(input$Date,input$Time), "%d/%m/%Y %H:%M:%S")
input$Weekday = weekdays(input$Datetime,abbreviate=TRUE)

par(mfrow = c(2,2))

#[1,1] plot
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     plot(Datetime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n"))
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     lines(Datetime, Global_active_power))

#[2,1] plot
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     plot(Datetime, Voltage, ylab="Voltage", type="n"))
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     lines(Datetime, Voltage))

#[1,2] plot
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     plot(Datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     lines(Datetime, Sub_metering_1))
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     lines(Datetime, Sub_metering_2, col="red"))
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     lines(Datetime, Sub_metering_3, col="blue"))
legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#[2,2] plot
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     plot(Datetime, Global_reactive_power, ylab="Global reactive power", type="n"))
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     lines(Datetime, Global_reactive_power))

#saving
dev.copy(png,filename="plot4.png",width=480, height=480)
dev.off()
