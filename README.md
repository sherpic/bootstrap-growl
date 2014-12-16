# bootstrap-growl

Pretty simple jQuery plugin that turns standard Bootstrap alerts into hovering 'Growl-like' notifications.

Forked from <https://github.com/ifightcrime/bootstrap-growl> as the library hadn't been updated in some time, and had
some very old outstanding pull requests, and added features I desired.

## Demo

I have a basic demo set up at jsfiddle for the time being which you can view here: http://jsfiddle.net/ifightcrime/Us6WX/1008/

## Features

* Uses standard [Bootstrap alerts](http://getbootstrap.com/components/#alerts) which provides 'success', 'info', 'warning', and 'danger' styles.
* Multiple growls called consecutively are stacked up one after another in a list.
* Automatically fades growls away after a default of 4 seconds.

## Dependencies

1. Recent version of [jQuery](http://jquery.com/). (Tested on 1.11.1)
2. [Bootstrap](http://getbootstrap.com/). (Tested on 3.3.1)

## Usage

Include the dependencies and `jquery.bootstrap-growl.min.js` into your page and call the following:

``` javascript
$.bootstrapGrowl("My message");
```

## Available Options

By default, growls use the standard 'alert' Bootstrap style, are 250px wide, right aligned, and are positioned 20px from the top right of the page.

``` javascript
$.bootstrapGrowl('another message, yay!', {
	ele: 'body',   // which element to append to
	type: 'info',  // null, 'success', 'info', 'warning' or 'danger'
	offset: {
		from: 'top', // 'top', or 'bottom'
		amount: 20   // integer
	},
	align: 'right',      // 'left', 'right', or 'center'
	width: 250,          // integer, or 'auto'
	delay: 4000,         // duration of popup
	allow_dismiss: true, // allow closing of popup using Bootstrap close button
	stackup_spacing: 10  // spacing between consecutively stacked growls
});
```

## Additional Contributors

* Jose Martinez https://github.com/callado4
* Lloyd Watkin https://github.com/lloydwatkin
* TruongSinh Tran-Nguyen https://github.com/tran-nguyen
* Alex Russell https://github.com/alexrussell
