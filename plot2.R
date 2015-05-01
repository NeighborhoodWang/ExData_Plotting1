## This code is written for read in a household electric 
## power consumption Data set and plot the relationship
## between the "time and Global Active Power(kilowatts)" 

## Step 1:load dataset from local directory
EPCdata <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Step 2:subset this dataset with only February, 2007
EPCsubset <- subset(EPCdata,as.character(EPCdata$Date) == "1/2/2007"|as.character(EPCdata$Date) == "2/2/2007",select=Date:Sub_metering_3)

## Step 3:tide the dataset by convert the Date and Time class
EPCsubset$Date <- as.Date(EPCsubset$Date,format="%d/%m/%Y")

## Step 4:plot the picture and export the plot
png(filename="plot2.png")
plot(EPCsubset$Global_active_power,type = "s",xlim=c(0,2880),ylab="Global Active Power(kilowatts)",xlab="",xaxt="n")
axis(1, c(1,1440,2880), c("Thu","Fri","Sat"))
dev.off()