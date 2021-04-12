
<!-- README.md is generated from README.Rmd. Please edit that file -->

# timecardassistant

<!-- badges: start -->
<!-- badges: end -->

The goal of timecardassistant package is to create efficiency around
time tracking along with helping improve the end users comfort level of
working with R.

## Installation

You can install the released version of timecardassistant from
[GitHub](https://github.com/benrwoodard/timecardassistant.git) with:

``` r
# install.packages("devtools")
devtools::install_github("benrwoodard/timecardassistant")
```

## Examples

### Start activity record

This is a basic example which shows you how to record your time:

``` r
library(timecardassistant)

starttc('clientname', 'project name')
```

This function creates a ‘ps’ object which is used in the `donetc()`
function to create the final record for the activity on the ‘timecard’
object.

#### Adjusting activity started time

If you have missed the time when you started and want to start the
activity to a previous time then you simply use the ‘started’ argument.

Each hour is calculated as 100% or 1. To set the time to be exactly 30
minutes before the current time you would run the following:

``` r
starttc('clientname', 'project name', started = .5)
```

Here is a helpful breakdown of the hour break points:

| minutes | started |
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

### Finished activity record

To record the activity time to the ‘timecard’ object you will use the
`donetc()` function

``` r
donetc()
```

#### Adjusting activity completed time

If you need to adjust the time when the last recorded activity was
finished then you will add the ‘finished’ argument value.

``` r
donetc(finished = .5)
```

#### Adding activity notes

Adding notes is a good idea if the project name is not sufficient to
record your activity or followup actions need to be recorded.

``` r
donetc(notes = 'this will be recorded with the activity record')
```

#### Timecard csv file created

Every time you use the `donetc()` function a csv file is created with
the ‘yyyy-mm-dd\_timecard.csv’ naming convention. There is only one file
per day and can be used to restore the timecard object if needed, using
the `restoretc()` function.

### Example Workflow

The following is an example of a project activity workflow. Normally,
these would be added in the console and not recorded in an R script file
since these are simply triggers to recorded the start and end of an
activity.

``` r
## Load Example Data
starttc('clientname', 'project 1', .5)
donetc(notes = 'this is just a test')

starttc('clientname2', 'project 2', 1.5)
donetc(1)

starttc('clientname', 'project 3', 2.5)
donetc(1.5, notes = 'this is just a test')
```

#### Products of the functions

The preceding functions will create the ‘timecard’ object and the
timecard csv file for the date the functions were called.

``` r
timecard
#>        client       date  projectname started finished dif psatime
#> 1  clientname 2021-04-12 project name   10:56    11:26 0.5     0.5
#> 2  clientname 2021-04-12 project name   10:56    10:56 0.0     0.0
#> 3  clientname 2021-04-12 project name   10:56    11:26 0.5     0.5
#> 4  clientname 2021-04-12    project 1   10:56    11:26 0.5     0.5
#> 5 clientname2 2021-04-12    project 2   09:56    10:26 0.5     0.5
#> 6  clientname 2021-04-12    project 3   08:56    09:56 1.0     1.0
#>                                            notes
#> 1                                           <NA>
#> 2                                           <NA>
#> 3 this will be recorded with the activity record
#> 4                            this is just a test
#> 5                                           <NA>
#> 6                            this is just a test
```

``` r
list.files(pattern = "_timecard.csv")
#> [1] "2021-04-12_timecard.csv"
```
