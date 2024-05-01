#' Title: Download REDCap report
#'
#' This function retrieves a REDCap report using the provided API token, URL, and report ID.
#'
#' @param redcapTokenName The name of the API token stored in the .REnviron file.
#' @param redcapUrl The URL of the REDCap API.
#' @param redcapReportId The ID of the REDCap report to retrieve.
#' @return A tibble containing the contents of the REDCap report.
#' @examples
#' downloadRedcapReport(redcapTokenName = "6189879441F5C29A25245880677488BF", redcapUrl = "https://redcap.emory.edu/api/", redcapReportId = 46524)
#' @export
downloadRedcapReport <- function(redcapTokenName, redcapUrl, redcapReportId) {
  library(httr)
  library(tibble)

  # Read API token from .REnviron file
  token <- Sys.getenv(redcapTokenName)

  # Prepare request data
  formData <- list(
    token = token,
    content = 'report',
    format = 'csv',
    report_id = redcapReportId,
    csvDelimiter = '',
    rawOrLabel = 'raw',
    rawOrLabelHeaders = 'raw',
    exportCheckboxLabel = 'false',
    returnFormat = 'csv'
  )

  # Send POST request to REDCap API
  response <- httr::POST(redcapUrl, body = formData, encode = "form")

  # Check if request was successful
  if (httr::http_error(response)) {
    stop("Failure to retrieve REDCap report. Recheck credentials and parameters.")
  }

  # Extract content from response
  result <- httr::content(response)

  # Convert content to tibble
  report <- read.csv(text = result, stringsAsFactors = FALSE)

  return(as_tibble(report))
}
