# ── Core Shiny infrastructure ──────────────────────────────
install.packages("shiny")
install.packages("DT")
install.packages("zip")

# ── Data manipulation & output ─────────────────────────────
install.packages("data.table")
install.packages("tidyverse")    # includes readr, ggplot2,
                                 # stringr, stringi, tibble,
                                 # dplyr, tidyr, purrr, readr
install.packages("writexl")

# ── Text / corpus analysis ─────────────────────────────────
install.packages("quanteda")
install.packages("quanteda.textstats")
install.packages("quanteda.textplots")

# ── Network analysis ───────────────────────────────────────
install.packages("igraph")
install.packages("visNetwork")

# ── POS tagging ────────────────────────────────────────────
install.packages("udpipe")

# ── Fast string processing ─────────────────────────────────
install.packages("stringi")

install.packages("textstem")   # lemmatisation
install.packages("koRpus")     # textstem dependency
install.packages("sylly")      # koRpus dependency
install.packages("readr")      # explicit — used for CSV download
