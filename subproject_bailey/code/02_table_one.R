here::i_am("subproject_bailey/code/02_table_one.R")

data <- readRDS(
  file = "subproject_bailey/output/data.rds"
)

library(gtsummary)
library(dplyr)
table1 <- data %>%
  tbl_summary(
    include = c(PNEUMONIA, INTUBED, CARDIOVASCULAR, OBESITY, PATIENT_TYPE, AGE),
    missing = "no",
    label = list(
      AGE ~ "Age",
      PATIENT_TYPE ~ "Type of Care",
      PNEUMONIA ~ "Pneumonia",
      INTUBED ~ "Ventilator", 
      CARDIOVASCULAR ~ "Cardiovascular Disease", 
      OBESITY ~ "Obesity"
    ))


saveRDS(
  table1,
  file = here::here("subproject_bailey/output/table1.rds")
)