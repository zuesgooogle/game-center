require.config({
	shim : {
        'utils'     : ['jquery']
    },
    
    
	paths: {
		'jquery'	: '../lib/jquery.min',
		'bootbox'	: '../lib/bootbox.min',
  		'utils'     : '../lib/utils',
  		'app'		: 'app',
  		'server'	: 'server'
　　}
});

define(['jquery', 'bootbox', 'utils', 'app', 'server' ], function($, bootbox, utils) {
	var console = {};
	
	$(function() {
		$('.menu').click(function() {
			console.load(this);
		});

	});
	
	console = {	
			
		load: function(menu) {
			var url = $(menu).attr("data-url");
			if( url == null ) {
				return;
			}
			
			$.ajax({
				url:  url,
				type: 'POST',
				dataType: 'html',
				async: true,
				data: {
					
				},
				beforeSend: function(xhr) {
					utils.mask();
				},
				complete: function(result) {
					utils.unmask();
				}
			})
			.done(function(result) {
				$('#main').html(result);
			});
		},
			
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
					var $error = $(that.getErrorTpl());
					$error.find('ul').html('<li>您输入的密码不正确，原因可能是：</li>' + 
				  			  '<li>忘记密码；账号输入有误；</li>' +
				  			  '<li>未区分字母大小写；未开启小键盘</li>'
				  			);
					
					bootbox.dialog({
					  message: $error,
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
					var $error = $(that.getErrorTpl());
					$error.find('ul').html('<li>账号已存在，可以尝试：</li>' + 
				  			  '<li>'+ username +'123；</li>' +
				  			  '<li>'+ username +'abc；</li>'
				  			);

					
					bootbox.dialog({
					  message: $error,
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
		
		getErrorTpl: function() {
			return '<div class="form-group has-error">' +
						  	'<div class="help-block with-errors">'+
								'<ul class="list-unstyled"></ul>' +
							'</div>' +
				   '</div>';
		}
	};
	
	return console;
});