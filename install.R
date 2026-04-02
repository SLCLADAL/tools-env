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

install.packages("topicmodels")   # unsupervised LDA
install.packages("seededlda")     # seeded/semi-supervised LDA
install.packages("SnowballC")     # stemming
install.packages("tidytext")      # tidy() for LDA beta/gamma matrices

install.packages("reshape2")      # for LDA data reformatting

# Pre-download udpipe models so they are baked into the Binder image
model_dir <- "/home/jovyan/udpipe-models"
dir.create(model_dir, recursive = TRUE, showWarnings = FALSE)
for (lang in c("english-ewt", "german-gsd", "french-gsd", 
               "spanish-ancora", "italian-isdt", "portuguese-bosque",
               "dutch-alpino", "russian-syntagrus", "chinese-gsd")) {
  tryCatch(
    udpipe::udpipe_download_model(language = lang, model_dir = model_dir),
    error = function(e) message("Could not download: ", lang)
  )
}
