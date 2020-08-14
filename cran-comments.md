

## Test environments
* local ubuntu 18.04, R 4.0.2

* win-builder
  * R version 4.0.2 (2020-06-22)
  * R Under development (unstable) (2020-08-10 r79000)
  * R version 3.6.3 (2020-02-29)

* R-hub 
  * Windows Server 2008 R2 SP1, R-devel, 32/64 bit
  * Ubuntu Linux 16.04 LTS, R-release, GCC
  * Fedora Linux, R-devel, clang, gfortran

* Continuous Integration Systems
  * Ubuntu 16.04.6 [Travis], 4.0.0 (2020-04-24)
  * Debian testing [Drone],  4.0.1 (2020-06-06)
  * Windows Server 2012 R2 x64 [AppVeyor], 4.0.2 Patched (2020-08-13 r79016)


## R CMD check results

0 errors | 0 warnings | 0 notes


[
* R-hub's Windows Server has no GhostScript and can thus not check size of PDFs
* R-hub's Fedora System was missing one LaTeX package and hence had problems with the vignettes
]

