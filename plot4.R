## This code is written for read in a household electric 
## This code plot four plots in a figure

## Step 1:load dataset from local directory
EPCdata <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Step 2:subset this dataset with only February, 2007
EPCsubset <- subset(EPCdata,as.character(EPCdata$Date) == "1/2/2007"|as.character(EPCdata$Date) == "2/2/2007",select=Date:Sub_metering_3)

## Step 3:tide the dataset by convert the Date and Time class
EPCsubset$Date <- as.Date(EPCsubset$Date,format="%d/%m/%Y")

## Step 4:plot the picture and export the plot
png(filename="plot4.png")

par(mfrow=c(2,2))##split one figure into 4 pieces
## Step 4.1:plot the topleft picture
plot(EPCsubset$Global_active_power,type = "s",xlim=c(0,2880),ylab="Global Active Power",xlab="",xaxt="n")
axis(1, c(1,1440,2880), c("Thu","Fri","Sat"))

## Step 4.2:plot the rightleft picture
plot(EPCsubset$Voltage,type = "s",xlim=c(0,2880),ylab="Voltage",xlab="datetime",xaxt="n")
axis(1, c(1,1440,2880), c("Thu","Fri","Sat"))

## Step 4.3:plot the bottomleft picture
plot(EPCsubset$Sub_metering_1,type = "s",xlim=c(0,2880),ylab="Energy sub metering",xlab="",xaxt="n")
lines(EPCsubset$Sub_metering_2,type = "s",col="red")
lines(EPCsubset$Sub_metering_3,type = "s",col="blue")
axis(1, c(1,1440,2880), c("Thu","Fri","Sat"))
legend(x = "topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=par("lty"),lwd=par("lwd"),col=c("black","red","blue"),bty="n")

## Step 4.4:plot the bottomright picture
plot(EPCsubset$Global_reactive_power,type = "s",xlim=c(0,2880),ylab="Global_reactive_power",xlab="datetime",xaxt="n")
axis(1, c(1,1440,2880), c("Thu","Fri","Sat"))

dev.off()