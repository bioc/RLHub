% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gs_signal.R
\name{gs_signal}
\alias{gs_signal}
\title{GS-Signal}
\usage{
gs_signal(quiet = FALSE)
}
\arguments{
\item{quiet}{If TRUE, messages are suppressed. Default: FALSE.}
}
\value{
A \code{tbl} object. See details.
}
\description{
A \code{tbl} containing the coverage from every human sample in RLBase around
"gold-standard" R-loop sites.
}
\details{
\subsection{Source}{

Gold-standard R-loop sites are those which were profiled with ultra-long-read
R-loop sequencing (SMRF-Seq) as described in \href{https://pubmed.ncbi.nlm.nih.gov/32105733/}{\emph{Malig et al., 2021.}}.
A \href{https://rlbase-data.s3.amazonaws.com/misc/correlation_genes_100kb.bed}{bed file}
containing these sites was derived and lifted to hg38. Sites were then
extended by 100kb bi-directionally and then binned into 1kb bins.

For each sample in RLBase, coverage tracks were calculated from alignments
using \href{https://github.com/Bishop-Laboratory/RLPipes}{\code{RLPipes}}. Then, coverage
tracks were summed within each of the 1kb bins using \code{deepTools} and wrangled
into a \code{tbl}.

The processing steps are described in the \href{https://github.com/Bishop-Laboratory/RLBase-data}{RLBase-data} README.md.

These data are used by \code{\link[RLSeq:corrAnalyze]{RLSeq::corrAnalyze()}} to determine how well a query sample
correlates with the samples in RLBase.
}

\subsection{Structure}{

Sample of data:\tabular{lrrrr}{
   location \tab ERX2277510 \tab ERX2277511 \tab ERX3974959 \tab ... \cr
   chr1_67636071_67637071 \tab 23 \tab 22 \tab 93 \tab ... \cr
   chr1_67637071_67638071 \tab 44 \tab 39 \tab 84 \tab ... \cr
   chr1_67638071_67639071 \tab 26 \tab 30 \tab 100 \tab ... \cr
   ... \tab ... \tab ... \tab ... \tab ... \cr
}


Column desc:
\itemize{
\item \code{location} - 1kb bins within "gold-standard" R-loop regions profiled with ultra-long-read R-loop sequencing (SMRF-Seq).
\item \code{ERX.../SRX...} - Columns corresponding to RLBase samples (see \link{rlbase_samples}). For each sample, the total coverage (bigWig file) within the range is shown.
}
}
}
\examples{

gss <- gs_signal()
}
