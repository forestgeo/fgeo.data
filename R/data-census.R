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
#' @section Definition of Variables in stem tables:
#' * `treeID`: The unique tree identifier in CTFS database. Useful to be certain
#'   in matching trees.
#' * `stemID`: The unique stem identifier in CTFS database. Useful to be certain
#'   in matching stems.
#' * `tag`: Tag number used in the field.
#' * `StemTag`: Tag number on the individual stem, if present.
#' * `sp`: The species mnemonic. To get full species names, the taxonomy table
#'   must be downloaded from the CTFS database.
#' * `quadrat`: Quadrat designation.
#' * `gx`: The x coordinate within the plot, relative to one edge of the plot.
#' * `gy`: The y plot coordinate.
#' * `MeasureID`: An integer automatically generated to uniquely identify a
#'   single DBH measurement. In the future this column may be renamed as 
#'   `DBHID`. 
#' * `CensusID`: An integer automatically generated to uniquely identify a 
#'   census.
#' * `dbh`: Diameter of one stem on the tree, the stem whose stemID is given.
#' * `pom`: Same as `hom` but rounded to two decimal places and of type 
#'   character.
#' * `hom`: The height-of-measure, identical to pom but a numeric variable with
#'   full precision.
#' * `ExactDate`: The date on which a tree was measured.
#'  * `DFstatus`:  `DFstatus` in the R stem file is exactly Status in the
#'    ViewFullTable. Refers to the stem, not the tree -- so in tree tables it is
#'    not useful. 
#' * `codes`: The codes for the measurement as recorded in the field.
#' * `countPOM`: FIXME
#' * `status`: The status of each individual stem. In a single tree some stems
#'   may be alive and others may be dead.
#'     * `A`: Alive.
#'     * `D`: Dead.
#'     * `M`: Missing. Case when `dbh` and `codes` for a tree was not given, so
#'       it is not certain whether the tree was alive or dead.
#'     * `P`: Prior. It indicates a tree had not yet recruited at this census.
#'     * `G`: Gone. Case when a tree is alive and a stem which formerly had a
#'       measurement does not in this census.
#' * `date`: The julian date, for date arithmetic.
#'
#' @section Definition of Variables in tree tables:
#' Compared to stem tables, the the columns of tree tables and mean the same, 
#' except when specified below:
#' * `status`: Indicates the status of the entire tree. For example, if any stem
#'   is alive, the tree is alive; if every stem is dead, the tree is dead:
#' * `dbh`: Diameter of the tree.
#' * `nostems`: The number of living stems on the date of measurement.
#' 
#' NOTES: 
#' * `StemTag` is particularly useful for you to know whether the largest
#' stemtag changed from one census to the other.
#' * `DFstatus` is particularly not helpful as it refers to the status of the 
#'   stem, not the tree.
#'
#' @seealso [data_dictionary], [census_bci], 
#' \url{http://ctfs.si.edu/Public/CTFSRPackage/files/help/RoutputFull.pdf},
#' \url{http://ctfs.si.edu/Public/CTFSRPackage/files/help/RoutputStem.pdf}.
#' 
#' @name census_description
NULL
