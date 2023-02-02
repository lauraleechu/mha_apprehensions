install.packages("opendatatoronto")
install.packages("tidyverse")

library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(knitr)
library(janitor)

# get package
mental_health <-
  list_package_resources("mental-health-apprehensions")
#print(mental_health)
mental_health <-
  get_resource("4a92540b-6504-4b25-827d-4511b8b9f3d9")

write.csv(
  x = mental_health,
  "/cloud/project/inputs/data/mental_health.csv"
)