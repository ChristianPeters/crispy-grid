# Crispy Grid Changelog

## 0.6.0

* Remove the dependency to the Compass framework, which is no longer maintained.

## 0.5.0

* Add support for nested fluid columns. Just provide the intended colspan and the parent colspan (`+fluid-sub-column(2, 4)`) and the percentages are recalculated as if your nested column was relative to its grand-parent.
  Thanks to @lnolte!

## 0.4.0

* Add support for using `box-sizing` of `border-box` for your grid. This is inevitable when working with fluid grids as padding calculations won't work with percentage and pixel values mixed.
  Thanks to @lnolte!

## 0.3.1

* Altered configuration for a single device due to the change in Sass, that lists have to contain multiple elements

## 0.3.0

### Breaking Change:

* Added support for device-specific grid configurations for responsive designs
  * You have to update your grid configuration as specified in the readme.
  * Also, the first parameter of the mixins `+row` and `+grid-container` have been changed. Thus, you should use e.g. `+row($colspan: 16)` instead of `+row(16)`.

## 0.2.0

* Added option for using pie-clearfix on grid containers

## 0.1.3

* Fixed output when setting gutters to false

## 0.1.2

* Fixed bugs in grid behavior when using $left-gutter

## 0.1.0

* Removed IE6 hack that impeded modern browsers
* Added $left-gutter option

## 0.0.2

* Registrated Crispy Grid as an extension for Compass
* Updated installation instructions so that Rails 2.3, 3.0, and 3.1 are reflected
* Added row mixin
* Changed name of $right-margin to $gutter
* Added consistent support for column-count
* Added $subtract-border-from option

## 0.0.1

* Added core of the grid
