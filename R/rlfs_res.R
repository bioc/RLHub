#' RLFS-Test Results
#' 
#' A list containing the results of R-loop-forming sequences analysis ([RLSeq::analyzeRLFS()]) and
#' subsequent sample classification [RLSeq::predictCondition()] as "POS"
#' (robustly maps R-loops) or "NEG" (poorly maps R-loops) with all samples
#' in RLBase.
#' 
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A named `list`.
#' @details 
#' 
#' ## Source
#' 
#' R-loop-forming sequences were computationally predicted using [`QmRLFS-finder.py`](https://github.com/piroonj/QmRLFS-finder). The relevant section
#' of the RLBase data prep protocol can be found [here](https://github.com/Bishop-Laboratory/RLBase-data#generate-datasets).
#' Briefly, genomes available from UCSC were downloaded and analyzed with `QmRLFS-finder.py`
#' on default settings. The resulting RLFS ranges were converted to `.bed` format.
#' 
#' RLFS analysis (via [RLSeq::analyzeRLFS()]) implements permutation testing to calculate 
#' the enrichment of a query R-loop mapping peakset within the relevant RLFS ranges. This analysis produces
#' a p value and a Z-score distribution which are subsequently analyzed with 
#' [RLSeq::predictCondition()] (see [models]), yielding a quality prediction of "POS"
#' (robustly maps R-loops) or "NEG" (poorly maps R-loops). 
#' 
#' This approach was applied to every sample in RLBase (see [rlbase_samples]) to yield [rlfs_res].
#' 
#' ## Structure
#' 
#' `rlfs_res` is a named list where each name is the ID of a sample in RLBase (see [rlbase_samples]).
#' 
#' Each `list` item is itself a `list` comprising the following:
#' 
#' * `rlfsData` - A `list` with this structure:
#'   - `perTestResults` 
#'     * An object of the class `permTestResultsList` from `regioneR`.
#'     * Contains the results of permutation testing.
#'   - `Z-scores` 
#'     * An object of the class `localZScoreResultsList` from `regioneR`.
#'     * Contains the results of local Z-score analysis +/-5kb around each RLFS.
#' * `rlfsPred` - A `list` with this structure:
#'   - `Features`
#'     * A `tbl` containing the raw and transformed values of features used in [RLSeq::predictCondition()].
#'   - `Criteria`
#'     * A `list` containing the results of analyzing the four criteria which must all be `TRUE` for a prediction of "POS":
#'       - `PVal Significant` - The permutation test p value is < .05
#'       - `ZApex > 0` - The center of the Z-score distribution is > 0.
#'       - `ZApex > ZEdge` - The center of the Z-score distribution is > left edge and right edge.
#'       - `Predicted 'Case'` - The classifier predicted the "Case" label ("POS").
#'   - `prediction`
#'     * The final prediction: "POS" or "NEG"
#' 
#' @examples 
#' 
#' rlfsRes <- rlfs_res()
#' 
#' @export
rlfs_res <- function(quiet=FALSE) {
  geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
  eh <- AnnotationHub::query(geh(), "RLHub")
  title <- NULL
  ehid <- names(AnnotationHub::subset(eh, title == "RLFS-Test Results"))
  if (quiet) {
    suppressMessages(eh[[ehid]])
  } else {
    eh[[ehid]]
  }
}
