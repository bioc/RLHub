#' Models
#' 
#' Models used for predicting sample label ("POS": robustly maps R-loops; "NEG": poorly maps R-loops ) 
#' based on R-loop-forming sequences analysis ([RLSeq::analyzeRLFS()]). 
#' These models are used with [RLSeq::predictCondition()].
#' 
#' @aliases models prep_features fft_model
#' @param quiet If TRUE, messages are suppressed. Default: FALSE.
#' @returns A model object from the `caret` package.
#' @rdname models
#' @details 
#' 
#' ## Source
#' 
#' The models were developed as part of a semi-automated online learning scheme 
#' found in the RLBase-data protocol [here](https://github.com/Bishop-Laboratory/RLBase-data#build-discriminator-model).
#' Briefly, R-loop-forming sequences (RLFS) analysis was performed using [RLSeq::analyzeRLFS()]
#' for every sample peakset in RLBase (see [rlfs_res] for full results). The
#' samples were then manually inspected and any which starkly differed from 
#' their label were removed. Out of 693 possible samples, 135 were excluded 
#' due to a mismatch with their label. The remaining steps were
#' performed automatically.
#' 
#' * First,The non-discarded samples were partitioned 50:25:25 (train:test:discovery). 
#' Feature transformation was performed on the full data-set using the "YeoJohnson" 
#' transform along with typical standardization via [caret::preProcess()].
#' 
#' * Then, feature selection was performed in the discovery set using [Boruta::Boruta()]. 
#' 
#' * Then, the training set was then trained using a stacked ensemble model:
#' 
#'   - The ensemble model is a Random Forest and the 5 base models in the stack are:
#'     * Latent Dirichlet allocation
#'     * Recursive partitioning
#'     * Generalized linear model (logit)
#'     * K-nearest neighbors
#'     * Support vector machine (radial)
#'   - 10-fold 5-repeated cross-validation was implemented during training.
#'   
#' * Finally, The model was then evaluated in the testing set. It demonstrates an 
#'    accuracy of 0.9043. For more details, see the HTML 
#'    report [here](https://rlbase-data.s3.amazonaws.com/misc/model/FFT-classifier.html). 
#' 
#' ## Structure
#' 
#' * `prep_features()`
#'   - A feature-transform model which prepares the data for classification.
#'   - It is an object of class `preProcess` from the [caret::preProcess()] function call.
#' * `fft_model()`
#'   - A binary classifier which returns "POS" or "NEG".
#'   - It is an object of class `caretStack` from the [caretEnsemble::caretList()] function call. 
#' 
#' ## Usage
#' 
#' These models are used internally by [RLSeq::predictCondition()].
#' 
#' @examples 
#' 
#' fftModel <- fft_model()
#' 
#' pfModel <- prep_features()
#' 
#' @export
fft_model <- function(quiet=FALSE) {
  geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
  eh <- AnnotationHub::query(geh(), "RLHub")
  title <- NULL
  ehid <- names(AnnotationHub::subset(eh, title == "FFT-Model"))
  if (quiet) {
    suppressMessages(eh[[ehid]])
  } else {
    eh[[ehid]]
  }
}

#' @rdname models
#' @export
prep_features <- function(quiet=FALSE) {
  geh <- utils::getFromNamespace(".get_ExperimentHub", "ExperimentHub")
  eh <- AnnotationHub::query(geh(), "RLHub")
  title <- NULL
  ehid <- names(AnnotationHub::subset(eh, title == "Feature-Prep Model"))
  if (quiet) {
    suppressMessages(eh[[ehid]])
  } else {
    eh[[ehid]]
  }
}
