//Javascript for index page

(function($) {
	$(function() {
		$.getJSON("https://api.github.com/repos/hielkeminecraft/opennoteblockstudio/releases/latest", function(release){
			$("#downloadBtn").append(" (" + release.name + ")");
		});
	});

})(jQuery);