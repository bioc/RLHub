.onLoad <- function(libname, pkgname) {

  # Assign the location of the AWS S3 bucket for the hub data
  S3_BASE_URI <- "s3://rlbase-data/"
  S3_HTTPS_URL <- "https://rlbase-data.s3.amazonaws.com/"
  assign("S3_BASE_URI", S3_BASE_URI, envir = parent.env(environment()))
  assign("S3_HTTPS_URL", S3_HTTPS_URL, envir = parent.env(environment()))

  # Add hub data accessor functions
  fl <- system.file("extdata", "metadata.csv", package=pkgname)
  titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
  ExperimentHub::createHubAccessors(pkgname, titles)

}
