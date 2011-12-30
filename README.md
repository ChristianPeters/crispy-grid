# Crispy Grid

## Why should I use it?

In short, Crispy Grid closes the gap between easy-to-use grids for
simple web pages and doing everything by hand due to layout complexity.

### Reason 1: No need for bending CSS layout semantics

CSS grid frameworks like Blueprint and 960.gs try to realize their
higher level concepts using only margins and relative positioning.

Often, this is in conflict with CSS box semantics.
In CSS, whitespace surrounding content should be expressed as padding of
the containing element. Margins should be used for defining whitespace
among sibling elements. 

A common workaround for paddings and margins within a grid is using inner
wrapping elements which are save to style. This is unsemantic and
clutters up the template.

Crispy respects padding and border box properties.

Unlike [Lucid Grid](https://github.com/ezYZ/lucid) (which I recommend as
an alternative), padding and border width can be set along with the
column width in one statement. Crispy does the calculation for you.

### Reason 2: There is no problem about being specific

Whenever you try to realize a page that simply does not fit into the
predefined columns, you are likely to catch yourself fighting with the grid.
Likewise, most grids are not meant to be applied on more than the big
containers (navigation, sidebar, main, etc.). Yet it would be nice to
have a tool for specifying the layout of the inner elements in a smart
way.

Crispy tries to support you even if you go beyond the main grid.

## Usage

Pending. Please have a look at the source.

## Installation

1. In your Gemfile add:

    gem 'crispy-grid'

2. In your project configuration file (e.g. initializers/compass.rb)
   add:

    require 'crispy-grid'

3. Customize and import the grid in your application stylesheet:

### Configuration for a Single Device

The grid configuration is layed out for multiple devices.
Though, you can also use Crispy Grid the classic way without any overhead.
Just provide one setting and ignore the fact that the variables are
written in plural.

    // Copy this into your app in order to customize the grid
    $devices: desktop
    $grid-column-widths: 30px
    $grid-gutter-widths: 10px
    $grid-columns: 25

    // Import Crispy Grid below the configuration
    @import crispy/grid

### Configuration for Multiple Devices

In `$devices` you can list all devices you whish to respond to.
The nth entry of any of the following lists belongs to the nth device (the order of `$devices` matters).
The first device is the default for all grid helpers.
Consider to set mobile as default device when following the mobile-first design approach.

    // Copy this into your app in order to customize the grid
    $devices: desktop, tablet, handheld-640, handheld-320
    $grid-column-widths: 30px, 30px, 20px, 20px
    $grid-gutter-widths: 10px, 10px, 5px, 5px
    $grid-columns: 30, 25, 25, 13

    // Import Crispy Grid below the configuration
    @import crispy/grid

## License

See MIT-LICENSE.

## TODO

- Make use of @extend in order to reduce CSS output
- Return calculation of inner box width for further use as column width
  of children
