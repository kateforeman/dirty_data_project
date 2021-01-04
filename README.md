# Dirty Data Project 

## The brief 

The goal of this project was to take some messy publically available data and wrangle it into a suitable format. Once it was clean and tidy, we had a series of 
data analysis questions to answer. We had the choice of what tasks we chose to do and I decided on task 2 and 4. 

## Folder structure 

The structure of the folders was exactly the same for each task: 

<b>clean_data:</b> this folder holds the clean data saved as a .csv file. 

<b>data_cleaning_scripts:</b> this folder contains the R scripts in which the data cleaning and wrangling took place. 

<b>documentation_and_analysis:</b> the data analysis R notebook answering the data exploration questions can be found here. 

<b>raw_data:</b> the raw data is saved in these files as a .csv in task 2 and an .xlsx in task 4. 

## Task 2 

The raw data for this task came in two .csv files. The first contained cake names, abbreviations and quantities. The second contained the abbreviations, 
full ingredient names and quantities of ingredients. The first data set was pivoted to a longer format and I used a left join to combine the second data set. 
After cleaning the data until it was suitable for analysing, I saved it as a .csv and loaded it into a new R notebook within the documentation_and_analysis 
folder. Upon carrying out the analysis questions, I created an R notebook and wrote a markdown for this task which can be found in the documentation_and_analysis 
folder. 

## Task 4 

For this task, I read 3 excel data sets into R. Each data set contained survey data collected about halloween candy from a different year (2015 - 2017). For more 
information on this open data find it [here](https://www.scq.ubc.ca/so-much-candy-data-seriously/). I made certain assumptions about this data upon first reading 
the data in and have detailed this in the markdown, which again can be found in the documentation_and_analysis folder in the task_4 project. I used the janitor 
package and regular expression to clean the column names. There were some columns that were not related to candy at all and so would not be useful in my 
analysis and so were dropped from the dataset. I bound the rows together and hard coded the country columns so that each country was identified by one easily 
identifiable name. The data was pivoted to a long format and was saved to a .csv. 

## Running the code 

For more detailed explanation of the data wrangling and analysis process, a markdown can be found within the documentation_and_analysis folders of each project. . To explore the raw data, cleaning process and analysis for the two projects, 
