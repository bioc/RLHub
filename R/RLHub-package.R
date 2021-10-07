#' Accessing RLHub data
#'
#' RLHub provides convenient access point to the processed datasets available
#' within RLBase. In this document, we list the available accessor functions
#' which streamline access to the data.
#'
#' The RLHub package provides a useful interface to the data stored within the
#' "RLHub" ExperimentHub database. The full manifest of available data is found
#' here:
#'
#' |Title                              |Accessor                |Description                                                                                                                                                |
#' |:----------------------------------|:-----------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------|
#' |Primary Genomic Annotations (hg38) |[annots_primary_hg38]   |Primary Human genomic annotations curated for use with RLSuite.                                                                                            |
#' |Primary Genomic Annotations (mm10) |[annots_primary_mm10]   |Primary Mouse genomic annotations curated for use with RLSuite.                                                                                            |
#' |Full Genomic Annotations (hg38)    |[annots_full_hg38]      |Full Human genomic annotations curated for use with RLSuite.                                                                                               |
#' |Full Genomic Annotations (mm10)    |[annots_full_mm10]      |Full Mouse genomic annotations curated for use with RLSuite.                                                                                               |
#' |R-loop Binding Proteins            |[rlbps]                 |R-loop-binding proteins discovered from mass-spec studies.                                                                                                 |
#' |Gene Expression                    |[gene_exp]              |Gene expression count tables from matched RNA-Seq experiments corresponding to R-loop profiling. The counts, TPM, and VST-transformed counts are provided. |
#' |Feature Enrichment per Sample      |[feat_enrich_samples]   |Genomic feature enrichment stats for each peakset in RLBase.                                                                                               |
#' |Feature Enrichment per RL-Region   |[feat_enrich_rlregions] |Genomic feature enrichment stats for the RL-Regions in RLBase.                                                                                             |
#' |GS-Signal                          |[gs_signal]             |Bin-level read counts for RLBase samples around R-loop sites discovered using long-read SMRF-Seq (gold-standard sites).                                    |
#' |FFT-Model                          |[fft_model]             |Stacked classifier for deciding whether samples successfully mapped R-loops.                                                                               |
#' |Feature-Prep Model                 |[prep_features]         |Model for transforming dataset features prior to classification.                                                                                           |
#' |RLFS-Test Results                  |[rlfs_res]              |The results from RLFS (R-loop-forming sequences) analysis on all RLBase samples via the RLSeq package.                                                     |
#' |RLRegion Annotations               |[rlregions_annot]       |R-loop regions (rlregions) derived from S9.6-based and dRNH-based samples ('All' group), annotated with genomic features.                                  |
#' |RLRegion Metadata                  |[rlregions_meta]        |R-loop regions (rlregions) derived from S9.6-based and dRNH-based samples ('All' group), with descriptive metadata.                                        |
#' |RLRegion Read Counts               |[rlregions_counts]      |Read count tables from RLBase samples quantified across the R-loop regions (rlregions) derived from both S9.6-based and dRNH-based samples ('All' group).  |
#' |RLBase Sample Manifest             |[rlbase_samples]        |The hand-curated manifest of all RLBase samples with descriptive metadata and some sample-level analysis results.                                          |
#'
#'
#' @aliases RLHub-package RLHub
#' @import ExperimentHub
#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL
