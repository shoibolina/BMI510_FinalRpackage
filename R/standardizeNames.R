#' Title: Standardize variable names
#'
#' @param data A tibble.
#' @return The tibble with standardized variable names.
#' @examples
#' # Example 1: Standardize variable names in a tibble
#' library(tibble)
#' data <- tibble("First Name" = c("Trey", "Lina"),
#'                "Last Name" = c("Travis", "Kaushik"),
#'                "Age" = c(22, 23))
#' clean_data <- standardizeNames(data)
#' print(clean_data)
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
