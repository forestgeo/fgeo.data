# Source: Suzanne via
# * https://goo.gl/34Ywjw (ViewFullTable)
# * https://goo.gl/hkiKUW (ViewTaxonomy)

set.seed(123)
library(tidyverse)



# ViewTaxonomy # ------------------------------------------------------------

luquillo_taxa <- luquillo::ViewTaxonomy_luquillo
# Allow downloading as .csv
# write_tsv(luquillo_taxa, here::here("data-raw/luquillo_taxa.csv"))
# use_data(luquillo_taxa, overwrite = TRUE)



# ViewFullTable # -----------------------------------------------------------

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
# use_data(luquillo_vft_random, overwrite = TRUE)


luquillo_vft_1ha <- filter(luquillo_vft, Tag %in% tags_1ha)
# Allow downloading as .csv
# write_tsv(luquillo_vft_1ha, here::here("data-raw/luquillo_vft_1ha.csv"))
# use_data(luquillo_vft_1ha, overwrite = TRUE)






# Tree and stem tables ----------------------------------------------------

load_ls <- function(path, env) {
  path %>% 
  purrr::map(fs::dir_ls) %>% 
  purrr::map(fs::dir_ls) %>% 
  purrr::reduce(c) %>% 
  lapply(load, env)
}

compile_census <- function(.x, table) {
  .x %>% 
    purrr::keep(grepl(table, names(ls_1ha))) %>% 
    purrr::map(as.tibble) %>% 
    purrr::map(., 
      ~dplyr::mutate(., CensusID = unique(CensusID[!is.na(CensusID)]))
    ) %>% 
    purrr::reduce(rbind)
}



# 1 hectare

env_1ha <- new.env(parent = .GlobalEnv)
here::here("data-raw/private/rtbl_1ha") %>% 
  load_ls(env_1ha)
ls_1ha <- as.list(env_1ha)

# Tree: All tables compiled
luquillo_tree_1ha <- compile_census(ls_1ha, "full")
# use_data(luquillo_tree_1ha, overwrite = TRUE)
# Tree: One table for most examples
luquillo_tree6_1ha <- ls_1ha$luquillo.full6
# use_data(luquillo_tree6_1ha, overwrite = TRUE)



# Stem: All tables compiled
luquillo_stem_1ha <- compile_census(ls_1ha, "stem")
# use_data(luquillo_stem_1ha, overwrite = TRUE)
# Stem: One table for most examples
luquillo_stem6_1ha <- ls_1ha$luquillo.stem6
# use_data(luquillo_stem6_1ha, overwrite = TRUE)



# Random

env_random <- new.env(parent = .GlobalEnv)
here::here("data-raw/private/rtbl_random") %>% 
  load_ls(env_random)
ls_random <- as.list(env_random)

# Tree: All tables compiled
luquillo_tree_random <- compile_census(ls_random, "full")
# use_data(luquillo_tree_random, overwrite = TRUE)
# Tree: One table for most examples
luquillo_tree6_random <- ls_random$luquillo.full6
# use_data(luquillo_tree6_random, overwrite = TRUE)



# Stem: All tables compiled
luquillo_stem_random <- compile_census(ls_random, "stem")
# use_data(luquillo_stem_random, overwrite = TRUE)
# Stem: One table for most examples
luquillo_stem6_random <- ls_random$luquillo.stem6
# use_data(luquillo_stem6_random, overwrite = TRUE)



# Species table -----------------------------------------------------------

luquillo_spptable <- ls_1ha$luquillo.spptable
# use_data(luquillo_spptable, overwrite = TRUE)
