require.config({
	shim : {
        "bootstrap" : { "deps" :['jquery'] },
        "ui" 		: { "deps" :['jquery'] }
    },
    
    
	paths: {
　　		"jquery"	: "lib/jquery.min",
　　		"bootstrap"	: "lib/bootstrap.min",
  		
  		"ui"  		: "s4game/ui"
　　}
});

require(['jquery', 'bootstrap', 'ui'], function ($, bootstrap, ui){
		ui.navActive();
		
});