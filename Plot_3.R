library(ggplot2)
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
NEI$Emissions <- as.numeric(NEI$Emissions)
NEI$fips <- as.numeric(NEI$fips)
fip <- subset(NEI,fips=="24510")
ggplot(fip,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs (x="year") + labs (y="Total Emission ")+ 
  labs(title=expression("Emissions, Baltimore City 1999-2008 by Source Type"))