#' ---
#' project: 00_Comp_Knowledge_Base    #####################################
#' title:   pre-render script
#' author:  Reto Zihlmann
#' date:    2024-04-22 07:27:54
#' output:  github_document   #############################################
#' ---

## 1) checks if you are on local Windows system,
## 2) check if files in shared_files are outdated
##    (this step is currently not done as there is no `cp --update` similar
##     command in R which only copies files if they are no longer up-to-date)
## POSSIBLE PROBLME:
## it could be that those files are now always detected as a new file by git?
## CHECK if this is the case (I think not, because copy a file will not change the 'last edit' timestamp)
## 3) copies files into project if necessary
## 4) returns error if no include files are in project directory

computer_name <- "DWP-6T0DRQ3"
needed_files <- c("C:/Users/858782/Config_VersContr/reto_theme.scss",
                  "C:/Users/858782/Config_VersContr/reto_theme_book.scss",
                  "C:/Users/858782/Config_VersContr/ggiraph_left_align.html",
                  "C:/Users/858782/texmf/bibtex/bib/bib.bib",
                  "C:/Users/858782/texmf/tex/latex/commonstuff/RetoMathjax.tex")
if(Sys.info()["nodename"] == computer_name){
  file.copy(from = needed_files,
            to = "shared_files/", overwrite = TRUE, copy.date = TRUE)
}

if(any(!file.exists(paste0("shared_files/",
                        stringr::str_extract(needed_files, "([^/]+$)"))))){
  stop("\nNot all needed files are included in the folder 'shared_files'",
       "\nGo to 'shared_files/pre_render_script.R' and check why they are not copied")
}
