library(readr)
library(gtsummary)
library(dplyr)

here::i_am("subproject_licza/code/01_log_reg.R")

df <-  read_csv(here::here("data/covid_sub.csv"))

#Does pneumonia increase an individual's risk of whether the patient was connected to the ventilator 
# (controlling for age, sex, and presence of asthma) ?

log_df <- df |>
  mutate(
    INTUBED = case_when(INTUBED == "Yes" ~ 1, INTUBED == "No"  ~ 0, TRUE ~ NA_real_),
    SEX = case_when(SEX== 'male' ~ 1, SEX == 'female' ~ 0, TRUE ~ NA_real_),
    ASTHMA = case_when(ASTHMA== 'Yes' ~ 1, ASTHMA == 'No' ~ 0, TRUE ~ NA_real_),
    PNEUMONIA = case_when(PNEUMONIA== 'Yes' ~ 1, PNEUMONIA == 'No' ~ 0, TRUE ~ NA_real_),
    )

binary_mod <- glm(
  INTUBED ~ PNEUMONIA + AGE + SEX + ASTHMA,
  data = log_df,
  family = binomial()
)

reg_table <- tbl_regression(binary_mod, exponentiate = TRUE) |>
  add_global_p()

saveRDS(
  reg_table,
  file = here::here("subproject_licza/output/regression_table.rds")
)



