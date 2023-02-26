#' KOMA-Script LaTeX Letter Format
#'
#' A format for LaTeX letters via R Markdown using the KOMA-Script class
#' 'scrlttr2'. It provides layouts for many different window envelope types
#' (German, US, French, Japanese, ...) and lets you define customized layouts.
#'
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param keep_tex A boolean toggle to select whether intermediate
#'   LaTeX files are to be kept, defaults to `FALSE`
#'
#' @return R Markdown output to pass to [rmarkdown::render()]
#'
#' @examples
#' \dontrun{
#' rmarkdown::draft("my_letter.Rmd", template="pdf", package="komaletter")
#' rmarkdown::render("my_letter.Rmd")
#' }
#'
#' @details # Letter features
#'
#' Various aspects of the letter can be customized via the following
#' variables in the R Markdown document metadata (aka YAML header).
#'
#' Although it rarely makes sense to write a letter without sender and recipient,
#' a komaletter can be constructed by merely specifying the output format.
#' All other variables are optional.
#'
#'
#' Most commonly used variables:
#'
#' **Variable**     | **Description**
#' ---------------- | ------------------------------------------------------------
#' author           | Writer of the letter.
#' return-address   | Address of the sender; takes a list for a multi-line address.
#' address          | Name and address of the recipient; takes a list.
#' date             | Custom date; if not specified, current date will be inserted.
#' subject          | Subject line.
#' opening          | Text for the salutation.
#' closing          | Text for the complementary close, like: Best regards.
#' signature        | Text (e.g. your name) or an image of your signature with `"\\includegraphics{sig.png}"`.
#' signature-before | Adjust vertical space between closing and signature by specifying a length such as `2mm` or `"0.5\\baselineskip"`.
#'
#'
#' All variables understood by `rmarkdown`'s `pdf_document` format may be used
#' in addition to the `komaletter` variables defined in the following table
#' to further customize your letter. For modifications of the layout please
#' refer to the vignette "Introduction to komaletter".
#'
#' Further variables defined by komaletter:
#'
#' **Variable** | **Description**
#' ------------ | ----------------------------------------------------------------
#' lco          | Letter Class Option File. Either name of a standard KOMA-Script LCO (e.g. DIN, SN, ) or path to custom LCO. If not specified, the `maintainersDelight.lco` will be used.
#' lang         | Language code according to [BCP 47](https://www.rfc-editor.org/rfc/rfc5646.html) (e.g. `en` or `en-GB`).
#' papersize    | Size of paper eg. `a4`, `letter`.
#' return-phone | Phone number of sender used in letter head.
#' return-email | Email address of sender used in letter head.
#' return-url   | Website of sender used in letter head.
#' return-short | Shorter version of return address only used in window (see vignette `letter_example4`).
#' place        | Sender’s place used near date.
#' yourref      | Addressee’s reference as part of reference line.
#' yourmail     | Date of addressee’s referenced mail as part of reference line.
#' myref        | Sender’s reference as part of reference line.
#' customer     | Customer number as part of reference line.
#' invoice      | Invoice number as part of reference line.
#' cc           | Recipients to be carbon-copied; can take a list.
#' encl         | List of enclosures.
#' ps           | Text to be added at the end of the letter as a postscript.
#' inline-links | If true, do standard inline hyperlinks rather than footnotes (styling is author's job, cf. vignette `letter_example2`).
#' komaoption   | Specify further KOMA options; takes a list (see [KOMA-Script documentation](https://komascript.de/~mkohm/scrguien.pdf)).
#' parskip      | Defines how to mark new paragraphs, e.g. full, half, off (see [KOMA-Script documentation](https://komascript.de/~mkohm/scrguien.pdf)).
#'
#'
#' The source of the example letter vignettes show several of these options in use.
#'
#'
#' @references
#' JJ Allaire, Yihui Xie, Jonathan McPherson et al. (2020). rmarkdown:
#' Dynamic Documents for R. R package version 2.6.
#' <https://cran.r-project.org/package=rmarkdown>
#'
#' Aaron Wolen and Andrew Dunning (2017). pandoc-letter. GitHub Repository.
#' <https://github.com/aaronwolen/pandoc-letter>
#'
#' Markus Kohm (2020). KOMA-Script: A versatile LaTeX \eqn{2_\epsilon}{2\epsilon} bundle.
#' <https://komascript.de/~mkohm/scrguien.pdf>
#'
#' @export
komaletter <- function(..., keep_tex=FALSE){

  template <- system.file("rmarkdown", "templates", "pdf", "resources",
                          "template.tex", package="komaletter")
  default_lco <- system.file("rmarkdown", "templates", "pdf", "resources",
                             "maintainersDelight.lco", package="komaletter")
  default_lco <- sub("\\.[^.]*$", "", default_lco)

  base <- inherit_pdf_document(..., template=template, keep_tex=keep_tex,
                               md_extensions=c("-autolink_bare_uris"),
                               pandoc_args=c(paste0("--variable=lco_default:",
                                                    default_lco)))

  base$knitr$opts_chunk$prompt    <- FALSE
  base$knitr$opts_chunk$comment   <- '# '
  base$knitr$opts_chunk$highlight <- TRUE

  return(base)
}


# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...){
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"

  return(fmt)
}
