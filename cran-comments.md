## Release summary
This is the third CRAN release of `ennet`. This is a patch release to fix a
test that uses an input that used to throw an error but now does not. This
test has now beeen fixed.

### Bug fixes

* Fixed test for `create_db_topics_monthly` that used an input for a date of
2021-02-01 which earlier would provide an error but now that it is already
February, this input doesn't throw an error anymore. This was changed to
2020-01-01 instead.

## Test environments
* macOS, local R installation, R 4.0.3
* ubuntu 20.04, local R installation, R 4.0.3
* ubuntu 20.04 (on github actions), R 4.0.3
* windows latest (on github actions), R 4.0.3
* macOS latest (on github actions), R 4.0.3
* win-builder (devel, oldrelease, release)
* rhub windows ubuntu, fedora (devel, release)

## R CMD check results

0 errors | 0 warnings | 0 note

## Reverse dependencies
`ennet` doesn't have any downstream / reverse dependencies (see https://github.com/katilingban/ennet/tree/master/revdep)
