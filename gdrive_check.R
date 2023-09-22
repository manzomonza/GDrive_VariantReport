### Authentications 

googledrive::drive_auth("ngs_data_sdync@pathologie.unispital-basel.ch")
googlesheets4::gs4_auth("ngs_data_sdync@pathologie.unispital-basel.ch")

################################################# OPTPARSE
library(optparse)

option_list = list(
  make_option(c("-gs", "--gdrive_sheet"), type="character", default=NULL,
              help="Name of googlesheet file in Watchdog landingbay", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

gsheet_name = opt$gdrive_sheet
gsheet_name = paste0("'", gsheet_name, "'")
print(opt$gdrive_sheet)

#################################################/ OPTPARSE


qsearch = paste0("name contains ", gsheet_name)

googledrive::drive_find(q = qsearch, type = "spreadsheet")
