here::i_am("subproject_sophia/code/fit_model.R")

cfg <- config::get()

unit_param <- cfg$unit

data <- readRDS(here::here("subproject_sophia/output/clean_data.rds"))

regression <- glm(PATIENT_TYPE ~ CARDIOVASCULAR + OBESITY, 
                  data = data, 
                  family=binomial)

saveRDS(regression, 
        file = here::here("subproject_sophia/output/fit_model.rds"))