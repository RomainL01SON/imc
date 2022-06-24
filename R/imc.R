library(dplyr)

imc <- function(Height,Weight,unit_height="cm",unit_weight="kg"){

  dplyr::case_when(unit_height=="cm"&unit_weight=="kg"~ Weight/((Height/100)^2),
                   unit_height=="m"&unit_weight=="kg"~ Weight/((Height)^2),
                   TRUE ~ -99)
}

imc(168,115)

