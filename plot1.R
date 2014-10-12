input = read.table("household_power_consumption.txt", sep=";", header=TRUE,skip=66600, nrows=10000)
inputnames = read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=1)
input = setNames(input,names(inputnames))
input$Datetime = strptime(paste(input$Date,input$Time), "%d/%m/%Y %H:%M:%S")
with(subset(input, (Datetime>="2007-02-01")&(Datetime<"2007-02-03")),hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power"))
dev.copy(png,filename="plot1.png",width=480, height=480)
dev.off()

