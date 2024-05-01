# BMI510_FinalRpackage
Contains R package containing .R and .Rd files for each function, along with all other required submissions.

Each .R file is saved as the name of the functions.
<ol>
<li>logLikBernoulli.R file: logLikBernoulli = function(data) Write a function that takes a vector like data = c(1,0,0,0,1,1,1,) and calculates the parameter p that maximizes the log-likelihood log(P(p|data)). Use a grid-based search with p in steps of 0.001.
survCurv.R file: survCurv = function(status,time) Write a function that takes a numerical vector status and a numerical vector time , and calculates and plots a survival curve S(t).
unscale.R file: unscale = function(x) : Write a function that takes a vector that has been put through scale and reverses the centering/scaling, if any.
pcApprox.R file: pcApprox = function(x, npc) : Write a function that returns an approximation to the data x based on npc PCs.
standardizeNames = function(data) : Write a wrapper around dplyr::rename_with and janitor::make_clean_names that converts the variables in a tibble data to "small_camel" case (or another case if you like). The idea here is to have a reliable function that standardizes the variable log(P(p|data)) names in data you’re dealing with. This function should import elements of the janitor and snakecase packages; Roxygen2 will handle these dependencies for you.
minimumN.R file: minimumN = function(x1,x2) : Write a wrapper around pwr::pwr.t2n.test that takes either one ( x1 ) or two ( x2 ) samples of preliminary data and returns the minimum sample size needed for a t-test of the null hypotheses that either μX1 == 0 or μX1 == μX2 with 80% power at alpha=0.05.
downloadRedcapReport.R: downloadRedcapReport = function(redcapTokenName,redcapUrl,redcapReportId) : Using the block of RedCap template code below, write a function that:
                                uses Sys.getenv() to read an API token called redcapTokenName from the users’ .REnviron file.
                                queries redcapUrl to return the Redcap Report redcapReportId. (Notice these are the data from our simulated stroke study, now nicely and securely hosted on RedCap.)
                                returns the contents as a tibble.
</ol>
