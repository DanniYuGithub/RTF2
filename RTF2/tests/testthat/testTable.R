library(rtf)
library(RTF2)
context("Table creation")



test_that("rtf.table.out produces table", {
  data(xyz)
  colnames(xyz) <- apply(xyz[1:3,], 2, function(x) paste0(x, '; ', collapse='')) 
  xyz <- xyz[-(1:3), ]
  output <- "RTF2_table_output_xyz_test.rtf"
  #output <- file.path(system.file("tests/testthat", package = "RTF2"), "RTF2_table_output_xyz_test.rtf")
  rtf <- RTF(output, width=11, height=8.5, omi=c(1, 1, 1, 1), font.size=10)
  rtf.table.out(rtf, tb=xyz,
                titles='titles', prd.status='',
                footns=c(footnotes = 'TEST footnotes',       
                         paste("\nProgram Location:", 'progLocation', 
                               "\nOutput Location:", 'outputLocation', 
                               "\nData Location:", 'dataLocation')),
                nline.body=20, addSpaceHeader=0, addSpaceFoot=0, time.disp = FALSE)
  done(rtf)
  
  original <- system.file("tests/testthat", "RTF2_table_output_xyz.rtf", package = "RTF2")
  test <-  system.file("tests/testthat", "RTF2_table_output_xyz_test.rtf", package = "RTF2")
  
  expect_equal(readLines(original), readLines(test))
})
