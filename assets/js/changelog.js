(function($) {

	$(function() {
		$.getJSON("https://api.github.com/repos/opennbs/opennoteblockstudio/releases", function(result){
			var converter = new showdown.Converter();

			$.each(result, function(i, release){
				var html = converter.makeHtml(release.body);
				var date = new Date(release.published_at);

				$("#releases").append("<header class='major special'><h2>" + release.name + "</h2><p>" + date.toLocaleDateString("en-US") + "</p></header>" + html + "<hr>");
			});
		});
	});

})(jQuery);