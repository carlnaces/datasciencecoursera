library("data.table")

#1
pollutantmean <- function(directory, pollutant, id=1:332){
  
  names <- list.files(directory)
  nums <- as.numeric(sub('\\.csv$', '', names))
  
  selected.files = fileNames[match(id,nums)]
  data = lapply(file.path(directory, selected.files), read.csv)
  
  data = do.call(rbind.data.frame, data)
  mean(data[,pollutant], na.rm = TRUE)
}

#2
complete <- function(directory,  id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  return(dt[complete.cases(dt), .(nobs = .N), by = ID])
  
}

corr <- function(directory, threshold = 0) {
  
  lst <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  dt <- rbindlist(lst)
  
  dt <- dt[complete.cases(dt),]
  
  dt <- dt[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
  return(dt[, corr])
}
