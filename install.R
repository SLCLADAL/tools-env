# ============================================================
# SLCLADAL/tools-env — install.R
# Runs during repo2docker image build (internet available).
# All packages and udpipe models are baked into the image.
# ============================================================

# ── CRAN packages ────────────────────────────────────────────
install.packages(c(
  # Core Shiny
  "shiny",
  
  # Data wrangling
  "tidyverse",
  "data.table",
  "stringi",
  "dplyr",
  "ggplot2",
  "tibble",
  "readr",
  
  # Output / download
  "writexl",
  "DT",
  "zip",
  
  # Text analytics
  "quanteda",
  "quanteda.textplots",
  "quanteda.textstats",
  "udpipe",
  "tidytext",
  "topicmodels",
  "SnowballC",
  
  # Network visualisation
  "visNetwork",
  
  # Topic modelling
  "seededlda",
  
  # Lemmatisation (WordWebber optional)
  "textstem",
  
  # Utilities
  "remotes"
), repos = "https://cloud.r-project.org", dependencies = TRUE)

# ── udpipe models ────────────────────────────────────────────
# Pre-download during build so models are baked into the image.
# Without this the POSTagger tries to download at runtime, but
# ARDC Binder blocks outbound internet → model load fails.

message("Downloading udpipe models...")

model_dir <- "/home/jovyan/udpipe-models"
dir.create(model_dir, recursive = TRUE, showWarnings = FALSE)

bundled_langs <- c(
  "arabic-padt",
  "chinese-gsd",        "chinese-gsdsimp",
  "dutch-alpino",       "dutch-lassysmall",
  "english-ewt",        "english-gum",
  "english-lines",      "english-partut",
  "french-gsd",         "french-partut",
  "french-sequoia",     "french-spoken",
  "german-gsd",         "german-hdt",
  "italian-isdt",       "italian-partut",
  "italian-postwita",   "italian-twittiro",   "italian-vit",
  "japanese-gsd",
  "portuguese-bosque",  "portuguese-br",      "portuguese-gsd",
  "russian-gsd",        "russian-syntagrus",  "russian-taiga",
  "spanish-ancora",     "spanish-gsd"
)

for (lang in bundled_langs) {
  tryCatch({
    existing <- list.files(model_dir,
                           pattern    = paste0("^", lang, ".*[.]udpipe$"),
                           full.names = TRUE)
    if (length(existing) > 0) {
      message("  Already present: ", lang)
    } else {
      message("  Downloading: ", lang, " ...")
      udpipe::udpipe_download_model(language  = lang,
                                    model_dir = model_dir)
      message("  Done: ", lang)
    }
  }, error = function(e) {
    message("  WARNING — could not download '", lang,
            "': ", conditionMessage(e))
  })
}

n_models <- length(list.files(model_dir, pattern = "[.]udpipe$"))
message("udpipe downloads complete. Models in image: ", n_models)
