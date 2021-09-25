#' Accessing RLHub data
#'
#' RLHub is a convenient access point to the processed datasets available
#' within RLBase. In this document, we list the availabl accessor functions
#' which streamline access to the data.
#'
#' The RLHub package provides a useful interface to the data stored within the
#' "RLHub" ExperimentHub database. The full manifest of available data is found
#' here:
#'
#' \code{system.file("extdata", "metadata.csv", package = "RLHub")}
#'
#' @aliases RLHub-pacage annots_full_hg38 annots_full_mm10 annots_primary_hg38
#' annots_primary_mm10 feat_enrich_rlregions feat_enrich_samples fft_model
#' gene_exp gs_signal prep_features rlbase_samples rlbps rlfs_res
#' rlregions_annot rlregions_counts rlregions_meta
#' @examples
#' 
#' ## Access data-sets ##
#'
#' # Manifest of samples in RLBase
#' dat <- rlbase_samples()
#'
#' # Full hg38 annotations
#' dat <- annots_full_hg38()
#'
#' # Full mm10 annotations
#' dat <- annots_full_mm10()
#'
#' # Primary hg38 annotations
#' dat <- annots_primary_hg38()
#'
#' # Primary mm10 annotations
#' dat <- annots_primary_mm10()
#'
#' # Feature enrichment of RLRegions
#' dat <- feat_enrich_rlregions()
#'
#' # Feature enrichment of RLBase samples
#' dat <- feat_enrich_samples()
#'
#' # FFT-based sample classifier model
#' dat <- fft_model()
#'
#' # Feature transformer for fft_model()
#' dat <- prep_features()
#'
#' # Gene expression results from RLBase
#' dat <- gene_exp()
#'
#' # "Gold-standard" R-loop signal for samples in RLBase
#' dat <- gs_signal()
#'
#' # R-loop binding proteins data
#' dat <- rlbps()
#'
#' # Results of RLFS analysis from RLBase
#' dat <- rlfs_res()
#'
#' # R-loop regions, annotated for hg38 features
#' dat <- rlregions_annot()
#'
#' # R-loop regions, with read counts (as a summarized experiment)
#' dat <- rlregions_counts()
#'
#' # R-loop regions, metadata
#' dat <- rlregions_meta()
#' 
#' @import ExperimentHub
#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL
