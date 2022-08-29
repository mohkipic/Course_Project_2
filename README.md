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
  
  ### Plot1.R (Code)
  ```
  
  ```
  ### Plot 1
  ![plot1](/plot1.png)
- Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base 
  plotting system to make a plot answering this question. 
  ### Plot2.R (Code)
  ```
  
  ```
  ### Plot 2
  ![plot2](/plot2.png)
- Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen
  decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
  answer this question.
  ### Plot3.R (Code)
  ```
  
  ```
  ### Plot 3
  ![plot3](/plot3.png)
- Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?.
  ### Plot4.R (Code)
  ```
  
  ```
  ### Plot 4
  ![plot4](/plot4.png)
- How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?.
  ### Plot5.R (Code)
  ```
  
  ```
  ### Plot 5
  ![plot5](/plot5.png)
- Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California 
  (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?.
  ### Plot6.R (Code)
  ```
  
  ```
  ### Plot 6
  ![plot6](/plot6.png)
