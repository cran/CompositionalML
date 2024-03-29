\name{alpha-SVM}
\alias{alfa.svm}
\title{
\eqn{\alpha}-SVM
}

\description{
\eqn{\alpha}-SVM.
}

\usage{
alfa.svm(xnew, y, x, a = seq(-1, 1, by = 0.1), cost = seq(0.2, 2, by = 0.2), gamma = NULL)
}

\arguments{
\item{xnew}{
A matrix with the new compositional data whose group is to be predicted.
Zeros are allowed, but you must be careful to choose strictly positive vcalues of \eqn{\alpha}.
}
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
}

\details{
For each value of \eqn{\alpha}, the compositional data are transformed and then
the SVM is applied for one or more combinations of the cost and \eqn{\gamma} parameters.
}

\value{
A list including:
\item{mod}{
A list with the results of the SVM model for each value of \eqn{\alpha} that
includes the SVM output (an svm class object) as provided by the function "svm"
of the package \bold{e1071}, the configurations used (cost and \eqn{\gamma} values) and
the predicted values of "xnew".
}
}

\references{
Chang Chih-Chung and Lin Chih-Jen: LIBSVM: a library for Support Vector Machines
https://www.csie.ntu.edu.tw/~cjlin/libsvm/

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
\code{\link{alfasvm.tune}
}
}

\examples{
x <- as.matrix(iris[, 1:4])
x <- x/ rowSums(x)
y <- iris[, 5]
mod <- alfa.svm(x, y, x, a = c(0, 0.5, 1), cost = c(0.2, 0.4), gamma = c(0.1, 0.2) )
mod
}

