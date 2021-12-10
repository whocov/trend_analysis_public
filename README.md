Welcome to the WHO COVID-19 trend analysis repository
================

  - [Preamble](#preamble)
  - [Quick links](#quick-links)
  - [Overall dynamics figures](#overall-dynamics-figures-1)
  - [Contributions](#contributions)

[![refresh-readme](https://github.com/whocov/trend_analysis_public/actions/workflows/refresh_readme.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/refresh_readme.yml)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5106335.svg)](https://doi.org/10.5281/zenodo.5106335)

# Preamble

## Forewords

Welcome to the repository implementing the COVID-19 surveillance
pipelines developed by the WHO COVID-19 Analytics Team. For more
information on the infrastructure, check the [dedicated
website](https://asmodee-infrastructure-handbook.netlify.app/).

## General disclaimer

This repository contains work in progress. It implements an automated
data pipeline for country-level surveillance of COVID-19 dynamics using
publicly available data. Its content should not be used for publications
without explicit agreement from the authors. The accuracy of the
estimates provided in these analyses is contingent on data quality and
availability. Results presented here do not represent the official view
of the WHO, its staff or consultants. Caution must be taken when
interpreting all data presented, and differences between information
products published by WHO, national public health authorities, and other
sources using different inclusion criteria and different data cut-off
times are to be expected. While steps are taken to ensure accuracy and
reliability, all data are subject to continuous verification and change.
All counts are subject to variations in case detection, definitions,
laboratory testing, vaccination strategy, and reporting strategies. See
<https://covid19.who.int/info/> for further background and other
important considerations surrounding the source data. The designations
employed and the presentation of these materials do not imply the
expression of any opinion whatsoever on the part of WHO concerning the
legal status of any country, territory or area or of its authorities, or
concerning the delimitation of its frontiers or boundaries. We seek to
provide results for countries in all WHO regions (see inclusion criteria
below). For technical reasons (missing data, low incidence, model not
successfully fitting to the data), results may not be available for some
countries. Where this happens, the list of missing countries is
indicated in the relevant sections.

## Content of this repository

This repository provides country-level analyses of COVID-19 dynamics
characterised as summary figures, which outline:

  - **x-axis**: the daily growth rate of reported cases
  - **y-axis**: the current level of infections in the country (using 2
    different metrics, see below)
  - **color**: indications of increase in transmissibility from ASMODEE

The sections below provides details on these elements.

### Growth rates

The daily growth rate is estimated by fitting a Poisson GLM to reported
cases over the last 3 weeks. Note that whilst it is able to fit most
countries, this model may underestimate uncertainty. See [this
issue](https://github.com/whocov/trend_analysis_public/issues/4) and
[this one](https://github.com/whocov/trend_analysis_public/issues/5) for
discussions on future improvements.

### Current levels of infection

Two metrics are used as proxy for the current levels of infection:

1.  *% of historical peak of case incidence*: this metric uses the
    highest case incidence reported over a weekly time window; in
    situations where a country is currently going up its historical
    peak, this metric will slightly exceed 100%
2.  *death incidence per 1M inhabitants*: this metric is less sensitive
    to testing or case reporting; however, it does not solely reflect
    changes in COVID-19 dynamics, and is likely impacted by healthcare
    infrastructure

### Recent increases detected by ASMODEE

ASMODEE (**A**utomated **S**election of **M**odels and **D**etection of
**O**utliers for **E**pid**E**mics) is a new method for detecting recent
changes of trend in case incidence data. The initial publication
(Jombart et al. 2021 Phil Trans B) describing the method is currently in
press, and will be linked as soon as available.

## Inclusion criteria

Analyses are performed on all countries of WHO regions meeting the
following criteria:

  - reported at least 100 cases or tests over the last 7 weeks
  - (*in analyses using peak incidence*) peak weekly incidence is
    strictly positive (i.e. at least on case was reported in the past)

## Getting in touch

  - For bug reports, feature requests, or general feedback, please use
    github
    [issues](https://github.com/whocov/trend_analysis_public/issues).

  - You have questions, ideas, or comments you would like to share? Join
    our [discussion
    forum](https://github.com/whocov/trend_analysis_public/discussions).

  - Contributions to this repository are welcome through [pull
    requests](https://github.com/whocov/trend_analysis_public/pulls).

  - For further enquiries, send an email to [Thibaut
    Jombart](mailto:thibautjombart@gmail.com).

Note that for all matters of social interactions, this project is
submitted to a [code of conduct](CONDUCT.md).

-----

-----

# Quick links

## Overall dynamics figures

  - [AFRO](https://github.com/whocov/trend_analysis_public#afro-region)
  - [EMRO](https://github.com/whocov/trend_analysis_public#emro-region)
  - [EURO](https://github.com/whocov/trend_analysis_public#euro-region)
  - [PAHO](https://github.com/whocov/trend_analysis_public#paho-region)
  - [SEARO](https://github.com/whocov/trend_analysis_public#searo-region)
  - [WPRO](https://github.com/whocov/trend_analysis_public#wpro-region)

## ASMODEE runs

This section contains links to *asmodee* results for each WHO region.
Results are stored as *rds* files, each containing a `list` with the
following items:

  - `summary`: summary of the ASMODEE results
  - `results`: outputs of ASMODEE
  - `plot_overall_deaths`: *ggplot2* object of the overall dynamics plot
    using death per capita on the y-axis
  - `plot_overall_peaks`: *ggplot2* object of the overall dynamics plot
    using incidence as percentage of historical peak on the y-axis

Links to the *rds* files:

  - [AFRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_AFRO_latest.rds)
  - [EMRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_EMRO_latest.rds)
  - [EURO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_EURO_latest.rds)
  - [PAHO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_PAHO_latest.rds)
  - [SEARO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_SEARO_latest.rds)
  - [WPRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_WPRO_latest.rds)

# Overall dynamics figures

## AFRO region

[![auto-update-afro](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_afro.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_afro.yml)

<br>Analyses were last updated **Friday 10 December
2021**.<br><br>**Notes** <br>The following countries reported \< 100
cases/tests over the last 7 weeks and were not included in further
analyses:<br>Liberia, Saint Helena, Sao Tome and Principe, Sierra Leone
<br>

### Infection levels as % of historical incidence peak

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_peaks_AFRO_latest.png" width="85%">

### Infection levels as weekly deaths per 1M inhabitants

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_deaths_AFRO_latest.png" width="85%">

-----

-----

## EMRO region

[![auto-update-emro](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_emro.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_emro.yml)

<br>Analyses were last updated **Friday 10 December
2021**.<br><br>**Notes** <br>The following countries reported \< 100
cases/tests over the last 7 weeks and were not included in further
analyses:<br>Djibouti <br>

### Infection levels as % of historical incidence peak

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_peaks_EMRO_latest.png" width="85%">

### Infection levels as weekly deaths per 1M inhabitants

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_deaths_EMRO_latest.png" width="85%">

-----

-----

## EURO region

[![auto-update-euro](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_euro.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_euro.yml)

<br>Analyses were last updated **Friday 10 December
2021**.<br><br>**Notes** <br>The following countries reported \< 100
cases/tests over the last 7 weeks and were not included in further
analyses:<br>Holy See, Tajikistan <br>

### Infection levels as % of historical incidence peak

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_peaks_EURO_latest.png" width="85%">

### Infection levels as weekly deaths per 1M inhabitants

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_deaths_EURO_latest.png" width="85%">

† All references to Kosovo should be understood to be in the context of
the United Nations Security Council resolution 1244 (1999).

-----

-----

## PAHO region

[![auto-update-paho](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_paho.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_paho.yml)

<br>Analyses were last updated **Friday 10 December
2021**.<br><br>**Notes:** The following countries reported \< 100
cases/tests over the last 7 weeks and were not included in further
analyses:<br>British Virgin Islands, Falkland Islands (Malvinas),
Montserrat, Saba, Saint Barthélemy, Saint Pierre and Miquelon, Sint
Eustatius <br>

**Notes of geographic units**:

  - a dispute exists between the Governments of Argentina and the United
    Kingdom of Great Britain and Northern Ireland concerning sovereignty
    over the Falkland Islands (Malvinas)

  - data for Bonaire, Sint Eustatius and Saba have been disaggregated
    and displayed at the subnational level.

### Infection levels as % of historical incidence peak

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_peaks_PAHO_latest.png" width="85%">

### Infection levels as weekly deaths per 1M inhabitants

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_deaths_PAHO_latest.png" width="85%">

-----

-----

[![auto-update-searo](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_searo.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_searo.yml)

## SEARO region

<br>Analyses were last updated **Friday 10 December
2021**.<br><br>**Notes** <br>The following countries reported \< 100
cases/tests over the last 7 weeks and were not included in further
analyses:<br>Democratic People’s Republic of Korea, Timor-Leste <br>

### Infection levels as % of historical incidence peak

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_peaks_SEARO_latest.png" width="85%">

### Infection levels as weekly deaths per 1M inhabitants

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_deaths_SEARO_latest.png" width="85%">

-----

-----

## WPRO region

[![auto-update-wpro](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_wpro.yml/badge.svg)](https://github.com/whocov/trend_analysis_public/actions/workflows/auto_update_wpro.yml)

<br>Analyses were last updated **Friday 10 December
2021**.<br><br>**Notes** <br>The following countries reported \< 100
cases/tests over the last 7 weeks and were not included in further
analyses:<br>American Samoa, Cook Islands, Kiribati, Marshall Islands,
Micronesia (Federated States of), Nauru, Niue, Palau, Pitcairn Islands,
Samoa, Solomon Islands, Tokelau, Tonga, Tuvalu, Vanuatu, Wallis and
Futuna <br>

### Infection levels as % of historical incidence peak

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_peaks_WPRO_latest.png" width="85%">

### Infection levels as weekly deaths per 1M inhabitants

<img src="https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/png/pinplot_deaths_WPRO_latest.png" width="85%">

-----

-----

# Contributions

## Contributors

This pipeline benefits from the contributions of the WHO COVID-19
analytics team, with feedback and inputs from colleagues outside the
team. Contributions are listed by alphabetic order:

Code, data and original design:

  - Neale Batra
  - Yuka Jinnai
  - Thibaut Jombart
  - Olivier le Polain
  - Henry Laurenson-Schafer
  - Katelijn Vandemaele

Contributed ideas and feedback:

  - Brett Archer
  - Raquel Medialdea Carrera
  - Laura Guzman (original idea of *Tadpole* plots)
  - Esther Hamblion
  - Orlagh Ingeborg
  - Zyleen Kassamali

## Sending feedback

Feedback is welcome via github
[issues](https://github.com/whocov/trend_analysis_public/issues). When
filing a new issue:

  - first check if a similar issue already exists
  - specify whether this is a bug report or a feature request

## Contributing to this repository

Contributions to this repository are welcome through [pull
requests](https://github.com/whocov/trend_analysis_public/pulls).

## Contact

For further enquiries, send an email to [Thibaut
Jombart](mailto:thibautjombart@gmail.com).

### License

This repository is distributed under MIT license (see attached files).

### Code of Conduct

This project is submitted to a [code of conduct](CONDUCT.md).
