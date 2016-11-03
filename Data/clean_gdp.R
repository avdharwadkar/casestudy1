# Author: Abhishek Dharwadkar
# Date Created: 10/31/2016
# Description: Clean the data file for GDP data

## @knitr cleanGdp

# Read the comma delimited file with data starting at row 6
gdp <- read.csv(".\\Data\\getdata_data_GDP.csv", stringsAsFactors = F, skip = 5, header = F, col.names = c("country", "ranking", "", "economy", "gdp", "", "", "", "", ""))

# Check the data
dim(gdp)
head(gdp)
summary(gdp)
str(gdp)

# Clean and format data with regular expressions
# We create a new variable that is a "clean" version of gdp
gdp$gdp.n <- as.numeric(gsub(",", "", trimws(gdp$gdp)))
gdp$ranking.n <- as.numeric(gdp$ranking)

# Are there any country codes missing
any(is.na(gdp$country))

# Selecting only the four useful columns from the dataset
country.gdp <- gdp[c(1, 12, 4, 11)]

# Check if appropriaate variable were selected from the dataset
str(country.gdp)

# Output the clean dataset to output file for analysis
write.csv(country.gdp, file = ".\\Data\\country_gdp_tidy.csv")
