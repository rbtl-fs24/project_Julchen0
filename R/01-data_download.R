library(tidyverse)
library(googlesheets4)

# import data from Google Sheets
survey_data_raw <- read_sheet("https://docs.google.com/spreadsheets/d/1MeHKIt1VYLdthXUrP9FcPOzIMtt9rB3BlhG3LsX1NKY/edit?resourcekey#gid=1109383978")

#removing all the data from the trial run on the 16. May
survey_data_raw <- survey_data_raw[!format(survey_data_raw$Timestamp, "%Y-%m-%d") == "2024-05-16", ]
survey_data_raw <- survey_data_raw[substr(survey_data_raw$Timestamp, 1, 10) != "2024-05-16", ]

# Remove columns with sensitive, non-anonymous data
data_raw <- survey_data_raw |> 
  select(-c("Timestamp"))

#write raw data to csv and rds

write_rds(data_raw, "data/raw/data_raw.rds")
write_csv(data_raw, "data/raw/data_raw.csv")
