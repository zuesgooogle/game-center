define(['jquery'], function($) {
	var ui = {
		navActive: function() {
			var tag = $("#navTag");
			if( tag == undefined ) {
				return;
			}
			
			var nav = $("#navbar").find("li");
			nav.removeClass("active");
			
			$(nav[tag.val()]).addClass("active");
		}
			
	};
	
	return ui;
});