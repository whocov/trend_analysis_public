
library(reportfactory)

# Update data
compile_reports(report = "assemble", params = list(import_data = TRUE))

# Some of these regions error, need to check why manually
regions <- c("AFRO", "EMRO", "EURO", "PAHO", "SEARO", "WPRO")
## regions <- c("AFRO", "EURO", "PAHO", "SEARO", "WPRO")


# Note: n_cores needs to be adjusted by the user; best removed on windows,
# which does not support this parallelisation.
for (reg in regions) {
  try(compile_reports(report = "trendbreaker.Rmd",
                  params = list(who_region = reg, n_cores = 12),
                  subfolder = reg),
      silent = TRUE)
  ## version with no failsafe
  ## compile_reports(report = "trendbreaker.Rmd",
  ##                 params = list(who_region = reg, n_cores = 12),
  ##                 subfolder = reg)
}


# update README
rmarkdown::render('README.Rmd')
