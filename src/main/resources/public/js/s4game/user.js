require.config({
	shim : {
        'bootstrap' : ['jquery'],
        'bootbox'   : ['jquery'],
        'validator' : ['jquery'],
        'utils'     : ['jquery']
    },
    
    
	paths: {
		'jquery'	: '../lib/jquery.min',
		'bootstrap'	: '../lib/bootstrap.min',
　　		'validator' : '../lib/validator.min',
  		'bootbox'   : '../lib/bootbox.min',
  		'utils'     : '../lib/utils'
　　}
});

define(['jquery', 'bootbox', 'utils', 'bootstrap', 'validator' ], function($, bootbox, utils) {
	var user = {};
	
	$(function() {
		$("#password").bind('keyup',function(event) {  
			if(event.keyCode == 13){  
				user.login();
			}
		}); 
		
		$('#loginBtn').click(function() {
			user.login();
		});
		
		$('#registerBtn').click(function() {
			user.register();
		});
	});
	
	user = {	
			
		login: function() {
			var that = this;
			
			var form = $('#loginForm');
			form.validator('validate');
			
			var errors = form.find('div.has-error').length;
			if( errors > 0 ) {
				return;
			}
			
			$('.credentials').removeClass('has-error');
			
			$.ajax({
				url:  '/login',
				type: 'POST',
				data: {
					username: $('#username').val(),
					password: $('#password').val()
				},
				beforeSend: function(xhr) {
					utils.mask();
				},
				complete: function(result) {
					utils.unmask();
				}
			})
			.done(function(result) {
				var json = jQuery.parseJSON( result );
				if( json.ret == 0) {
					window.location.href = "/";
				} else {
					bootbox.dialog({
					  message:  $(that.errorTip()),
					  buttons: {
						  danger: {
						      label: "确定",
						      className: "btn-danger"
						  }
					  }
					});
				}
			});
		},
		
		loginQuick: function(redirect) {
			var that = this;
			
			var form = $('#loginQuickForm');
			form.validator('validate');
			
			var errors = form.find('div.has-error').length;
			if( errors > 0 ) {
				return;
			}
			
			$.ajax({
				url:  '/login',
				type: 'POST',
				data: {
					username: $('#username').val(),
					password: $('#password').val()
				},
				beforeSend: function(xhr) {
					utils.mask();
				},
				complete: function(result) {
					utils.unmask();
				}
			})
			.done(function(result) {
				var json = jQuery.parseJSON( result );
				if( json.ret == 0) {
					window.location.href = redirect;
				} else {
					bootbox.dialog({
					  message:  $(that.errorTip()),
					  buttons: {
						  danger: {
						      label: "确定",
						      className: "btn-danger"
						  }
					  }
					});
				}
			});
		},
		
		register: function() {
			var that = this;
			
			var form = $('#registerForm');
			form.validator('validate');
			
			var errors = form.find('div.has-error').length;
			if( errors > 0 ) {
				return;
			}
			
			var username = $('#username').val();
			$.ajax({
				url:  '/user/register',
				type: 'POST',
				data: {
					username: username,
					password: $('#password').val()
				},
				beforeSend: function(xhr) {
					utils.mask();
				},
				complete: function() {
					utils.unmask();
				}
			})
			.done(function(result) {
				var json = jQuery.parseJSON( result );
				if( json.ret == 0) {
					bootbox.alert('注册成功，立即登录体验！', function() {
						window.location.href = "/login";
					});
				} else {
					bootbox.dialog({
					  message: json.msg,
					  buttons: {
						  danger: {
						      label: "确定",
						      className: "btn-danger"
						  }
					  }
					});
				}
			});
		},
		
		isLogin: function() {
			var loginuser = $('#loginuser');
			return loginuser != null && loginuser.val() != '';
		},
		
		errorTip: function() {
			return '<div class="form-group has-error">' +
						  	'<div class="help-block with-errors">'+
								'<ul class="list-unstyled">' +
						  			'<li>您输入的密码不正确，原因可能是：</li>' + 
						  			'<li>账号输入有误</li>' +
						  			'<li>忘记密码</li>' +
						  			'<li>未区分字母大小写</li>' +
						  			'<li>未开启小键盘</li>'
						  	    '</ul>' +
							'</div>' +
				   '</div>';
		}
	};
	
	return user;
});