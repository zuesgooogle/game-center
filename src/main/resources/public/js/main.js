require.config({
	shim : {
        "bootstrap" 		: ['jquery'],
        "common" 			: ['jquery']
    },
	paths: {
　　		"jquery"			: "lib/jquery.min",
　　		"bootstrap"			: "lib/bootstrap.min",
　　		"common"  			: "s4game/common"
　　}
});

require(['jquery', 'bootstrap', 'common'], function ($, bootstrap, common){
	
});