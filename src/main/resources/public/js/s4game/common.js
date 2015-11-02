require.config({

	baseUrl: 'js/lib/',
	
	shim : {
		'bootstrap' : ['jquery'],
        'loadmask'  : ['jquery'],
        'validator' : ['jquery'],
        'bootbox'   : ['jquery']
    },
    
    
	paths: {
　　		'jquery'	: '../lib/jquery.min',
  		'loadmask'  : '../lib/jquery.loadmask.min',
  		'bootstrap'	: '../lib/bootstrap.min',
  		'bootbox'   : '../lib/bootbox.min'
　　}
});

define(['jquery', 'bootbox', 'loadmask'], function($, bootbox) {
	var common = {};
	
	$(function() {
		
		$('a.active').click(function() {
			$(this).parent().children('a.menu').toggle(300);
		});
		
		$('body').on('click', 'div.panel-heading', function() {
			$(this).parent().children('div.panel-body').toggle(300);
		});
	});
	
		
	common = {
		navActive: function() {
			var tag = $("#navTag");
			if( tag == undefined ) {
				return;
			}
			
			var nav = $("#navbar").find("li");
			nav.removeClass("active");
			
			$(nav[tag.val()]).addClass("active");
		},
			
		mask: function() {
			$('.mask').mask('Loading...');
		},
		
		unmask: function() {
			$('.mask').unmask();
		},
			
		alert: function(message) {
			bootbox.alert(message);
		},
		
		message: function(text) {
			var elem = $('#messageBox');
			elem.find("span").html(text);
	        elem.delay(100).slideDown().delay(3000).fadeOut();
		}
		
	};
	
	Date.prototype.format = function (fmt) {
	    var o = {
	        "M+": this.getMonth() + 1,
	        "d+": this.getDate(),
	        "H+": this.getHours(),
	        "m+": this.getMinutes(),
	        "s+": this.getSeconds(),
	        "q+": Math.floor((this.getMonth() + 3) / 3),
	        "S": this.getMilliseconds()
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	};
	
	common.navActive();

	
	return common;
});