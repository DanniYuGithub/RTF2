
#*****************************************************************************************************
#-- Function to produce table or plot to RTF file
#
#-- Author: Duytrac Nguyen
#
#*****************************************************************************************************

#-----------------------------------------------------------------------------------------------
#
###--- These functions are used for formatting dataframe, before produce it to RTF file
#
#-----------------------------------------------------------------------------------------------
# cat the expression and its result.
cat.exp <- function(x, start='\n----', sep2=ifelse(Print, '\n', ': '), end='\n',
                    Print=is.na(match(class(eval(x)), c('integer', 'numeric', 'character')))) {
  cat(start, deparse(substitute(x)), sep2)
  if (!Print) cat(eval(x),end) else print(eval(x))
}#end


# Function to add blank line between item (record) from table output.
add.blank.line.between <- function(dat, index_blank) {
  #--- adding blank lines between subjects
  dat2 <- NULL
  for(k in 1:length(index_blank)) {
    if(k==1) {
      if(index_blank[k]==index_blank[k+1]-1) {
        tmp <- rbind(dat[1:index_blank[k], ], "")
      } else {
        tmp <- rbind(dat[(index_blank[k]:(index_blank[k+1]-1)), ], "")
      }
    } else if(k==length(index_blank)) {
      tmp <- rbind(dat[(index_blank[k]:nrow(dat)), ], "")
    } else {
      tmp <- rbind(dat[(index_blank[k]:(index_blank[k+1]-1)), ], "")
    }
    if(is.null(dat2)) dat2 <- tmp else dat2 <- rbind(dat2, tmp)
  }
  dat_with_blank <- dat2

  return(dat_with_blank)
}#end


# format numbers before outputing
format.num <- function(x, num.sigf=2, width=1, num.space=1, trun=FALSE) {
  num <- formatC(format(round(x, num.sigf), nsmall=num.sigf), 
                 width=width, flag=paste(rep("", num.space), collapse=" "))
  if(trun==TRUE) {
    num <- gsub(" ", "", num)
  }
  return(num)
}#end format_num


sep.space <- function(n) {
  paste(rep(" ", times=n), collapse="")
}#end


#--- exclude col with all NA value
ex.col <- function(dat, excluded=c(NA, "")) {
  for(i in colnames(dat))
    if(all(dat[,i] %in% excluded)) {
      print(i)
      dat <- dat[,-which(names(dat) %in% i)]
    }
  dat
}


#--- excluded row with all NA value
ex.row <- function(dat, na.str=c(NA, "NA", "", " ", ".")) {
  ex.r <- NULL
  for(i in 1:nrow(dat)) {
    x <- dat[i,]
    if(all(x %in% na.str))
      ex.r <- c(ex.r, i)
  }
  if(!is.null(ex.r))
    ret <- dat[-ex.r,] else
      ret <- dat
    return(ret)
}#end


#--- function to make the 1st letter of a word to uppercase
simpleCap <- function(x) {
  x2 <- tolower(x)
  gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", x2, perl=TRUE)
}#end


# reorder levels 
level.order <- function(x, index=c(1,2,3)) {
  y <- factor(x)
  levels(y) <- index
  y <- as.numeric(as.character(y))
  return(y)
}#end


# remove duplcate. For example, a ID has multiple rows, just displaying
# the ID in the 1st row, the rest is empty
removed.dup <- function(dat, dupBy=NULL, varName=NULL) {
  id.dup <- which(duplicated(dat[,dupBy]))
  dat[id.dup, varName] <- ""
  return(dat)
}#end


#--- function to replace value
replace.val <- function(x, replaceVal=NA, byVal=NULL) {
  id <- which(x %in% replaceVal)
  x[id] <- byVal
  x
}#end replace_val


# some cases needed to convert NA to zero
convert.NA.to.zero <- function(dat) {
  check.NA <- function(x, width=2) {
    if(any(is.na(x)))
      x[x%in%NA] <- format(0, justify='right', width=width)
    x
  }
  
  tmp <- apply(dat, 2, check_NA)
  ret <- data.frame(tmp)
  return(ret)
}#end


# Function to Generate rtf table column widths
col.width <- function(tb){  
  cws <- NULL
  for(i in 1:length(names(tb))) {
    ncName <- nchar(names(tb)[i])
    ncString <- max(nchar(tb[,i]))
    nc <- max(ncName, ncString)
    cw <- nc*0.89/10                 # assume 10 characters per an inch
    cws <- c(cws, cw)
  }
  return(cws)
}#end


# Fill missing/blank as NA
fill.missing <- function(x) {
  x2 <- x
  if(any(x2 %in% c(NA, "", ".", " "))) {
    x2[which(x2 %in% c(NA, "", ".", " "))] <- NA
  }
  # make sure class of x would be the same as its original class
  class(x2) <- class(x)
  return(x2)
}#end


# make two data have the same class()
# apply for original and derived data
class.data <- function(dat1, dat2) {
  # dat1: original
  # dat2: derived
  if(ncol(dat1) != ncol(dat2))
    stop
  for(i in 1:ncol(dat1)) {
    class(dat2[,i]) <- class(dat1[,i])
  }
  return(dat2)
}#end

# function to map Lilly color with chart R color
color.code <- function(str.color) {
  colz <- NULL
  for(i in 1:length(str.color)) {
    colz[i] <- str.color[i]
    if(str.color[i] %in% "red")     {colz[i] <- '#D52B1E'} 
    if(str.color[i] %in% "blue")    {colz[i] <- '#00A1DE'}  
    if(str.color[i] %in% "darkblue")    {colz[i] <- '#263F6A'} 
    if(str.color[i] %in% "green")   {colz[i] <- '#00AF3F'}  
    if(str.color[i] %in% "lightgreen")  {colz[i] <- '#C2EDCE'}
    if(str.color[i] %in% "darkgreen")   {colz[i] <- '#275E37'}
    if(str.color[i] %in% "yellow")  {colz[i] <- '#FED100'}
    if(str.color[i] %in% "orange")  {colz[i] <- '#FF6D22'}
    if(str.color[i] %in% c('grey', 'gray'))           {colz[i] <- '#A59D95'}
    if(str.color[i] %in% c('lightgrey', 'lightgray')) {colz[i] <- '#D5D2CA'}
    if(str.color[i] %in% c('darkgrey', 'darkgray')) {colz[i] <- '#82786F'}
    if(str.color[i] %in% "brown")    {colz[i] <- '#4E2E2D'}
    
  }#end
  return(colz)
}#end

#------------------------------------------------------------------------------------------------









