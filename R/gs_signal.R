#' GS-Signal
#' 
#' A `tbl` containing the coverage from every human sample in RLBase around 
#' "gold-standard" R-loop sites.
#' 
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A `tbl` object. See details.
#' @details 
#' 
#' ## Source
#' 
#' Gold-standard R-loop sites are those which were profiled with ultra-long-read 
#' R-loop sequencing (SMRF-Seq) as described in [*Malig et al., 2021.*](https://pubmed.ncbi.nlm.nih.gov/32105733/). 
#' A [bed file](https://rlbase-data.s3.amazonaws.com/misc/correlation_genes_100kb.bed)
#' containing these sites was derived and lifted to hg38. Sites were then 
#' extended by 100kb bi-directionally and then binned into 1kb bins. 
#' 
#' For each sample in RLBase, coverage tracks were calculated from alignments
#' using [`RLPipes`](https://github.com/Bishop-Laboratory/RLPipes). Then, coverage
#' tracks were summed within each of the 1kb bins using `deepTools` and wrangled
#' into a `tbl`.
#' 
#' The processing steps are described in the [RLBase-data](https://github.com/Bishop-Laboratory/RLBase-data) README.md.
#' 
#' These data are used by [RLSeq::corrAnalyze()] to determine how well a query sample 
#' correlates with the samples in RLBase.
#' 
#' ## Structure
#' 
#' Sample of data:
#' 
#' |location               | ERX2277510| ERX2277511| ERX3974959| ...|
#' |:----------------------|----------:|----------:|----------:|---:|
#' |chr1_67636071_67637071 |         23|         22|         93| ...|
#' |chr1_67637071_67638071 |         44|         39|         84| ...|
#' |chr1_67638071_67639071 |         26|         30|        100| ...|
#' |...                    |        ...|        ...|        ...| ...|
#' 
#' 
#' Column desc:
#' 
#' * `location` - 1kb bins within "gold-standard" R-loop regions profiled with ultra-long-read R-loop sequencing (SMRF-Seq).
#' * `ERX.../SRX...` - Columns corresponding to RLBase samples (see [rlbase_samples]). For each sample, the total coverage (bigWig file) within the range is shown.
#' 
#' @examples 
#' 
#' gss <- gs_signal()
#' 
#' @export
gs_signal <- function(quiet=FALSE) {
  geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
  eh <- AnnotationHub::query(geh(), "RLHub")
  title <- NULL
  ehid <- names(AnnotationHub::subset(eh, title == "GS-Signal"))
  if (quiet) {
    suppressMessages(eh[[ehid]])
  } else {
    eh[[ehid]]
  }
}
