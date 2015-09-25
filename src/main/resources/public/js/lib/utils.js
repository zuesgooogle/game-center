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
	var utils = {};
	
	utils = {
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