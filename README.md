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

### Mixins

The only things you need to know for using Crispy Grid are these 3 mixins:

1. `+grid-container`
  * Include this in your container element(s) that contain your whole grid.
2. `+column`
  * This is the most important mixin. Include e.g. `+column(5)` to span 5 columns, each having a gutter to the right-hand side.
3. `+last`
  * Use this to indicate that a column is the last one in a row. It just removes the right gutter.

Use might also find these mixins useful:

1. `+last-column`
  * This combines `+column` and `+last`. You should favor `+last-column` over these two in order to reduce CSS output.
2. `+row`
  * Use this for columns that span the whole row. This mixin just calls `+column` with the configured count of $grid-columns.

### Options

Pending. Please have a look at the source.

## Installation

1. In your Gemfile add:

    gem 'crispy-grid'

2. In your project configuration file (e.g. initializers/compass.rb, [you might want to](https://github.com/Compass/compass-rails/blob/stable/README.md#configuration) create one if it does not exist yet) add:

    require 'crispy-grid'

3. Customize and import the grid in your application stylesheet:

### Configuration for a Single Device

Tell Crispy Grid to use a single device by setting the singular
configuration options `$device`, `$grid-column-width`, and `grid-gutter-width`.

``` sass
// Copy this into your app in order to customize the grid
$device: desktop
$grid-column-width: 30px
$grid-gutter-width: 10px
$grid-columns: 24

// Import Crispy Grid below the configuration
@import crispy/grid
```

### Configuration for Multiple Devices

In `$devices` you can list all devices you whish to respond to.
The nth entry of any of the following lists belongs to the nth device (the order of `$devices` matters).
The first device is the default for all grid helpers.
Consider to set mobile as default device when following the mobile-first design approach.

``` sass
// Copy this into your app in order to customize the grid
$devices: desktop, tablet, handheld-640, handheld-320
$grid-column-widths: 30px, 30px, 20px, 20px
$grid-gutter-widths: 10px, 10px, 5px, 5px
$grid-columns: 30, 24, 24, 13

// Import Crispy Grid below the configuration
@import crispy/grid
```

## Changelog

There is one. [Have a look at it](https://github.com/ChristianPeters/crispy-grid/blob/master/CHANGELOG.md).

## License

See MIT-LICENSE.
