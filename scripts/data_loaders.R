## This script file contains utility functions to load data


#' Load latest data on Rt + predictors
#'
#' @author Tibo
load_final_data <- function() {
  latest_file <- rfextras::find_latest(
                               pattern = "final_dat",
                               where = here::here("data"))
  file_date <- rfextras::extract_date(latest_file)
  out <- rio::import(latest_file)
  attr(out, "timestamp") <- file_date
  out
}





#' Extract timestamp from an object with a 'timestamp' attribute
#'
#' @author Tibo
get_timestamp <- function(x) {
  attr(x, "timestamp")
}



#' Get ASMODEE results
#'
#' @author Tibo

#' @param who_region The WHO region to be used; only "EURO" is currently
#'   available.
#'
#' @return A list containing the following items:
#' * `summary`: summary of the ASMODEE results
#' * `results`: outputs of ASMODEE
#' * `plot_overall_deaths`: *ggplot2* object of the overall dynamics plot using
#'   death per capita on the y-axis
#' * `plot_overall_peaks`: *ggplot2* object of the overall dynamics plot using
#'   incidence as percentage of historical peak (excluding the last 90 days) on the
#'   y-axis

load_asmodee_results <- function(who_region = "EURO") {
  file_pat <- sprintf("asmodee_outputs_%s",
                     toupper(who_region))
  latest_file <- rfextras::find_latest(
                               pattern = file_pat,
                               where = here::here("data"))
  file_date <- rfextras::extract_date(latest_file)
  out <- rio::import(latest_file)
  attr(out, "timestamp") <- file_date
  out
}





#' Load country data
#'
#' Contains: who_region, report_country, iso3, population
#' 
#' @author Tibo
load_countries_data <- function() {
  phifunc::pull_pop_data() %>%
    filter(iso3 != "BES") %>% # remove 'Bonaire, Sint Eustatius and Saba'
    select(who_region, report_country, iso3, population)
}

