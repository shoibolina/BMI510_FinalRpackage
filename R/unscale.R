#' Title: Reverse the centering/scaling of a vector
#'
#' Takes a vector that has been put through scaling and reverses the centering/scaling, if any.
#'
#' @param x A numeric vector.
#' @return The unscaled vector.
#' @export
unscale <- function(x) {
  mean_x <- mean(x)
  std_x <- sd(x)
  unscaled <- x * std_x + mean_x
  return(unscaled)
}
