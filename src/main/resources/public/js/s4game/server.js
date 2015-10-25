require.config({
	shim : {
        'bootstrap' : ['jquery'],
        'bootbox'   : ['jquery'],
        'validator' : ['jquery'],
        'utils'     : ['jquery']
    },
    
    
	paths: {
		'jquery'	: '../lib/jquery.min',
		'json'		: '../lib/jquery.json.min',
		'bootstrap'	: '../lib/bootstrap.min',
  		'validator' : '../lib/validator.min',
  		'bootbox'   : '../lib/bootbox.min',
  		'utils'     : '../lib/utils'
　　}
});

define(['jquery', 'bootbox', 'utils', 'bootstrap', 'validator', 'json' ], function($, bootbox, utils) {
	var server = {};
	
	$(function() {
		$('#updateServerBtn').click(function() {
			server.update();
		});

	});
	
	server = {	
			
		update: function() {
			var that = this;
			
			var form = $('#serverForm');
			form.validator('validate');
			
			var errors = form.find('div.has-error').length;
			if( errors > 0 ) {
				return;
			}
			
			var status = $('input:radio[name="status"]:checked').val();
			if( status == null ) {
				utils.alert('请选择服务器状态');
				return;
			}
			
			var data = {status: status};
			var inputs = form.find('input');
			$.each(inputs, function(index, element) {
				var $el = $(element);
				
				if( $el.attr('id') != null ) {
					data[$el.attr('id')] = $el.val();
				}
			});
			
			$.ajax({
				url:  '/server/update',
				type: 'POST',
	            data:{params: $.toJSON(data)}, 

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
					
				} else {
					
				}
			});
		}
		
	};
	
	return server;
});