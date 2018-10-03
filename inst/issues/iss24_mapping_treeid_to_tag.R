# Relates to https://github.com/forestgeo/rtbl/issues/48.
# TODO: Update all tables from this new version of ViewFullTable:
path <- "data-raw/private/ViewFullTable_luquillo/ViewFullTable_luquillo.csv"
vft_good <- fgeo.tool::read_vft(here::here(path))

library(tidyverse)
library(fgeo.data)



# vft ---------------------------------------------------------------------
# The viewfulltable is OK: 
# * Each TreeID maps to a single Tag.
# * `Date` and `ExactDate` have valid values (not all missing and with good
# format).

vft <- fgeo.data::luquillo_vft_4quad

vft %>% 
  dplyr::select(TreeID, Tag) %>% 
  unique() %>% 
  arrange(Tag) %>% 
  group_by(Tag) %>% 
  summarize(n_treeid = n_distinct(TreeID)) %>% 
  filter(n_treeid > 1)

vft %>% 
  dplyr::select(TreeID, Tag) %>% 
  unique() %>% 
  arrange(Tag) %>% 
  group_by(TreeID) %>% 
  summarize(n_tag = n_distinct(Tag)) %>% 
  filter(n_tag > 1)

# OK
head(vft$ExactDate)
head(vft$Date)



# census ------------------------------------------------------------------
# The derived datasets are not OK. 

# Bad
stem %>% 
  dplyr::select(treeID, tag) %>% 
  unique() %>% 
  arrange(tag) %>% 
  group_by(tag) %>% 
  summarize(n = n_distinct(treeID)) %>% 
  filter(n > 1)

# OK
stem <- fgeo.data::luquillo_stem6_1ha
stem %>% 
  dplyr::select(treeID, tag) %>% 
  unique() %>% 
  arrange(tag) %>% 
  group_by(treeID) %>% 
  summarize(n = n_distinct(tag)) %>% 
  filter(n > 1)
