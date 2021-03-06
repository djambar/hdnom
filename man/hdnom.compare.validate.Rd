% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/9.hdnom.compare.validate.R
\name{hdnom.compare.validate}
\alias{hdnom.compare.validate}
\title{Compare High-Dimensional Cox Models by Model Validation}
\usage{
hdnom.compare.validate(x, time, event, model.type = c("lasso", "alasso",
  "flasso", "enet", "aenet", "mcp", "mnet", "scad", "snet"),
  method = c("bootstrap", "cv", "repeated.cv"), boot.times = NULL,
  nfolds = NULL, rep.times = NULL, tauc.type = c("CD", "SZ", "UNO"),
  tauc.time, seed = 1001, trace = TRUE)
}
\arguments{
\item{x}{Matrix of training data used for fitting the model;
on which to run the validation.}

\item{time}{Survival time.
Must be of the same length with the number of rows as \code{x}.}

\item{event}{Status indicator, normally 0 = alive, 1 = dead.
Must be of the same length with the number of rows as \code{x}.}

\item{model.type}{Model types to compare. Could be at least two
of \code{"lasso"}, \code{"alasso"}, \code{"flasso"}, \code{"enet"},
\code{"aenet"}, \code{"mcp"}, \code{"mnet"}, \code{"scad"},
or \code{"snet"}.}

\item{method}{Validation method.
Could be \code{"bootstrap"}, \code{"cv"}, or \code{"repeated.cv"}.}

\item{boot.times}{Number of repetitions for bootstrap.}

\item{nfolds}{Number of folds for cross-validation and
repeated cross-validation.}

\item{rep.times}{Number of repeated times for repeated cross-validation.}

\item{tauc.type}{Type of time-dependent AUC.
Including \code{"CD"} proposed by Chambless and Diao (2006).,
\code{"SZ"} proposed by Song and Zhou (2008).,
\code{"UNO"} proposed by Uno et al. (2007).}

\item{tauc.time}{Numeric vector. Time points at which to evaluate
the time-dependent AUC.}

\item{seed}{A random seed for cross-validation fold division.}

\item{trace}{Logical. Output the validation progress or not.
Default is \code{TRUE}.}
}
\description{
Compare High-Dimensional Cox Models by Model Validation
}
\examples{
# Load imputed SMART data
data(smart)
x = as.matrix(smart[, -c(1, 2)])[1:1000, ]
time = smart$TEVENT[1:1000]
event = smart$EVENT[1:1000]

# Compare lasso and adaptive lasso by 5-fold cross-validation
cmp.val.cv =
  hdnom.compare.validate(x, time, event,
                         model.type = c("lasso", "alasso"),
                         method = "cv", nfolds = 5, tauc.type = "UNO",
                         tauc.time = seq(0.25, 2, 0.25) * 365, seed = 1001)

print(cmp.val.cv)
summary(cmp.val.cv)
plot(cmp.val.cv)
plot(cmp.val.cv, interval = TRUE)
}
\references{
Chambless, L. E. and G. Diao (2006).
Estimation of time-dependent area under the ROC curve for long-term
risk prediction.
\emph{Statistics in Medicine} 25, 3474--3486.

Song, X. and X.-H. Zhou (2008).
A semiparametric approach for the covariate specific ROC curve with
survival outcome.
\emph{Statistica Sinica} 18, 947--965.

Uno, H., T. Cai, L. Tian, and L. J. Wei (2007).
Evaluating prediction rules for t-year survivors with censored
regression models.
\emph{Journal of the American Statistical Association} 102, 527--537.
}

