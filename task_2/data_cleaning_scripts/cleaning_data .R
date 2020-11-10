library(tidyverse) 
library(dplyr) 
library(janitor) 
library(here) 

#Reading in the two datasets 

cake_ingredients_data <- read_csv(here("raw_data/cake-ingredients-1961.csv")) 
cake_abbreviations_data <- read_csv(here("raw_data/cake_ingredient_code.csv"))
glimpse(cake_ingredients_data) 
head(cake_ingredients_data)

cake_ingredients_data %>% 
  slice_max(CA, n = 1)

#Pivoting the data to be longer 

long_cake_data <- cake_ingredients_data %>% 
  pivot_longer(cols = c(AE, BM, BP, BR, BS, CA, CC, CE, CI, CS, CT, DC, EG, EW, EY, FR, GN, HC, LJ, LR, MK, 
               NG, NS, RM, SA, SC, SG, SR, SS, ST, VE, WR, YT, ZH), names_to = "ingredients", values_to = 
                 "quantities") 

#Imputing the missing values in quantities 

imputed_long_cake_data <- long_cake_data %>%
  mutate(quantities = coalesce(quantities, 0)) 

#Doing a left join on the data 

joined_data <- imputed_long_cake_data %>% 
  left_join(cake_abbreviations_data, by = c("ingredients" = "code")) 

#Dropping ingredients abbreviations 

joined_data_abbreviations_dropped <- joined_data %>% 
  select(-ingredients) 

#Imputing missing values in measure 

imputed_data <- joined_data_abbreviations_dropped %>% 
  mutate(measure = coalesce(measure, "cup"))

#Cleaning names 
  
imputed_clean_data <- clean_names(imputed_data) 
