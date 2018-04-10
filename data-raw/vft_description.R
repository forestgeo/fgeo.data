library(tibble)
library(fgeo.data)

column <- c(
  "DBHID",
  "PlotID",
  "PlotName",
  "Family",
  "Genus",
  "SpeciesName",
  "Subspecies",
  "SpeciesID",
  "SubspeciesID",
  "Mnemonic",
  "QuadratID",
  "QuadratName",
  "QX",
  "QY",
  "PX",
  "PY",
  "TreeID",
  "Tag",
  "StemID",
  "StemNumber",
  "StemTag",
  "PrimaryStem",
  "CensusID",
  "PlotCensusNumber",
  "DBH",
  "HOM",
  "ExactDate",
  "Date",
  "ListOfTSM",
  "Status",
  "HighHOM",
  "LargeStem"
)

definition <- c(
  "Foreign Key to DBH table.",
  "Foreign Key to Site table.",
  "Descriptive name of the site also referred to as the plot.",
  "Taxonomic family name (from the Angiosperm Phylogeny Group - APG - system).",
  "Genus of the plant, according to the APG system.",
  "Species part of Latin name, may be a morphospecies name.",
  "Subspecies portion of the Latin name, may be a subspecies or variety.",
  "Foreign Key to Species table.",
  "Foreign Key to SubSpecies table, indicating the subspecies if there is one.",
  "Code used in the field for designating the species, usually 6 letters (4 for the genus and 2 for the species).",
  "Foreign Key to Quadrat table.",
  "Descriptive name for the quadrat used in the field. The first two characters (digits) usually refer column and the last two to the row.",
  "Distance from the lower left corner of the quadrat in meters on the X axis.",
  "Distance from the lower left corner of the quadrat in meters on the Y axis.",
  "Distance from the plot origin (lower left corner) in meters on the X axis.",
  "Distance from the plot origin (lower left corner) in meters on the Y axis.",
  "Foreign Key to Tree table.",
  "Tag number on the tree in the field, should be unique within each plot.",
  "Foreign Key to Stem table.",
  "Column used to carry stemid from previous database version.",
  "The stem tag used in the field to identify the different stems of a tree in the case of multiplestemmed trees.",
  "A character description of the stem, whether it is the primary or a secondary stem, or a branch, etc.",
  "Foreign Key to Census table.",
  "Census number, an integer, 1=first census, etc.",
  "Stem diameter, usually at breast height. Units are user defined, but assumed to be consistent within the database. It is recommended that the dbh be rounded down to the nearest 5 mm for trees <=5 cm dbh.",
  "Height (in meters) on the stem at which the diameter was measured, usually at 1.3 meters.",
  "Date on which the measurement was taken (format is yyyy-mm-dd).",
  "Number of days since 1960-01-01.",
  "Codes indicating the attributes or condition of the tree, stem, or measurement. Codes are separated by a comma in the case of more than one. An explanation of the codes is found in the TSMAttributes.txt file.",
  "Indicates the status of the tree or stem. Possible values are: alive (tree or stem is alive), dead (tree is dead), lost_stem (stem is dead, not found, or broken, etc. but other stems of the tree are still alive), or missing (tree or stem was not found, so measurement is unknown).",
  "Indicates whether the current height of measurement is the highest for this stem.",
  "Indicates whether the current stem is the largest stem of tree."
)



vft_description <- tibble(column, definition)

# Order rows of vft_description as column of vft
cols_order <- match(names(bci_vft_1ha), vft_description$column)
vft_description <- vft_description[cols_order, ]

use_data(vft_description, overwrite = TRUE)
