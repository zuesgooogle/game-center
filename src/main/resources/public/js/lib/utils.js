require.config({

	baseUrl: 'js/lib/',
	
	shim : {
        'loadmask'  : ['jquery'],
        'bootbox'   : ['jquery']
    },
    
    
	paths: {
　　		'jquery'	: 'jquery.min',
  		'loadmask'  : 'jquery.loadmask.min',
  		'bootbox'   : 'bootbox.min'
　　}
});

define(['jquery', 'bootbox', 'loadmask'], function($, bootbox) {

	$(function() {
		$('a.active').click(function() {
			$(this).parent().children('a.tree').toggle(300);
		});
		
		$('div.panel-heading').click(function() {
			$(this).parent().children('div.panel-body').toggle(300);
		});
	});
	
	var utils = {};
	
	utils = {
		navActive: function() {
			var tag = $("#navTag");
			if( tag == undefined ) {
				return;
			}
			
			var nav = $("#navbar").find("li");
			nav.removeClass("active");
			
			$(nav[tag.val()]).addClass("active");
		},
			
		mask: function() {
			$('.mask').mask('Loading...');
		},
		
		unmask: function() {
			$('.mask').unmask();
		},
			
		alert: function(message) {
			bootbox.alert(message);
		}
	};
	
	return utils;
});