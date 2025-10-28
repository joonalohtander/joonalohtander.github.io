library(tidyverse)
library(googlesheets4)
library(ggtern)
library(data.table)
library(here)
theme_set(theme_bw())
i_am("ternary.R")

max_value = 8 # Maximum value in Likert scale

# read data
# sheet_url is the URL for the data from the Google form (Google Sheets link)
gs4_deauth()
sheet_url <-
  "https://docs.google.com/spreadsheets/d/1xCLr3IhDbjMgCBj7Dwijlv28d332-VtGGgG0N0cKPX4/edit?usp=sharing"
data <- read_sheet(sheet_url) %>%
  as.data.table()

# Change colnames depending on your Google Forms format
colnames(data) <- c("timestamp", "env_econ", "env_soc", "soc_econ")

data <- data %>% 
  .[, env_econ := as.integer(sub("\\..*", "", env_econ))+4] %>% 
  .[, env_soc := as.integer(sub("\\..*", "", env_soc))+4] %>% 
  .[, soc_econ := as.integer(sub("\\..*", "", soc_econ))+4]

env_econ = data$env_econ
env_soc = data$env_soc
soc_econ = data$soc_econ

# count mean weight per value
env_abs = (env_econ + env_soc) / 2
econ_abs = (max_value - env_econ + max_value - soc_econ) / 2
soc_abs = (soc_econ + max_value - env_soc) / 2

# weight the means
env = env_abs * (max_value - econ_abs) / max_value * (max_value - soc_abs) /
  max_value
econ = econ_abs * (max_value - env_abs) / max_value * (max_value - soc_abs) /
  max_value
soc = soc_abs * (max_value - env_abs) / max_value * (max_value - econ_abs) /
  max_value

data <- data.table(env = env, econ = econ, soc = soc)

# draw plot
plot <- ggtern(data, aes(x = soc, y = econ, z = env)) +
  xlab("Social \nValues") +
  ylab("Economic Values") +
  zlab("Environmental \nValues") +
  geom_point(size = 3, color = "#001219") +
  theme(
    panel.background = element_rect(fill = "#F9F7E9"),
    plot.background = element_rect(fill = "transparent"),
    text = element_text(color = "#001219"),
    line = element_line(color = "#001219")
  )

# save plot to current directory
ggtern::ggsave(
  plot = plot,
  path = here(),
  filename = "ternary.png",
  width = 360,
  height = 240,
  units = "mm",
  bg = "transparent"
)

plot


