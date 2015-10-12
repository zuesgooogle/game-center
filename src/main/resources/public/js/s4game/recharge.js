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
			
			if( !this.isLogin() ) {
				this.error('请先登录！');
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
		},
		
		isLogin() {
			var loginuser = $('#loginuser');
			
			return loginuser != null && loginuser.val() != '';
		}
		
	};
	
	return recharge;
});