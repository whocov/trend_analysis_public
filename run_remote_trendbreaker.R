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

# We silence errors as we want the for loop to continue if some regions fail
for (reg in regions) {
  params <- list(who_region = reg)
  try(source("trendbreaker.R"), silent = TRUE)
}



# Update README - using a failsafe for now as it is unclear if pandoc will
# create problems
try(rmarkdown::render('README.Rmd'), silent = TRUE)
