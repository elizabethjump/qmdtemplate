#' Using `create_qmd`
#'
#' @description
#' Use this function to create a pre-formatted Quarto doc that renders to PDF with Typst.
#'
#' @usage create_oee_qmd(file_name = NULL,
#'                  ext_type = "typst_pdf")
#'
#' @param file_name A string that will become the name of the Quarto report
#' @param ext_type Specify what type of report you want to make. Options include:
#'   * `typst_pdf`: creates a Quarto doc that uses Typst to render to PDF
#'   
#' @returns This creates and opens a new Quarto doc with the name specified in `file_name`.
#' @export
#' @importFrom utils file.edit
#'
#' @examples
#' \dontrun{
#' create_oee_qmd(file_name = "new_report",
#'                ext_type = "short_report_pdf")
#' }
create_qmd <- function(file_name = NULL,
                           ext_type = "typst_pdf") {
  
  if (is.null(file_name)) {
    stop("You must provide a valid file_name")
  }
  
  # make sure ext_type matches available options ----
  sort_method <- rlang::arg_match(ext_type, c("typst_pdf"))
  
  # create directory for quarto report and _extensions ----
  report_dir <- paste0(file_name, "_report/")
  
  if(!dir.exists(report_dir)) {
    dir.create(report_dir,
               recursive = T)
    
  }
  
  # copy quarto doc + formatting files ----
  files <- list.files(system.file(paste0("extdata\\", ext_type),
                                  package = "qmdtemplate"),
                      full.names = T)
  
  for(file in files) {
    
    file.copy(
      from = file,
      to = report_dir,
      overwrite = TRUE,
      recursive = TRUE,
      copy.mode = TRUE
    )
    
  }
  
  # logic check to make sure extension files were moved ----
  n_files <- length(list.files(report_dir,
                               recursive = T))
  
  if(n_files >= 2){
    message(paste0("A new folder for your quarto report '", file_name, "' has been created and sub-directories have been created with needed formatting extensions."))
  } else {
    message("The folder and extension haven't been installed correctly.")
  }
  
  # rename template qmd to match new report ----
  file.rename(paste0(report_dir, "/template.qmd"),
              paste0(report_dir, "/", file_name, ".qmd", collapse = ""))
  
  # open the new file in the editor ----
  usethis::edit_file(paste0(report_dir, "/", file_name, ".qmd", collapse = ""))
  
}
