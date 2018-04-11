# Source (editable): http://bit.ly/2IHesHZ

library(googlesheets)

vft_description <- gs_read(gs_title("vft_description"))
use_data(vft_description, overwrite = TRUE)
