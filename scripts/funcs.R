
flag_timewindow_compare <- function(
  dat = NULL,
  ind = "death_new",
  latest_date = NA,
  window_days = 7,
  name = "") {
  
  
  
  if (is.null(dat)) return(dat)
  if (is.na(window_days)) window_days <- 7
  if (!("report_date" %in% colnames(dat))) {
    colnames(dat)[grep("date", colnames(dat))[1]] <- "report_date"
  }
  if (!(ind %in% colnames(dat))) return(NULL)
  
  colnames(dat)[which(colnames(dat) == ind)] <- "vals"
  
  if (is.na(latest_date)) {
    latest_date <- floor_date(
      max(dat$report_date, na.rm = T),
      "weeks",
      week_start = 1
    ) - days(1)
  }
  
  dat <- dat %>%
    filter(
      report_date <= latest_date,
      report_date >= latest_date - days(window_days * 2 - 1)
    ) %>%
    mutate(
      window = ifelse(
        report_date > latest_date - window_days,
        "new",
        "old"
      )
    ) %>%
    group_by(window) %>%
    summarise(vals = median(vals, na.rm = T))
  
  new_val = dat %>% 
    filter(window == "new") %>%
    pull(vals)
  
  old_val <- dat %>%
    filter(window == "old") %>%
    pull(vals)
  
  diff <- perc_change(new_val, old_val)
  if (!is.numeric(diff)) return(NULL)
  if (length(diff) < 1) return(NULL)
  if (is.na(diff)) return(NULL)
  if (length(old_val) < 1) return(NULL)
  if (is.na(old_val)) return(NULL)
  if (length(new_val) < 1) return(NULL)
  if (is.na(old_val)) return(NULL)
  
  
  return(list("name" = name, "new" = new_val, "old" = old_val, "diff" = diff))
  
}


# FOR TESTING
# dat = dat
# group_var = report_country
# var_name_out = "Rt_mean"
# var_name_in = "Rt_mean"
# th = 1.2
# measure = "cross"
# latest_date = as.Date("2021-03-02")
# window_days = 7


flag_timewindow_process <- function(dat, group_var, var_name_out,
                                    var_name_in, th, measure = "diff", 
                                    latest_date = NA, window_days = NA) {
  
  
  flag_iso <- dat %>%
    group_by({{ group_var }}) %>%   #
    group_split() %>%
    # apply the timewindow func to all countries
    map(., ~flag_timewindow_compare(.x, var_name_in, name = .x$report_country[1], 
                                    latest_date = latest_date, window_days = window_days)) %>%
    # remove null entries
    purrr::compact(.)
  
  if (measure == "cross") {
    flag_iso <- keep(flag_iso, ~(.x[["new"]] > th & .x[["old"]] <= th))
  } else if (measure == "diff"){
    flag_iso <- keep(flag_iso, ~(.x[[measure]] > th))
  }
  
  
  out_df <- tibble(
    "group" = map_chr(flag_iso, ~pluck(.x, "name")),
    "a" = TRUE,
    "b" = map_chr(flag_iso, ~pluck(.x, "old")),
    "c" = map_chr(flag_iso, ~pluck(.x, "new")),
    "d" = map_chr(flag_iso, ~pluck(.x, "diff"))
  )
  
  colnames(out_df)[2:5] <- c(
    glue::glue("{var_name_out}_flag"), glue::glue("{var_name_out}_prev"),
    glue::glue("{var_name_out}_new"), glue::glue("{var_name_out}_diff")
  ) 
  
  return(out_df)
}
