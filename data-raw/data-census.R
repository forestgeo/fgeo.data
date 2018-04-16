# Data Source -------------------------------------------------------------

# Original files sent By Suzanne Lao. (Mauro's private email
# https://goo.gl/WhFNqd).

# From: Lao, Suzanne <LAOZ@si.edu>
# Date: Thu, Jul 27, 2017 at 1:33 PM
# Subject: RE: Data from BCI for examples
# To: Mauro Lepore <maurolepore@gmail.com>
# Cc: "Davies, Stuart J." <DaviesS@si.edu>
#
# I have shared a folder with you via dropbox ***[bcifiles]***. It includes:
#
# -          BCI elevation data
#
# -          BCI 2005 and 2010 stem data
#
# -          BCI 2005 and 2010 tree data
#
# -          BCI species file
#
# -          wood density file, which contains some errors, and will be updated
# soon. However the values for BCI should be fine.
#
# -          a text file with the habitats per 20x20m quadrats, which were
# determined by observation.
#
# However, habitats can also be determined by the slope, convexity, and
# elevation. I am attaching a file I made ***[bci.quad.info.rdata]***, which is
# quite old. You may want to redo this file, or maybe someone else has a better
# one.
#
# The tree and stem data are the most updated ones that we have from Rick.
# Please use a subset of this data only.
#
# Let me know if you have any questions.
#
# Cheers,
# Suzanne




library(tidyverse)
library(fgeo.data)

# Subset 1ha --------------------------------------------------------------

# STEM

# Whole data
load("data-raw/private/bcifiles/bci.stem6.rdata")
bci_stem6 <- as_tibble(bci.stem6)
rm(bci.stem6)
# Use only permitted trees
ids_1ha <- unique(fgeo.data::bci_vft_1ha$TreeID)
bci_stem6_1ha <- filter(bci_stem6, treeID %in% ids_1ha)

# Whole data
load("data-raw/private/bcifiles/bci.stem7.rdata")
bci_stem7 <- as_tibble(bci.stem7)
rm(bci.stem7)
# Use only permitted trees
ids_1ha <- unique(fgeo.data::bci_vft_1ha$TreeID)
bci_stem7_1ha <- filter(bci_stem7, treeID %in% ids_1ha)

# TREE

# Whole data
load("data-raw/private/bcifiles/bci.tree6.rdata")
bci_tree6 <- as_tibble(bci.tree6)
rm(bci.tree6)
# Use only permitted trees
ids_1ha <- unique(fgeo.data::bci_vft_1ha$TreeID)
bci_tree6_1ha <- filter(bci_tree6, treeID %in% ids_1ha)

# Whole data
load("data-raw/private/bcifiles/bci.tree7.rdata")
bci_tree7 <- as_tibble(bci.tree7)
rm(bci.tree7)
# Use only permitted trees
ids_1ha <- unique(fgeo.data::bci_vft_1ha$TreeID)
bci_tree7_1ha <- filter(bci_tree7, treeID %in% ids_1ha)

# Subset random -----------------------------------------------------------

# STEM

# Whole data
load("data-raw/private/bcifiles/bci.stem6.rdata")
bci_stem6 <- as_tibble(bci.stem6)
rm(bci.stem6)
# Use only permitted trees
ids_random <- unique(fgeo.data::bci_vft_random$TreeID)
bci_stem6_random <- filter(bci_stem6, treeID %in% ids_random)

# Whole data
load("data-raw/private/bcifiles/bci.stem7.rdata")
bci_stem7 <- as_tibble(bci.stem7)
rm(bci.stem7)
# Use only permitted trees
ids_random <- unique(fgeo.data::bci_vft_random$TreeID)
bci_stem7_random <- filter(bci_stem7, treeID %in% ids_random)

# TREE

# Whole data
load("data-raw/private/bcifiles/bci.tree6.rdata")
bci_tree6 <- as_tibble(bci.tree6)
rm(bci.tree6)
# Use only permitted trees
ids_random <- unique(fgeo.data::bci_vft_random$TreeID)
bci_tree6_random <- filter(bci_tree6, treeID %in% ids_random)

# Whole data
load("data-raw/private/bcifiles/bci.tree7.rdata")
bci_tree7 <- as_tibble(bci.tree7)
rm(bci.tree7)
# Use only permitted trees
ids_random <- unique(fgeo.data::bci_vft_random$TreeID)
bci_tree7_random <- filter(bci_tree7, treeID %in% ids_random)



# Remove unwanted columns following advice by Suzanne Lao -----------------
# RE https://github.com/forestgeo/fgeo.data/issues/7

remove_unwanted <- function(x, rmv) {
  x[setdiff(names(x), rmv)]
}

stem_tables <- list(
  bci_stem6_1ha = bci_stem6_1ha,
  bci_stem7_1ha = bci_stem7_1ha,
  bci_stem6_random = bci_stem6_random,
  bci_stem7_random = bci_stem7_random
)
stem_tables %>% 
  purrr::map(remove_unwanted, fgeo.data:::census_unwanted()$stem) %>% 
  purrr::map2(.x = ., .y = names(.), ~assign(.y, .x, .GlobalEnv))

tree_tables <- list(
  bci_tree6_1ha = bci_tree6_1ha,
  bci_tree7_1ha = bci_tree7_1ha,
  bci_tree6_random = bci_tree6_random,
  bci_tree7_random = bci_tree7_random
)
tree_tables %>% 
  purrr::map(remove_unwanted, fgeo.data:::census_unwanted()$tree) %>% 
  purrr::map2(.x = ., .y = names(.), ~assign(.y, .x, .GlobalEnv)
)



# Use data ----------------------------------------------------------------

use_data(bci_tree6_1ha, overwrite = TRUE)
use_data(bci_tree7_1ha, overwrite = TRUE)
use_data(bci_tree6_random, overwrite = TRUE)
use_data(bci_tree7_random, overwrite = TRUE)

use_data(bci_stem6_1ha, overwrite = TRUE)
use_data(bci_stem7_1ha, overwrite = TRUE)
use_data(bci_stem6_random, overwrite = TRUE)
use_data(bci_stem7_random, overwrite = TRUE)

