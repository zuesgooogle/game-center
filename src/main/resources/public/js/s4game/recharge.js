require.config({
	shim : {
        'bootstrap' : ['jquery'],
        'select'    : ['jquery']
    },
    
    
	paths: {
　　		'jquery'	: '../lib/jquery.min',
　　		'bootbox'	: '../lib/bootbox.min',
　　		'bootstrap'	: '../lib/bootstrap.min',
　　		'select'    : '../lib/bootstrap-select.min',
  		'utils'     : '../lib/utils',
　　}
});

define(['jquery', 'bootbox', 'utils', 'select', 'bootstrap'], function($, bootbox, utils) {
	var recharge = {};
	
	$(function() {
		 $('.selectpicker').selectpicker('render');
	});
	
	recharge = {
		mask: function() {
			$('.mask').mask('Loading...');
		},
		
		unmask: function() {
			$('.mask').unmask();
		},
			
		login: function() {},
		
		register: function() {}
	};
	
	return recharge;
});