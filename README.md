
# odvis

[![R-CMD-check](https://github.com/rogerbeecham/odvis/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rogerbeecham/odvis/actions/workflows/R-CMD-check.yaml)

`odvis` is an R package that provides helper functions for visualizing
directed origin-destination data using `ggplot2`.

## Installation

You can install the development version of `odvis` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rogerbeecham/odvis")
```

## Asymmetric curves with `get_trajectory()`

Standard flow visualizations draw lines between origin-destination
pairs. In `ggplot2` this can be achieved by passing coordinates to
`geom_path()`, one row for *origin* and *destination* respectively. In
order to represent both outward and inward directions, we have to offset
the locations (y-position) of the coordinate pairs.

``` r
od_pair <- tribble(
      ~direction, ~o_d,    ~x, ~y, 
       "out",        "origin",   0,  .2,   
       "out",        "destination",   1,  .2,
       "in",         "origin",   1,  -.2,
       "in",         "destination",   0,  -.2,
)      
     
od_pair |> 
  ggplot() +
  geom_point(aes(x=x, y=y*.2, group=direction, colour=direction)) +
  geom_path(aes(x=x, y=y*.2, group=direction, colour=direction)) +
  geom_text(aes(x=x, y=y*.5, label=o_d, colour=direction)) +
  geom_text(data=. %>% filter(o_d=="origin"), aes(x=.5, y=y, label=direction, colour=direction)) +
  scale_colour_manual(values=c("#b2182b", "#2166ac"), guide="none") +
  coord_equal(ylim=c(-.2, +.2), xlim=c(-.1, +1.1)) 
```

<img src="./man/figures/straight-line.svg" width="60%">

The [`ggforce`](https://ggforce.data-imaginist.com/) extension provides
a function for generating various curves, and we can use `geom_bezier()`
to add a control point to offset curves depending on whether the
direction is *outward* (bends upward) or *inward* (bends downward). This
allows us to represent the origin and destination point locations in
their exact position.

``` r
od_pair <- tribble(
      ~direction, ~o_d,    ~x, ~y, 
       "out",        "o",   0,  .015,   
       "out",        "c",   0.5,  .2, 
       "out",        "d",   1,.015,
       "in",         "o",   1,  -.015,
       "in",        "c",   0.5,  -.2, 
       "in",         "d",   0,  -.015,
)      
     
od_pair |> 
  ggplot() +
  geom_point(data=. %>% filter(o_d!="c"), aes(x=x, y=0, group=direction)) +
  geom_bezier0(aes(x=x, y=y, group=direction, colour=direction)) +
  geom_text(data=. %>% filter(o_d!="c"), 
            aes(x=x, y=y*3, label=o_d, colour=direction)) +
  geom_text(data=. %>% filter(o_d=="o"), aes(x=.5, y=y*12, label=direction, colour=direction)) +
  scale_colour_manual(values=c("#b2182b", "#2166ac"), guide="none") +
  coord_equal(ylim=c(-.2, +.2), xlim=c(-.1, +1.1))
```

<img src="./man/figures/bezier-line.svg" width="60%">

A problem here is that the control point is not generalisable and the
symbolisation not intuitive. The outward and inward directions are
differentiated, but imagine a complex graph dataset with many edges in
2D space. So we move the control points such that lines curve towards
the destination. This is achieved with `get_trajectory()`, which takes a
character string naming the od-pair and locations in x and y of that
OD’s origin an destination. The function returns a `tibble` of three
rows representing origin, control point and destination respectively.

``` r
dat <- bind_rows(
  outward=get_trajectory(o_x=0,o_y=0,d_x=1,d_y=0, "out") |>
  add_column(type=c("o","c","d")), 
  inward=get_trajectory(o_x=1,o_y=0,d_x=0,d_y=0, "in") |> 
  add_column(type=c("o","c","d"))
  )

dat |> 
  ggplot(aes(x=x,y=y, colour=od_pair)) +
  geom_point(data=. %>% filter(type!="c"), colour="#252525") +
  ggforce::geom_bezier0(aes(group=od_pair)) +
   geom_text(data=. %>% filter(type=="c"), aes(label=od_pair)) +
  scale_colour_manual(values=c("#b2182b", "#2166ac"), guide="none") +
  coord_equal() 
```

<img src="./man/figures/bezier-line-asymmetric.svg" width="60%">

### Example

<img src="./man/figures/bezier-application.svg" width="100%">

## OD Maps
