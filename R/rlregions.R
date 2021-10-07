#' R-loop Regions
#'
#' R-loop regions (RL regions) are consensus sites of R-loop formation derived
#' from a meta-analysis of the R-loop mapping experiments in RLBase. RLHub includes
#' information about these regions ([rlregions_meta]), the overlap of genomic
#' features with RL regions ([rlregions_annot]), and the read count matrices
#' for each sample in RLBase within each RL region ([rlregions_counts]).
#'
#' @aliases rlregions rlregions_annot rlregions_meta rlregions_counts
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A list of `tbl` objects. See details.
#' @rdname rlregions
#' @details
#'
#' R-loop regions (RL regions) are consensus sites of R-loop formation derived
#' from a meta-analysis of the R-loop mapping experiments in RLBase. In `RLHub`,
#' we provide access to:
#'
#' * [rlregions_meta] - The metadata describing these RL regions.
#' * [rlregions_annot] - RL regions overlapped with genome features (see [annotations]).
#' * [rlregions_counts] - RL region read counts across RLBase samples.
#'
#' # Source
#'
#' ## RL Regions - [rlregions_meta]
#'
#' RL Regions were derived during [this](https://github.com/Bishop-Laboratory/RLBase-data#get-r-loop-consensus)
#' step of the RLBase-data [protocol](https://github.com/Bishop-Laboratory/RLBase-data).
#'
#' Here is a brief summary of the key processing steps.
#'
#' 1. Human RLBase samples which were labeled as "POS", classified as "POS" (see [rlfs_res]), and which
#'    have at least 5000 peaks were selected.
#' 2. Then, these peaks were then randomly downsampled to 5000 ranges each and aggregated.
#' 3. Then, the hg38 genome was binned into 10bp bins and the number of aggregated peaks was
#'    overlapped with each bin and counted, producing a bedGraph.
#' 4. Then, macs3 was implemented to call peaks on the bedGraph file.
#' 5. Finally, the resulting ranges were combined to create summary ranges.
#'
#' **Note**: steps 2-4 were performed separately on datasets from dRNH (catalytically-dead RNaseH1) R-loop mapping experiments
#' and S9.6-based experiments due to the noted differences in R-loop mapping between these modalities. In step 5, they were combined to
#' create summary ranges, and the original source (dRNH or S9.6) was noted in the resulting metadata.
#'
#' ## RL Regions anno - [rlregions_annot]
#'
#' Once RL regions were generated, they were overlapped with the annotations found in [RLHub::annots_full_hg38()].
#' This was done separately for dRNH-derived, S9.6-derived, and combined RL regions.
#'
#' ## RL Regions Counts - [rlregions_counts]
#'
#' Once RL regions were generated, [Rsubread::featureCounts()] was used to count
#' the number of overlapping reads from the `.bam` alignment files for each
#' sample in RLBase ([rlbase_samples]) within each RL region (only "combined" regions used).
#'
#' These data were then VST-transformed and TPM was also calculated.
#'
#' # Structure
#'
#' ## RL Regions - [rlregions_meta]
#'
#' `rlregions_meta()` is a `tbl` with the following structure:
#'
#' |rlregion    |location                  |is_rlfs |source   | confidence_level| medSignalVal|  medPVal|  medQVal| avgSignalVal|   avgPVal|  avgQVal| numPeaks| nSamples| nStudies| nModes| nTissues|ip_types               | nIPTypes| pct_case| avgNumPeaks| medNumPeaks|geneIDs |allGenes |mainGenes |is_repeat |
#' |:-----------|:-------------------------|:-------|:--------|----------------:|------------:|--------:|--------:|------------:|---------:|--------:|--------:|--------:|--------:|------:|--------:|:----------------------|--------:|--------:|-----------:|-----------:|:-------|:--------|:---------|:---------|
#' |All_RL64926 |chrM:0-16569:.            |TRUE    |dRNH S96 |            53.21|     1.962881| 20.92420| 17.01782|     2.563848| 653.89461| 649.8001|    52373|      298|       44|     16|       36|S9.6,dRNH,RNA-m6A,None |        4| 75.16779|    80117.79|       45063|NA      |NA       |NA        |TRUE      |
#' |All_RL19159 |chr5:49656610-49661950:.  |FALSE   |dRNH S96 |            36.55|     2.826610| 19.16160| 15.24025|     3.282115| 108.41481| 104.6716|   107393|      261|       43|     15|       34|S9.6,RNA-m6A,None,dRNH |        4| 77.01149|    73058.96|       43815|NA      |NA       |NA        |TRUE      |
#' |All_RL50251 |chr16:46386300-46391280:. |FALSE   |dRNH S96 |            31.68|     3.258560| 25.21965| 21.00418|     3.428755|  87.33233|  83.3639|   133750|      243|       43|     16|       33|RNA-m6A,S9.6,dRNH,None |        4| 76.13169|    65721.60|       38878|NA      |NA       |NA        |TRUE      |
#' |... |... |...   |... |            ...|     ...| ...| ...|     ...|  ...|  ...|   ...|      ...|       ...|     ...|       ...|... |        ...| ...|    ...|       ...|...      |...       |...        |...      |
#'
#'
#' Column description:
#'
#' * `rlregion` - The ID of the RL Region.
#' * `location` - The location of the RL Region. This column follows the pattern "chrom:start-stop:strand"
#' * `is_rlfs` - Logical indicating whether the RL region overlaps with an R-loop forming sequence.
#' * `source` - Indicates whether the RL region was discovered from catalytically-dead RNaseH1-based mapping (`dRNH`), S9.6-based mapping (`S96`), or both (`dRNH S96`).
#' * `conservation_score` - The percent of samples in which this range was found (calculated separately for `dRNH` and `S96` sites and then averaged together for sites from `dRNH S96` source).
#' * `medSignalVal` - The median broadPeak "signalVal" (see [UCSC specification](https://genome.ucsc.edu/FAQ/FAQformat.html#format13)) of sample peaks in the RL region.
#' * `medPVal` - The median broadPeak -log10 pval (see [UCSC specification](https://genome.ucsc.edu/FAQ/FAQformat.html#format13)) of sample peaks in the RL region.
#' * `medQVal` - The median broadPeak -log10 qval (adjusted pval) (see [UCSC specification](https://genome.ucsc.edu/FAQ/FAQformat.html#format13)) of sample peaks in the RL region.
#' * `avgSignalVal/avgPVal/avgQVal` - same as above, but with mean instead of median.
#' * `medNumPeaks` - The median number of peaks for samples which overlapped with this RL Region.
#' * `avgNumPeaks` - Same as above with mean instead of median.
#' * `nSamples` - The number of samples which overlap with this peak.
#' * `nModes` - The number of different R-loop mapping methods in which this RL region was found.
#' * `nTissues` - The number of different tissues in which this RL region was found.
#' * `ip_types` - The "IP types" (S9.6, dRNH, or None) in which this RL Region was found.
#' * `nIPType` - The number of different "IP types" in which this RL region was found.
#' * `pct_case` - The percentage of samples which overlapped with this RL region that were predicted "POS" by [RLSeq::predictCondition()].
#' * `geneIDs` - The IDs of all genes overlapping with this RL Region.
#' * `allGenes` - The Gene Symbols of all genes overlapping with this RL Region.
#' * `mainGenes` - The Gene Symbols of all genes (which appear in pathway databases) overlapping with this RL Region.
#' * `is_repeat` - A logical indicating whether the RL Region occurs in a repetitive genomic region as determined by repeat masker (and also peri-centromeric regions were included.)
#' * `confidence_score` - A confidence score for ranking RL Regions.
#'   - **Method**:
#'     * **Summary**: `confidence_score` is the geometric mean of features
#'      relevant to RL Region robustness with a penalty for
#'      regions found only in `dRNH` and `S96` alone.
#'     * **Calculation**: The `confidence_score` is calculated as following: `C = m * (cons * ns * mq * ms)^(1/4)`; where
#'     `m` is a penalty (of `1.25` weight) for RL Regions not found in both `S96` and `dRNH` sets. `cons` is
#'     the standardized log2 transform of the `conservation score`. `ns` is the standardization of the
#'     `nSamples` column. `mq` is the standardized log2 transform of the `medQVal` column.
#'     `ms` is the standardized log2 transform of the `medSignalVal` column.
#' * `corr(R/PVal/PAdj)` - Results of correlation analysis between R-loop abundance and
#' expression within each RL Region. (see also [gene_exp])
#'   - **Method**: R-loop alignment files were summarized within RL Regions to
#'     make a count matrix, which was then `log2(tpm + 1)` normalized. Then, the expression
#'     `log2(tpm + 1)` matrix was summarized to the RL Regions level as the mean
#'     expression of genes overlapping with the R-loop. Then, R-loop and
#'     expression samples were paired based on the study of origin, sample
#'      condition, and other factors (73 sample pairs in total)
#'     (see the description of the `exp_matchCond` column in [rlbase_samples]).
#'     Within each pairing, there were some many-to-many mappings between R-loop
#'     and expression samples, due to multiple samples having the same `exp_matchCond`.
#'     In these cases, RL region expression and R-loop abundance was summarized
#'     as the mean across redundant samples. Finally, the Spearman correlation
#'     between R-loop abundance and expression was calculated within each
#'     R-loop region (see [cor.test]), yielding `Rho` and the `p.value`.
#'     See also the relevant processing script (`buildExpression.R`) from the
#'      [RLBase-data repo](https://github.com/Bishop-Laboratory/RLBase-data/blob/main/scripts/buildExpression.R#L145-L219).
#'   - `corrR` -  Spearman's Rho for the correlation between expression and R-loop
#'   abundance within each RL Region (see [gene_exp]).
#'   - `corrPVal` - The pvalue from running `cor.test` as described above.
#'   - `corrPAdj` - The result of multiple testing correction on `corrPVal`
#'   using `p.adjust` with default arguments. (See also [p.adjust])
#'
#'
#' ## RL Regions anno - [rlregions_annot]
#'
#' `rlregions_annot()` is a `tbl` with the following structure:
#'
#' |rlregion   |annotation                          |
#' |:----------|:-----------------------------------|
#' |All_RL4615 |CNA__3__4                           |
#' |All_RL4615 |CNA__1__8                           |
#' |All_RL4615 |G4Qexp__G4Q_PDS_NaK_GSE63874__95848 |
#' |...        |...                                 |
#'
#' Column description:
#'
#' * `rlregion` - The RL Region ID corresponding to the [rlregions_meta] table.
#' * `annotation` - The annotation which overlaps with the query RL region. Annotation
#' names follow the convention "DataBase__Type__ID" (see also [annotations]).
#'
#' ## RL Regions Counts - [rlregions_counts]
#'
#' `rlregions_counts()` is a `SummarizedExperiment` with the following structure:
#'
#' * `dim`: 64418 532
#' * `assays`
#'   - `cts` - Raw read counts of each RLBase sample within each RL Region.
#'   - `tpm` - The TPM normalization of `cts`
#'   - `vst` - The VST transform of `cts` (see also [DESeq2::vst()]).
#' * `colData` - A `DataFrame` with structure:
#'
#' |experiment |label |strand_specific |paired_end |mode   |prediction |discarded | numPeaks|bam                                                                       |bam_avail |
#' |:----------|:-----|:---------------|:----------|:------|:----------|:---------|--------:|:-------------------------------------------------------------------------|:---------|
#' |SRX113814  |POS   |FALSE           |FALSE      |DRIVE  |NEG        |TRUE      |      337|../RLBase-data/rlbase-data/rlpipes-out/bam/SRX113814/SRX113814_hg38.bam   |TRUE      |
#' |SRX113812  |POS   |FALSE           |FALSE      |DRIP   |NEG        |TRUE      |       78|../RLBase-data/rlbase-data/rlpipes-out/bam/SRX113812/SRX113812_hg38.bam   |TRUE      |
#' |SRX2675003 |POS   |TRUE            |FALSE      |R-ChIP |POS        |FALSE     |    10331|../RLBase-data/rlbase-data/rlpipes-out/bam/SRX2675003/SRX2675003_hg38.bam |TRUE      |
#' |... |...   |...            |...      |... |...        |...     |    ...|... |...      |
#'
#' Column description:
#'
#' * `experiment` - The RLBase sample ID
#' * `label` - The label provided by the data submitters ("POS" or "NEG")
#' * `strand_specific` - A logical indicating whether the data is stranded or not.
#' * `paired_end` - A logical indicating whether the data is paired-end or not.
#' * `prediction` - The predicted label from [RLSeq::predictCondition()]. Can be "POS" or "NEG".
#' * `discarded` - A logical indicating whether the sample was discarded during model building due to a mismatch with its label.
#' * `numPeaks` - The number of peaks called from this sample.
#' * `bam` - The relative path of the bam file for this sample.
#' * `bam_avail` - A logical indicating whether the bam file was available.
#'
#'
#' @examples
#'
#' rlregions <- rlregions_meta()
#'
#' rlregionsAnno <- rlregions_annot()
#'
#' rlregionsCounts <- rlregions_counts()
#' @export
rlregions_annot <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "RLRegion Annotations"))
    eh[[ehid, verbose = !quiet]]
}

#' @rdname rlregions
#' @export
rlregions_meta <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "RLRegion Metadata"))
    eh[[ehid, verbose = !quiet]]
}

#' @rdname rlregions
#' @export
rlregions_counts <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "RLRegion Read Counts"))
    eh[[ehid, verbose = !quiet]]
}
