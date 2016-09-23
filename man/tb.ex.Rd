\name{tb.ex}
\alias{tb.ex}
\docType{data}
\title{
tb.ex Sample Data Set
}
\description{
A simulated dataset, designed to demonstrate the RTF2 package's ability to create nice tables for data with multiple levels. 
}
\usage{data("tb.ex")}
\format{
  A data frame with 56 observations on the following 10 variables.
  \describe{
    \item{\samp{; ID}}{Individual identification}
    \item{\samp{; Group}}{Treatment group}
    \item{\samp{; Sample}}{Marker measured}
    \item{\samp{; Type}}{Type of measurement}
    \item{\samp{Var Name Group; Cell 0(\%)}}{Measurement value}
    \item{\samp{Var Name Group; Cell 1+(\%)}}{Measurement value}
    \item{\samp{Var Name Group; Cell 2+(\%)}}{Measurement value}
    \item{\samp{Var Name Group; Cell 3+(\%)}}{Measurement value}
    \item{\samp{Var Name Group; Cell High}}{Measurement value}
    \item{\samp{; Ratio}}{Ratio}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(tb.ex)
str(tb.ex) 
}
\keyword{datasets}
