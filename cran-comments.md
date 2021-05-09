## Resubmission

This is a resubmission. In this version, I have implemented the following in
response to feedback/comments from CRAN:

* reduce test timings

I have reviewed the different tests I use and have trimmed down the longest
running test to use smaller toy data to run faster. The tests now run for less
than 100 seconds on `winbuilder`

* address CRAN status checks erros

Fix CRAN check issue where internet resources sometimes become unavailable and
therefore causes errors. CRAN policy specifies that such scenarios should
"exit gracefully" notifying user that resource is unavailable rather than
throw a check warning or error. This has been implemented in this patch version
by using the `try()` function whenever an internet resource is required and then
return a message that resource is unavailable instead of a warning or an error.

## Test environments
* macOS, local R installation, R 4.0.5
* ubuntu 20.04, local R installation, R 4.0.5
* ubuntu 20.04 (on github actions), R 4.0.5
* windows latest (on github actions), R 4.0.5
* macOS latest (on github actions), R 4.0.5
* win-builder (devel, oldrelease, release)
* rhub windows ubuntu, fedora (devel, release)

## R CMD check results

0 errors | 0 warnings | 0 note

## Reverse dependencies
`ennet` doesn't have any downstream / reverse dependencies 
(see https://github.com/katilingban/ennet/tree/master/revdep)
