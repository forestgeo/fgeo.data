#' General description of census tables: tree and stem.
#'
#' Tree and stem tables are dataframes that store data from one specific census
#' of one specific census plot. For any given plot one tree table stores data
#' recorded during one specific census, and each row records the data from one
#' specific tree. Similarly, for any given plot one stem table stores data
#' recorded during one specific census , and each row records the data from one
#' specific stem. For example, if plot X was censused twice, then it has two
#' tree tables and two stem tables.
#'
#' Each tree (or stem) table of a census plot has two remarkable properties:
#' * The number of rows equals the number of trees (or stems) that were ever
#' found in the plot (in any census). This implies that the number of rows is
#' identical to that of any other tree (or stem) table of the same plot; also,
#' that trees (or stems) appear in tree (or stem) tables before they recruit,
#' while they are alive, and after they die.
#' * The order of the rows is identical to that of any other tree (or stem)
#' table of the same plot. This implies that you can compare data accross
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
#'   in matching stems.
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
#'   database.
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
#' * `nostems`: The number of living stems on the date of measurement.
#'
#' * `status`: Indicates the status of the entire tree. For example, if any stem
#'   is alive, the tree is alive; if every stem is dead, the tree is dead:
#'     * `A`: Aalive.
#'     * `D`: Dead.
#'     * `M`: Missing.
#'     * `P`: Prior. It indicates a tree had not yet recruited at this census.
#'     * `G`: Gone. xxx to complete.
#'
#' * `date`: The julian date, for date arithmetic.
#'
#' * `agb`: Above-ground-biomass of all stems on the tree, in Mg (equal to
#'   metric tons or 106 g). Note that `agb = 0` for dead trees.
#'
#' @section Definition of Variables in stem tables:
#' Compared to tree tables, the the variables are and mean the same. But notice
#' some differences in `DFstatus` and `agb`; also notice the additional
#' variables `codes` and `countPOM` and that the variable `nostems` does not
#' exist for stem tables.
#'
#' * `treeID`: See tree table.
#'
#' * `stemID`: See tree table.
#'
#' * `tag`: See tree table.
#'
#' * `StemTag`: See tree table.
#'
#' * `sp`: See tree table.
#'
#' * `quadrat`: See tree table.
#'
#' * `gx`: See tree table.
#'
#' * `gy`: See tree table.
#'
#' * `MeasureID`: See tree table.
#'
#' * `CensusID`: See tree table.
#'
#' * `dbh`: Diameter of the stem.
#'
#' * `pom`: See tree table.
#'
#' * `hom`: See tree table.
#'
#' * `ExactDate`: See tree table.
#'
#' * `DFstatus`: The codes are the same as in tree tables except that stems may
#' have the additional status `G` (gone). `G` applies when a tree is alive and a
#' stem which formerly had a measurement does not in this census. This happens
#' in some plots, where individual stems do not have tags and cannot be tracked.
#'
#' * `codes`: The codes for the measurement as recorded in the field.
#'
#' * `countPOM`: The number of POMs (HOMs) for the same stem in this census.
#'
#' * `status`: See tree table.
#'
#' * `date`: See tree table.
#'
#' * `agb`: Same, but notice that some may be NA.
#'
#' @source \url{http://ctfs.si.edu/Public/CTFSRPackage/index.php/web/data_format}
#' @name census_description
NULL



#' Tree and stem tables from Barro Colorado Island (bci).
#'
#' For a description see [census_description]. Tree and stem tables of the same
#' trees selected in [vft_1ha_bci] and [vft_random_bci]. The nuber after `stem`
#' or `census` matches a value of the column `CensusID` in the corresponding
#' ViewFullTable.
#'
#' @format See examples.
#'
#' @seealso [vft_1ha_bci], [vft_random_bci], [census_description].
#'
#' @examples
#' str(stem6_1ha_bci, give.attr = FALSE)
#'
#' str(tree7_1ha_bci, give.attr = FALSE)
#'
#' str(stem7_random_bci, give.attr = FALSE)
#'
#' str(tree6_random_bci, give.attr = FALSE)
#'
#' @name census_bci
NULL

# Subset 1ha
#' @rdname census_bci
"stem6_1ha_bci"
#' @rdname census_bci
"stem7_1ha_bci"
#' @rdname census_bci
"tree6_1ha_bci"
#' @rdname census_bci
"tree7_1ha_bci"

# Subset random
#' @rdname census_bci
"stem6_random_bci"
#' @rdname census_bci
"stem7_random_bci"
#' @rdname census_bci
"tree6_random_bci"
#' @rdname census_bci
"tree7_random_bci"
