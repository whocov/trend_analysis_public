# translate the Rmd to R
knitr::purl(here::here("report_sources", "trendbreaker.Rmd"))

# run report for each region, or a single region if WHO_REGION is a specified
# environment variable; the latter is useful to have different actions compile
# different regions

regions <- Sys.getenv("WHO_REGION")
if (regions == "") {
  regions <- c("AFRO", "EMRO", "EURO", "PAHO", "SEARO", "WPRO")
} else {
  regions <- toupper(regions)
  expected_regions <- c("AFRO", "EMRO", "EURO", "PAHO", "SEARO", "WPRO")
  regions <- match.arg(regions, expected_regions)
}

for (reg in regions) {
  params <- list(who_region = reg)
  source("trendbreaker.R")
}
