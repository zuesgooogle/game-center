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
		$('body').on('click', '#addServerBtn', function() {
			server.add();
		});
		
		$('body').on('click', '#updateServerBtn', function() {
			server.update();
		});
		
		$('body').on('click', '.server-edit', function() {
			server.edit(this);
		});
		
		$('body').on('click', '.server-remove', function() {
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
				url:  '/console/server/update',
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
					that.updateTable(json.data);
					
					$('#addModal').modal('hide');
					utils.message("保存成功！");
				} else {
					utils.alert(json.msg);
				}
			});
		},
		
		updateTable: function(data) {
			var $tr = $('#tr-' + data.id);
			var add = ($tr.length == 0);
			if( add ) {
				var count = $('#serverBody').find('tr').length + 1;
				
				$tr = $('<tr id="tr-'+ data.id +'"></tr>');
				if( count % 2 == 0 ) {
					$tr.addClass('info');
				}
			}else {
				$tr.html('');
			}

			
			$tr.append('<td>'+ data.id +'</td>');
			$tr.append('<td>'+ data.name +'</td>');
			$tr.append('<td>'+ data.serverIp +'</td>');
			$tr.append('<td>'+ data.serverPort +'</td>');
			$tr.append('<td>'+ data.mysqlIp +'</td>');
			$tr.append('<td>'+ data.mysqlName +'</td>');
			$tr.append('<td>'+ data.status +'</td>');
			
			var $action = $('<td></td>');
			$action.append('<input type="hidden" id="'+ data.id +'" value='+ $.toJSON(data) +'>');
			$action.append('<a class="server-edit"   href="javascript:void(0)" data-id="'+ data.id +'" title="编辑"><span class="glyphicon glyphicon-edit"></span></a> &nbsp;');
			$action.append('<a class="server-remove" href="javascript:void(0)" data-id="'+ data.id +'" title="删除"><span class="glyphicon glyphicon-remove"></span></a>');

			$tr.append($action);
			
			if( add ) {
				$('tbody').prepend($tr);
			}
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
				if( $(element).attr("name") != "status" ) {
					$(element).val("");
				}
			});
			
			//status radio
			var radio = $('input:radio[name="status"]');
			$.each(radio, function(index, element) {
				var $el = $(element);
				if( $el.val() == "1" ) {
					$el.attr("checked", "checked");
				} else {
					$el.removeAttr("checked");
				}
			});
		},
		
		remove: function(btn) {
			var serverId = $(btn).attr('data-id');
			
			bootbox.confirm('您确认要删除吗？', function(btn) {
				if( btn ) {
					$.ajax({
						url:  '/console/server/remove',
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