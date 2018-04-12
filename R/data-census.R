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
#' 
#' 
#' * `StemTag`: FIXME: RELOCATE. Tag number on the individual stem, if present.
#' 
#' 
#' 
#' * `treeID`: The unique tree identifier in CTFS database. Useful to be certain
#' in matching trees.
#' * `tag`: Tag number used in the field.
#' * `sp`: The species mnemonic. To get full species names, the taxonomy table
#'   must be downloaded from the CTFS database.
#' * `quadrat`: Quadrat designation.
#' * `gx`: The x coordinate within the plot, relative to one edge of the plot.
#' * `gy`: The y plot coordinate.
#' * `stemID`: The unique stem identifier in CTFS database. Useful to be certain
#'   in matching stems.
#' * `dbh`: Diameter of one stem on the tree, the stem whose stemID is given.
#' * `hom`: The height-of-measure, identical to pom but a numeric variable with
#'   full precision.
#' * `ExactDate`: The date on which a tree was measured.
#' * `codes`: The codes for the measurement as recorded in the field.
#' * `date`: The julian date, for date arithmetic.
#' * `status`: Indicates the status of the entire tree. For example, if any stem
#'   is alive, the tree is alive; if every stem is dead, the tree is dead:
#'     * `A`: Alive.
#'     * `D`: Dead.
#'     * `M`: Missing.
#'     * `P`: Prior. It indicates a tree had not yet recruited at this census.
#'     * `G`: Gone. xxx to complete.
#' * `nostems`: The number of living stems on the date of measurement.
#'
#' @section Definition of Variables in stem tables:
#' Compared to tree tables, the the columns of stem tables and mean the same, 
#' except when specified below:
#' * `treeID`, `stemID`, `tag`, `StemTag`: See tree table.
#' * `sp`, `quadrat`, `gx`, `gy`. : See tree table.
#' * `dbh`: Diameter of the stem.
#' * `hom`, `ExactDate`: See tree table.
#' * `DFstatus`: FIXME: Check with Suzanne if it should be removed.
#' * `codes`: The codes for the measurement as recorded in the field.
#' * `date` `status`: See tree table.
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
