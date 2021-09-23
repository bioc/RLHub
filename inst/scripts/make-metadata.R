#' Creates the metadata for RLHub

meta <- data.frame(
  Title = c(
    "Genomic Annotations (hg38)",
    "Genomic Annotations (mm10)",
    "Gene Expression",
    "Feature Enrichment per Sample",
    "Feature Enrichment per RL-Region",
    "GS-Signal",
    "FFT-Model",
    "Feature-Prep Model",
    "RLFS-Test Results",
    "RLRegion Annotations",
    "RLRegion Metadata",
    "RLRegion Read Counts",
    "RLBase Sample Manifest"
  ),
  Description = c(
    paste0("Human genomic annotations curated for use with RLSuite."),
    paste0("Mouse genomic annotations curated for use with RLSuite."),
    paste0("Gene expression count tables from matched RNA-Seq experiments ",
           "corresponding to R-loop profiling. The counts, TPM, and VST-",
           "transformed counts are provided."),
    paste0("Genomic feature enrichment statistics for each peakset in RLBase."),
    paste0("Genomic feature enrichment statistics for the RL-Regions within RLBase."),
    paste0("Bin-level read counts for RLBase samples around R-loop sites ",
           "discovered using long-read SMRF-Seq (gold-standard sites)."),
    paste0("Stacked classifier for deciding whether samples successfully mapped",
           " R-loops."),
    paste0("Model for transforming dataset features prior to classification."),
    paste0("The results from RLFS (R-loop-forming sequences) analysis on all",
           " RLBase samples via the RLSeq package."),
    paste0("R-loop regions (rlregions) derived from S9.6-based and dRNH-based",
           " samples ('All' group), annotated with genomic features."),
    paste0("R-loop regions (rlregions) derived from S9.6-based and dRNH-based",
           " samples ('All' group), with descriptive metadata."),
    paste0("Read count tables from RLBase samples quantified across the ",
           "R-loop regions (rlregions) derived from both S9.6-based and",
           " dRNH-based samples ('All' group)."),
    paste0("The hand-curated manifest of all RLBase samples ",
           "with descriptive metadata and some sample-level analysis results.")
  ),
  BiocVersion = "3.14",
  Genome = c(
    "hg38",
    "mm10",
    rep("hg38", 11)
  ),
  SourceType = c(
    rep("Multiple", 2),
    "FASTQ",
    rep("Multiple", 8), 
    "BAM", 
    "XLS/XLSX"
  ),
  SourceUrl = "https://github.com/Bishop-Laboratory/RLBase-data",
  SourceVersion = "v1",
  Species = c(
    "Homo sapiens",
    "Mus musculus",
    rep("Homo sapiens", 11)
  ),
  TaxonomyId = c(
    9606,
    10090,
    rep(9606, 11)
  ),
  Coordinate_1_based = TRUE,
  DataProvider = "Multiple",
  Maintainer = "Henry Miller <millerh1@uthscsa.edu>",
  RDataClass = c(
    "list",
    "list",
    "SummarizedExperiment",
    "tbl",
    "tbl",
    "tbl",
    "caretStack",
    "preProcess",
    "list",
    "tbl",
    "tbl",
    "SummarizedExperiment",
    "tbl"
  ),
  DispatchClass = "Rda",
  Location_Prefix = "http://s3.amazonaws.com/experimenthub/",
  RDataPath = c(
    "RLHub/annotations_hg38.rda",
    "RLHub/annotations_mm10.rda",
    "RLHub/geneexp.rda",
    "RLHub/feature_enrichment_per_samples.rda",
    "RLHub/feature_enrichment_rlregions.rda",
    "RLHub/gsSignalRLBase.rda",
    "RLHub/fftModel.rda",
    "RLHub/prepFeatures.rda",
    "RLHub/rlfsres.rda",
    "RLHub/rlregions_annotations.rda",
    "RLHub/rlregions_table.rda",
    "RLHub/rlregions_counts.rda",
    "RLHub/rlsamples.rda"
  ),
  Tags = c(
    "annots_hg38",
    "annots_mm10",
    "gene_exp",
    "feat_enrich_samples",
    "feat_enrich_rlregions",
    "gs_signal",
    "fft_model",
    "prep_features",
    "rlfs_res",
    "rlregions_annot",
    "rlregions_meta",
    "rlregions_counts",
    "rlbase_samples"
  )
)

write.csv(meta, file="inst/extdata/metadata.csv", row.names=FALSE)

