here::i_am("subproject_bailey/code/01_data.R")

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

print("read args")

#Remove missing
data <- data[!is.na(data$AGE) |
               !is.na(data$PATIENT_TYPE) | 
               !is.na(data$PNEUMONIA) | 
               !is.na(data$INTUBED) | 
               !is.na(data$CARDIOVASCULAR) | 
               !is.na(data$OBESITY), ] %>%
  filter(SEX %in% sex,
         MEDICAL_UNIT %in% medical_unit)

print("cleaned data")
#Label PATIENT_TYPE 
data$PATIENT_TYPE <- ifelse(data$PATIENT_TYPE == 'hospitalization', "Hospitalization",
                            ifelse(data$PATIENT_TYPE == 'returned home', 'Returned Home', data$PATIENT_TYPE))

#Save data as RDS
saveRDS(
  data,
  file = here::here("subproject_bailey/output/data.rds")
)
