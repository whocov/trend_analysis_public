#' This function uses `binom.test` to derive estimates of the 95% CI for
#' proportions.
#'
#' @param k number of successes
#'
#' @param n number of trials
#'
#' @param conf confidence level, defaults to 0.95
#'
#' @param result a `character` vector indicating which bounds of the confidence
#'   interval to return: can be `"lower"`, or `"upper"`, or `"both"`
#'
#' @param perc a `logical` indicating if results should be formatted as
#'   percentages, rounded to 2 decimal places, or not (defaults to `FALSE`)
#'
#' @param dec the number of decimal places used for rounding percentages
#'
#' @author Thibaut Jombart
#' 

prop_ci <- function(k, n,
                    result = c("both", "lower", "upper"),
                    perc = FALSE,
                    conf = 0.95,
                    dec = 2) {
  if (is.na(n)) {
    return(NA_integer_)
  }
  
  if(n == 0){
    out = c(0,1)
  } else{
    out <- binom.test(k, n, conf.level = conf)$conf.int
    result <- match.arg(result)
  }
  if (result == "both") {
    result <- c("lower", "upper")
  }
  names(out) <- c("lower", "upper")
  out <- out[result]
  
  if (perc) {
    out <- round(100 * out, dec)
  }
  out
}

prop_ci <- Vectorize(prop_ci)
