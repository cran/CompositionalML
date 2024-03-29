\name{Tuning the parameters of the alpha-SVM}
\alias{alfasvm.tune}
\title{
Tuning the parameters of the \eqn{\alpha}-SVM
}

\description{
Tuning the parameters of the \eqn{\alpha}-SVM.
}

\usage{
alfasvm.tune(y, x, a = seq(-1, 1, by = 0.1), cost = seq(0.2, 2, by = 0.2), gamma = NULL,
ncores = 1, folds = NULL, nfolds = 10, stratified = TRUE, seed = NULL, graph = FALSE)
}

\arguments{
\item{y}{
The response variable, it can either be a factor (for classification) or a
numeric vector (for regression). Depending on the nature of the response
variable, the function will proceed with the necessary task.
}
\item{x}{
A matrix with the compositional data.
}
\item{a}{
A vector with a grid of values of the power transformation, it has to be
between -1 and 1. If zero values are present it has to be greater than 0.
If a=0, the isometric log-ratio transformation is applied.
}
\item{cost}{
A grid of values for the cost of constraints violation. The cost is the
"C"-constant of the regularization term in the Lagrange formulation.
}
\item{gamma}{
A grid of values for the \eqn{\gamma} parameter of the Gaussian kernel.
If no values are supplied the default grid is used, ten equidistant values
from \eqn{1/D^2} to \eqn{\sqrt{D}},
}
\item{ncores}{
The number of cores to use. If more than 1, parallel computing will take place.
It is advisable to use it if you have many observations and or many variables,
otherwise it will slow down the process.
}
\item{folds}{
If you have the list with the folds supply it here. You can also leave it
NULL and it will create folds.
}
\item{nfolds}{
The number of folds in the cross validation.
}
\item{stratified}{
Do you want the folds to be created in a stratified way? TRUE or FALSE.
}
\item{seed}{
You can specify your own seed number here or leave it NULL.
}
\item{graph}{
If graph is TRUE (default value) a plot will appear.
}
}

\details{
K-fold cross validation is performed to select the optimal parameters for the SVM
and also estimate the rate of accuracy. For continuous responses the estimated
performance translates to the MSE, while for categorical responses (factors) this
is the accuracy (percentage of crrect classification).
}

\value{
If graph is true, a graph with the estimated performance for each value of \eqn{\alpha}.
A list including:
\item{per}{
A vector with the estimated performance for each value of \eqn{\alpha}.
}
\item{performance}{
A vector with the optimal performance and the optimal combinations of cost and \eqn{\gamma} values.
}
\item{best_a}{
The value of \eqn{\alpha} corresponding to the optimal performance.
}
\item{runtime}{
The time required by the cross-validation procedure.
}
}

\references{
Chang Chih-Chung and Lin Chih-Jen: LIBSVM: a library for Support Vector Machines
https://www.csie.ntu.edu.tw/~cjlin/libsvm/

Friedman Jerome, Trevor Hastie and Robert Tibshirani (2009).
The elements of statistical learning, 2nd edition. Springer, Berlin.

Tsagris M.T., Preston S. and Wood A.T.A. (2011). A data-based power transformation
for compositional data. In Proceedings of the 4th Compositional Data Analysis
Workshop, Girona, Spain. https://arxiv.org/pdf/1106.1451.pdf
}

\author{
Michail Tsagris.

R implementation and documentation: Michail Tsagris \email{mtsagris@uoc.gr}.
}

%\note{
%%  ~~further notes~~
%}

\seealso{
\code{\link{alfa.svm}
}
}

\examples{
x <- as.matrix(iris[, 1:4])
x <- x/ rowSums(x)
y <- iris[, 5]
mod <- alfasvm.tune(y, x, a = c(0, 0.5, 1), cost = c(0.2, 0.4), gamma = c(0.1, 0.2) )
mod
}

