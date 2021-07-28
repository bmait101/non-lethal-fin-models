# Function to cleave df in two 

cleave_by <- function(df, ...) {
  stopifnot(inherits(df, "data.frame"))
  
  # use tidyeval to get the names ready for dplyr
  grouping <- quos(...)
  
  # Calculate a single number to represent each group
  group_index <- df %>%
    group_by(!!!grouping) %>%
    group_indices()
  
  # do the split by this single group_index variable and return it
  split(df, group_index)
}