(function($) {

	skel.breakpoints({
		xlarge:	'(max-width: 1680px)',
		large:	'(max-width: 1280px)',
		medium:	'(max-width: 980px)',
		small:	'(max-width: 736px)',
		xsmall:	'(max-width: 480px)'
	});

	$(function() {

		var	$window = $(window),
		$body = $('body');

		// Fix: Placeholder polyfill.
		$('form').placeholder();

		// Prioritize "important" elements on medium.
		skel.on('+medium -medium', function() {
			$.prioritize(
				'.important\\28 medium\\29',
				skel.breakpoint('medium').active
				);
		});

		// Off-Canvas Navigation.

			// Navigation Panel Toggle.
			$('<a href="#navPanel" class="navPanelToggle"></a>')
			.appendTo($body);

			// Navigation Panel.
			$(
				'<div id="navPanel">' +
				$('#nav').html() +
				'<a href="#navPanel" class="close"></a>' +
				'</div>'
				)
			.appendTo($body)
			.panel({
				delay: 500,
				hideOnClick: true,
				hideOnSwipe: true,
				resetScroll: true,
				resetForms: true,
				side: 'right'
			});

			// Fix: Remove transitions on WP<10 (poor/buggy performance).
			if (skel.vars.os == 'wp' && skel.vars.osVersion < 10)
				$('#navPanel')
			.css('transition', 'none');


		});

})(jQuery);