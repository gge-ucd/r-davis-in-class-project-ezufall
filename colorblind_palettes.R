install.packages("ggthemes")
install.packages("viridis")
install.packages("scico")
install.packages("devtools")
devtools::install_github("kwstat/pals")
install.packages("rcartocolor")

library(ggplot2)
library(ggthemes)
library(scales)
library(viridis)
library(scico)
library(devtools)
library(pals)
library(rcartocolor)
#also see colorbrewer.org, carto

show_col(coolwarm(16), labels = FALSE)

#from ggthemes
show_col(colorblind_pal()(8))
#scale_colour_colorblind etc
# same colorblind palette with grey:
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
show_col(cbPalette)
# same colorblind palette with black:
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
show_col(cbbPalette)
# To use for fills, add
scale_fill_manual(values=cbPalette)
# To use for line and point colors, add
scale_colour_manual(values=cbPalette)

#from the viridis package
#turbo = new and better jet
show_col(turbo(16), labels = FALSE)
#rocket and mako from python
show_col(rocket(16), labels = FALSE)
show_col(mako(16), labels = FALSE)
#edited cividis
show_col(cividis(16), labels = FALSE)
show_col(magma(16), labels = FALSE)
show_col(inferno(16), labels = FALSE)
show_col(plasma(16), labels = FALSE)
show_col(viridis(16), labels = FALSE)
#scale_fill_viridis
#scale_color_viridis

#from the scales package
show_col(viridis_pal()(16), labels = FALSE)
#?scale_colour_scico
#?scale_color_scico
#?scale_fill_scico
#?scale_colour_scico_d
#?scale_color_scico_d
#?scale_fill_scico_d

#from the scico package
#diverging
scico_palette_show(palettes = "vik")
scico_palette_show(palettes = "roma")
scico_palette_show(palettes = "broc")
scico_palette_show(palettes = "cork")
scico_palette_show(palettes = "tofino")
scico_palette_show(palettes = "lisbon")
scico_palette_show(palettes = "berlin")

#sequential
#hawaii and batlow are pretty
scico_palette_show(palettes = "batlow")
scico_palette_show(palettes = "bilbao")
scico_palette_show(palettes = "bamako")
scico_palette_show(palettes = "acton")
scico_palette_show(palettes = "buda")
scico_palette_show(palettes = "davos")
scico_palette_show(palettes = "devon")
scico_palette_show(palettes = "grayC")
scico_palette_show(palettes = "acton")
scico_palette_show(palettes = "hawaii")
scico_palette_show(palettes = "imola")
scico_palette_show(palettes = "lajolla")
scico_palette_show(palettes = "nuuk")
scico_palette_show(palettes = "tokyo")
scico_palette_show(palettes = "oslo")
scico_palette_show(palettes = "turku")

#dual
scico_palette_show(palettes = "oleron")

#circular
scico_palette_show(palettes = "brocO")
scico_palette_show(palettes = "corkO")
scico_palette_show(palettes = "vikO")
scico_palette_show(palettes = "romaO")

#from pals
#ocean.curl is pretty
pal.bands(ocean.balance, ocean.delta, ocean.curl, main = "cmocean")
pal.bands(ocean.thermal, ocean.haline, ocean.solar)

#from rcartocolor
display_carto_all(type = "diverging", colorblind_friendly = TRUE)
display_carto_all(type = "quantitative", colorblind_friendly = TRUE)
display_carto_all(type = "qualitative", colorblind_friendly = TRUE)
display_carto_all(type = "aggregation", colorblind_friendly = TRUE)
display_carto_all(type = "all", colorblind_friendly = TRUE)

#color brewer example of creating a color ramp with same color in the middle
#of diverging color scale
brbg <- brewer.pal(11, "BrBG")
cols <- c(colorRampPalette(c(brbg[1], brbg[6]))(51), 
          colorRampPalette(c(brbg[6], brbg[11]))(51)[-1])

#brown to white to green colormap
library(RColorBrewer)
display.brewer.pal(11, "BrBG")
