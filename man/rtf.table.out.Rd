\name{rtf.table.out}
\alias{rtf.table.out}

\title{
RTF table output
}
\description{
The function produces nice tables in RTF format.
}
\usage{
rtf.table.out(rtf, tb, cell1 = NULL, cell2 = 1, nheader = NULL, 
              nline.body = 40, height = 8.5, width = 11,
              omi = c(1, 1, 1, 1), cw = NULL, 
              colFormat = NULL, varName = NULL, 
              var.ul = NULL, titles = "", footns = "", prd.status = "QA", 
              header = FALSE, footer = FALSE, addSpaceHeader = 0,
              addSpaceFoot = 0, page.disp = TRUE, time.disp=TRUE, 
              font = "Courier New", Done = TRUE,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rtf}{
RTF object that needs to be declared once before calling the function.
}
  \item{tb}{
Table output that is a data.frame
}
  \item{cell1}{
Row number where table content begins. Default is automatically calculated from column names.
}
  \item{cell2}{
Column number where table content begins. 
}
  \item{nheader}{
Number of rows in table header. Default is automatically calculated from column names.
}
  \item{nline.body}{
Number of rows per page for table output. Varies depending on page format (portrait or landscape).
}
  \item{height}{
The height of the output page.
}
  \item{width}{
The width of the output page.
}
  \item{omi}{
A numerical vector of the form c(bottom, left, top, right) which gives the margin in inches for 
the four sides of the plot. The default is c(1, 1, ,1, 1.).
}
  \item{cw}{
A vector of numbers assigning the width of each table column.
}
  \item{colFormat}{
A vector of characters That assign the alignment (left, center, or right) for each column. 
Using L for left, C for center, and R for right. Default is all left.
}
  \item{varName}{
Variable names that are to be repeated on the next page
}
  \item{var.ul}{
Character vector of variables that are to be underlined in the table header. Default is \cr
first two levels.
}
  \item{titles}{
Table titles
}
  \item{footns}{
Table footnotes
}
  \item{prd.status}{
Mode (dev, qa, prd) for table output
}
  \item{header}{
Just leave the default as FALSE
}
  \item{footer}{
Just leave the default as FALSE
}
  \item{addSpaceHeader}{
Expanding the width of header
}
  \item{addSpaceFoot}{
Expanding the width of footnotes
}
  \item{page.disp}{
Whether to display page number
}
  \item{time.disp}{
  Should time and date be displayed
  }
  \item{font}{
  Font for rtf output
  }
  \item{Done}{
  Is the rtf document complete
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

#--- single row for table header
library(rtf)
attach(dat.ex)
tb <- dat.ex

titles <- "Just for titles"
footnotes <- "Just for footnotes"
progLocation <- "Where the program is"
dataLocation <- "Where the data is"
outputLocation <- "Where the output is"

output <- file.path(getwd(), "RTF2_table_output.rtf")
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=8)

# call function to produce table output
rtf.table.out(rtf, tb=tb,
              cell1=2, cell2=1, nheader=1,
              colFormat=c("R", rep("C", 11)), cw=c(1.8, rep(0.6, 11)), 
              width=11, height=8.5,
              varName=NULL, var.ul=NULL,
              titles=titles, prd.status='',
              footns=c(footnotes,                                                                                                                  
                       paste("\nProgram Location:", progLocation, 
                             "\nOutput Location:", outputLocation, 
                             "\nData Location:", dataLocation)),  
              nline.body=25, addSpaceHeader=0, addSpaceFoot=0)

done(rtf)

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
              cw=c(0.4, 0.5, 0.6, 0.6, rep(0.8, 6)),  
              width=11, height=8.5,
              varName=NULL, var.ul="Var Name Group",
              titles=titles, prd.status='',
              footns=c(footnotes,                                                                                                                   
                       paste("\nProgram Location:", progLocation, 
                             "\nOutput Location:", outputLocation, 
                             "\nData Location:", dataLocation)),  
              nline.body=30, addSpaceHeader=0, addSpaceFoot=0)    

done(rtf)

#--- table header with more than 2 rows
library(rtf)
attach(tb.ex)
colnames(tb.ex) <- c("; ; ID", "; ; Group", "; ; Sample", "; ; Type",
                     "Var Name Group; Early Cell; Cell 0(\%)",  
                     "Var Name Group; Early Cell; Cell 1+(\%)",
                     "Var Name Group; Late Cell; Cell 2+(\%)", 
                     "Var Name Group; Late Cell; Cell 3+(\%)",
                     "Var Name Group; ; Cell High", "; ; Ratio") 

titles <- "Just for titles"
footnotes <- "Just for footnotes"
progLocation <- "Where the program is"
dataLocation <- "Where the data is"
outputLocation <- "Where the output is"

output <- file.path(getwd(), "RTF2_table_output_3.rtf")
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=8)

rtf.table.out(rtf, tb=tb.ex, cell2=1, 
              colFormat=c(rep("L",2), rep("R", 2), rep("C", 6)), 
              cw=c(0.4, 0.5, 0.6, 0.6, rep(0.8, 6)),  
              width=11, height=8.5,
              varName=NULL, titles=titles, prd.status='',
              footns=c(footnotes,                                                                                                                  
                       paste("\nProgram Location:", progLocation, 
                             "\nOutput Location:", outputLocation, 
                             "\nData Location:", dataLocation)),  
              nline.body=30, addSpaceHeader=0, addSpaceFoot=0)    

done(rtf)

###Be certain to have the column names in the correct format with a '; '
  #separating each desired header variable name. 
  #See 'vignette("RTF2")' for an example. 
  
# end example

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
