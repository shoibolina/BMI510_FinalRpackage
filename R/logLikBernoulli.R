#' Title: Maximum Likelihood Estimate
#'
#' Given a vector of binary outcomes, calculates the parameter p that maximizes
#' the log-likelihood of the data under the assumption of a Bernoulli distribution.
#'
#' @param data A numeric vector of binary outcomes (0s and 1s).
#' @return The maximum likelihood estimate of parameter p.
#' @examples
#' data <- c(1, 0, 0, 0, 1, 1, 1)
#' logLikBernoulli(data)
#' @export
logLikBernoulli <- function(data) {
  # Define a vector of possible values for p
  p_values <- seq(0, 1, by = 0.001)

  # Initialize variables to store maximum log-likelihood and corresponding p
  max_log_likelihood <- -Inf
  max_p <- NA

  # Iterate over each value of p
  for (p in p_values) {
    # Calculate the log-likelihood for the current value of p
    log_likelihood <- sum(data * log(p) + (1 - data) * log(1 - p))

    # Check if the current log-likelihood is greater than the maximum
    if (log_likelihood > max_log_likelihood) {
      max_log_likelihood <- log_likelihood
      max_p <- p
    }
  }

  # Return the value of p that maximizes the log-likelihood
  return(max_p)
}
