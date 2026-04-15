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

