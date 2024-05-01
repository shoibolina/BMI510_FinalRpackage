#' Title: Approximate data based on principal components
#'
#' Returns an approximation to the data based on a specified number of principal components.
#' The approximation is rescaled and centered to match the original data.
#'
#' @param x A numeric vector or matrix.
#' @param npc Number of principal components to use.
#' @return The approximation of the data based on the specified number of principal components.
#' @examples
#' # Example 1: Approximating a matrix with 3 principal components
#' set.seed(123)
#' data_matrix <- matrix(rnorm(100), nrow = 10)
#' approx_matrix <- pcApprox(data_matrix, npc = 3)
#' @export
pcApprox <- function(x, npc) {
  pca <- prcomp(x)
  approx_data <- pca$rotation[, 1:npc] %*% t(pca$x[, 1:npc])
  scale(approx_data, center = TRUE, scale = TRUE)
}
