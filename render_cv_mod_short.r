# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

# Knit the HTML version
rmarkdown::render("cv_mod_short.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "shannon_pileggi_cv_short.html")

# Knit the PDF version to temporary html location
# use this to replace links with footnotes
tmp_html_cv_loc <- here::here("shannon_pileggi_cv_short.html")
rmarkdown::render("cv_mod_short.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
# links stay as links ---
# tmp_html_cv_loc <- here::here("cv_mod.html")
# links convert to footnotes ---
tmp_html_cv_loc <- here::here("shannon_pileggi_cv_short.html")
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "shannon_pileggi_cv_short.pdf")
