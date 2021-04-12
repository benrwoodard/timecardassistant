
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
| 55      | .92     |
| 50      | .83     |
| 45      | .75     |
| 40      | .67     |
| 35      | .58     |
| 30      | .5      |
| 25      | .42     |
| 20      | .33     |
| 15      | .25     |
| 10      | .17     |
| 5       | .08     |

## When the activity is done

To record the acitity time to the ‘timecard’ object you will use the
`donetc()` function

``` r
donetc()
```

### Retroactive activity completion

If you need to adjust the time when the last recorded activity was
finished then you will add the ‘finished’ argument value.

``` r
donetc(finished = .5)
```

### Activity Notes

Adding notes is a good idea if the project name is not sufficient to
record your activity or followup actions need to be recorded.

``` r
donetc(notes = 'this will be recorded with the activity record')
```

The resulting ‘timecard’ object will looks something like this:

``` r
## Load Example Data
starttc('clientname', 'project name', .5)
donetc(notes = 'this is just a test')

starttc('clientname2', 'project 2', 1.5)
donetc(1)

starttc('clientname', 'project 3', 2.5)
donetc(1.5, notes = 'this is just a test')
```

``` r
timecard
#>        client       date  projectname started finished dif psatime
#> 1  clientname 2021-04-12 project name   06:27    06:57 0.5     0.5
#> 2  clientname 2021-04-12 project name   06:27    06:27 0.0     0.0
#> 3  clientname 2021-04-12 project name   06:27    06:57 0.5     0.5
#> 4  clientname 2021-04-12 project name   06:27    06:57 0.5     0.5
#> 5 clientname2 2021-04-12    project 2   05:27    05:57 0.5     0.5
#> 6  clientname 2021-04-12    project 3   04:27    05:27 1.0     1.0
#>                                            notes
#> 1                                           <NA>
#> 2                                           <NA>
#> 3 this will be recorded with the activity record
#> 4                            this is just a test
#> 5                                           <NA>
#> 6                            this is just a test
```
