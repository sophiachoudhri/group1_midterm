R_LIBS_USER := C:/Users/whhanso/AppData/Local/R/win-library/4.5

export R_LIBS_USER

#Default params
SEX ?= all
MEDICAL_UNIT ?= all

.PHONY: report
report:
	Rscript render_combined_report.R $(SEX) $(MEDICAL_UNIT)
	
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
	

	

