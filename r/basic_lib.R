packages <- c('tidyverse', 'magrittr', 'lubridate', 'readxl', 'conflicted', 'plotly', 'RColorBrewer', 'xlsx')

installed_packages <- packages %in% rownames(installed.packages())

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

conflicted::conflicts_prefer(dplyr::filter)
conflicted::conflicts_prefer(dplyr::summarise)

invisible(lapply(packages, library, character.only = TRUE))



