require.config({
	shim : {
        'bootstrap' : ['jquery'],
        'bootbox'   : ['jquery'],
        'json'		: ['jquery'],
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
	var app = {};
	
	$(function() {
		$('#addAppBtn').click(function() {
			app.add();
		});
		
		$('#updateAppBtn').click(function() {
			app.update();
		});

		$('.app-edit').click(function() {
			app.edit(this);
		});
		
		$('.app-remove').click(function() {
			app.remove(this);
		});
	});
	
	app = {	
			
		add: function() {
			this.cleanData();
			$('#username').val($('#loginuser').val());
			$('#createTime').val(new Date().format("yyyy-MM-dd HH:mm:ss"));
			
			$('#appModal').modal('show');
		},
			
		update: function() {
			var that = this;
			
			var form = $('#appForm');
			form.validator('validate');
			
			var errors = form.find('div.has-error').length;
			if( errors > 0 ) {
				return;
			}

			var data = {};
			var inputs = form.find('input');
			$.each(inputs, function(index, element) {
				var $el = $(element);
				
				if( $el.attr('id') != null ) {
					data[$el.attr('id')] = $el.val();
				}
			});
			
			$.ajax({
				url:  '/app/update',
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
					window.location.href = "/app";
				} else {
					utils.alert(json.msg);
				}
			});
		},
		
		edit: function(btn) {
			var appId = $(btn).attr('data-id');
			var json = $('#' + appId).val();

			var data = jQuery.parseJSON(json);
			this.bindData(data);
			
			$('#appModal').modal('show');
		},
		
		bindData: function(data) {
			$.each(data, function(key, value) {
				$('#' + key).val(value);
			});
		},
		
		cleanData: function() {
			var form = $('#appForm');
			var inputs = form.find('input');
			$.each(inputs, function(index, element) {
				$(element).val("");
			});
		},
		
		remove: function(btn) {
			var appId = $(btn).attr('data-id');
			
			bootbox.confirm('您确认要删除吗？', function(btn) {
				if( btn ) {
					$.ajax({
						url:  '/app/remove',
						type: 'POST',
			            data:{id: appId}, 

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
							window.location.href = "/app";
						} else {
							utils.alert(json.msg);
						}
					});
				}
			});
		}
		
		
	};
	
	return app;
});