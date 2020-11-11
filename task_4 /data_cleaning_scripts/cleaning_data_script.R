library(tidyverse) 
library(dplyr) 
library(janitor) 
library(here) 
library(stringr) 
library(lubridate)

data_2015 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2015.xlsx")) 
data_2016 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2016.xlsx")) 
data_2017 <- readxl::read_xlsx(here("raw_data/candy_ranking_data/boing-boing-candy-2017.xlsx")) 

cleaned_names_data_2015 <- clean_names(data_2015) 
cleaned_names_data_2016 <- clean_names(data_2016) 
cleaned_names_data_2017 <- clean_names(data_2017) 

q_dropped_2017 <- cleaned_names_data_2017 %>% 
  mutate(year = 2017) %>%
  rename_with(.fn = ~ str_remove_all(., "q[0-9]+_"), cols = everything()) %>% 
  select(-internal_id, -other_comments, -joy_other, -despair_other, -click_coordinates_x_y, 
         -media_daily_dish, -media_science, -media_espn, -media_yahoo, -dress, -x114, -day, 
         -real_housewives_of_orange_county_season_9_blue_ray, -sweetums_a_friend_to_diabetes, 
         -creepy_religious_comics_chick_tracts, -whole_wheat_anything, -vicodin, 
         -state_province_county_etc) 

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
         -peterson_brand_sidewalk_chalk) 

rename_age_2016 <- cleaned_names_data_2016 %>% 
  mutate(year = 2016) %>% 
  rename(age = how_old_are_you) %>% 
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
         -whole_wheat_anything, -vicodin, -which_state_province_county_do_you_live_in) 

rename_tricks_treating_2017 <- q_dropped_2017 %>% 
  rename(are_you_going_actually_going_trick_or_treating_yourself = going_out) 

combined <- bind_rows(rename_tricks_treating_2017, rename_age_2016, renamed_age_2015) 