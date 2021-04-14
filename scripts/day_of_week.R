#' Convert dates to factors
#'
#' This will map a `Date' vector to weekdays, with the following distinction:
#' weekden, monday, of the rest of the week
#'
#' @author Thibaut
#' 
day_of_week <- function(date) {
  day_of_week <- weekdays(date)
  out <- vapply(
    day_of_week,
    function(x) {
      if (x %in% c("Saturday", "Sunday")) {
        "weekend"
      } else if (x == "Monday") {
        "monday"
      } else {
        "rest_of_week"
      }
    },
    character(1)
  )
  factor(out, levels = c("rest_of_week", "monday", "weekend"))
} 
