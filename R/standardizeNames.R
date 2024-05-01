#' Title: Standardize variable names
#'
#' @param data A tibble.
#' @return The tibble with standardized variable names.
#' @export
standardizeNames <- function(data) {
  library(dplyr)
  library(janitor)

  # Convert variable names to small camel case
  clean_data <- data %>%
    rename_with(tolower, everything()) %>%
    make_clean_names(case = "camel")

  return(clean_data)
}
