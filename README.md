
<!-- README.md is generated from README.Rmd. Please edit that file -->

# timecardassistant

<!-- badges: start -->
<!-- badges: end -->

The goal of timecardassistant is to create an efficiency around time
tracking and help develop a comfort level of workign with R.

## Installation

You can install the released version of timecardassistant from
[GitHub](https://github.com/benrwoodard/timecardassistant.git) with:

``` r
# install.packages("devtools")
devtools::install_github("benrwoodard/timecardassistant")
```

## Example

This is a basic example which shows you how to record your time:

``` r
library(timecardassistant)
## Load Example Data
load('data/tc_example.RData')
#> Warning: file 'tc_example.RData' has magic number 'RDX1'
#>   Use of save versions prior to 2 is deprecated
timecard <- ex

starttc('clientname', 'project name')
```

If you have missed the time when you started and want to start the
activity to a previous time then you simply use the ‘started’ argument.

Each hour is calculated as 100% or 1. To set the time to be exactly 30
minutes before the curren time you would run the following:

``` r
starttc('clientname', 'project name', started = .5)
```

Here is a helpful breakdown of the hour break points:

| Minutes | Percent |
|---------|---------|
| 30      | .5      |
| 25      | .42     |
| 20      | .33     |
| 15      | .25     |
| 10      | .17     |
| 5       | .08     |
