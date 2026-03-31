here::i_am("subproject_emma/code/01_models.R")

library(dplyr)
library(gtsummary)
library(readr)

#data <- readRDS(
  #file = here::here("data/covid_sub.csv")
#)

data <- readr::read_csv(here::here("data/covid_sub.csv"))

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

data_model <- data |>
  filter(SEX %in% sex,
         MEDICAL_UNIT %in% medical_unit) |>
  filter(!is.na(INTUBED), !is.na(AGE)) |>
  mutate(
    INTUBED = factor(INTUBED, levels = c("No", "Yes"))
  )

intubation_age_mod <- glm(
  INTUBED ~ AGE,
  data = data_model,
  family = binomial()
)

intubation_age_table <- 
  tbl_regression(
    intubation_age_mod,
    exponentiate = TRUE
  ) |>
  add_global_p()

saveRDS(
  list(
    model = intubation_age_mod,
    table = intubation_age_table
  ),
  file = here::here("subproject_emma/output/intubation_age_results.rds")
)