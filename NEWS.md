# ennet 0.1.1

Second release of `ennet` package.

Bug fixes:

* Addressed CRAN checks NOTE indicating that there are 192 marked UTF-8 strings
in the packaged datasets. These marked strings have now been converted to ASCII
or to NA

* Removed `DiagrammeR` as a dependency package and removed the code chunk in 
respective vignette that creates the ennet workflow. The workflow diagram is
now done using an external drawing tool (OmniGraffle) instead of within R using
`DiagrammeR`


# ennet 0.1.0

First release of `ennet` package.

The `ennet` package has two key sets of functions:

1. The first set of functions facilitates the extraction of text data from the 
[**en-net** online forum](https://www.en-net.org). 

2. The second set of functions supports the analysis of the extracted datasets 
to produce summary measures and statistics of the 
[**en-net** online forum](https://www.en-net.org).
