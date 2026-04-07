R_LIBS_USER := C:/Users/whhanso/AppData/Local/R/win-library/4.5

export R_LIBS_USER

#Default params
SEX ?= all
MEDICAL_UNIT ?= all

.PHONY: report
report:
	Rscript render_combined_report.R $(SEX) $(MEDICAL_UNIT)
	
### Bailey Output

.PHONY: bailey
bailey: subproject_bailey/output/data.rds subproject_bailey/output/table1.rds \
 subproject_bailey/output/pneumonia_bar_chart.rds \
 subproject_bailey/output/intubed_bar_chart.rds \
 subproject_bailey/output/cardiovascular_bar_chart.rds \
 subproject_bailey/output/obesity_bar_chart.rds \
 subproject_bailey/output/patient_bar_chart.rds \
 subproject_bailey/output/age_histogram.rds
 
subproject_bailey/output/data.rds: subproject_bailey/code/01_data.R
	Rscript subproject_bailey/code/01_data.R $(SEX) $(MEDICAL_UNIT)
	
subproject_bailey/output/table1.rds: subproject_bailey/output/data.rds \
 subproject_bailey/code/02_table_one.R
	Rscript subproject_bailey/code/02_table_one.R

BAILEY_FIGURES = subproject_bailey/output/pneumonia_bar_chart.rds \
									subproject_bailey/output/intubed_bar_chart.rds \
									subproject_bailey/output/cardiovascular_bar_chart.rds \
									subproject_bailey/output/obesity_bar_chart.rds \
									subproject_bailey/output/patient_bar_chart.rds \
									subproject_bailey/output/age_histogram.rds
									
$(BAILEY_FIGURES): subproject_bailey/output/data.rds subproject_bailey/code/03_plots.R
	Rscript subproject_bailey/code/03_plots.R
										
### Sophia Output

.PHONY: sophia
sophia: subproject_sophia/output/clean_data.rds subproject_sophia/output/fit_model.rds \
 subproject_sophia/output/table.rds
 

subproject_sophia/output/clean_data.rds: subproject_sophia/code/clean_data.R 
	Rscript subproject_sophia/code/clean_data.R $(SEX) $(MEDICAL_UNIT)

subproject_sophia/output/fit_model.rds: subproject_sophia/code/fit_model.R \
 subproject_sophia/output/clean_data.rds
	Rscript subproject_sophia/code/fit_model.R

subproject_sophia/output/table.rds: subproject_sophia/code/fit_model.R \
 subproject_sophia/output/fit_model.rds
	Rscript subproject_sophia/code/table.R
	

### Licza output

.PHONY: licza
licza: subproject_licza/output/regression_table.rds

subproject_licza/output/regression_table.rds: subproject_licza/code/01_log_reg.R
	Rscript subproject_licza/code/01_log_reg.R $(SEX) $(MEDICAL_UNIT)
	

### Emma

.PHONY: emma
emma: subproject_emma/output/intubation_age_results.rds \
 subproject_emma/output/intubation_rate_by_age_group.png

subproject_emma/output/intubation_age_results.rds: subproject_emma/code/01_models.R
	Rscript subproject_emma/code/01_models.R $(SEX) $(MEDICAL_UNIT)

subproject_emma/output/intubation_rate_by_age_group.png: subproject_emma/code/02_make_barplot.R
	Rscript subproject_emma/code/02_make_barplot.R $(SEX) $(MEDICAL_UNIT)
	

### Ava

.PHONY: ava
ava: subproject_ava/output/recode.rds subproject_ava/output/table_one.rds

subproject_ava/output/recode.rds: subproject_ava/code/recode.R
	Rscript subproject_ava/code/recode.R $(SEX) $(MEDICAL_UNIT)
	
subproject_ava/output/table_one.rds: subproject_ava/code/table_one.R
	Rscript subproject_ava/code/table_one.R $(SEX) $(MEDICAL_UNIT)

	

