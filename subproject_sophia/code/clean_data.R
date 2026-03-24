here::i_am("subproject_sophia/code/clean_data.R")

data <- read.csv(
  file = here::here("data/covid_sub.csv")
)

data <- data |> 
  mutate(
    PATIENT_TYPE = factor(PATIENT_TYPE,
                          levels = c("returned home", "hospitalization")),
    CARDIOVASCULAR = factor(CARDIOVASCULAR,
                            levels = c("No","Yes")),
    OBESITY = factor(OBESITY,
                     levels = c("No", "Yes"))
  )


saveRDS(data, 
        file= here::here("subproject_sophia/output/clean_data.rds"))