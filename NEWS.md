# komaletter (development version)

  * modify default template to take into account the grffile tex package now a legacy package. Same fix as in pandoc and rmarkdown. 

# komaletter 0.3.1
  * added a section to the intro vignette about non-English letters
  * slightly darker header and foldmarks in default style (maintainersDelight.lco)
  
# komaletter 0.3
  * added vignette describing parameterized letters for mass mailings
  * reduced mandatory YAML metadata header items to 'output' (dispensed with 'opening', 'address', 'author')
  * introduced continuous integration service Travis CI

# komaletter 0.2
  * protected path to default lco in LaTeX file against breaking at whitespace on windows
  * renamed maintainers_delight.lco to avoid pandoc problems with underscores in paths

# komaletter 0.1
  * intial version based on linl version 0.0.2 but using KOMA-Script class 'scrlttr2' instead of LaTeX class 'letter'
