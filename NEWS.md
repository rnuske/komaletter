# komaletter 0.5.0
  * added sections to default letter layout, since the employed KOMA-Script letter class `scrlttr2` has no sections. Just use `#`, `##`, `###` in your markdown and if you need section numbers set the YAML option `numbersections: true`.
  * enable References. If a bibliography is included in the YAML header and a citekey is used, a paragraph with a reference list gets added to the end of the text. 
  * removed polyglossia from template.tex since newer pandoc does not support it anymore.

# komaletter 0.4.2
  * fixed a redirected URL
  
# komaletter 0.4.1
  * documented YAML-parameter `inline-links` for creating inline hyperlinks rather than footnotes
  * the default layout signals the PDF viewer to print the document at its actual size, which is followed by some.
  * notes on printing in README & vignette
  
# komaletter 0.4
  * the default layout now also handles two-line return addresses gracefully
  * added YAML parameter `return-short` to define an additional shorter address 
    just for the return address in window  
  * enhanced documentation. roxygen documentation now written in markdown

# komaletter 0.3.2
  * modified pandoc LaTeX template to consider that tex package 'grffile' might not be available. grffile is now a legacy package and was absent from TeX Live for a short time. (thanks @cderv)

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
