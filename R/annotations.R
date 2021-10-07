#' Annotations
#'
#' Genomic features relevant to R-loops. Both mm10 and
#' hg38 annotations are available.
#'
#' @aliases annotations annots_primary_hg38 annots_primary_mm10 annots_full_hg38 annots_full_mm10
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A list of `tbl` objects. See details.
#' @rdname annotations
#' @details
#'
#' The `list` contains `tbl` objects (tidyverse-style data frames) containing
#' annotations as genomic ranges. The **primary** annotations (e.g.,
#' `annots_primary_hg38()`) are an abbreviated
#' version of the **full** annotations (e.g., `annots_full_hg38()`). See the
#' description below for further details:
#'
#' ## Databases available
#'
#' This section details the annotation databases which are available in RLHub. See the succeeding
#' section ("Objects available based on accessor") for a list of which databases
#' are available within each function. All processing was performed using
#' [this script](https://github.com/Bishop-Laboratory/RLBase-data/blob/e63707e9e4dece5b2c007bd4284975be4998dfd4/scripts/getGenomicFeatures.R)
#' as part of the [RLBase-data](https://github.com/Bishop-Laboratory/RLBase-data) processing protocol.
#'
#' * **Centromeres**
#'   - Description: Centromere locations within the genome.
#'   - Source: UCSC table [centromeres](https://genome.ucsc.edu/cgi-bin/hgTables?db=hg38&hgta_group=map&hgta_track=centromeres&hgta_table=centromeres&hgta_doSchema=describe+table+schema).
#' * **CNA**
#'   - Description: Copy-number alterations found in inherited disorder cell lines. See source for full description. CNV states (0-4)
#'     are represented in the data as separate types. For example, Deep deletion (0) sites are accessed with `annots_full_hg38()$CNA__0`.
#'   - Source:  UCSC table [coriellDelDup](https://genome.ucsc.edu/cgi-bin/hgTables?db=hg38&hgta_group=phenDis&hgta_track=coriellDelDup&hgta_table=coriellDelDup&hgta_doSchema=describe+table+schema).
#' * **Cohesin**
#'   - Description: This database contains manually-curated STAG2 and STAG1 ChIP-Seq data reprocessed by the RLHub authors to find
#'     consensus STAG1 and STAG2 sites between cell lines (using \href{https://github.com/rhysnewell/ChIP-R}{chip-r}.)
#'   - Source: processed data source *[Pan et al](https://academic.oup.com/nar/article/48/10/5639/5827199)* and processed
#'     further as part of the RLBase-data pipeline [here](https://github.com/Bishop-Laboratory/RLBase-data/tree/e63707e9e4dece5b2c007bd4284975be4998dfd4).
#' * **CpG_Islands**:
#'   - Description: CpG island predicted locations throughout the genome.
#'   - Source: UCSC table [cpgIslandExt](http://genome.ucsc.edu/cgi-bin/hgTables?hgta_doSchemaDb=hg38&hgta_doSchemaTable=cpgIslandExt).
#' * **Encode_CREs**:
#'   - Description: The UCSC Encode_CREs table contains putative promoter-like ("prom"), promoter-enhancer-like ("enhP"),
#'     distal-enhancer-like ("enhD"), H3K4me3 ("K4me3"), and CTCF ("CTCF") chromatin states across the genome.
#'   - Source: UCSC table [encodeCcreCombined](https://genome.ucsc.edu/cgi-bin/hgTables?db=hg38&hgta_group=regulation&hgta_track=encodeCcreCombined&hgta_table=encodeCcreCombined&hgta_doSchema=describe+table+schema).
#' * **Encode_Histone**:
#'   - Description: consensus peaks from histone ChIP experiments downloaded from Encode.
#'     Biological replicates were summarized with [chip-r](https://github.com/rhysnewell/ChIP-R).
#'   - Source: Encode v121. Manifest of samples downloaded is [here](https://github.com/Bishop-Laboratory/RLBase-data/blob/e63707e9e4dece5b2c007bd4284975be4998dfd4/misc-data/histone_encode_manifest.csv).
#' * **encodeTFBS**:
#'   - Description: The collection of curated transcription-factor binding profiles from encode, made available by UCSC table browser.
#'   - Source: UCSC table [encRegTfbsClustered](https://genome.ucsc.edu/cgi-bin/hgTrackUi?db=hg38&g=encRegTfbsClustered).
#' * **G4Qexp**:
#'   - Description: G4-Quadruplex ChIP-Seq data
#'   - Source: GEO accession [GSE63874](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63874).
#' * **G4Qpred**:
#'   - Description: Re-processed and binned G4-Quadruplex Predictions. The type names for this database are the G4Q prediction classes and follow the pattern `tl:N_nl:N_gn:N`.
#'     `tl`: the length of guanine tracts in region; `nl`: number of locations for G4 formation; `gn`: the number of possible simultaneous G4 structures. For more information, see the source publication [here](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0165101).
#'     Due to the large number of possible configurations of `tl`, `nl`, and `gn`, they were binned based on frequency.
#'   - Source: Figshare [Rouchka et al.](https://figshare.com/collections/G4_Supporting_Material/3498270/1) and [direct download link](https://figshare.com/ndownloader/files/6432597)
#' * **knownGene_RNAs**:
#'   - Description: RNA species provided by UCSC KnownGene, split up by the "transcriptType" column from the source table.
#'   - Source: UCSC table [knownGene](http://genome.ucsc.edu/cgi-bin/hgTables?hgta_doSchemaDb=hg38&hgta_doSchemaTable=knownGene).
#' * **Microsatellite**:
#'   - Description: Microsatellite DNA regions predicted based on motif.
#'   - Source: UCSC table [microsat](http://genome.ucsc.edu/cgi-bin/hgTables?hgta_doSchemaDb=hg38&hgta_doSchemaTable=microsat).
#' * **PolyA**:
#'   - Description: List of predicted poly-A sites, split by the "name2" column of the source table.
#'   - Source: UCSC table [wgEncodeGencodePolyaV38](http://genome.ucsc.edu/cgi-bin/hgTables?hgta_doSchemaDb=hg38&hgta_doSchemaTable=wgEncodeGencodePolyaV38).
#' * **RBP_ChIP**:
#'   - Description: ChIP-Seq data sets for RNA-binding proteins (RBPs) generated by [*Nostrand et al*](https://www.nature.com/articles/s41586-020-2077-3) for Encode. Data are split by ChIP target.
#'   - Source: Encode v121. Manifest of samples [here](https://static-content.springer.com/esm/art%3A10.1038%2Fs41586-020-2077-3/MediaObjects/41586_2020_2077_MOESM9_ESM.xlsx) from source
#'     study [*Nostrand et al*](https://www.nature.com/articles/s41586-020-2077-3).
#' * **RBP_eCLiP**:
#'   - Description: eCLiP-Seq data sets for RNA-binding proteins (RBPs) generated by [*Nostrand et al*](https://www.nature.com/articles/s41586-020-2077-3) for Encode. Data are split by eCLiP target.
#'   - Source: Encode v121. Manifest of samples [here](https://static-content.springer.com/esm/art%3A10.1038%2Fs41586-020-2077-3/MediaObjects/41586_2020_2077_MOESM6_ESM.xlsx) from source
#'     study [*Nostrand et al*](https://www.nature.com/articles/s41586-020-2077-3).
#' * **Repeat_Masker**:
#'   - Description: Repeat masker table from UCSC containing genomic annotations for predicted repetitive elements, split by class of repetitive element ("repClass").
#'   - Source: UCSC table [rmsk](https://genome.ucsc.edu/cgi-bin/hgTables?db=hg38&hgta_table=rmsk&hgta_doSchema=describe+table+schema).
#' * **skewr**:
#'   - Description: Regions of G or C-skew profiled using the `skewr` program. See the RLBase-data [`README.md`](https://github.com/Bishop-Laboratory/RLBase-data) for steps.
#'   - Source: From UCSC goldenPath, [hg38](ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz) and
#'     [mm10](ftp://hgdownload.soe.ucsc.edu/goldenPath/mm10/bigZips/mm10.fa.gz) genomes.
#'     [hg38](ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/genes/hg38.ensGene.gtf.gz)
#'     and [mm10](ftp://hgdownload.soe.ucsc.edu/goldenPath/mm10/bigZips/genes/mm10.ensGene.gtf.gz) gene GTF.
#'     CpG islands for mm10 and hg38 provided as described in the **CpG_Islands** entry above. Processing
#'     proceeded using [`skewr`](https://github.com/srhartono/SkewR/tree/e351e20c9d5a1704e7b5d79ad7dbdc895d04919d) with
#'     [`stochHMM v0.38`](https://github.com/KorfLab/StochHMM/releases/tag/v0.38).
#' * **snoRNA_miRNA_scaRNA**:
#'   - Description: snoRNA, miRNA, and scaRNA species provided by UCSC table browser and split by the "type" column.
#'   - Source: UCSC table [wgRna](http://genome.ucsc.edu/cgi-bin/hgTables?hgta_doSchemaDb=hg38&hgta_doSchemaTable=wgRna).
#' * **Splice_Events**:
#'   - Description: UCSC table of alternative splice events predicted from transcriptome data sets. Split by "name" column.
#'   - Source: UCSC table [knownAlt](http://genome.ucsc.edu/cgi-bin/hgTables?hgta_doSchemaDb=hg38&hgta_doSchemaTable=knownAlt).
#' * **Transcript_Features**:
#'   - Description: Transcript features (e.g., "exon", "intron", etc) provided by Bioconductor TxDb packages. Split
#'     based on the following features: "Exon", "Intron", "fiveUTR", "threeUTR", "TSS", "TTS", "Intergenic".
#'   - Source: TxDb for [hg38](https://bioconductor.org/packages/release/data/annotation/html/TxDb.Hsapiens.UCSC.hg38.knownGene.html) and
#'     [mm10](https://bioconductor.org/packages/release/data/annotation/html/TxDb.Mmusculus.UCSC.mm10.knownGene.html).
#' * **tRNAs**:
#'   - Description: UCSC table containing predicted tRNA genes.
#'   - Source: UCSC table [tRNAs](http://genome.ucsc.edu/cgi-bin/hgTables?hgta_doSchemaDb=hg38&hgta_doSchemaTable=tRNAs).
#'
#' ## Objects available based on accessor function
#'
#' Here, we show which objects are available with each accessor function:
#'
#' | DataBase name       | `annots_primary_hg38()` | `annots_primary_mm10()` | `annots_full_hg38()` | `annots_full_mm10()` |
#' | ------------------- | ----------------------- | ----------------------- | -------------------- | -------------------- |
#' | Centromeres         | FALSE | FALSE | TRUE | FALSE |
#' | CNA                 | FALSE   | FALSE | TRUE | FALSE |
#' | Cohesin             | FALSE | FALSE | TRUE | FALSE |
#' | CpG_Islands         | TRUE | TRUE | TRUE | TRUE |
#' | Encode_CREs         | TRUE | TRUE | TRUE | TRUE |
#' | Encode_Histone      | FALSE | FALSE | TRUE | FALSE |
#' | encodeTFBS          | FALSE | FALSE | TRUE | FALSE |
#' | G4Qexp              | FALSE | FALSE | TRUE | FALSE |
#' | G4Qpred             | TRUE | FALSE | TRUE | FALSE |
#' | knownGene_RNAs      | TRUE | FALSE | TRUE | FALSE |
#' | Microsatellite      | FALSE | FALSE | TRUE | TRUE |
#' | PolyA               | TRUE | FALSE | TRUE | FALSE |
#' | RBP_ChIP            | FALSE | FALSE | TRUE | FALSE |
#' | RBP_eCLiP           | FALSE | FALSE | TRUE | FALSE |
#' | Repeat_Masker       | TRUE | TRUE | TRUE | TRUE |
#' | skewr               | TRUE | TRUE | TRUE | TRUE |
#' | snoRNA_miRNA_scaRNA | TRUE | FALSE | TRUE | FALSE |
#' | Splice_Events       | FALSE | FALSE | TRUE | TRUE |
#' | Transcript_Features | TRUE | TRUE | TRUE | TRUE |
#' | tRNAs               | TRUE | TRUE | TRUE | TRUE |
#'
#' ## Object structure
#'
#' Accessor functions (e.g., `annots_primary_hg38()`) return a named `list` of `tbl`
#' objects that specify feature ranges. Below, we detail the naming and structure of each.
#'
#' ### List names
#'
#' The names in the `list` objects provided by each accessor function (e.g., `annots_primary_hg38()`)
#' follow this structure: `DataBase__Type`. `DataBase` is the database from which
#' annotations were derived and `Type` indicates the specific annotations from the database
#' which are included in the \code{tbl}. This is required as some databases produce > 1
#' type of annotation (e.g., **Transcript_Features** contains "Exon"
#'  (`Transcript_Features__Exon`) and "Intron" (`Transcript_Features__Intron`)).
#'
#' ### `tbl` structure
#'
#' Each `tbl` returned has the following structure:
#'
#' | chrom | start | end   | strand | id |
#' | ----- | ----- | ----- | ------ | -- |
#' | chr1  | 10015 | 10498 | +      | 1  |
#' | chr1  | 10614 | 11380 | +      | 2  |
#' | ...
#'
#' Columns:
#'
#' * "chom" - the Chromosome of the feature range (UCSC style)
#' * "start" - the starting position of the feature range.
#' * "end" - the end position of the feature range.
#' * "strand" - the strand of the feature range.
#' * "id" - A unique ID for the feature range.
#'
#'
#' @examples
#'
#' annos <- annots_primary_hg38()
#'
#' annos <- annots_full_hg38()
#'
#' annos <- annots_primary_mm10()
#'
#' annos <- annots_full_mm10()
#' @export
annots_primary_hg38 <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "Primary Genomic Annotations (hg38)"))
    eh[[ehid, verbose = !quiet]]
}

#' @rdname annotations
#' @export
annots_full_hg38 <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "Full Genomic Annotations (hg38)"))
    eh[[ehid, verbose = !quiet]]
}

#' @rdname annotations
#' @export
annots_primary_mm10 <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "Primary Genomic Annotations (mm10)"))
    eh[[ehid, verbose = !quiet]]
}

#' @rdname annotations
#' @export
annots_full_mm10 <- function(quiet = FALSE) {
    geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
    eh <- AnnotationHub::query(geh(), "RLHub")
    title <- NULL
    ehid <- names(AnnotationHub::subset(eh, title == "Full Genomic Annotations (mm10)"))
    eh[[ehid, verbose = !quiet]]
}
