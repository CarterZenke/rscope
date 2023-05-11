find_and_parse_lateness <- function(df, regex="- Lateness", unit="seconds") {
  new <- df %>%
           dplyr::rowwise() %>%
           dplyr::mutate(
             dplyr::across(
               dplyr::matches(regex),
               rscope::parse_lateness
             )
           )

  return(new)
}
