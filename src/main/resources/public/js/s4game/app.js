require.config({
	shim : {
		'bootstrap' : ['jquery'],
        'common'     : ['jquery']
    },
    
    
	paths: {
		'bootstrap'	: '../lib/bootstrap.min',
		'bootbox'   : '../lib/bootbox.min',
		'validator' : '../lib/validator.min',
		'json'		: '../lib/jquery.json.min',
  		'common'     : 'common'
　　}
});

define(['jquery', 'bootbox', 'common', 'bootstrap', 'validator', 'json'], function($, bootbox, common) {
	var app = {};
	
	$(function() {
		/** register event */
		$('body').on('click', '#addAppBtn', function() {
			app.add();
		});
		
		$('body').on('click', '#updateAppBtn', function() {
			app.update();
		});

		$('body').on('click', '.app-edit', function() {
			app.edit(this);
		});
		
		$('body').on('click', '.app-remove', function() {
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
				var $tr = $(element);
				
				if( $tr.attr('id') != null ) {
					data[$tr.attr('id')] = $tr.val();
				}
			});
			
			$.ajax({
				url:  '/console/app/update',
				type: 'POST',
	            data:{params: $.toJSON(data)}, 

				beforeSend: function(xhr) {
					common.mask();
				},
				complete: function(result) {
					common.unmask();
				}
			})
			.done(function(result) {
				var json = jQuery.parseJSON( result );
				if( json.ret == 0) {
					that.updateTable(json.data);
					
					$('#appModal').modal('hide');
					common.message('保存成功！');
				} else {
					common.alert(json.msg);
				}
			});
		},
		
		updateTable: function(data) {
			var $tr = $('#tr-' + data.id);
			var add = ($tr.length == 0);
			if( add ) {
				var count = $('#appBody').find('tr').length + 1;
				
				$tr = $('<tr id="tr-'+ data.id +'"></tr>');
				if( count % 2 == 0 ) {
					$tr.addClass('info');
				}
			}else {
				$tr.html('');
			}
			
			$tr.append('<td>'+ data.id +'</td>');
			$tr.append('<td>'+ data.key +'</td>');
			$tr.append('<td>'+ data.name +'</td>');
			$tr.append('<td>'+ data.username +'</td>');
			$tr.append('<td>'+ new Date(data.createTime).format("yyyy-MM-dd HH:mm:ss") +'</td>');
			
			var $action = $('<td></td>');
			$action.append('<input type="hidden" id="'+ data.id +'" value='+ $.toJSON(data) +'>');
			$action.append('<a class="app-edit"   href="javascript:void(0)" data-id="'+ data.id +'" title="编辑"><span class="glyphicon glyphicon-edit"></span></a> &nbsp;');
			$action.append('<a class="app-remove" href="javascript:void(0)" data-id="'+ data.id +'" title="删除"><span class="glyphicon glyphicon-remove"></span></a>');
			
			$tr.append($action);
			
			if( add ) {
				$('tbody').prepend($tr);
			}
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
						url:  '/console/app/remove',
						type: 'POST',
			            data:{id: appId}, 

						beforeSend: function(xhr) {
							common.mask();
						},
						complete: function(result) {
							common.unmask();
						}
					})
					.done(function(result) {
						var json = jQuery.parseJSON( result );
						if( json.ret == 0) {
							
						} else {
							common.alert(json.msg);
						}
					});
				}
			});
		}
		
		
	};
	
	return app;
});