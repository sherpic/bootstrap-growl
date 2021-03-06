(function() {
  var $;

  $ = jQuery;

  $.bootstrapGrowl = function(message, options) {
    var $alert, css, offsetAmount, to;
    options = $.extend({}, $.bootstrapGrowl.default_options, options);
    $alert = $('<div>');
    $alert.attr('class', 'bootstrap-growl alert');
    if (options.type) {
      $alert.addClass('alert-' + options.type);
    }
    if (options.allow_dismiss) {
      $alert.addClass('alert-dismissable');
      if (options.allow_dismiss) {
        $alert.append('<button class="close" data-dismiss="alert" type="button"><span aria-hidden="true">&times;</span><span classs="sr-only">Close</span></button>');
      }
    }
    $alert.append(message);
    if (options.top_offset) {
      options.offset = {
        from: 'top',
        amount: options.top_offset
      };
    }
    offsetAmount = options.offset.amount;
    $('.bootstrap-growl').each(function() {
      return offsetAmount = Math.max(offsetAmount, parseInt($(this).css(options.offset.from)) + $(this).outerHeight() + options.stackup_spacing);
    });
    css = {
      'position': (options.ele === 'body' ? 'fixed' : 'absolute'),
      'margin': 0,
      'z-index': '9999',
      'display': 'none'
    };
    css[options.offset.from] = offsetAmount + 'px';
    $alert.css(css);
    if (options.width !== 'auto') {
      $alert.css('width', options.width + 'px');
    }
    $(options.ele).append($alert);
    switch (options.align) {
      case 'center':
        $alert.css({
          'left': '50%',
          'margin-left': '-' + $alert.outerWidth() / 2 + 'px'
        });
        break;
      case "left":
        $alert.css('left', '20px');
        break;
      default:
        $alert.css('right', '20px');
    }
    $alert.fadeIn();
    if (options.delay > 0) {
      to = setTimeout((function() {
        return $alert.fadeOut(function() {
          return $alert.alert('close');
        });
      }), options.delay);
      $alert.on('mouseenter', function() {
        return clearTimeout(to);
      });
      $alert.on('mouseleave', function() {
        return to = setTimeout((function() {
          return $alert.fadeOut(function() {
            return $alert.alert('close');
          });
        }), options.delay);
      });
    }
    if (options.callback) {
      $alert.on('closed.bs.alert', function() {
        return options.callback();
      });
    }
    return $alert;
  };

  $.bootstrapGrowl.default_options = {
    ele: 'body',
    type: 'info',
    offset: {
      from: 'top',
      amount: 20
    },
    align: 'right',
    width: 250,
    delay: 4000,
    allow_dismiss: true,
    stackup_spacing: 10,
    callback: null
  };

}).call(this);
