require.config({
	shim : {
        "bootstrap" 		: ['jquery'],
        "utils" 			: ['jquery'],
        'bootstrap-select' 	: ['jquery']
    },
    
    
	paths: {
　　		"jquery"			: "lib/jquery.min",
　　		"bootstrap"			: "lib/bootstrap.min",
　　		'bootstrap-select' 	: 'lib/bootstrap-select.min',
  		"utils"  			: "lib/utils"
　　}
});

require(['jquery', 'bootstrap', 'ui', 'bootstrap-select'], function ($, bootstrap, utils){
	utils.navActive();
});