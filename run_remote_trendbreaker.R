# translate the Rmd to R
knitr::purl(here::here("report_sources", "trendbreaker.Rmd"))

# run report for each region
regions <- c("AFRO", "EMRO", "EURO", "PAHO", "SEARO", "WPRO")
for (reg in regions) {
  params <- list(who_region = reg)
  source("trendbreaker.R")
}
