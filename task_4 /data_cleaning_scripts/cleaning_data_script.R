library(tidyverse) 
library(dplyr) 
library(janitor) 
library(here) 
library(stringr) 
library(lubridate) 
library(naniar) 

#Reading in the data 

data_2015 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2015.xlsx")) 
data_2016 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2016.xlsx")) 
data_2017 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2017.xlsx")) 

#Cleaning column names 

cleaned_names_data_2015 <- clean_names(data_2015) 
cleaned_names_data_2016 <- clean_names(data_2016) 
cleaned_names_data_2017 <- clean_names(data_2017) 

#Dropping the unecessary columns in all three datasets 

q_dropped_2017 <- cleaned_names_data_2017 %>% 
  mutate(year = 2017) %>%
  rename_with(.fn = ~ str_remove_all(., "q[0-9]+_"), cols = everything()) %>% 
  select(-internal_id, -other_comments, -joy_other, -despair_other, -click_coordinates_x_y, 
         -media_daily_dish, -media_science, -media_espn, -media_yahoo, -dress, -x114, -day, 
         -real_housewives_of_orange_county_season_9_blue_ray, -sweetums_a_friend_to_diabetes, 
         -creepy_religious_comics_chick_tracts, -whole_wheat_anything, -vicodin, 
         -state_province_county_etc, -pencils, -vials_of_pure_high_fructose_corn_syrup_for_main_lining_into_your_vein, 
         -broken_glow_stick, -dental_paraphenalia, -generic_brand_acetaminophen, 
         -candy_that_is_clearly_just_the_stuff_given_out_for_free_at_restaurants, 
         -cash_or_other_forms_of_legal_tender, -chardonnay, 
         -chick_o_sticks_we_don_t_know_what_that_is, -glow_sticks, -gum_from_baseball_cards, 
         -hugs_actual_physical_hugs, -healthy_fruit, -jolly_rancher_bad_flavor, 
         -bonkers_the_board_game, -kale_smoothie, 
         -abstained_from_m_ming, -minibags_of_chips, 
         -sandwich_sized_bags_filled_with_boo_berry_crunch, 
         -spotted_dick, -those_odd_marshmallow_circus_peanut_things, -trail_mix, 
         -white_bread, -any_full_sized_candy_bar)  

renamed_age_2015 <- cleaned_names_data_2015 %>% 
  mutate(year = 2015) %>% 
  rename(age = how_old_are_you) %>% 
  select(-timestamp, -please_leave_any_remarks_or_comments_regarding_your_choices, 
         -please_list_any_items_not_included_above_that_give_you_joy, 
         -please_list_any_items_not_included_above_that_give_you_despair, 
         -guess_the_number_of_mints_in_my_hand, -betty_or_veronica, 
         -check_all_that_apply_i_cried_tears_of_sadness_at_the_end_of, 
         -that_dress_that_went_viral_early_this_year_when_i_first_saw_it_it_was, 
         -fill_in_the_blank_taylor_swift_is_a_force_for, -fill_in_the_blank_imitation_is_a_form_of, 
         -what_is_your_favourite_font, 
         -if_you_squint_really_hard_the_words_intelligent_design_would_look_like, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626, 
         -which_day_do_you_prefer_friday_or_sunday, 
         -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_bruce_lee, 
         -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jk_rowling, 
         -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_malala_yousafzai, 
         -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_thom_yorke, 
          -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_jj_abrams, 
         -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_hillary_clinton, 
         -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_donald_trump, 
         -please_estimate_the_degrees_of_separation_you_have_from_the_following_folks_beyonce_knowles, 
         -creepy_religious_comics_chick_tracts, 
         -sea_salt_flavored_stuff_probably_chocolate_since_this_is_the_it_flavor_of_the_year, 
         -vicodin, 
         -whole_wheat_anything, 
         -peterson_brand_sidewalk_chalk, -pencils, 
         -vials_of_pure_high_fructose_corn_syrup_for_main_lining_into_your_vein, 
         -broken_glow_stick, -dental_paraphenalia, -generic_brand_acetaminophen, 
         -candy_that_is_clearly_just_the_stuff_given_out_for_free_at_restaurants, 
         -cash_or_other_forms_of_legal_tender, 
         -chick_o_sticks_we_don_t_know_what_that_is, -glow_sticks, 
         -gum_from_baseball_cards, -hugs_actual_physical_hugs, -healthy_fruit, 
         -jolly_rancher_bad_flavor, -kale_smoothie, -minibags_of_chips, 
         -spotted_dick, -those_odd_marshmallow_circus_peanut_things, 
         -trail_mix, -white_bread, -lapel_pins, -mint_leaves, 
         -box_o_raisins, -brach_products_not_including_candy_corn, 
         -peanut_butter_jars, -x100_grand_bar, -any_full_sized_candy_bar) 

