This release fixes the errors reported in the CRAN checks.

The errors were caused by a change in the main dependency, KOMA-Script: from version 3.49 on, deprecated features throw an error. The CRAN machines with the newest KOMA-Script (Fedora 44) picked this up. The templates now use the supported replacements, which are available since KOMA-Script 3.28 released in 2020.

## Test environments
* local: Ubuntu 26.04.1, R-release and R-devel
* win-builder: R-devel, R 4.6.2
* GitHub Actions: ubuntu-latest, windows-latest, macos-latest
* Rhub Action: Fedora 44 machines

## R CMD check results
0 errors | 0 warnings | 0 notes

Thanks for your great service
Robert
