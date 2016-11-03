# Author: Abhishek Dharwadkar
# Date Created: 10/31/2016
# Description: Merge the gpd and edstats dataset

# Read the comma delimited file with data
gdp.clean <- read.csv(".\\Data\\country_gdp_tidy.csv", header = T)
edstats.clean <- read.csv(".\\Data\\country_edstats_tidy.csv", header = T)

# Merger the gdp and edstats data by country code
gdp.edstatt.country <- merge(gdp.clean, edstats.clean, by.x = c("country"), by.y = c("CountryCode"))

# Check the data
dim(gdp.edstatt.country)

# Write the merged dataset to a csv file for analysis
write.csv(gdp.edstatt.country, file = ".\\Analysis\\gdp_edstats_by_country.csv")
