cetak_hasil_excel <-function(dataku)
{
  
  wb <- openxlsx::createWorkbook()
  
  hs1 <- openxlsx::createStyle(fgFill = "#DCE6F1", halign = "CENTER", textDecoration = "italic",
                                 border = "Bottom")
  
  hs2 <- openxlsx::createStyle(fontColour = "#ffffff", fgFill = "#4F80BD",
                              halign = "center", valign="center", textDecoration = "bold", 
                               border = "TopBottomLeftRight")
  
  openxlsx::addWorksheet(wb, "", gridLines = TRUE)
  
  openxlsx::writeDataTable(wb, "", dataku, rowNames = FALSE, startRow = 2, startCol = 2, tableStyle = "TableStyleMedium21")
                           
                           openxlsx::openXL(wb)
}
                           