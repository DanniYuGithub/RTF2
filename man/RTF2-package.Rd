\name{RTF2-package}
\alias{RTF2-package}
\alias{RTF2}
\docType{package}
\title{
\packageTitle{RTF2}
}
\description{
\packageDescription{RTF2}
}
\details{

%The DESCRIPTION file:
\packageDescription{RTF2}
%\packageIndices{RTF2}
RTF2 package that has functions to produce nice tables/plots in RTF format
}
\author{
\packageAuthor{RTF2}

Maintainer: \packageMaintainer{RTF2}
}
%\references{
%1.  http://r-pkgs.had.co.nz//
%2.  https://cran.r-project.org/web/packages/tables/vignettes/tables.pdf
%}

\keyword{ package }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%~~ \code{\link[<rtf>:<rtf>-package]{<rtf>}} ~~
%}
\examples{

#Notice that you MUST attach package rtf with library(rtf) before using any RTF2 function

#rtf.table.out

#--- table header with more than 1 row
library(rtf)
attach(tb.ex)

titles <- "Just for titles"
footnotes <- "Just for footnotes"
progLocation <- "Where the program is"
dataLocation <- "Where the data is"
outputLocation <- "Where the output is"

output <- file.path(getwd(), "RTF2_table_output_2.rtf")
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=8)

# call function to produce table output
rtf.table.out(rtf, tb=tb.ex,
              cell1=3, cell2=1, nheader=2,
              colFormat=c(rep("L",2), rep("R", 2), rep("C", 6)), 
              cw=c(0.8, 0.8, 0.8, 0.6, rep(0.8, 6)),  
              width=11, height=8.5,
              varName=NULL, var.ul="Var Name Group",
              titles=titles, prd.status='',
              footns=c(footnotes,                                                                                                                  
                       paste("\nProgram Location:", progLocation, 
                             "\nOutput Location:", outputLocation, 
                             "\nData Location:", dataLocation)),   
              nline.body=30, addSpaceHeader=0, addSpaceFoot=0)     


  
# end example

#rtf.plot.out
library(rtf)
attach(dat.ex)

# call RTF (from rtf package) to create a RTF file output
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

}
