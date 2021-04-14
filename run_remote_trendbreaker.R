params <- list(who_region = "EURO")
knitr::purl(here::here("report_sources", "trendbreaker.Rmd"))
source("trendbreaker.R")
