here::i_am("subproject_ava/code/recode.R")

library(dplyr)

data <- read.csv(
  file = here::here("data/covid_sub.csv")
)

cargs <- commandArgs(TRUE)

sex <- ifelse(
  cargs[1] == "all", 
  list(unique(data$SEX)),
  cargs[1]
)[[1]]

medical_unit <- ifelse(
  cargs[2] == "all",
  list(unique(data$MEDICAL_UNIT)),
  cargs[2]
)[[1]]

data <- data %>%
    filter(SEX %in% sex,
           MEDICAL_UNIT %in% medical_unit) 

data$num_med_conditions <- rowSums(data[, c("PNEUMONIA","DIABETES","COPD","ASTHMA","INMSUPR","HIPERTENSION","CARDIOVASCULAR","RENAL_CHRONIC","OTHER_DISEASE","OBESITY")]=="Yes")
data$patient_type_recode <-ifelse(data$PATIENT_TYPE == "hospitalization", 1, 0)
saveRDS(
  data, 
  file = here::here("subproject_ava/output/recode.rds")
)

