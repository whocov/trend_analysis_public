
#' Get proportion of NA by column
#'
#' @author Tibo
#' 
na_by_col <- function(x) {
  out <- lapply(x, function(e) mean(is.na(e)))
  out <- stack(out)
  names(out) <- c("p", "variable")
  class(out) <- c("na_diag", class(out))
  out
}



#' Get proportion of NA by country
#'
#' @author Tibo
#' 
na_by_country <- function(x) {
  split_x <- split(x, x$country)
  out <- sapply(split_x, function(e) mean(is.na(e)))
  out <- stack(out)
  names(out) <- c("p", "variable")
  class(out) <- c("na_diag", class(out))
  out
}



#' Plot proportion of NA
#'
#' @author Tibo
#' 
plot.na_diag <- function(x) {
  x %>%
  ggplot(aes(x = p, y = variable)) +
  geom_col() +
  theme_bw() +
  labs(y = "", x = "Proportion of missing data")
}
