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



# Setup -------------------------------------------------------------------

library(tidyverse)
library(fgeo.opendata)

# Subset 1ha --------------------------------------------------------------

# STEM

# Whole data
load("data-raw/private/bcifiles/bci.stem6.rdata")
bci_stem6 <- as_tibble(bci.stem6)
rm(bci.stem6)
# Use only permitted trees
ids_1ha <- unique(fgeo.opendata::vft_1ha_bci$TreeID)
stem6_1ha_bci <- filter(bci_stem6, treeID %in% ids_1ha)
use_data(stem6_1ha_bci, overwrite = TRUE)

# Whole data
load("data-raw/private/bcifiles/bci.stem7.rdata")
bci_stem7 <- as_tibble(bci.stem7)
rm(bci.stem7)
# Use only permitted trees
ids_1ha <- unique(fgeo.opendata::vft_1ha_bci$TreeID)
stem7_1ha_bci <- filter(bci_stem7, treeID %in% ids_1ha)
use_data(stem7_1ha_bci, overwrite = TRUE)

# TREE

# Whole data
load("data-raw/private/bcifiles/bci.tree6.rdata")
bci_tree6 <- as_tibble(bci.tree6)
rm(bci.tree6)
# Use only permitted trees
ids_1ha <- unique(fgeo.opendata::vft_1ha_bci$TreeID)
tree6_1ha_bci <- filter(bci_tree6, treeID %in% ids_1ha)
use_data(tree6_1ha_bci, overwrite = TRUE)

# Whole data
load("data-raw/private/bcifiles/bci.tree7.rdata")
bci_tree7 <- as_tibble(bci.tree7)
rm(bci.tree7)
# Use only permitted trees
ids_1ha <- unique(fgeo.opendata::vft_1ha_bci$TreeID)
tree7_1ha_bci <- filter(bci_tree7, treeID %in% ids_1ha)
use_data(tree7_1ha_bci, overwrite = TRUE)

# Subset random -----------------------------------------------------------

# STEM

# Whole data
load("data-raw/private/bcifiles/bci.stem6.rdata")
bci_stem6 <- as_tibble(bci.stem6)
rm(bci.stem6)
# Use only permitted trees
ids_random <- unique(fgeo.opendata::vft_random_bci$TreeID)
stem6_random_bci <- filter(bci_stem6, treeID %in% ids_random)
use_data(stem6_random_bci, overwrite = TRUE)

# Whole data
load("data-raw/private/bcifiles/bci.stem7.rdata")
bci_stem7 <- as_tibble(bci.stem7)
rm(bci.stem7)
# Use only permitted trees
ids_random <- unique(fgeo.opendata::vft_random_bci$TreeID)
stem7_random_bci <- filter(bci_stem7, treeID %in% ids_random)
use_data(stem7_random_bci, overwrite = TRUE)

# TREE

# Whole data
load("data-raw/private/bcifiles/bci.tree6.rdata")
bci_tree6 <- as_tibble(bci.tree6)
rm(bci.tree6)
# Use only permitted trees
ids_random <- unique(fgeo.opendata::vft_random_bci$TreeID)
tree6_random_bci <- filter(bci_tree6, treeID %in% ids_random)
use_data(tree6_random_bci, overwrite = TRUE)

# Whole data
load("data-raw/private/bcifiles/bci.tree7.rdata")
bci_tree7 <- as_tibble(bci.tree7)
rm(bci.tree7)
# Use only permitted trees
ids_random <- unique(fgeo.opendata::vft_random_bci$TreeID)
tree7_random_bci <- filter(bci_tree7, treeID %in% ids_random)
use_data(tree7_random_bci, overwrite = TRUE)
