#' Title: Reverse the centering/scaling of a vector
#'
#' Takes a vector that has been put through scaling and reverses the centering/scaling, if any.
#'
#' @param x A numeric vector that has been centered and scaled.
#' @return The unscaled and uncentered vector.
#' @examples
#' scaled_vector <- scale(c(1, 2, 3, 4, 5))
#' unscaled_vector <- unscale(scaled_vector)
#' @export
unscale <- function(x) {
  mean_x <- attr(x, "scaled:center")
  std_x <- attr(x, "scaled:scale")
  if (is.null(mean_x) || is.null(std_x)) {
    stop("Input vector is not scaled.")
  }
  unscaled <- x * std_x + mean_x
  return(unscaled)
}
