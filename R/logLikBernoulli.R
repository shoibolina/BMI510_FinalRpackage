#' Title: Maximum Likelihood Estimate
#'
#' Given a vector of binary outcomes, calculates the parameter p that maximizes
#' the log-likelihood of the data under the assumption of a Bernoulli distribution.
#'
#' @param data A numeric vector of binary outcomes (0s and 1s).
#' @return The maximum likelihood estimate of parameter p.
#' @export
logLikBernoulli <- function(data) {
  likelihood <- function(p) {
    sum(data * log(p) + (1 - data) * log(1 - p))
  }
  p_grid <- seq(0, 1, by = 0.001)
  log_likelihoods <- sapply(p_grid, likelihood)
  p_grid[which.max(log_likelihoods)]
}
