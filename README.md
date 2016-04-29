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

## Installation

1. In your Gemfile add:

    ``gem 'crispy-grid'``

2. Customize and import the grid in your application stylesheet:

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

### Configuration for using border-box

By default, Crispy Grid mimics this more natural behavior for a box-sizing: content-box setting by doing calculations. If you start a new project and do not have to support IE7, we recommend you to use box-sizing: border-box instead.
When switching an old project to border-box-sizing you need to tell Crispy Grid so. This is as simple as initializing it with `$grid-box-sizing` like so

``` sass
...
$grid-box-sizing: border-box

// Import Crispy Grid below the configuration
...
```

Setting the `$grid-box-sizing` to `border-box` will tell the grid to
ignore its padding calculations as they are no longer needed when using
the `border-box` box-model. However this will not apply `border-box` to
your elements. Most likely you'll want to apply `border-box` to all your
elements. The way [Paul Irish recommends](http://www.paulirish.com/2012/box-sizing-border-box-ftw/) looks like this when using Compass.

``` sass
*
  +box-sizing(border-box)
```

In most cases this will be the way to go. However, there might be the
edge cases where you don't want to apply `border-box` to all your
elements. That's why setting the box-model is not part of Crispy Grid's
`$grid-box-sizing` option.

### On Fluid Grids
Crispy is fully capable of creating percentage based grids. However, when creating a fluid grid `border-box` should be used.
Nesting columns is tricky with fluid grids. Crispy provides the `fluid-sub-column` mixin to help with nested columns. (See below)

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
  * This combines `+column` and `+last`. You should favor it over the two in order to reduce CSS output.
2. `+row`
  * Use this for columns that span the whole row. This mixin just calls `+column` with the configured count of `$grid-columns`.
3. `+fluid-sub-column`
  * This resets the percentage values for nested fluid columns.
    Just provide the intended colspan and the parent colspan (`+fluid-sub-column(2, 4)`) and Crispy will calculate a width and gutter as if the column was not nested.

### Options

#### Options for `+column`, `+last-column`, `+row`, `+fluid-sub-column`
* `$colspan`
  * Specifies the number of grid columns the element should span
  * If the element does not fit into the grid, you can also specify a fixed width.
  * It is the only mandatory parameter.
  * Examples: `+column(5)`, `+column(120px)`, `+row($colspan: 23)`
* `$device`
  * Relevant if you have [configured multiple devices](#configuration-for-multiple-devices)
  * Default: `default-device()` - that is the value of `$device` or the first one in `$devices`
  * The device must be contained in your `$devices` configuration.
  * Examples: `+column(3, $device: tablet)`, `+last-column(1, $device: handheld-320)`
* `$padding`
  * Now the fun stuff: Even when you use the browser default setting `box-sizing: content-box`, it is ensured that you do not break the grid by setting padding or a border.
  * Default: 0
  * Reduces the resulting `width` attribute of your column (unless you configured `$grid-box-sizing: border-box`)
  * It is applied to both left and right by default.
  * `padding-top` and `padding-bottom` are out of scope - just set them separately.
  * Just like `$colspan`, you can also specify a number of columns.
  * Examples: `+column(5, $padding: 10px)`, `+column(10, $padding: 1)` - they will have the same overall width as `+column(5)` / `+column(10)`
* `$differing-right-padding`
  * Override `$padding` for the right side or exclusively set `$padding` for the right side
  * Default: false
  * Examples: `+column(5, $padding: 10px, $differing-right-padding: 15px)`, `+column(5, $differing-right-padding: 10px)`
* `$border-width`
  * Same principle as `$padding`
  * This just sets the CSS `border-width` property when using `$grid-box-sizing: border-box`. Otherwise, it also effects the `width` property.
* `$differing-right-border-width`
  * Same principle as `$differing-right-padding`
* `$gutter`
  * Customize the gutter (i.e. right margin) of a column
  * Default: `grid-gutter-width($device)`
  * Does not affect the "inner gutters"; i.e. if your `grid-gutter-width()` is 10px, `+column(5, $gutter: 15px)` will just add 5px overall whitespace, not 5*5px.
* `$left-gutter`
  * Normally, gutters are only right with Crispy Grid. But you might have your reasons.
  * Default: false
  * Examples: `+column(5, $gutter: 10px, $left-gutter: 10px)`, `+last-column($left-gutter: 10px)`
* `$subtract-border-from`
  * Sometimes you could say `+column(10, $padding: 1)` if there wasn't a 1px border that tries to ruin your grid (because you rely on box-sizing: content-box).
  * You can use e.g. `+column(10, $padding: 1, $border-width: 1px, $subtract-border-from: padding)` instead of `+column(10, $padding: 29px, $border-width: 1px)`.
  * Default: false
  * Possible values: `padding`, `left-padding`, `right-padding`, `gutter`, `left-gutter`, `right-gutter`
  * Example: `+column(10, $border-width: 2px, $subtract-border-from: gutter)`
  * This option does nothing useful when using `$grid-box-sizing: border-box`.

#### Options for `+grid-container`
* `$device`
  * see above
* `$colspan`
  * Default: `grid-columns($device)`
  * see above
* `$padding: 0`
  * Unlike with columns, paddings and borders of a container do not affect its inner width.
  * So the real grid starts with within the container paddings
  * Example: `+grid-container($colspan: 24, $padding: 30px)` still leaves 24 full columns to its content
* `$differing-right-padding`
  * see above
* `$border-width`
  * see above
* `$differing-border-width`
  * see above
* `$left-margin`
  * Normally containers should be horizontally centered on the page.
  * Default: auto
  * If you wish to enforce to have whitespace around your container even if the browser window is not bigger than your content, you should do so by setting `$padding`.
* `$right-margin`
  * see above

## Changelog

There is one. [Have a look at it](https://github.com/ChristianPeters/crispy-grid/blob/master/CHANGELOG.md).

## License

See MIT-LICENSE.
