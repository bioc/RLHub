#' Feature Enrichment
#' 
#' Feature Enrichment per RL-Region ([feat_enrich_rlregions]) and per Sample ([feat_enrich_samples]).
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A `tbl` object. See details.
#' @rdname featureEnrichment
#' @aliases feat_enrich_rlregions feat_enrich_samples
#' @details 
#' 
#' ## Source
#' 
#' For every R-loop-mapping sample in RLBase ([feat_enrich_samples]) or for
#' each of the three RL-Regions databases ([feat_enrich_rlregions]), 
#' peaks were calculated and then 
#' tested via [RLSeq::featureEnrich()] to determine enrichment within all
#' available genomic features.
#' 
#' The processing steps are described in the [RLBase-data](https://github.com/Bishop-Laboratory/RLBase-data) README.md.
#' 
#' ## Structure
#' 
#' Example data:
#' 
#' |db          |type        | num_total_peaks | num_tested_peaks| num_tested_anno_ranges| num_total_anno_ranges| avg_reldist_rl| avg_reldist_shuf| pval_reldist| stat_fisher_rl| pval_fisher_rl| stat_fisher_shuf| pval_fisher_shuf|experiment |
#' |:-----------|:-----------|----------------:|---------------:|----------------------:|---------------------:|--------------:|----------------:|------------:|--------------:|--------------:|----------------:|----------------:|:----------|
#' |Cohesin     |STAG1       |             9892|           10000|                   9935|                  9939|      0.2514476|        0.2480947|    0.0816731|       1.400271|      0.0477869|        0.6820876|        0.1303705|ERX2277510 |
#' |Cohesin     |STAG2       |            10613|           10000|                   9935|                 10696|      0.2432965|        0.2525422|    0.0002326|       1.945212|      0.0000159|        0.5382866|        0.0174814|ERX2277510 |
#' |CpG_Islands |CpG_Islands |            28189|           10000|                   9989|                 31144|      0.2190449|        0.2501005|    0.0000000|       5.332338|      0.0000000|        0.9855223|        0.9236551|ERX2277510 |
#' |... |... |            ...|           ...|                   ...|                 ...|      ...|        ...|    ...|       ...|      ...|        ...|        ...|... |
#' 
#' 
#' Column description:
#' * `db` - the database from which annotations were derived. See [annotations].
#' * `type` - the type from which annotations were derived. See [annotations].
#' * `num_tested_peaks`: The number of peak ranges tested for enrichment.
#' * `num_total_peaks`: The total number of peaks in the sample. 
#' * `num_tested_anno_ranges`: The number of annotation ranges which the peaks were tested against.
#' * `num_total_anno_ranges`: The total number of ranges in the annotation.
#' * `avg_reldist_rl`: The mean relative distances between peaks and annotation ranges as described [here](https://rnabioco.github.io/valr/reference/bed_reldist.html).
#' * `avg_reldist_shuf`: Same as `avg_reldist_rl` except with peaks shuffled randomly to provide a negative control.
#' * `pval_reldist`: The `ks.test` p value from comparing the distribution of the peak and shuffle relative distances as described [here](https://rnabioco.github.io/valr/articles/interval-stats.html). 
#' * `stat_fisher_rl`: The the odds ratio from the fisher's exact test as described [here](https://rnabioco.github.io/valr/reference/bed_fisher.html).
#' * `stat_fisher_shuf`: Same as above, but with the shuffled peaks to provide a negative control.
#' * `pval_fisher_rl`: The p value from Fisher's exact test as described [here](https://rnabioco.github.io/valr/reference/bed_fisher.html).
#' * `pval_fisher_shuf`: Same as above, but with the shuffled peaks to provide a negative control.
#' * `experiment` (only `feat_enrich_samples()`): The R-loop mapping sample for which the calculation was performed. See [rlbase_samples].
#' * `opt` (only `feat_enrich_rlregions()`): The type of RL-Region (see [rlregions]) which was tested.
#' 
#' @examples 
#' 
#' fes <- feat_enrich_samples()
#' 
#' fes <- feat_enrich_rlregions()
#' 
#' @export
feat_enrich_samples <- function(quiet=FALSE) {
  geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
  eh <- AnnotationHub::query(geh(), "RLHub")
  title <- NULL
  ehid <- names(AnnotationHub::subset(eh, title == "Feature Enrichment per Sample"))
  if (quiet) {
    suppressMessages(eh[[ehid]])
  } else {
    eh[[ehid]]
  }
}


#' @rdname featureEnrichment
#' @export
feat_enrich_rlregions <- function(quiet=FALSE) {
  geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
  eh <- AnnotationHub::query(geh(), "RLHub")
  title <- NULL
  ehid <- names(AnnotationHub::subset(eh, title == "Feature Enrichment per RL-Region"))
  if (quiet) {
    suppressMessages(eh[[ehid]])
  } else {
    eh[[ehid]]
  }
}

