# Spring temperature drives phenotypic selection on plasticity of flowering time
---

Data on field observations of flowering time and fitness of the perennial forest herb Lathyrus vernus and on spring temperature from weather station data. The dataset includes 22 years of data (1987–1996 and 2006–2017) from a Lathyrus vernus population located in a deciduous forest in Tullgarn, SE Sweden (58.9496 N, 17.6097 E). It includes records from 837 individuals (607 from 1987 to 1996, and 230 from 2006 to 2017), and from 2478 flowering events.

## Description of the data and file structure

The file "datadef.csv" includes the following variables:

year: year of the recording

id_nr: numeric plant id

id: unique plant id (combination of numeric plant id and period)

fcode: flowering code (1 if the plant flowered on that year, 0 if not)

FFD: First Flowering Date

n_fl: number of flowers

n_fr: number of fruits

totseed: total number of seeds

intactseed: total number of intact seeds (not damaged by seed predator beetles)

shoot_vol: shoot volume

period: old (1987–1996) or new (2006–2017)

n_years_fl_fitness: number of years when data on flowering and fitness is available

n_years_study: number of years when the plant was included in the study

mean_4: Average daily mean temperature of April (calculated from nearby meteorological station data)

cmean_4: Mean-centred average daily mean temperature of April


## Code/Software

The file "lathyrus_ms2_code_Dryad.rmd" is an R notebook containing all the code needed for running the analyses on the manuscript.