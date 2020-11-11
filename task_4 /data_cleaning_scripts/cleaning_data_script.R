library(tidyverse) 
library(dplyr) 
library(janitor) 
library(here) 
library(stringr) 

data_2015 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2015.xlsx")) 
data_2016 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2016.xlsx")) 
data_2017 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2017.xlsx")) 

cleaned_names_data_2015 <- clean_names(data_2015) 
cleaned_names_data_2016 <- clean_names(data_2016) 
cleaned_names_data_2017 <- clean_names(data_2017) 

q_dropped_2017 <- cleaned_names_data_2017 %>% 
  rename_with(.fn = ~ str_remove_all(., "q[0-9]+_"), cols = everything()) 

renamed_age_2015 <- cleaned_names_data_2015 %>% 
  rename(age = how_old_are_you) 

rename_age_2016 <- cleaned_names_data_2016 %>% 
  rename(age = how_old_are_you) 

rename_tricks_treating_2017 <- q_dropped_2017 %>% 
  rename(are_you_going_actually_going_trick_or_treating_yourself = going_out) %>% 
  rename(timestamp = internal_id) 