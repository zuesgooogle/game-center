require.config({
	shim : {
        'bootstrap' : ['jquery'],
        'validator' : ['jquery'],
        'loadmask'  : ['jquery']
    },
    
    
	paths: {
　　		'jquery'	: '../lib/jquery.min',
　　		'bootstrap'	: '../lib/bootstrap.min',
　　		'validator' : '../lib/validator.min',
  		'loadmask'  : '../lib/jquery.loadmask.min'
　　}
});

define('user', ['jquery', 'bootstrap', 'validator', 'loadmask'], function($) {
	var user = {};
	
	$(function() {
		$('#registerBtn').click(function() {
			user.doRegister();
		});
	});
	
	user = {
		mask: function() {
			$('.mask').mask('Loading...');
		},
		
		unmask: function() {
			$('.mask').unmask();
		},
			
		doRegister: function() {
			var that = this;
			
			var form = $('#registerForm');
			form.validator('validate');
			
			var errors = form.find('div.has-error').length;
			if( errors > 0 ) {
				return;
			}
			
			var data = {
					account : $('#account').val(),
					password: $('#password').val()
			};
			
			$.ajax({
				url:  '/user/register',
				type: 'POST',
				data: data,
				beforeSend: function(xhr) {
					that.mask();
				},
				complete: function() {
					that.unmask();
				}
			})
			.done(function(result) {
				var json = jQuery.parseJSON( result );
				if( json.ret == 0) {
					
				} else {
					
				}
				console.log(json);
			});
		}
	};
	
	return user;
});