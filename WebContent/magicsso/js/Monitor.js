/*************************************************
 * MagicPassPrototype Monitor
 * 매직패스 상태 모니터
 * 
 * @author Naruware 한영수/박종훈
 * @version 1.1
 *************************************************/
var Monitor = function()
{
};
Monitor.prototype =
{
	start : function()
	{
		if(MagicPass.usable && MagicPass.option.JS_monitor.use)
		{
			if(MagicPass.isLogin())
			{
				if(MagicPass.option.JS_monitor.object == null)
				{
					MagicPass.option.JS_monitor.object = window.setInterval(function(){
						if(!MagicPass.isLogin())
						{
							//MagicPass.siteLogout(MagicPass.baseUrl);
							var logoutUrl = MagicPass.logoutUrl;
							window.location.replace(logoutUrl);
						}
					}, MagicPass.option.JS_monitor.interval);
				}
			}
		}
	},
	stop : function()
	{
		window.clearInterval(MagicPass.option.JS_monitor.object);
		MagicPass.option.JS_monitor.object = null;
	}
};

/*--------------------------------------------------------
 * 	Auto Start
--------------------------------------------------------*/
MagicPass.job("매직패스 로그아웃 모니터링", function(){
	new Monitor().start();
});

if(MagicPass.option.MP_monitor.use)
{
	window.unlock = false;
	MagicPass.addEvent(window, "unload", function(){
		if(!window.unlock)
		{
			MagicPass.monitor(MagicPass.option.MP_monitor.interval);
			window.unlock = true;
		}
	});
}