here::i_am("subproject_sophia/code/table.R")

table <- tbl_regression(regression, 
               exponentiate = TRUE) |>
  add_global_p() |>
  bold_p(t = 0.05) |>
  bold_labels() |>
  modify_caption("**Table 3. Multiple Logistic Regression Model Looking at Association between Hospitalization Status and Cardiovascular Disease and Obesity")

saveRDS(table, 
        file = here::here ("subproject_sophia/output/table.rds" ))