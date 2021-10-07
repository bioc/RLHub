#' Gene Expression
#'
#' A `SummarizedExperiment` containing the gene expression results from RNA-Seq
#' data sets published in tandem with R-loop-mapping data sets.
#'
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A `SummarizedExperiment` object. See details.
#' @details
#'
#' ## Source
#'
#' For each R-loop-mapping data set in RLBase, any associated RNA-Sequencing data
#' was also downloaded and quantified using `salmon v1.4.0`. This enables comparison
#' of R-loop abundance and gene expression. The list of SRA accessions from which
#' data was obtained are found here: `colData(gene_exp())$sample`.
#'
#' The processing steps are described in the [RLBase-data](https://github.com/Bishop-Laboratory/RLBase-data) README.md.
#'
#' ## Structure
#'
#' * colData
#'   - Contains metadata about every sample matching the metadata. See [rlbase_samples] for a full description.
#' * assays
#'   - A `SimpleAssays` object containing three matrices (genes X samples):
#'     * `cts` - Raw read counts
#'     * `tpm` - TPM-normalized read counts
#'     * `vst` - VST-transformed read counts. (See [DESeq2::vst()])
#'
#' @examples
#'
#' geneExp <- gene_exp()
#' @export
gene_exp <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "Gene Expression"))
    eh[[ehid, verbose = !quiet]]
}
