### Title: Concatenate GMT Files
### Author: Eileen Owens
### Date: 09/16/2024
### Purpose: Combine multiple GMT files in a format compatible with GSEABase / GSVA.

# Option 1: In terminal
cd /path/to/gmt/files # set to directory where gmt files are located
cat *.gmt > allGeneSets.gmt

# Option 2: In RStudio
library(dplyr)
setwd("/path/to/gmt/files") # set to directory where gmt files are located
gmtFiles <- list.files(pattern = "\\.gmt", full.names = TRUE) # Get list of all .gmt files in this directory
gmtTables <- lapply(gmtFiles, read.table) # Read in the list of files as a table
gmt_data <- bind_rows(gmtTables) # combine them by row into a data frame
gmt_data <- gmt_data %>%
  mutate(across(everything(), ~ replace(.x, is.na(.x), ""))) # replace NA values with blanks
write.table(gmt_data, file="../allGeneSets.txt", sep="\t", row.names = FALSE, col.names = FALSE) # export as tab-delimited txt file, NOT a .gmt file. For whatever reason, the latter DOES NOT WORK. Immediately changing the file extension from .txt to .gmt in your file explorer also WILL NOT WORK. The only solution that I've gotten to work is: 1) Open the exported .txt file in Excel, 2) Change nothing, just "save as" a tab-delimited .txt file, 3) Change the file extension to .gmt in your file explorer. You now have a concatenated GMT file that can be imported without errors for GSEABase-based applications like the GSVA package.
