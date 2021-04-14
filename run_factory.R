
library(reportfactory)

## Update data
compile_reports(report = "assemble", params = list(import_data = TRUE))

## Some of these regions error, need to check why manually
## regions <- c("AFRO", "EMRO", "EURO", "PAHO", "SEARO", "WPRO")
regions <- c("AFRO", "EURO", "PAHO", "SEARO", "WPRO")


## Note: n_cores needs to be adjusted by the user; best removed on windows,
## which does not support this parallelisation.
for (reg in regions) {
  compile_reports(report = "trendbreaker.Rmd",
                  params = list(who_region = reg, n_cores = 12),
                  subfolder = reg)
}
