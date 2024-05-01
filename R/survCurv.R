#' Title: Survival curve
#'
#' Given vectors of event status and corresponding times, calculates and plots
#' the survival curve S(t).
#'
#' @param status A numeric vector indicating event status (0 for censored, 1 for event).
#' @param time A numeric vector of time to event or censoring.
#' @return A plot of the survival curve.
#' @examples
#' # Example usage:
#' library(survival)
#' test_survCurv <- function() {
#'   url <- "https://jlucasmckay.bmi.emory.edu/global/bmi510/Labs-Materials/survival.csv"
#'   survival_data <- read.csv(url)
#'   str(survival_data)
#'   survCurv(status = survival_data$status, time = survival_data$time)
#' }
#' # Call the test function
#' test_survCurv()
#' @export
survCurv <- function(status, time) {
  library(survival)
  surfit <- survfit(Surv(time, status) ~ 1)
  plot(surfit, xlab = "Time", ylab = "Survival Probability", main = "Survival Curve")
}

