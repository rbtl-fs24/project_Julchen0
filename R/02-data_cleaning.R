library(tidyverse)
library(googlesheets4)

data_raw <- read_rds(here::here("/cloud/project/data/raw/data_raw.rds"))

data_raw_renamed <- data_raw |> 
  rename(concern_value = "How concerned are you about food waste in general?",
         knowledge_value = "How much do you know about ETHs' food waste reduction strategies?",
         mensa_visit_amount = "How often do you eat at any ETH Mensa (Poly, Archimedes, ...)",
         no_visit_reason = "Why do you not eat at Mensa",
         leftovers_amount = "How often do you have leftover food on your plate",
         largeportion_amount = "How often do you ask for a big portion",
         foodoptions_amount = "How many food options do you find appropriate for a Mensa",
         vegi_option = "Do you agree with the following statement: 
There should always be a vegetarian option",
         vegan_option = "Do you agree with the following statement: 
There should always be a vegan option",
         paymore_largerportion = "Would you be willing to pay more for a larger sized portion?",
         paymore_largerportion_value = "If yes, how much more (in CHF)",
         buy_leftovers = "Would you be willing to eat a menu option out of leftover food from the previous day?",
         buy_leftovers_value = "If yes, how much would you be willing to pay for it (in CHF)?",
         gender = "Please select your gender")


data_dictionary <- read_sheet("https://docs.google.com/spreadsheets/d/1omnM0B-LrFG5DbDekS_mihtmpH1iItsw0QYJruoAYjA/edit#gid=0")
write_csv(data_dictionary, "data/processed/data_dictionary.csv")


data_processed <- data_raw_renamed

write_rds(data_processed, "data/processed/data_processed.rds")
write_csv(data_processed, "data/processed/data_processed.csv")
