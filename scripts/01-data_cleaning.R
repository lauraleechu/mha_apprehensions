#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects


# Renaming MHA Apprehension Types
mental_health <-
  mental_health |>
  mutate(
    ApprehensionType =
      recode(
        ApprehensionType,
        "Mha Sec 15 (Form 1)" = "Sec. 15",
        "Mha Sec 16 (Form 2)" = "Sec. 16",
        "Mha Sec 17 (Power Of App)" = "Sec. 17",
        "Mha Sec 28(1) (Form 9 Elopee)" = "Sec. 28(1)",
        "Mha Sec 33.4 (Form 47 Cto)" = "Sec. 33.4"
      )
  )

#cleaning data for number of apprehensions by MHA type over a few years
first_apprehension <-
  mental_health |>
  select(ReportYear, ApprehensionType) |>
  group_by(ApprehensionType) |>
  count(ReportYear) 


write.csv(
  x = first_apprehension,
  "/cloud/project/inputs/data/first_apprehension.csv")
  
  
#Total apprehension by MHA type and gender cleaning data
gender_apprehension <-
  mental_health |>
  select(Sex, ApprehensionType) |>
  group_by(ApprehensionType) |>
  count(Sex) 

write.csv(
  x = gender_apprehension,
  "/cloud/project/inputs/data/gender_apprehension.csv")

# cleaning data: creating base tables to merge (AgeGroup, Sex, ReportYear)
secondtbl1 <-
  tabyl(mental_health, AgeGroup, ReportYear) |>
  adorn_totals(c("row", "col")) 

secondtbl2 <-
  tabyl(mental_health, Sex, ReportYear) |>
  adorn_totals(c("row", "col"))


write.csv(
  x = secondtbl1,
  "/cloud/project/inputs/data/secondtbl1.csv", row.names=FALSE)

write.csv(
  x = secondtbl2,
  "/cloud/project/inputs/data/secondtbl2.csv", row.names=FALSE)

library(knitr)
library(janitor)
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(kableExtra)

scndtbl <-
  merge(secondtbl1, secondtbl2, all = TRUE) |>
  select("AgeGroup", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021") 


write.csv(
  x = scndtbl,
  "/cloud/project/inputs/data/scndtbl.csv", row.names=FALSE)


#Total apprehension by MHA type and Age Group cleaning
age_apprehension <-
  mental_health |>
  select(AgeGroup, ApprehensionType) |>
  group_by(ApprehensionType) |>
  count(AgeGroup) 

write.csv(
  x = age_apprehension,
  "/cloud/project/inputs/data/age_apprehension.csv")

         