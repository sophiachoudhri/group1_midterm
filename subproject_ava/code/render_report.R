here::i_am("code/render_report.R")

library(rmarkdown)
render("report.Rmd", output_file = here::here("report.html"))