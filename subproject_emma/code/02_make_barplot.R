here::i_am("subproject_emma/code/02_make_barplot.R")

library(here)
library(readr)
library(dplyr)
library(ggplot2)

data <- readr::read_csv(file = here::here("data/covid_sub.csv"))

cargs <- commandArgs(TRUE)

sex <- ifelse(
  cargs[1] == "all", 
  list(unique(data$SEX)),
  cargs[1]
)[[1]]

print(sex)

medical_unit <- ifelse(
  cargs[2] == "all",
  list(unique(data$MEDICAL_UNIT)),
  cargs[2]
)[[1]]

data <- data |>
  filter(SEX %in% sex,
         MEDICAL_UNIT %in% medical_unit) 

print(nrow(data))

data$INTUBED_num <- ifelse(data$INTUBED == "Yes", 1, 0)

data$age_group <- cut(
  data$AGE,
  breaks = c(0, 20, 30, 40, 50, 60, 70, 80, 100)
)

plot_data <- aggregate(INTUBED_num ~ age_group, data = data, mean)

barplot_intubation_age <- 
  ggplot(plot_data, aes(x = age_group, y = INTUBED_num)) +
  geom_col() +
  theme_bw() +
  labs(
    x = "Age Group",
    y = "Intubation Rate",
    title = "Intubation Rate by Age Group"
  )

ggsave(
  here::here("subproject_emma/output/intubation_rate_by_age_group.png"),
  plot = barplot_intubation_age,
  device = "png"
)