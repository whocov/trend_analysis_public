[![update-trendbreaker](https://github.com/whocov/trend_analysis_public/actions/workflows/update_trendbreaker.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/update_trendbreaker.yml)

# Welcome to the WHO COVID-19 trend analysis repository

**Disclaimer: this repository is work in progress; please do not use without contacting the [author](mailto:thibautjombart@gmail.com).**


## Quick links

### Overall dynamics figures

* [AFRO](https://github.com/whocov/trend_analysis_public#afro-region)
* [EMRO](https://github.com/whocov/trend_analysis_public#emro-region)
* [EURO](https://github.com/whocov/trend_analysis_public#euro-region)
* [PAHO](https://github.com/whocov/trend_analysis_public#paho-region)
* [SEARO](https://github.com/whocov/trend_analysis_public#searo-region)
* [WPRO](https://github.com/whocov/trend_analysis_public#wpro-region)



### ASMODEE runs

This section contains links to *asmodee* results for each WHO region. Results
are stored as *rds* files, each containing a `list` with the following items:

* `summary`: summary of the ASMODEE results
* `results`: outputs of ASMODEE
* `plot_overall_deaths`: *ggplot2* object of the overall dynamics plot using
  death per capita on the y-axis
* `plot_overall_peaks`: *ggplot2* object of the overall dynamics plot using
  incidence as percentage of historical peak (excluding the last 90 days) on the
  y-axis

Links to the *rds* files:

* [AFRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_AFRO_latest.rds)
* [EMRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_EMRO_latest.rds)
* [EURO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_EURO_latest.rds)
* [PAHO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_PAHO_latest.rds)
* [SEARO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_SEARO_latest.rds)
* [WPRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_WPRO_latest.rds)



## Overall dynamics figures

### AFRO region

#### Infection levels as % of historical incidence peak

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_AFRO_latest.png" width="85%">

#### Infection levels as weekly deaths per 100k

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_AFRO_latest.png" width="85%">



### EMRO region

#### Infection levels as % of historical incidence peak

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_EMRO_latest.png" width="85%">

#### Infection levels as weekly deaths per 100k

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_EMRO_latest.png" width="85%">



### EURO region

#### Infection levels as % of historical incidence peak

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_EURO_latest.png" width="85%">

#### Infection levels as weekly deaths per 100k

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_EURO_latest.png" width="85%">



### PAHO region

#### Infection levels as % of historical incidence peak

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_PAHO_latest.png" width="85%">

#### Infection levels as weekly deaths per 100k

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_PAHO_latest.png" width="85%">



#### SEARO region

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_SEARO_latest.png" width="85%">

#### Infection levels as weekly deaths per 100k

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_SEARO_latest.png" width="85%">



### WPRO region

#### Infection levels as % of historical incidence peak

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_WPRO_latest.png" width="85%">

#### Infection levels as weekly deaths per 100k

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_WPRO_latest.png" width="85%">