rename_age_2016 <- cleaned_names_data_2016 %>% 
  mutate(year = 2016) %>% 
  rename(age = how_old_are_you) %>% 
  rename(country = which_country_do_you_live_in) %>% 
  rename(gender = your_gender) %>% 
  select(-timestamp, -york_peppermint_patties_ignore, 
         -when_you_see_the_above_image_of_the_4_different_websites_which_one_would_you_most_likely_check_out_please_be_honest, 
         -do_you_eat_apples_the_correct_way_east_to_west_side_to_side_or_do_you_eat_them_like_a_freak_of_nature_south_to_north_bottom_to_top, 
         -which_day_do_you_prefer_friday_or_sunday, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_francis_bacon_1561_1626, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_kevin_bacon, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_bieber, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_beyonce, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jj_abrams, 
         -please_estimate_the_degree_s_of_separation_you_have_from_the_following_celebrities_jk_rowling, 
         -what_is_your_favourite_font, 
         -that_dress_that_went_viral_a_few_years_back_when_i_first_saw_it_it_was, 
         -betty_or_veronica, 
         -person_of_interest_season_3_dvd_box_set_not_including_disc_4_with_hilarious_outtakes, 
         -sweetums_a_friend_to_diabetes, 
         -please_list_any_items_not_included_above_that_give_you_joy, 
         -please_list_any_items_not_included_above_that_give_you_despair, 
         -please_leave_any_witty_snarky_or_thoughtful_remarks_or_comments_regarding_your_choices, 
         -guess_the_number_of_mints_in_my_hand, 
         -creepy_religious_comics_chick_tracts, 
         -whole_wheat_anything, -vicodin, -which_state_province_county_do_you_live_in, -pencils, 
         -vials_of_pure_high_fructose_corn_syrup_for_main_lining_into_your_vein, 
         -broken_glow_stick, -dental_paraphenalia, -generic_brand_acetaminophen, 
         -candy_that_is_clearly_just_the_stuff_given_out_for_free_at_restaurants, 
         -cash_or_other_forms_of_legal_tender, -chardonnay, 
         -chick_o_sticks_we_don_t_know_what_that_is, -glow_sticks, 
         -gum_from_baseball_cards, -hugs_actual_physical_hugs, -healthy_fruit, 
         -jolly_rancher_bad_flavor, -bonkers_the_board_game, -kale_smoothie, 
         -minibags_of_chips, -those_odd_marshmallow_circus_peanut_things, -white_bread, 
         -trail_mix, -spotted_dick, -any_full_sized_candy_bar) 

#Renaming the going_out columns to all be the same 

rename_tricks_treating_2017 <- q_dropped_2017 %>% 
  rename(are_you_going_actually_going_trick_or_treating_yourself = going_out) 

#Combining dataframes 

combined <- bind_rows(rename_tricks_treating_2017, rename_age_2016, renamed_age_2015) 

#Recoding country names 

replacing_with_na <- combined %>% 
  replace_with_na(replace = list(country = c("Somewhere", "See above", "One of the best ones", 
                                             "Not the USA or Canada", "Narnia", "insanity lately", 
                                             "I don't know anymore", "god's country", 
                                             "Fear and Loathing", "endland", "Earth", "Denial", 
                                             "A", "A tropical island south of the equator", 
                                             "United Statea", "United staes", "this one", 
                                             "there isn't one for old men", "one of the best ones", 
                                             "subscribe to dm4uz3 on youtube", "Neverland" 
                                             ))) 

