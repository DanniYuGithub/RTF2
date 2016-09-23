## ------------------------------------------------------------------------
library(RTF2)
library(rtf)

## ------------------------------------------------------------------------
data(dat.ex)
dat.ex


## ------------------------------------------------------------------------
titles <- "Just for titles"
footnotes <- "Just for footnotes"
progLocation <- "Where the program is"
dataLocation <- "Where the data is"
outputLocation <- "Where the output is"

## ------------------------------------------------------------------------
output <- file.path(getwd(), "RTF2_table_output.rtf")

## ------------------------------------------------------------------------
library(rtf)
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=8)

## ------------------------------------------------------------------------
rtf.table.out(rtf, tb=dat.ex,
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

## ------------------------------------------------------------------------
data(tb.ex)
dim(tb.ex)
colnames(tb.ex)

## ------------------------------------------------------------------------
titles <- "Just for titles"
footnotes <- "Just for footnotes"
progLocation <- "Where the program is"
dataLocation <- "Where the data is"
outputLocation <- "Where the output is"

output <- file.path(getwd(), "RTF2_table_output_2.rtf")
library(rtf)
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=8)

## ------------------------------------------------------------------------
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
done(rtf)

## ------------------------------------------------------------------------
data(xyz)
xyz

## ------------------------------------------------------------------------
hd.var <- apply(xyz[1:3,], 2, function(x) paste0(x, '; ', collapse='')) 
for (i in hd.var) cat(i, '\n', sep='')

## ------------------------------------------------------------------------
colnames(xyz) <- hd.var
xyz <- xyz[-(1:3), ]

## ------------------------------------------------------------------------
output <- file.path(getwd(), "RTF2_table_output_xyz.rtf")
library(rtf)
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=10)
  
#undebug(rtf.table.out)
rtf.table.out(rtf, tb=xyz,
  titles='titles', prd.status='',
  footns=c(footnotes = 'TEST footnotes',       
    paste("\nProgram Location:", 'progLocation', 
          "\nOutput Location:", 'outputLocation', 
          "\nData Location:", 'dataLocation')),
  nline.body=20, addSpaceHeader=0, addSpaceFoot=0) 
done(rtf)

## ------------------------------------------------------------------------
plot.out <- function() {
     plot(dat.ex$mpg ~ factor(dat.ex$cyl))
 }


## ------------------------------------------------------------------------
titles <- "Just for titles"
footnotes <- "Just for footnotes"
progLocation <- "Where the program is"
dataLocation <- "Where the data is"
outputLocation <- "Where the output is"


output <- file.path(getwd(), "RTF2_plot_output.rtf")
library(rtf)
rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=8)


## ------------------------------------------------------------------------
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


