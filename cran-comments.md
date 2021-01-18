## Release summary
This is the second CRAN release of `ennet`.

### Bug fixes

* Fixed NOTE on CRAN checks for non-ASCII characters (192 marked UTF-8 strings)

### Enhancements/Improvements

* refactored the `count_topics` and `count_authors` functions into new more
coherent functions for counting topics and other related metrics (previous
functions have now been deprecated);

* added new functions to retrieve data from the [en-net database](https://github.com/katilingban/ennet_db);

* added new functions to process and handle data from the [en-net database](https://github.com/katilingban/ennet_db); and,

* updated documentation to reflect the enhancments/improvements implemented.

## Test environments
* macOS, local R installation, R 4.0.3
* ubuntu 20.04, local R installation, R 4.0.3
* ubuntu 20.04 (on github actions), R 4.0.3
* windows latest (on github actions), R 4.0.3
* macOS latest (on github actions), R 4.0.3
* win-builder (devel, oldrelease, release)
* rhub windows ubuntu, fedora (devel, release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Reverse dependencies
`ennet` doesn't have any downstream / reverse dependencies (see https://github.com/katilingban/ennet/tree/master/revdep)