country_tidied_combined_data <- replacing_with_na %>% 
  mutate(country = recode(country, "usa" = "USA", 
                          "us" = "USA", 
                          "españa" = "Spain", 
                          "belgium" = "Belgium", 
                          "US" = "USA", 
                          "USSA" = "USA", 
                          "USA!!!!!!" = "USA", 
                          "USA! USA! USA!" = "USA", 
                          "USA! USA!" = "USA", 
                          "USA!" = "USA", 
                          "USA USA USA USA" = "USA", 
                          "USA USA USA" = "USA", 
                          "USA (I think but it's an election year so who can really tell)" 
                          = "USA", 
                          "Usa" = "USA", 
                          "uSA" = "USA", 
                          "USa" = "USA", 
                          "Units States" = "USA", 
                          "United Stetes" = "USA", 
                          "United States of America" = "USA", 
                          "The United States of America" = "USA", 
                          "UNited States" = "USA", 
                          "United States" = "USA", 
                          "United  States of America" = "USA", 
                          "United State" = "USA", 
                          "United Sates" = "USA", 
                          "Unites States" = "USA", 
                          "The United States" = "USA", 
                          "U.S.A." = "USA", 
                          "u.s.a" = "USA", 
                          "u.s.a." = "USA", 
                          "United Stated" = "USA", 
                          "United Statss" = "USA", 
                          "united States" = "USA", 
                          "U.S." = "USA", 
                          "U.s." = "USA", 
                          "Trumpistan" = "USA", 
                          "Murica" = "USA", 
                          "Merica" = "USA", 
                          "america" = "USA", 
                          "America" = "USA", 
                          "The Yoo Ess of Aaayyyyyy" = "USA", 
                          "30.0" = "USA", 
                          "44.0" = "USA", 
                          "45.0" = "USA", 
                          "47.0" = "USA", 
                          "51.0" = "USA", 
                          "54.0" = "USA", 
                          "the best one - usa" = "USA", 
                          "Us" = "USA", 
                          "united states of america" = "USA", 
                          "United states" = "USA", 
                          "united states" = "USA", 
                          "u.s." = "USA", 
                          "United Kingdom" = "UK", 
                          "uk" = "UK", 
                          "United Kindom" = "UK", 
                          "netherlands" = "Netherlands", 
                          "canada" = "Canada", 
                          "england" = "UK", 
                          "England" = "UK", 
                          "france" = "France", 
                          "germany" = "Germany", 
                          "usa" = "USA", 
                          "us" = "USA", 
                          "US" = "USA", 
                          "USSA" = "USA", 
                          "California" = "USA", 
                          "New Jersey" = "USA", 
                          "New York" = "USA", 
                          "North Carolina" = "USA", 
                          "Pittsburgh" = "USA", 
                          "USAUSAUSA" = "USA", 
                          "N. America" = "USA", 
                          "usas" = "USA", 
                          "USAA" = "USA", 
                          "USA? Hard to tell anymore.." = "USA", 
                          "USA USA USA!!!!" = "USA", 
                          "US of A" = "USA", 
                          "U S" = "USA", 
                          "u s a" = "USA", 
                          "USA!!!!!!" = "USA", 
                          "USA! USA! USA!" = "USA", 
                          "USA! USA!" = "USA", 
                          "USA!" = "USA", 
                          "USA USA USA USA" = "USA", 
                          "USA USA USA" = "USA", 
                          "USA (I think but it's an election year so who can really tell)" 
                          = "USA", 
                          "Usa" = "USA", 
                          "uSA" = "USA", 
                          "Units States" = "USA", 
                          "United Stetes" = "USA", 
                          "United States of America" = "USA", 
                          "UNited States" = "USA", 
                          "United States" = "USA", 
                          "United  States of America" = "USA", 
                          "United State" = "USA", 
                          "United Sates" = "USA", 
                          "U.S.A." = "USA", 
                          "U.S." = "USA", 
                          "U.s." = "USA", 
                          "Trumpistan" = "USA", 
                          "Murica" = "USA", 
                          "Merica" = "USA", 
                          "america" = "USA", 
                          "America" = "USA", 
                          "The Yoo Ess of Aaayyyyyy" = "USA", 
                          "murrika" = "USA", 
                          "I pretend to be from Canada, but I am really from the United States." = "USA", 
                          "30.0" = "USA", 
                          "44.0" = "USA", 
                          "45.0" = "USA", 
                          "47.0" = "USA", 
                          "51.0" = "USA", 
                          "54.0" = "USA", 
                          "the best one - usa" = "USA", 
                          "Us" = "USA", 
                          "united states of america" = "USA", 
                          "United states" = "USA", 
                          "united states" = "USA", 
                          "Ahem....Amerca" = "USA", 
                          "merica" = "USA", 
                          "'merica" = "USA", 
                          "32" = "USA", 
                          "35" = "USA", 
                          "45" = "USA", 
                          "46" = "USA", 
                          "Alaska" = "USA", 
                          "u.s." = "USA", 
                          "United Kingdom" = "UK", 
                          "uk" = "UK", 
                          "United Kindom" = "UK", 
                          "netherlands" = "Netherlands", 
                          "canada" = "Canada", 
                          "england" = "UK", 
                          "England" = "UK", 
                          "france" = "France", 
                          "germany" = "Germany", 
                          "Scotland" = "UK", 
                          "CANADA" = "Canada", 
                          "Canada`" = "Canada", 
                          "Can" = "Canada")) 

#Moving year to the beginning 

year_first <- country_tidied_combined_data %>% 
  select(year, everything()) 

#Pivoting the dataset 

long_data <- year_first %>% 
  pivot_longer(cols = "100_grand_bar":peanut_butter_bars, names_to = "candy", values_to = "ratings")
  
#Dropping nas 

dropping_missing_values <- long_data %>% 
  drop_na(ratings) 

#Removing any text from age column 

removing_extra_age_information <- dropping_missing_values %>% 
  mutate(age = str_remove(age, "[A-Za-z-!'?]+")) 
         
write_csv(removing_extra_age_information, "clean_halloween_candy_bar_data.CSV") 



  