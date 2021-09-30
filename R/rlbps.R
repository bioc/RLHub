#' R-loop Binding Proteins
#' 
#' A list of annotations for genomic features relevant to R-loops. Both mm10 and 
#' hg38 annotations are available.
#' 
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A `tbl` object. See details.
#' @details 
#' 
#' ## Source
#' 
#' R-Loop binding proteins (RLBPs) are proteins which were discovered by mass-spectrometry
#' after S9.6 immuno-precipitation (S9.6 is an antibody that binds R-loops). The data
#' were aggregated from three studies which analyzed RLBPs in this manner:
#' 
#' 1. *Nadel et al., 2015* - [article](https://epigeneticsandchromatin.biomedcentral.com/articles/10.1186/s13072-015-0040-6)
#' 2. *Wang et al., 2018* - [article](https://genome.cshlp.org/content/early/2018/08/14/gr.237362.118)
#' 3. *Cristini et al., 2018* - [article](https://pubmed.ncbi.nlm.nih.gov/29742442/)
#'
#' The data were downloaded from the supplementary materials of each study
#' and processed using [custom R scripts](https://github.com/Bishop-Laboratory/RLBase-data/tree/main/scripts/rlbps/)
#' as part of the [RLBase-data](https://github.com/Bishop-Laboratory/RLBase-data) pipeline. This processing
#' involved normalization of mass-spec abundance calculations and the derivation of a "combined score"
#' for ranking all the proteins. 
#' 
#' ## Structure
#' 
#' | geneName | NADEL.2015 | WANG.2018 | CRISTINI.2018 | combinedScore |
#' | -------- | ---------- | --------- | ------------- | ------------- |
#' | DDX21    | 0.9        | 0         | 0.968         |  1.87         |
#' | DHX9     | 0.85       | 0.0635    | 0.831         |  1.74         |
#' | ...      | ...        | ...       | ...           |  ...          |
#' 
#' 
#' Columns:
#' 
#' * geneName
#'   - The official HGNC symbol of the RLBP
#' * NADEL.2015
#'   - Normalized abundance of protein from *Nadel et al., 2015*
#' * WANG.2018
#'   - Normalized abundance of protein from *Wang et al., 2018*
#' * CRISTINI.2018
#'   - Normalized abundance of protein from *Cristini et al., 2018*
#' * combinedScore
#'   - Sum of normalized abundance across studies.
#' 
#' @examples 
#' 
#' rlbpsData <- rlbps()
#' 
#' @export
rlbps <- function(quiet=FALSE) {
  geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
  eh <- AnnotationHub::query(geh(), "RLHub")
  title <- NULL
  ehid <- names(AnnotationHub::subset(eh, title == "R-loop Binding Proteins"))
  if (quiet) {
    suppressMessages(eh[[ehid]])
  } else {
    eh[[ehid]]
  }
}
