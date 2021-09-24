.onLoad <- function(libname, pkgname) {
  
  # Modified version of createHubAccessors which allows custom names
  createHubAccessors2 <- function(pkgname, titles, tags) 
  {
    eh <- AnnotationHub::query(ExperimentHub:::.get_ExperimentHub(), pkgname)
    ehids <- vapply(titles, function(tle, exactMatch, tags) {
      ehid <- names(AnnotationHub::subset(eh, title == tle))
      if (length(ehid) == 0L) {
        stop(sQuote(tle), " not found in ExperimentHub")
      } else if (length(ehid) != 1L) {
        stop(sQuote(tle), " matches more than 1 ExperimentHub resource")
      }
      ehid
    }, character(1))
    ns <- asNamespace(pkgname)
    lapply(seq(titles), function(i) {
      assign(tags[[i]], ExperimentHub:::.hubAccessorFactory(ehids[[i]]), 
             envir = ns)
      namespaceExport(ns, tags[[i]])
    })
  }

  # Assign the location of the AWS S3 bucket for the hub data
  S3_BASE_URI <- "s3://rlbase-data/"
  S3_HTTPS_URL <- "https://rlbase-data.s3.amazonaws.com/"
  assign("S3_BASE_URI", S3_BASE_URI, envir = parent.env(environment()))
  assign("S3_HTTPS_URL", S3_HTTPS_URL, envir = parent.env(environment()))

  # Add hub data accessor functions
  fl <- system.file("extdata", "metadata.csv", package=pkgname)
  titles <- read.csv(fl, stringsAsFactors=FALSE)$Title
  tags <- read.csv(fl, stringsAsFactors=FALSE)$Tag
  createHubAccessors2(pkgname, titles, tags)
}



