here::i_am("code/recode.R")

data <- read.csv(
  file = here::here("covid_sub.csv")
)

data$num_med_conditions <- rowSums(data[, c("PNEUMONIA","DIABETES","COPD","ASTHMA","INMSUPR","HIPERTENSION","CARDIOVASCULAR","RENAL_CHRONIC","OTHER_DISEASE","OBESITY")]=="Yes")
data$patient_type_recode <-ifelse(data$PATIENT_TYPE == "hospitalization", 1, 0)
saveRDS(
  data, 
  file = here::here("output/recode.rds")
)

