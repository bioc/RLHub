#' RLBase Sample Manifest
#'
#' A `tbl` containing metadata about each sample in RLBase.
#'
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A `tbl`.
#' @details
#'
#' ## Source
#'
#' RLBase samples were curated by hand in Excel from searching keywords such as "R-loops"
#' and "RNA:DNA hybrids" in GEO, SRA, and PubMed. Where R-loop mapping data
#' was publically available, entries were added to the Excel spreadsheet such that
#' every sample (SRX.../ERX.../GSM...) had it's own line. Information was noted for each
#' sample, such as the "mode" (the type of R-loop mapping it was) and the "Condition"
#' (e.g., "RNaseH1", "WKKD", etc). When genomic input controls were available, they
#' were manually matched to the experimental samples for which they could serve as a
#' background control during peak calling.
#'
#' The up-to-date excel sheet is found [here](https://github.com/Bishop-Laboratory/RLBase-data/blob/main/rlbase-data/rlbase_catalog.xlsx).
#'
#' Throughout the process of analyzing the data (see [RLBase-data](https://github.com/Bishop-Laboratory/RLBase-data)), additional
#' metadata was added to the sample sheet (see structure for full account).
#'
#' ## Structure
#'
#' `rlbase_samples` is a `tbl` with the structure:
#'
#' |rlsample   |label |condition |mode  |lab         |tissue |genotype |other |     PMID|group |family |ip_type |strand_specific |moeity |bisulfite_seq |file_type |experiment_original |control_original |study     |name                                                  |paired_end | read_length|control | eff_genome_size|genome |prediction |discarded | numPeaks|expsamples            |exp_matchCond       |coverage_s3                 |peaks_s3                        |fastq_stats_s3                                |bam_stats_s3                             |report_html_s3               |rlranges_rds_s3              |rlfs_rda_s3                       |
#' |:----------|:-----|:---------|:-----|:-----------|:------|:--------|:-----|--------:|:-----|:------|:-------|:---------------|:------|:-------------|:---------|:-------------------|:----------------|:---------|:-----------------------------------------------------|:----------|-----------:|:-------|---------------:|:------|:----------|:---------|--------:|:---------------------|:-------------------|:---------------------------|:-------------------------------|:---------------------------------------------|:----------------------------------------|:----------------------------|:----------------------------|:---------------------------------|
#' |SRX1070676 |POS   |S96       |DRIPc |Fred Chedin |NT2    |WT       |NT    | 27373332|rl    |DRIP   |S9.6    |TRUE            |RNA    |FALSE         |public    |GSM1720613          |NA               |SRP059800 |GSM1720613: NT2 DRIPc-seq, rep 1; Homo sapiens; OTHER |FALSE      |          50|NA      |      2706186140|hg38   |POS        |FALSE     |    34092|SRX1070685,SRX1070686 |WT_NT_SRP059800_NT2 |coverage/SRX1070676_hg38.bw |peaks/SRX1070676_hg38.broadPeak |fastq_stats/SRX1070676_hg38__fastq_stats.json |bam_stats/SRX1070676_hg38__bam_stats.txt |reports/SRX1070676_hg38.html |rlranges/SRX1070676_hg38.rds |rlfs_rda/SRX1070676_hg38.rlfs.rda |
#' |SRX1070677 |POS   |S96       |DRIPc |Fred Chedin |NT2    |WT       |NT    | 27373332|rl    |DRIP   |S9.6    |TRUE            |RNA    |FALSE         |public    |GSM1720614          |NA               |SRP059800 |GSM1720614: NT2 DRIPc-seq, rep 2; Homo sapiens; OTHER |FALSE      |          50|NA      |      2706186140|hg38   |POS        |FALSE     |    22117|SRX1070685,SRX1070686 |WT_NT_SRP059800_NT2 |coverage/SRX1070677_hg38.bw |peaks/SRX1070677_hg38.broadPeak |fastq_stats/SRX1070677_hg38__fastq_stats.json |bam_stats/SRX1070677_hg38__bam_stats.txt |reports/SRX1070677_hg38.html |rlranges/SRX1070677_hg38.rds |rlfs_rda/SRX1070677_hg38.rlfs.rda |
#' |SRX1070678 |POS   |S96       |DRIP  |Fred Chedin |NT2    |WT       |NT    | 27373332|rl    |DRIP   |S9.6    |FALSE           |DNA    |FALSE         |public    |GSM1720615          |NA               |SRP059800 |GSM1720615: NT2 DRIP-seq, 1; Homo sapiens; OTHER      |FALSE      |          50|NA      |      2706186140|hg38   |POS        |FALSE     |    73924|SRX1070685,SRX1070686 |WT_NT_SRP059800_NT2 |coverage/SRX1070678_hg38.bw |peaks/SRX1070678_hg38.broadPeak |fastq_stats/SRX1070678_hg38__fastq_stats.json |bam_stats/SRX1070678_hg38__bam_stats.txt |reports/SRX1070678_hg38.html |rlranges/SRX1070678_hg38.rds |rlfs_rda/SRX1070678_hg38.rlfs.rda |
#' |... |...   |...       |...  |... |...    |...       |...    | ...|...    |...   |...    |...           |...    |...         |...    |...          |...               |... |...     |...      |          ...|...      |      ...|...   |...        |...     |    ...|... |... |... |... |... |... |... |... |... |
#'
#' Column description:
#'
#' * `rlsample` - The unique ID of the sample, same as in the [SRA](https://www.ncbi.nlm.nih.gov/sra).
#' * `label` - Label corresponding to the author-supplied condition of the sample. "POS" indicates the sample should robustly map R-loops, "NEG" indicates the opposite.
#' * `condition` - The specific condition for each sample.
#' * `mode` - The type of R-loop mapping for each sample.
#' * `lab` - The senior author on the publication from which the data was provided.
#' * `tissue` - The tissue condition for the sample.
#' * `genotype` - The sample's genotype.
#' * `other` - A column for other pertinent metadata provided by the authors.
#' * `PMID` - The PMID associated with the sample
#' * `group` - One of "rl" (R-loop mapping) or "exp" (Expression data/RNA-Seq).
#' * `family` - The family of the "mode" (e.g., "DRIP" includes "sDRIP", "DRIPc", "qDRIP", etc)
#' * `ip_type` - The IP type of the "mode" for each sample. One of "S9.6", "dRNH" (dead RNaseH1), or "None".
#' * `strand_specific` - Whether the sample is stranded.
#' * `moeity` - The moeity which was IP'd (if applicable)
#' * `bisulfite_seq` - Whether the data uses bisulfite conversion sequencing (e.g., "BisDRIP-Seq" samples)
#' * `file_type` - The type of data (always "public" for RLBase samples).
#' * `experiment_original` - The original name of this sample as entered by hand in the curated Excel spreadsheet (usually converted from GSM to SRX).
#' * `control_original` - Same as above for the accompanying control sample (if applicable.)
#' * `study` - The SRA study accession for this sample.
#' * `name` - The sample's name as entered in SRA.
#' * `paired_end` - A logical indicating whether the data is paired end.
#' * `read_length` - The read length for the sample.
#' * `control` - The RLBase ID of the genomic input control sample corresponding to this sample (if applicable)
#' * `eff_genome_size` - The effective genome size based on read length and genome (calculated with the `khmer` package) see relevant portion of RLBase-data protocol [here](https://github.com/Bishop-Laboratory/RLBase-data#preliminary).
#' * `genome` - The UCSC genome ID for this sample.
#' * `prediction` - The prediction from running [RLSeq::predictCondition()].
#' * `discarded` - A logical indicating whether this sample was discarded during model building for a mismatch with its "label" (see [models]).
#' * `numPeaks` - The number of peaks called for this sample.
#' * `expsamples` - The IDs of any corresponding expression samples.
#' * `exp_matchCond` - The meta data used to match this sample to any corresponding expression samples (if applicable).
#'   - **Method**: Some R-loop mapping studies also had matched RNA-Seq data. In these cases,
#'   they were also recorded with the same metadata (where applicable) as R-loop mapping samples. To match expression and R-loop samples,
#'   the `study`, `tissue`, `genotype`, and `other` columns were compared iteratively for each R-loop sample. If all four
#'   were a match with at least one expression samples, then those four columns would be assigned as the `exp_matchCond`. If only
#'   three were available, then they would become the `exp_matchCond`. To see the order in which columns were checked
#'   for possible matches, view the `buildExpression.R` script in the
#'    [RLBase-data repo](https://github.com/Bishop-Laboratory/RLBase-data/blob/main/scripts/buildExpression.R#L25-L32).
#'    See also the section on `corr(R/PVal/PAdj)` column in [rlregions].
#' * `coverage_s3` - The location of the coverage tracks (`.bw`) in the AWS S3 bucket for RLBase data ('s3://rlbase_data/').
#' * `peaks_s3` - Same as above for peak files (`.broadPeak`)
#' * `fastq_stats_s3` - Same as above for fastq QC statistics data (`.json`).
#' * `bam_stats_s3` - Same as above for BAM QC statistics data (`.txt`).
#' * `report_html_s3` - Same as above for reports from [RLSeq::report()] (`.html`).
#' * `rlranges_rds_s3` - Same as above for RLRanges R objects, as in [RLSeq::RLRanges()] (`.rds`)
#' * `rlfs_rda_s3` - Same as above for [rlfs_res] objects generated by [RLSeq::analyzeRLFS()] (`.rda`).
#'
#' @examples
#'
#' rlsamples <- rlbase_samples()
#' @export
rlbase_samples <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "RLBase Sample Manifest"))
    eh[[ehid, verbose = !quiet]]
}
