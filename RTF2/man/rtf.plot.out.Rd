\name{rtf.plot.out}
\alias{rtf.plot.out}

\title{
RTF plot output
}
\description{
The function produces nice plots in RTF format.
}
\usage{
rtf.plot.out(rtf, plotOut, page.disp = FALSE, 
             height = 8.5, width = 11, omi.marg = c(1, 1, 1, 1), 
             width.plot = 8, height.plot = 5, fs = 10, 
             titles, footns, prd.status = "", font = "Courier New", 
             widthHeader = 7, widthFoot = 9, breakPage = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rtf}{
RTF object that is needs to be declared once before calling the function
}
  \item{plotOut}{
Plot output that should be a function. For example, plotOut <- function()
}
  \item{page.disp}{
Whether to display page number
}
  \item{height}{
The height of the output page.
}
  \item{width}{
The width of the output page.
}
  \item{omi.marg}{
A numerical vector of the form c(bottom, left, top, right) which gives the margin in inches for the four sides of the plot. The default is c(1, 1, ,1, 1.).
}
  \item{width.plot}{
The width of the plot print out.
}
  \item{height.plot}{
The height of the plot print out.
}
  \item{fs}{
Font size
}
  \item{titles}{
Plot titles
}
  \item{footns}{
Plot footnotes
}
  \item{prd.status}{
Mode (dev, qa, prd) for plot output
}
  \item{font}{
  Font for output
  }
  \item{widthHeader}{
Set the width of titles
}
  \item{widthFoot}{
Set the width of footnotes
}
  \item{breakPage}{
If there is more than one page, use breakPage=TRUE for going to the new page.
}
  \item{\dots}{
Other arguments passed
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Michael Man, Duytrac Nguyen, and Danni Yu
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# start example

#Notice that you MUST attach package rtf with library(rtf) before using any RTF2 function

library(rtf)

# put the plot into a function
plot.out <- function() {
  plot(dat.ex$mpg ~ factor(dat.ex$cyl))
}#end

titles <- "Just for titles"
footnotes <- "Just for footnotes"
progLocation <- "Where the program is"
dataLocation <- "Where the data is"
outputLocation <- "Where the output is"

output <- file.path(getwd(), "RTF2_plot_output.rtf")
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=8)

# call function to produce plot output
rtf.plot.out(rtf, plotOut=plot.out, page.disp=FALSE,
           height=8.5, width=11, omi.marg=c(1, 1, 1, 1),
           width.plot=8, height.plot=4.5,
           fs=8,
           titles=titles,
           footns=c(paste(footnotes, "\n\nProgram Location:", progLocation, 
                          "\nOutput Location:", outputLocation, 
                          "\nData Location:", dataLocation)),
           widthHeader=7, widthFoot=9, prd.status="")
done(rtf)

# end example    
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
