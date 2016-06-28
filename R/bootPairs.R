#' Compute the bootstrap `sum' of all scores using Cr1 to Cr3.
#' 
#' Maximum entropy bootstrap (meboot) package is used for statistical inference
#' using the sum of three signs sg1 to sg3 from the three criteria Cr1 to Cr3 to
#' assess preponderance of evidence in favor of a sign. (+1, 0, -1).
#' The bootstrap output can be analyzed to assess approximate
#' preponderance of a particular sign which determines
#' the causal direction.
#' 
#' @param mtx {data matrix with two or more columns}
#' @param ctrl {data matrix having control variable(s) if any}
#' @param n999 {Number of bootstrap replications (default=999)}
#' @importFrom meboot meboot
#' @return {A vector of n999 `sum' values summarizing the weighted sums associaed with all three
#'    criteria}  
#' @note This computation is computer intensive and generally very slow. It may be better to use
#'   it at a later stage in the investigation when a preliminary causal determination 
#'   is already made. If you call it with command \code{f1=bootPairs(mtx, n999=n999)}, then
#'   the following code computes the proportion of negative signs: 
#'   \code{length(f1[f1<0])/length(f1)}.
#' In general, a positive sign for weighted sum reported in the column `sum' means
#' that the first variable listed as the input matrix to this function is the `kernel cause.' 
#' @author Prof. H. D. Vinod, Economics Dept., Fordham University, NY
#' @seealso See Also \code{\link{silentPairs}}.
#' @references Vinod, H. D.'Generalized Correlation and Kernel Causality with 
#'  Applications in Development Economics' in Communications in 
#'  Statistics -Simulation and Computation, 2015, 
#'  \url{http://dx.doi.org/10.1080/03610918.2015.1122048} 
#' @references Zheng, S., Shi, N.-Z., and Zhang, Z. (2012). Generalized measures 
#'  of correlation for asymmetry, nonlinearity, and beyond. 
#'  Journal of the American Statistical Association, vol. 107, pp. 1239-1252.
#' @references Vinod, H. D. and Lopez-de-Lacalle, J. (2009). 'Maximum entropy bootstrap
#'  for time series: The meboot R package.' Journal of Statistical Software,
#'  Vol. 29(5), pp. 1-19. 
#' @keywords kernel regression, asymmetric
#' @examples
#'
#' \dontrun{
#' set.seed(34);x=sample(1:10);y=sample(2:11)
#' bootPairs(cbind(x,y),n999=29)
#' 
#' data('EuroCrime')
#' attach(EuroCrime)
#' bootPairs(cbind(crim,off),n999=29) #first column crim is the cause for majority positive signso
#' }
#' @export

bootPairs = function(mtx, ctrl = 0, n999 = 9) {
    p = NCOL(mtx)
    n = NROW(mtx)
    out = matrix(NA, nrow = n999, ncol = p - 1)
    Memtx <- array(NA, dim = c(n, n999, p))  #3 dimensional matrix
    for (i in 1:p) {
        Memtx[, , i] = meboot(mtx[, i], reps = n999)$ensem
    }
    for (k in 1:n999) {
        out[k, ] = silentPairs(mtx = Memtx[, k, 1:p], ctrl = ctrl)
    }
    return(out)
}