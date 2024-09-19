/*************************************************
 * MagicPassPrototype Logout
 * �����н� �α׾ƿ�
 * 
 * @author Naruware �ѿ���/������
 * @version 1.1
 *************************************************/

var Logout = function(userid, returnUrl)
{
	this.userid = userid;
	this.returnUrl = returnUrl;
};
Logout.prototype =
{
		response: function(xmlData)
		{
			var actionName = MagicPass.xmlParse(xmlData, "actionName");
			var success = (MagicPass.xmlParse(xmlData, "success").toLowerCase() == "true") ? true : false;
			var code = MagicPass.xmlParse(xmlData, "code");
			var message = MagicPass.xmlParse(xmlData, "message");

			if(success)
			{
				switch (actionName)
				{
					case "GET_SERVER_CERTIFICATION":
						MagicPass.serverCertificate = message;
						break;
					case "INIT_KEY":
						this.changeKey(message);
						break;
					case "LOGOUT":
				   		this.complete();
						break;
					case "LOGIN_SESSION_CHECK":
						this.isLoginSessionAlive = true;
						break;
				}
			}
			else
			{
				switch(actionName)
				{
					case "LOGIN_SESSION_CHECK":
						break;
					default :
						MagicPass.error(message || code);
						break;
				}
			}
		},
		
	start: function()
	{
		MagicPass.logout();
		if(MagicPass.isMacCheck)
			MagicPass.request("LOGOUT", this.response, this, {"ssoid" : this.userid});
		this.complete();
	},
	complete: function()
	{
		if(MagicPass.isPopSite)
			window.open('about:blank', '_self').close();
		var url = new String(this.returnUrl);
		url = (url.isNull()) ? MagicPass.baseUrl : this.returnUrl;
		window.location.replace(url);
	}
	
};