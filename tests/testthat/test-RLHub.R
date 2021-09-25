# Test accessors in RLHub

test_that(desc = "Test accessors in RLHub", {

    # Test accessors
    meta <- read.csv(system.file("extdata", "metadata.csv", package = "RLHub"))

    # Do tests
    a_ <- lapply(
        seq(meta$Tags), function(i) {
            tag <- meta$Tags[i]
            cls <- meta$RDataClass[i]
            fxn <- utils::getFromNamespace(tag, "RLHub")
            testthat::expect_true(cls %in% class(fxn()))
        }
    )
})
