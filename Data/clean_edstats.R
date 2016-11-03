# Author: Abhishek Dharwadkar
# Date Created: 10/31/2016
# Description: Clean the data file for EDSTATS data

# Read the comma delimited file with edstats data
edstats <- read.csv(".\\Data\\getdata_data_EDSTATS_Country.csv", stringsAsFactors = F, header = T)

# Check the data
dim(edstats)
head(edstats)
summary(edstats)
str(edstats)

# Check if any NA country codes
any(is.na(edstats$CountryCode))

# Output the clean dataset to output file for analysis
write.csv(edstats, file = ".\\Data\\country_edstats_tidy.csv")
