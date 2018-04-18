# Source: Suzanne via
# * https://goo.gl/34Ywjw (ViewFullTable)
# * https://goo.gl/hkiKUW (ViewTaxonomy)

set.seed(123)
library(tidyverse)



# ViewTaxonomy ------------------------------------------------------------

luquillo_taxa <- luquillo::ViewTaxonomy_luquillo
# Allow downloading as .csv
# write_tsv(luquillo_taxa, here::here("data-raw/luquillo_taxa.csv"))
use_data(luquillo_taxa, overwrite = TRUE)



# ViewFullTable -----------------------------------------------------------

luquillo_vft <- luquillo::ViewFullTable_luquillo

# Choose 1000 tags at random from the entire plot

tags_random <- luquillo_vft %>% 
  filter(CensusID == 6) %>%
  pull(Tag) %>% 
  unique() %>% 
  sample(1000, replace = FALSE)



# Choose all tags from the most abundant hectare

# Find abundance hectare
ha <- luquillo_vft %>% 
 mutate(
   xha = ggplot2::cut_interval(PX, length = 100),
   yha = ggplot2::cut_interval(PY, length = 100)
 ) %>% 
 filter(!is.na(PX), !is.na(DBH)) %>% 
 group_by(xha, yha) %>% 
 summarise(xn = length(DBH), yn = length(DBH)) %>% 
 select(matches("x|y")) %>% 
 arrange(xn, yn)

# Confirm
p <- luquillo_vft %>% 
 filter(!is.na(DBH)) %>% 
 sample_n(10000) %>% 
 ggplot(aes(PX, PY)) + geom_point()

# Most abundant hectare is x = (100,200]; y = (400,500]

tags_1ha <- luquillo_vft %>% 
  filter(between(PX, 100, 200), between(PY, 400, 500)) %>% 
  pull(Tag) %>% 
  unique()



# Keep chosen tags exclusively

luquillo_vft_random <- filter(luquillo_vft, Tag %in% tags_random)
# Allow downloading as .csv
# write_tsv(luquillo_vft_random, here::here("data-raw/luquillo_vft_random.csv"))
use_data(luquillo_vft_random, overwrite = TRUE)


luquillo_vft_1ha <- filter(luquillo_vft, Tag %in% tags_1ha)
# Allow downloading as .csv
# write_tsv(luquillo_vft_1ha, here::here("data-raw/luquillo_vft_1ha.csv"))
use_data(luquillo_vft_1ha, overwrite = TRUE)



# Census ------------------------------------------------------------------


