require.config({
	shim : {
        'bootstrap' : ['jquery'],
        'select'    : ['jquery']
    },
    
    
	paths: {
　　		'jquery'	: '../lib/jquery.min',
　　		'bootbox'	: '../lib/bootbox.min',
　　		'bootstrap'	: '../lib/bootstrap.min',
　　		'validator' : '../lib/validator.min',
　　		'select'    : '../lib/bootstrap-select.min',
  		'utils'     : '../lib/utils',
　　}
});

define(['jquery', 'bootbox', 'utils', 'select', 'bootstrap', 'validator'], function($, bootbox, utils) {
	utils.navActive();
	
	var recharge = {};
	
	$(function() {
		 $('.selectpicker').selectpicker('render');
		 
		 $('#payBtn').click(function() {
			recharge.prepare();
		 });
		 
	});
	
	recharge = {
		
		/*
		 * pay prepare 
		 */
		prepare: function() {
			var that = this;
			
			var price = $('input:radio[name="priceRadio"]:checked').val();
			if( price == null ) {
				that.error("请选择充值金额！");
				return;
			}
			
			var type = $('input:radio[name="typeRadio"]:checked').val();
			if( type == null ) {
				that.error("请选择充值方式！");
				return;
			}
			
		},
		
		error: function(msg) {
			bootbox.dialog({
			  message: msg,
			  buttons: {
				  danger: {
				      label: "确定",
				      className: "btn-danger"
				  }
			  }
			});
		}
		
	};
	
	return recharge;
});