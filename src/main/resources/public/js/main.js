require.config({
	shim : {
        "bootstrap" : ['jquery'],
        "ui" 		: ['jquery'],
        'bootstrap-select' : ['jquery']
    },
    
    
	paths: {
　　		"jquery"	: "lib/jquery.min",
　　		"bootstrap"	: "lib/bootstrap.min",
　　		'bootstrap-select' : 'lib/bootstrap-select.min',
  		"ui"  		: "s4game/ui"
　　}
});

require(['jquery', 'bootstrap', 'ui', 'bootstrap-select'], function ($, bootstrap, ui){
		ui.navActive();
		
});