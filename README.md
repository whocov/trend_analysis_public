
# Welcome to the WHO COVID-19 trend analysis repository

**Disclaimer: this repository is work in progress; please do not use without contacting the [author](mailto:thibautjombart@gmail.com).**


## Overall dynamics figures

### AFRO

#### Infection levels as % of historical incidence peak

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_AFRO_latest.png" width="70%">

<br>

#### Infection levels as weekly deaths per 100k

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_AFRO_latest.png" width="70%">



#### EMRO

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_EMRO_latest.png" width="70%">

<br>

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_EMRO_latest.png" width="70%">



#### EURO region

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_EURO_latest.png" width="70%">

<br>

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_EURO_latest.png" width="70%">



#### PAHO

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_PAHO_latest.png" width="70%">

<br>

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_PAHO_latest.png" width="70%">



#### SEARO

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_SEARO_latest.png" width="70%">

<br>

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_SEARO_latest.png" width="70%">



#### WPRO

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_peaks_WPRO_latest.png" width="70%">

<br>

<img src="https://raw.githubusercontent.com/whocov/trend_analysis_public/main/asmodee_outputs/png/waffle_deaths_WPRO_latest.png" width="70%">



### ASMODEE runs

This section contains links to *asmodee* runs for each WHO region:

* [AFRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_AFRO_latest.rds)
* [EMRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_EMRO_latest.rds)
* [EURO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_EURO_latest.rds)
* [PAHO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_PAHO_latest.rds)
* [SEARO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_SEARO_latest.rds)
* [WPRO](https://github.com/whocov/trend_analysis_public/raw/main/asmodee_outputs/rds/asmodee_outputs_WPRO_latest.rds)




----------------------------

# Using the report factory

The factory will help you handle multiple `rmarkdown` reports at the
same time. Put your `.Rmd` files in `report_sources`, refer to any
external files in the `.Rmd` using `here::here()`, and you’re sorted.

## How the default factory is organised

  - `report_sources`: (mandatory) put your `.Rmd` documents there
    (subfolders are OK)

  - `data/`: (recommended) put your data in this folder (subfolders are
    OK)
    
      - `data/raw`: to store raw data, as read-only
      - `data/clean`: to store cleaned data

  - `R/`: (recommended) put your external R scripts and functions, used in your
    `.Rmd` reports, in this folder (subfolders are OK)

  - `outputs/`: (automatically created) the factory will store
    report outputs there, using named and time-stamped folders

## How to run the factory: useful commands

  - `list_reports()`: lists reports currently stored in the factory
    (only `.Rmd` source files)

  - `compile_reports()`: compiles one or more reports: An individual report can
    be compiled using the exact file name or a non-ambiguous match; multiple
    reports can be compiled by using a regular expression to match report names;
    all reports can be compiled if the argument is left empty.  Compiled reports
    will be stored in `outputs/`.

## Basic workflow
Below is a basic workflow to get you started.  For more information consult
[https://www.repidemicsconsortium.org/reportfactory/]

1.  create a new factory using `new_factory()` and move into this new
    folder

2.  go to `report_sources/`, write your `.Rmd` report, using the
    provided examples as inspiration; remove the examples files.

3.  check your report by compiling the `.Rmd` manually if needed,
    e.g. `rmarkdown::render("foobar.Rmd")`; once you are
    happy with the results, **make sure you remove all output files from
    the source folder**

4.  run `compile_reports()` to generate all outputs, or
    `compile_reports("foobar")` if you just want to produce time-stamped
    outputs for reports that can be matched via regular expressions by "foobar";
    check results in the folder `outputs/`.
