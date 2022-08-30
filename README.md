# Course_Project_2
My_Assignment_Project_Exploratory_Data_Analysis

## Introduction
Fine particulate matter ($PM_{2.5}$) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, 
the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant 
into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of . This database is known as the National Emissions Inventory (NEI). 
You can read more information about the NEI at the [EPA National Emissions Inventory web site] (http://www.epa.gov/ttn/chief/eiinformation.html).

## Scope
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the 
United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

## Questions & Answers by Codes, plots
- Have total emissions from  decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total  emission from all 
  sources for each of the years 1999, 2002, 2005, and 2008.
  
  ### Plot_1.R (Code)
  ```
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$Emissions <- as.numeric(NEI$Emissions)
  NEI <- transform(NEI, year = factor(year))
  tmi <- tapply(NEI$Emissions, NEI$year, sum)
  barplot(tmi,xlab="Years", ylab="Total Emissions",main="Total Emissions Over Years")
  ```
  ### Plot_1
  ![Plot_1](/Plot_1.png)
- Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot 
  answering this question. 
  ### Plot_2.R (Code)
  ```
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$Emissions <- as.numeric(NEI$Emissions)
  NEI$fips <- as.numeric(NEI$fips)
  NEI <- transform(NEI, year = factor(year))
  fip <- subset(NEI,fips=="24510")
  tmi <- tapply(fip$Emissions, fip$year, sum)
  barplot(tmi,xlab="Years", ylab="Total Emissions",main="Total Emissions Over Years during fips = 24510")
  ```
  ### Plot_2
  ![Plot_2](/Plot_2.png)
- Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions 
  from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
  ### Plot_3.R (Code)
  ```
  library(ggplot2)
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$Emissions <- as.numeric(NEI$Emissions)
  NEI$fips <- as.numeric(NEI$fips)
  ggplot(NEI,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs (x="year") + labs (y="Total Emission ")+ 
    labs(title=expression("Emissions, Baltimore City 1999-2008 by Source Type"))
  ```
  ### Plot_3
  ![Plot_3](/Plot_3.png)
- Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?.
  ### Plot4.R (Code)
  ```
  library(sqldf)
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$Emissions <- as.numeric(NEI$Emissions)
  NEI$fips <- as.numeric(NEI$fips)
  data <- sqldf('SELECT * FROM SCC WHERE `EI.Sector` LIKE "%Coal"')
  SCC_code <- data$SCC
  tmi <- subset(NEI, SCC%in%SCC_code)
  tmi <- transform(tmi, year = factor(year))
  tmf <- tapply(tmi$Emissions, tmi$year, sum)
  barplot(tmf,xlab="Years", ylab="Total Emissions",main="Coal Source Emissions Across US From 1999 to 2008 Year")
  ```
  ### Plot_4
  ![Plot_4](/Plot_4.png)
- How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?.
  ### Plot5.R (Code)
  ```
  library(sqldf)
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI$Emissions <- as.numeric(NEI$Emissions)
  NEI$fips <- as.numeric(NEI$fips)
  data <- sqldf('SELECT * FROM SCC WHERE `EI.Sector` LIKE "%Vehicles"')
  SCC_code <- data$SCC
  tmi <- subset(NEI, SCC%in%SCC_code)
  tmi <- transform(tmi, year = factor(year))
  fip <- subset(tmi,fips=="24510")
  tmf <- tapply(fip$Emissions, fip$year, sum)
  barplot(tmf,xlab="Years", ylab="Total Emissions",main="Vehicles Source Emissions Across US From 1999 to 2008 Year")
  ```
  ### Plot_5
  ![Plot_5](/Plot_5.png)
- Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
  Which city has seen greater changes over time in motor vehicle emissions?.
  ### Plot_6.R (Code)
  ```
  
  ```
  ### Plot_6
  ![Plot_6](/Plot_6.png)
