# https://github.com/ifightcrime/bootstrap-growl

$ = jQuery

$.bootstrapGrowl = (message, options) ->
	options = $.extend({}, $.bootstrapGrowl.default_options, options)

	$alert = $('<div>')
	$alert.attr 'class', 'bootstrap-growl alert'
	$alert.addClass 'alert-' + options.type if options.type

	if options.allow_dismiss
		$alert.addClass 'alert-dismissable'
		$alert.append '<button class="close" data-dismiss="alert" type="button"><span aria-hidden="true">&times;</span><span classs="sr-only">Close</span></button>' if options.allow_dismiss

	$alert.append message

	# Prevent BC breaks
	if options.top_offset
		options.offset =
			from: 'top'
			amount: options.top_offset

	# calculate any 'stack-up'
	offsetAmount = options.offset.amount
	$('.bootstrap-growl').each ->
		offsetAmount = Math.max(offsetAmount, parseInt($(this).css(options.offset.from)) + $(this).outerHeight() + options.stackup_spacing)

	css =
		'position': (if options.ele is 'body' then 'fixed' else 'absolute')
		'margin': 0
		'z-index': '9999'
		'display': 'none'

	css[options.offset.from] = offsetAmount + 'px'

	$alert.css css

	$alert.css 'width', options.width + 'px' if options.width isnt 'auto'

	# have to append before we can use outerWidth()
	$(options.ele).append $alert

	switch options.align
		when 'center'
			$alert.css
				'left': '50%'
				'margin-left': '-' + $alert.outerWidth() / 2 + 'px'
		when "left"
			$alert.css 'left', '20px'
		else
			$alert.css 'right', '20px'

	$alert.fadeIn()

	# Only remove after delay if delay is more than 0
	if options.delay > 0
		to = setTimeout (->
			$alert.fadeOut ->
				$alert.alert 'close'
		), options.delay

		$alert.on 'mouseenter', ->
			clearTimeout to

		$alert.on 'mouseleave', ->
			to = setTimeout (->
				$alert.fadeOut ->
					$alert.alert 'close'
			), options.delay

	if options.callback
		$alert.on 'closed.bs.alert', ->
			options.callback()

	$alert

$.bootstrapGrowl.default_options =
	ele: 'body'
	type: 'info'
	offset:
		from: 'top'
		amount: 20
	align: 'right'
	width: 250
	delay: 4000
	allow_dismiss: true
	stackup_spacing: 10
	callback: null

