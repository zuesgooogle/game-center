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
	var server = {};
	
	$(function() {
		$('#addServerBtn').click(function() {
			server.add();
		});
		
		$('#updateServerBtn').click(function() {
			server.update();
		});

		$('.server-edit').click(function() {
			server.edit(this);
		});
		
		$('.server-remove').click(function() {
			server.remove(this);
		});
	});
	
	server = {	
			
		add: function() {
			this.cleanData();
			
			$('#addModal').modal('show');
		},
			
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
					window.location.href = "/server";
				} else {
					utils.alert(json.msg);
				}
			});
		},
		
		edit: function(btn) {
			var serverId = $(btn).attr('data-id');
			var json = $('#' + serverId).val();

			var data = jQuery.parseJSON(json);
			this.bindData(data);
			
			$('#addModal').modal('show');
		},
		
		bindData: function(data) {
			$.each(data, function(key, value) {
				$('#' + key).val(value);
			});
			
			//status radio
			var radio = $('input:radio[name="status"]');
			$.each(radio, function(index, element) {
				var $el = $(element);
				if( data.status == $el.val() ) {
					$el.attr("checked", "checked");
					return;
				}
			});
		},
		
		cleanData: function() {
			var form = $('#serverForm');
			var inputs = form.find('input');
			$.each(inputs, function(index, element) {
				$(element).val("");
			});
		},
		
		remove: function(btn) {
			var serverId = $(btn).attr('data-id');
			
			bootbox.confirm('您确认要删除吗？', function(btn) {
				if( btn ) {
					$.ajax({
						url:  '/server/remove',
						type: 'POST',
			            data:{id: serverId}, 

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
							window.location.href = "/server";
						} else {
							utils.alert(json.msg);
						}
					});
				}
			});
		}
		
		
	};
	
	return server;
});