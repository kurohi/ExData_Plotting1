input = read.table("household_power_consumption.txt", sep=";", header=TRUE,skip=66600, nrows=10000)
inputnames = read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=1)
input = setNames(input,names(inputnames))
input$Datetime = strptime(paste(input$Date,input$Time), "%d/%m/%Y %H:%M:%S")
input$Weekday = weekdays(input$Datetime,abbreviate=TRUE)
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     plot(Datetime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n"))
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")&
              ((Weekday=="Thu")|(Weekday=="Fri")|(Weekday=="Sat"))),
     lines(Datetime, Global_active_power))
dev.copy(png,filename="plot2.png",width=480, height=480)
dev.off()
