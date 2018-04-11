#' General description of tree and stem tables.
#'
#' Each tree and stem table is a dataframes that stores data of one census of
#' one plot. That is, for any given plot one tree table stores data recorded
#' during one specific census, and each row records the data from one specific
#' tree. And for any given plot one stem table stores data recorded during one
#' specific census , and each row records the data from one specific stem. For
#' example, if plot X was censused twice, then it has two tree tables and two
#' stem tables.
#'
#' Each tree or stem table has two remarkable properties:
#' * The number of rows equals the number of trees or stems that were ever found
#' in the plot (in any census). This implies that the number of rows is
#' identical to that of any other tree or stem table of the same plot; also,
#' that trees or stems appear in tree or stem tables before they recruit, while
#' they are alive, and after they die.
#' * The order of the rows is identical to that of any other tree or stem
#' table of the same plot. This implies that you can compare data across
#' censuses even if the row order is important for your analyses. Also, you can
#' easily repeat analyses with different censuses with minimal effort. For
#' example, this structure makes helps to calculate demographic rates between
#' any pair of censuses.
#'
#' @section Definition of Variables in tree tables:
#'
#' * `treeID`: The unique tree identifier in CTFS database. Useful to be certain
#' in matching trees.
#'
#' * `stemID`: The unique stem identifier in CTFS database. Useful to be certain
#'   in matching stems. FIXME: Missing in `bci_tree6_1ha`
#'
#' * `tag`: Tag number used in the field.
#'
#' * `StemTag`: Tag number on the individual stem, if present.
#'
#' * `sp`: The species mnemonic. To get full species names, the taxonomy table
#'   must be downloaded from the CTFS database:
#'   http://ctfs.arnarb.harvard.edu/CTFSReports
#'
#' * `quadrat`: Quadrat designation.
#'
#' * `gx`: The x coordinate within the plot, relative to one edge of the plot.
#'
#' * `gy`: The y plot coordinate.
#'
#' * `MeasureID`: The unique identifier of a single measurement in the CTFS
#'   database. FIXME: Missing in `bci_tree6_1ha`
#'
#' * `CensusID`: The numeric identifier of the census.
#'
#' * `dbh`: Diameter of one stem on the tree, the stem whose stemID is given.
#'
#' * `pom`: The point-of-measure, where the diameter was taken, identical to hom,
#'   but a character variable with only 2 decimal places.
#'
#' * `hom`: The height-of-measure, identical to pom but a numeric variable with
#'   full precision.
#'
#' * `ExactDate`: The date on which a tree was measured.
#'
#' * `DFstatus`: The codes for the measurement as recorded in the field.
#'     * `A`: Alive.
#'     * `D`: Dead.
#'     * `lost_stem` (deprecated): Lost stem. It usually means the stem was
#'     broken in the given census, while the tree had no other stem.  This
#'     status is deprecated;  it is safer to check `stemID` to determine whether
#'     a tree's measurement changed stems between censuses.
#'     * `M`: Missing. It is used where there is no record of the corresponding
#'     value of `dbh`, so it is not certain whether the tree was alive or dead.
#'     `P`: Prior. It indicates a tree had not yet recruited at this census.
#'
#' * `codes`: The codes for the measurement as recorded in the field.
#'
#' * `nostems`: The number of living stems on the date of measurement.
#'
#' * `status`: Indicates the status of the entire tree. For example, if any stem
#'   is alive, the tree is alive; if every stem is dead, the tree is dead:
#'     * `A`: Alive.
#'     * `D`: Dead.
#'     * `M`: Missing.
#'     * `P`: Prior. It indicates a tree had not yet recruited at this census.
#'     * `G`: Gone. xxx to complete.
#'
#' * `date`: The julian date, for date arithmetic.
#'
#' * `agb`: Above-ground-biomass of all stems on the tree, in Mg (equal to
#' metric tons or 106 g). Note that `agb = 0` for dead trees. FIXME: This
#' variable should probably be removed. It doesn't exist in the output of
#' rtbl().
#'
#' @section Definition of Variables in stem tables:
#' Compared to tree tables, the the variables are and mean the same. But notice
#' some differences in `DFstatus` and `agb`; also notice the additional
#' variables `codes` and `countPOM` and that the variable `nostems` does not
#' exist for stem tables.
#'
#' * `treeID`, `stemID`, `tag`, `StemTag`, `sp`, `quadrat`, `gx`, `gy`: See tree
#'   table.
#'
#' * `MeasureID`: The unique identifier of a single measurement in the CTFS
#'   database. FIXME: Missing in `bci_stem6_1ha`
#'
#' * `CensusID`: See tree table. FIXME: Missing from `bci_stem6_1ha`.`
#'
#' * `dbh`: Diameter of the stem.
#'
#' * `pom` FIXME: Misisng from `bci_stem6_1ha`, `hom`, `ExactDate`: See tree
#'   table.
#'
#' * `DFstatus`: The codes are the same as in tree tables except that stems may
#' have the additional status `G` (gone). `G` applies when a tree is alive and a
#' stem which formerly had a measurement does not in this census. This happens
#' in some plots, where individual stems do not have tags and cannot be tracked.
#'
#' * `codes`: The codes for the measurement as recorded in the field.
#'
#' * `countPOM`: The number of POMs (HOMs) for the same stem in this census.
#' FIXME: Misisng from `bci_stem6_1ha`.
#'
#' * `status`, `date`: See tree table.
#'
#' * `agb`: Same, but notice that some may be NA. FIXME: Remove from
#' `bci_stem6_1ha`. It shouldn't be here as it is not in the output of `rtbl()`.
#'
#' @seealso [census_bci], [data_dictionary].
#' 
#' @name census_description
NULL



#' Tree and stem tables from Barro Colorado Island (bci).
#'
#' For a general description see [census_description]. These datasets are tree
#' and stem tables of the same trees selected to create the tables [bci_vft_1ha]
#' and [bci_vft_random]. In the name of the tree and stem tables documented
#' here, the number after `stem` or `census` matches a value of the column
#' `PlotCensusNumber` in the corresponding ViewFullTable.
#'
#' @format See examples.
#'
#' @seealso [bci_vft_1ha], [bci_vft_random], [census_description],
#'   [data_dictionary].
#'
#' @examples
#' str(bci_stem6_1ha, give.attr = FALSE)
#'
#' str(bci_tree7_1ha, give.attr = FALSE)
#'
#' str(bci_stem7_random, give.attr = FALSE)
#'
#' str(bci_tree6_random, give.attr = FALSE)
#'
#' @name census_bci
NULL

# Subset 1ha
#' @rdname census_bci
"bci_stem6_1ha"
#' @rdname census_bci
"bci_stem7_1ha"
#' @rdname census_bci
"bci_tree6_1ha"
#' @rdname census_bci
"bci_tree7_1ha"

# Subset random
#' @rdname census_bci
"bci_stem6_random"
#' @rdname census_bci
"bci_stem7_random"
#' @rdname census_bci
"bci_tree6_random"
#' @rdname census_bci
"bci_tree7_random"
