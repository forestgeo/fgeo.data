# Source (editable): https://docs.google.com/spreadsheets/d/1rny_Jy0Itmz6ZU8m5pDMXWphhS8LunS77KwXjUEwP4U/edit?usp=sharing

library(googlesheets)

vft_description <- gs_read(gs_title("vft_description"))
use_data(vft_description, overwrite = TRUE)
