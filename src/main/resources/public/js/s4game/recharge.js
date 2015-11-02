require.config({
	shim : {
        'bootstrap' : ['jquery'],
        "common" 	: ['jquery'],
        'select'    : ['jquery']
    },
    
    
	paths: {
　　		'jquery'	: '../lib/jquery.min',
　　		'bootbox'	: '../lib/bootbox.min',
　　		'bootstrap'	: '../lib/bootstrap.min',
　　		'validator' : '../lib/validator.min',
　　		'select'    : '../lib/bootstrap-select.min',
  		'common'     : 'common',
  		'user'		: 'user'
　　}
});

define(['jquery', 'bootbox', 'common', 'user', 'select', 'bootstrap', 'validator'], function($, bootbox, common, user) {
	common.navActive();
	
	var recharge = {};
	
	$(function() {
		 $('.selectpicker').selectpicker('render');
		 
		 $('#payBtn').click(function() {
			recharge.prepare();
		 });
		 
		 $('#loginQuickBtn').click(function() {
			 user.loginQuick("/recharge");
		 });
	});
	
	recharge = {
		
		/*
		 * pay prepare 
		 */
		prepare: function() {
			var that = this;
			
			if( !user.isLogin() ) {
				$('#loginQuickModal').modal('show');
				return;
			}
			
			var rechargeForm = $('#rechargeForm');
			
			var price = $('input:radio[name="priceRadio"]:checked').val();
			if( price == null ) {
				this.error("请选择充值金额！");
				return;
			}
			
			var type = $('input:radio[name="typeRadio"]:checked').val();
			if( type == null ) {
				this.error("请选择充值方式！");
				return;
			}
			
			rechargeForm.submit();
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