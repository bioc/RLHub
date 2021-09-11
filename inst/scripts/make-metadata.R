#' Creates the metadata for RLHub

meta <- data.frame(
  Title = c(
    paste0()
  ),
  Description = c(
    paste0()
  ),
  BiocVersion = c(

  ),
  Genome = c(

  ),
  SourceType = c(

  ),
  SourceUrl = c(

  ),
  SourceVersion = c(

  ),
  Species = c(

  ),
  TaxonomyId = c(

  ),
  Coordinate_1_based = TRUE,
  DataProvider = "",
  Maintainer = "Henry Miller <millerh1@uthscsa.edu>",
  RDataClass = c(

  ),
  DispatchClass = c(

  ),
  RDataPath = c(

  ),
  Tags = "",
  Notes = c(

  )
)

write.csv(meta, file="inst/extdata/metadata.csv", row.names=FALSE)

