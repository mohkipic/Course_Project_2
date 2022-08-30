library(ggplot2)
library(sqldf)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
NEI$Emissions <- as.numeric(NEI$Emissions)
fip <- subset(NEI,fips%in% c("06037","24510"))
fip$fips[fip$fips=="24510"] <- "Baltimore City"
fip$fips[fip$fips=="06037"] <- "Los Angeles County"
data <- sqldf('SELECT * FROM SCC WHERE `EI.Sector` LIKE "%Vehicles"')
SCC_code <- data$SCC
tmi <- subset(fip, SCC%in%SCC_code)
ggplot(tmi,aes(factor(year),Emissions,fill=fips)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~fips,scales = "free",space="free") + 
  labs (x="year") + labs (y="Total Emission ")+ 
  labs(title= "Vehicles Source Emissions in Baltimore & LA From 1999 to 2008 Year")