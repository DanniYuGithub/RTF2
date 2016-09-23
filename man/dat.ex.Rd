\name{dat.ex}
\alias{dat.ex}
\docType{data}
\title{
dat.ex sample data set
}
\description{
Example car data for rtf table building. The mtcar dataset with the addition of car make and model. 
}
\usage{data("dat.ex")}
\format{
  A data frame with 32 observations on the following 12 variables.
  \describe{
    \item{\code{Catg}}{Car make and model}
    \item{\code{mpg}}{Miles per (US) gallon}
    \item{\code{cyl}}{Number of cylinders}
    \item{\code{disp}}{Displacement (cu. in.)}
    \item{\code{hp}}{Gross horsepower}
    \item{\code{drat}}{Rear axle ratio}
    \item{\code{wt}}{Weight (lb/1000)}
    \item{\code{qsec}}{Quarter mile time}
    \item{\code{vs}}{V/S}
    \item{\code{am}}{Transmission (0 = automatic, 1 = manual)}
    \item{\code{gear}}{Number of forward gears}
    \item{\code{carb}}{Number of carburetors}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
\code{mtcars} dataset from \code{datasets} package with rownames treated as new variable   

Original data from:               
Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(dat.ex)
str(dat.ex) 
}
\keyword{datasets}
