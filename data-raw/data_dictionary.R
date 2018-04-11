# Source http://ctfs.si.edu/Public/DataDict/data_dict.php

library(tidyverse)
library(rvest)

dictionary <- read_html("http://ctfs.si.edu/Public/DataDict/data_dict.php")
harvest_tx <- html_nodes(dictionary, xpath = "//table//td") %>%
  html_text() 

nms_idx <- 1:5
nms <- harvest_tx[nms_idx]
harvest_data <- harvest_tx[-nms_idx]

data_dictionary <- matrix(harvest_data, ncol = 5, byrow = TRUE) %>% 
  as.data.frame.matrix(stringsAsFactors = FALSE) %>% 
  setNames(tolower(nms)) %>% 
  as_tibble() %>% 
  dplyr::select(table, column, description)

usethis::use_data(data_dictionary, overwrite = TRUE)
