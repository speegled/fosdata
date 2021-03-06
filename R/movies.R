#' MovieLens 100K
#'
#' Randomly selected ratings of movies from MovieLens.
#'
#' From the creators of the data:
#'
#' This dataset (ml-latest-small) describes 5-star rating and free-text tagging activity from [MovieLens](http://movielens.org), a movie recommendation service. It contains 100836 ratings and 3683 tag applications across 9742 movies. These data were created by 610 users between March 29, 1996 and September 24, 2018. This dataset was generated on September 26, 2018.
#'
#' Users were selected at random for inclusion. All selected users had rated at least 20 movies. No demographic information is included. Each user is represented by an id, and no other information is provided.
#'
#' The data are contained in the files `links.csv`, `movies.csv`, `ratings.csv` and `tags.csv`. More details about the contents and use of all these files follows.
#'
#' This is a *development* dataset. As such, it may change over time and is not an appropriate dataset for shared research results. See available *benchmark* datasets if that is your intent.
#'
#' This and other GroupLens data sets are publicly available for download at <http://grouplens.org/datasets/>.
#'
#' **Usage License**
#'
#' Neither the University of Minnesota nor any of the researchers involved can guarantee the correctness of the data, its suitability for any particular purpose, or the validity of results based on the use of the data set. The data set may be used for any research purposes under the following conditions:
#' \enumerate{
#'   \item The user may not state or imply any endorsement from the University of Minnesota or the GroupLens Research Group.
#'   \item The user must acknowledge the use of the data set in publications resulting from the use of the data set (see below for citation information).
#'   \item The user may redistribute the data set, including transformations, so long as it is distributed under these same license conditions.
#'   \item The user may not use this information for any commercial or revenue-bearing purposes without first obtaining permission from a faculty member of the GroupLens Research Project at the University of Minnesota.
#'   \item The executable software scripts are provided "as is" without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The entire risk as to the quality and performance of them is with you. Should the program prove defective, you assume the cost of all necessary servicing, repair or correction.
#'   \item In no event shall the University of Minnesota, its affiliates or employees be liable to you for any damages arising out of the use or inability to use these programs (including but not limited to loss of data or data being rendered inaccurate).
#'   \item If you have any further questions or comments, please email <grouplens-info@umn.edu>
#' }
#'
#' @format A data frame with 100836 observations of 6 variables
#' \describe{
#'   \item{userId}{Unique int Id of the rater of the movie}
#'   \item{movieId}{Unique int ID of the movie}
#'   \item{rating}{Number of stars given to the movie. Half stars were added as a possibility after collecting some of the data.}
#'   \item{timestamp}{Seconds since UTC January 1, 1970}
#'   \item{title}{Title of movie with year in parentheses}
#'   \item{genres}{pipe separated list of genres from Action, Adventure, Animation, Children's, Comedy, Crime, Documentary, Drama, Fantasy, Film-Noir, Horror, Musical, Mystery, Romance, Sci-Fi, Thriller, War, Western, (no genres listed)}
#' }
#'
#' @source F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4: 19:1–19:19. <https://doi.org/10.1145/2827872>
"movies"
