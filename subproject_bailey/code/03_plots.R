here::i_am("subproject_bailey/code/03_plots.R")

library(ggplot2)
library(dplyr)

data <- readRDS(
  file = "subproject_bailey/output/data.rds"
)

print(head(data$PNEUMONIA))

#PNEUMONIA
pneumonia_bar_chart <-
  data %>%
  filter(!is.na(PNEUMONIA)) %>%
  ggplot(aes(x = PNEUMONIA, fill = PNEUMONIA)) +
  geom_bar() +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "red")) +
  labs(
    title = "Distribution of Pneumonia Diagnosis",
    x = "Diagnosis of Pneumonia",
    y = "Count"
  )


saveRDS(
  pneumonia_bar_chart,
  file = here::here("subproject_bailey/output/pneumonia_bar_chart.rds")
)

#INTUBED
intubed_bar_chart <-
  data |> 
  filter(!is.na(INTUBED)) |>
  ggplot(aes(x = INTUBED, fill = INTUBED)) +
  geom_bar() +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "red")) +
  labs(
    title = "Distribution of Intubation",
    x = "Intubation Status",
    y = "Count"
  )


saveRDS(
  intubed_bar_chart,
  file = here::here("subproject_bailey/output/intubed_bar_chart.rds")
)

#CARDIOVASCULAR
cardiovascular_bar_chart <-
  data |> 
  filter(!is.na(CARDIOVASCULAR)) |>
  ggplot(aes(x = CARDIOVASCULAR, fill = CARDIOVASCULAR)) +
  geom_bar() +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "red")) +
  labs(
    title = "Distribution of Cardiovascular Disease",
    x = "Cardiovascular Disease",
    y = "Count"
  )

saveRDS(
  cardiovascular_bar_chart,
  file = here::here("subproject_bailey/output/cardiovascular_bar_chart.rds")
)

#OBESITY
obesity_bar_chart <-
  data |> 
  filter(!is.na(OBESITY)) |>
  ggplot(aes(x = OBESITY, fill = OBESITY)) +
  geom_bar() +
  scale_fill_manual(values = c("Yes" = "blue", "No" = "red")) +
  labs(
    title = "Distribution of Obesity",
    x = "Obesity Status",
    y = "Count"
  )


saveRDS(
  obesity_bar_chart,
  file = here::here("subproject_bailey/output/obesity_bar_chart.rds")
)

#PATIENT_TYPE
patient_bar_chart <-
  data |> 
  filter(!is.na(PATIENT_TYPE)) |>
  ggplot(aes(x = PATIENT_TYPE, fill = PATIENT_TYPE)) +
  geom_bar() +
  scale_fill_manual(values = c("Hospitalization" = "blue", "Returned Home" = "red")) +
  labs(
    title = "Distribution of Patient Type",
    x = "Patient Type",
    y = "Count"
  )


saveRDS(
  patient_bar_chart,
  file = here::here("subproject_bailey/output/patient_bar_chart.rds")
)

age_histogram <-
  data |>
  filter(!is.na(AGE)) |>
  ggplot(aes(x = AGE)) +
  geom_histogram(fill = "blue") +
  labs(
    title = "Distribution of Age", 
    x = "Age",
    y = "Count"
  )


saveRDS(
  age_histogram,
  file = here::here("subproject_bailey/output/age_histogram.rds")
)