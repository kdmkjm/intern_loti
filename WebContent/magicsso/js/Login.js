/*************************************************
 * MagicPassPrototype Login
 * 매직패스 로그인
 * 
 * @author Naruware 한영수/박종훈
 * @version 1.2
 *************************************************/
var Login = function(idInput, pwInput, returns)
{
	this.idInput	= (typeof(idInput) === "string") ? document.getElementById(idInput) : idInput;
	this.pwInput	= (typeof(pwInput) === "string") ? document.getElementById(pwInput) : pwInput;
	this.returns	= returns;

	//Constructor
	this.Login();
};
Login.prototype = 
{
	Login: function()
	{
	    MagicPass.writeLog("Login.js :: MagicPass.readyLoaderX start","green");
		MagicPass.readyLoaderX();
	},
	response: function(xmlData)
	{
		var actionName = MagicPass.xmlParse(xmlData, "actionName");
		var success = (MagicPass.xmlParse(xmlData, "success").toLowerCase() == "true") ? true : false;
		var code = MagicPass.xmlParse(xmlData, "code");
		var message = MagicPass.xmlParse(xmlData, "message");
		var etc = MagicPass.xmlParse(xmlData, "etc");
		if(success)
		{
			switch(actionName)
			{
				case "GET_SERVER_CERTIFICATION":
					MagicPass.serverCertificate = message;
					break;
				case "INIT_KEY":
					this.changeKey(message);
					break;
				case "LOGIN":
					this.complete(message,code,etc);
					break;
			}
		}
		else
		{
			switch(code)
			{
				case "10001":
				case "10003":
					this.idInput.value = "";
					this.pwInput.value = "";
					this.idInput.focus();
					break;
				case "32000":
					alert("이미 로그인이 되어 있습니다.\n"+etc+"로그아웃 시켜주세요");
					break;	
			    case "10009":
			        this.idInput.value = "";
			        this.pwInput.value = "";
			        this.idInput.focus();
			        alert("비밀번호 "+etc+"회 오류입니다. 5회 오류이면 시스템을 사용하실 수 없습니다.");
			        break;	
			}
			if(!(code=="32000" || code=="10009"))
			MagicPass.error(message || code);
		}
	},
	validate: function()
	{
		if(MagicPass.usable)
		{
			if(this.idInput.value == "")
			{
				MagicPass.error(70001);
				this.idInput.focus();
	
				return false;
			}
			else if(this.pwInput.value == "")
			{
				MagicPass.error(70002);
				this.pwInput.focus();
	
				return false;
			}
			else if(MagicPass.isLogin())
			{
				if(confirm(MagicPass.error(70012, false)))
					MagicPass.logout();
				else
					return false;
			}
		}
		else
		{
			if(!confirm(MagicPass.error(70000, false)))
			{
				MagicPass.setupOffLine();
			}

			return false;
		}

		return true;
	},
	start: function()
	{
		if(this.validate())
		{	
			if(MagicPass.isMacCheck)
				MagicPass.loginType = MagicPass.MACCHECK;
			else
				MagicPass.loginType = MagicPass.ID;
			
			MagicPass.init();

			var code = MagicPass.getEnvKey();
			if(code == 0)
			{
				var result = new String(MagicPass.getResult());
				if(!result.isNull())
				{
					MagicPass.request("INIT_KEY", this.response, this, {"initialSessionKey": result});
					return;
				}
			}

			MagicPass.error(code);
		}
	},
	changeKey: function(initialSessionKey)
	{
		var code = MagicPass.changeKey(initialSessionKey);
		if(code == 0)
		{
			//var mA = document.getElementById("macAddr");
			if(MagicPass.isMacCheck)
				code = MagicPass.encryptLogin(this.idInput.value+MagicPass.seperator+MagicPass.getMacAddress('',false),  this.pwInput.value);
			else
				code = MagicPass.encryptLogin(this.idInput, this.pwInput);

			if(code == 0)
			{
				var result = new String(MagicPass.getResult());
				if(!result.isNull())
				{

					MagicPass.request("LOGIN", this.response, this, {"ssoEncryptedData": result, "ssoLoginType": MagicPass.loginType, "ssoApplicationCode": MagicPass.applCode, "isEam": MagicPass.option.useEam});
					return;
				}
			}
		}

		MagicPass.error(code);
	},
	complete: function(ssoEncryptedData)
	{
		MagicPass.setCharset();
		MagicPass.setDelegateName();
		MagicPass.browserOffCheck();
		MagicPass.setToken(ssoEncryptedData);
		MagicPass.directLogout();
		if(MagicPass.option.MP_monitor.use) MagicPass.monitor(0);
	
		if(typeof(this.returns) === "function")
		{
			(this.returns)();
		}
		else
		{
			var url = new String(this.redirect);			
			window.location.replace((url.isNull()) ? MagicPass.baseUrl : this.redirect);
		}
	},
	complete: function(ssoEncryptedData,code,etc)
	{
		MagicPass.setCharset();
		MagicPass.setDelegateName();
		MagicPass.browserOffCheck();
		MagicPass.setToken(ssoEncryptedData);
		MagicPass.directLogout();
		if(MagicPass.option.MP_monitor.use) MagicPass.monitor(0);
		if(code=="70016" || code=="70017"){
			var codeN = parseInt(code);
			etc="\n("+etc+" 일 남았습니다)";
			if(confirm(MagicPass.error(codeN, false)+etc))
			{
				url = (codeN == 70016)?MagicPass.passwdChangeUrl:MagicPass.snumberChangeUrl;
				window.location.replace(url);
				return;
			}
		}
		if(typeof(this.returns) === "function")
		{
			(this.returns)();
		}
		else
		{
			var url = new String(this.returns);			
			window.location.replace((url.isNull()) ? MagicPass.baseUrl : this.returns);
		}
		
	}
};