# Author: Abhishek Dharwadkar
# Date Created: 10/31/2016
# Description: Analyse the merged gdp and edstats dataset

# Load the library
library(ggplot2)

# Read the merged dataset
gdp.edstats.by.country <- read.csv(".\\Analysis\\gdp_edstats_by_country.csv", header = T)

# Check the dimensions of the merged dataset
dim(gdp.edstats.by.country)
str(gdp.edstats.by.country)

# Sort the data by ascending order of gdp
attach(gdp.edstats.by.country)
gdp.edstats.by.country <- gdp.edstats.by.country[order(gdp.n),]
detach(gdp.edstats.by.country)

# The 13th in the resulting data frame when the data is sorted by gdp ascending
gdp.edstats.by.country[13,8]

# Subset the data for "High income: OECD" and "High income: nonOECD" groups
gdp.edstats.by.country.hi.oecd <- gdp.edstats.by.country[which(grepl("High income: OECD", gdp.edstats.by.country$Income.Group)),]
gdp.edstats.by.country.hi.nonoecd <- gdp.edstats.by.country[which(grepl("High income: nonOECD", gdp.edstats.by.country$Income.Group)),]

# Check the dimentions before and after filtering
dim(gdp.edstats.by.country)
dim(gdp.edstats.by.country.hi.oecd)
dim(gdp.edstats.by.country.hi.nonoecd)

# Average rankings of counties by "High income: OECD" and "High income: nonOECD" groups
mean(gdp.edstats.by.country.hi.oecd$ranking.n, na.rm=TRUE)
mean(gdp.edstats.by.country.hi.nonoecd$ranking.n, na.rm=TRUE)

# Plot the GDP for all of the countries
ggplot(gdp.edstats.by.country, aes(x = gdp.edstats.by.country$country))


