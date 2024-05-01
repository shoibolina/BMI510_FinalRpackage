#' Title: Minimum sample size calculation for a t-test
#'
#' This function is a wrapper around `pwr::pwr.t2n.test` that calculates the minimum sample size
#' needed for a t-test of the null hypothesis with specified power and significance level.
#'
#' @param x1 A numeric vector representing the first sample.
#' @param x2 A numeric vector representing the second sample (optional).
#' @return The minimum sample size needed for a t-test.
#' @export
minimumN <- function(x1, x2 = NULL) {
  library(pwr)

  if (is.null(x2)) {
    # Calculate sample size for one-sample t-test
    result <- pwr.t.test(d = mean(x1) / sd(x1), power = 0.8, sig.level = 0.05, type = "t", alternative = "two.sided")
  } else {
    # Calculate sample size for two-sample t-test
    result <- pwr.t2n.test(d = (mean(x1) - mean(x2)) / sqrt((sd(x1)^2 + sd(x2)^2) / 2), power = 0.8, sig.level = 0.05)
  }

  return(result$n)
}
