## Release summary
This is the fourth CRAN release of `ennet`. This is a patch release to fix a
CRAN check issue where internet resources sometimes become unavailable and
therefore causes errors. CRAN policy specifies that such scenarios should
"exti gracefully" notifying user that resource is unavailable rather than
throw a check warning or error. This has been implemented in this patch version.

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
`ennet` doesn't have any downstream / reverse dependencies (see https://github.com/katilingban/ennet/tree/master/revdep)
