#' KOMA-Script LaTeX Letter Format
#'
#' A format for LaTeX letters via R Markdown using the KOMA-Script class
#' 'scrlttr2'. It provides layouts for many different window envelope types
#' (German, US, French, Japanese, ...) and the possibility to define your own.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{\link[rmarkdown:pdf_document]{pdf_document}}
#' @param keep_tex A boolean toggle to select whether intermediate
#' LaTeX files are to be kept, defaults to \code{FALSE}
#' @return R Markdown output format to pass to
#' \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyLetter.Rmd", template="pdf", package="komaletter")
#' rmarkdown::render("MyLetter.Rmd")
#' }
#'
#' @section Letter features:
#' Various aspects of the letter can be customized via the following
#' variables in the R Markdown document metadata (aka YAML frontmatter).
#'
#' Most commonly used variables:
#' \tabular{ll}{
#'   \strong{Variable} \tab \strong{Description}\cr
#'   author            \tab Writer of the letter\cr
#'   return-address    \tab Address of the sender; takes a list for a multi-line address.\cr
#'   address           \tab Name and address of the recipient; takes a list.\cr
#'   date              \tab Custom date; if not specified, current date will be inserted.\cr
#'   subject           \tab Subject line.\cr
#'   opening           \tab Text for the salutation.\cr
#'   closing           \tab Text for the complementary close.\cr
#'   signature         \tab Typed signature or image placed below closing.\cr
#'   signature-before  \tab Allows adjustment of vertical space before signature.
#' }
#'
#' Further variables defined by komaletter:
#' \tabular{ll}{
#'   \strong{Variable} \tab \strong{Description}\cr
#'   lco          \tab Letter Class Option File. Either name of a standard KOMA-Script LCO (e.g. DIN, SN, ) or path to custom LCO. If not specified, the \code{maintainers_delight.lco} will be used.\cr
#'   lang         \tab Language code according to \href{https://tools.ietf.org/html/bcp47}{BCP 47} (e.g. \code{en} or \code{en-GB}).\cr
#'   papersize    \tab Size of paper eg. `a4`, `letter`.\cr
#'   return-phone \tab Phone number of sender used in letter head.\cr
#'   return-email \tab Email address of sender used in letter head.\cr
#'   return-url   \tab Website of sender used in letter head.\cr
#'   place        \tab Sender’s place used near date.\cr
#'   yourref      \tab Addressee’s reference as part of reference line.\cr
#'   yourmail     \tab Date of addressee’s referenced mail as part of reference line.\cr
#'   myref        \tab Sender’s reference as part of reference line.\cr
#'   customer     \tab Customer number as part of reference line.\cr
#'   invoice      \tab Invoice number as part of reference line.\cr
#'   cc           \tab Recipients to be carbon-copied; can take a list for multiple recipients.\cr
#'   encl         \tab List of enclosures.\cr
#'   ps           \tab Text to be added at the end of the letter as a postscript.\cr
#'   komaoption   \tab Specify further KOMA options; takes a list (see KOMA-Script documentation).\cr
#'   parskip      \tab Defines how to mark new paragraphs, e.g. false, full, half (see KOMA-Script documentation)
#' }
#'
#'
#' The source of example letter vignettes show several of these options in use.
#'
#' @seealso
#' \code{\link[linl]{linl}}
#'
#' @references
#' JJ Allaire, R Foundation, Hadley Wickham, Journal of Statistical Software, Yihui Xie, Ramnath
#' Vaidyanathan, Association for Computing Machinery, Carl Boettiger, Elsevier, Karl Broman,
#' Kirill Mueller, Bastiaan Quast, Randall Pruim, Ben Marwick, Charlotte Wickham, Oliver Keyes
#' and Miao Yu (2017). rticles: Article Formats for R Markdown. R package version 0.4.1.
#' \url{https://cran.r-project.org/package=rticles}
#'
#' JJ Allaire, Joe Cheng, Yihui Xie, Jonathan McPherson, Winston Chang, Jeff Allen, Hadley
#' Wickham, Aron Atkins, Rob Hyndman and Ruben Arslan (2017). rmarkdown: Dynamic Documents for R.
#' R package version 1.6. \url{https://cran.r-project.org/package=rmarkdown}
#'
#' Yihui Xie (2017). knitr: A General-Purpose Package for Dynamic Report Generation in R. R
#' package version 1.17.
#'
#' Aaron Wolen (2017). pandoc-letter. GitHub Repository. \url{https://github.com/aaronwolen/pandoc-letter}.
#'
#' Dirk Eddelbuettel and Aaron Wolen (2017). linl: 'linl' is not 'Letter'. R package version 0.0.2. \url{https://cran.r-project.org/package=linl}
#'
#' @export
komaletter <- function(..., keep_tex=FALSE){

  template <- system.file("rmarkdown", "templates", "pdf", "resources",
                          "template.tex", package="komaletter")
  path_to_default <- system.file("rmarkdown", "templates", "pdf", "resources",
                                 "maintainers_delight.lco", package="komaletter")
  path_to_default <- sub("\\.[^.]*$", "", path_to_default)

  base <- inherit_pdf_document(..., template=template, keep_tex=keep_tex,
                               md_extensions=c("-autolink_bare_uris"),
                               pandoc_args=c(paste0("--variable=lco_default:",
                                                  path_to_default)))

  base$knitr$opts_chunk$prompt    <- FALSE  # changed from TRUE
  base$knitr$opts_chunk$comment   <- '# '   # default to one hashmark
  base$knitr$opts_chunk$highlight <- TRUE   # changed as well

  return(base)
}


# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...){
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"

  return(fmt)
}
