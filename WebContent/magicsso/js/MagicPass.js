/*************************************************
 * MagicPassPrototype
 * �����н��� ��� ����
 * Copyright 2010, DreamSecurity. http://www.dreamsecurity.com
 * 
 * @author Naruware �ѿ���/������
 * @version 2.3
 *************************************************/
MagicPass = new Object();

MagicPass.siteTitle					= "��û�ϵ�";//"SITENAME";
MagicPass.siteName					= "��û�ϵ�";//"SITENAME";
MagicPass.applCode					= "APPL000005";
MagicPass.pkiType					= "NPKI";
MagicPass.path						= "/magicsso";		//�����н� ��ġ���
MagicPass.baseUrl					= MagicPass.path + "/_session-view.jsp";		//�����н� ó�� ��, �̵��� URL(����Ʈ ����������)
//MagicPass.baseUrl					= "http://www.cnuct.kr/portal/login/actionLogin.do";		//�����н� ó�� ��, �̵��� URL(����Ʈ ����������)
MagicPass.errorUrl					= MagicPass.path + "/error.jsp";		//��ȣȭ ó�� URL
MagicPass.logoutUrl				    = "http://"+window.location.host+MagicPass.path+"/logout.jsp";	
//MagicPass.logoutUrl				    = "http://127.0.0.1:10001/magicsso/logout.jsp";		
//MagicPass.directLogoutUrl			= "http://"+window.location.host+MagicPass.path+"/secure.jsp?actionName=LOGOUTC";		//����������,�����н������ �α׾ƿ�ó��
//MagicPass.directLogoutUrl			= "http://127.0.0.1:10001/magicsso/secure.jsp?actionName=LOGOUTC";		//����������,�����н������ �α׾ƿ�ó��
MagicPass.secureUrl					= MagicPass.path + "/secure.jsp";		//��ȣȭ ó�� URL

MagicPass.reloginUrl 				= MagicPass.path + "/reLogin.jsp";      // reLoginó�� URL
MagicPass.passwdChangeUrl		    = MagicPass.path + "/changePassword.jsp"; // ��й�ȣ ����
MagicPass.snumberChangeUrl	        = MagicPass.path + "/changeSafetyNumber.jsp"; // ������ȣ ����

//MagicPass.ClientIP	=	"";
/* */
MagicPass.seperator                 = "!@#";
MagicPass.reLogin                   = 1;

/* MagicPass Option Definitions */
MagicPass.option = new Object();
MagicPass.option.debugScript		= true;		//�ڹٽ�ũ��Ʈ ����׸��
MagicPass.option.debugApplet		= true;		//�ڹپ��ø� ����׸��
MagicPass.option.useEam				= false;	//MagicEAM
MagicPass.option.isAutoLogin		= false;		//�ڵ��α���(�����н��� �α��εǾ� �ִ� ���¿� ���� ��, �ڵ����� ����Ʈ�α���)
MagicPass.option.useCertificate		= true;		//������ �α��� ��뿩��
MagicPass.option.useApplet			= false;		//���ø� ��뿩��(IE�̿ܿ����� �ڵ����� ���ø����)
MagicPass.option.useMagicPassS		= false;		//MagicPassS(RMI Server) ��뿩��(Windows�̿�(Linux, Mac and etc.)���� �ڵ����� MagicPassS���)
MagicPass.option.useSessionSync		= true;		//������ �����н� �α��μ����� �����ϰ� ����(�������� ��������� �����н��������� ����Ʈ �α׾ƿ���Ŵ.)
MagicPass.option.JS_monitor			= {use : true, interval : 4000, object : null};		//�ڹٽ�ũ��Ʈ �α׾ƿ�����(�ڹٽ�ũ��Ʈ�� �ش� interval �� �����н� �α׾ƿ����� ����)
MagicPass.option.MP_monitor			= {use : false, interval : 10000};		//�����н��� �ڵ����Ǿƿ� ���(�������� �����н��� �ش� interval �̳��� IsLogon ȣ���� ������ �α׾ƿ�)

/* MagicPass Client-Modules Version Definitions */
MagicPass.version = {
	"MagicLoaderX"		: "1,0,2,2",
	"MagicPassX"		: "1,0,4,7",
	"MPCertX"		: "1,1,0,1",
	"passportApplet"	: "1.0.0.2",
	"passportJ"		: "1.0.0.2"
	

};

/*--------------------------------------------------------------
	In the below will be Optimazing
--------------------------------------------------------------*/

/* MagicPass runtime variable Definitions */ 
MagicPass.usable			= false;		//�÷����� ��� ���ɿ���
MagicPass.usableCertX			= false;		//�÷����� ��� ���ɿ���
MagicPass.isReady			= false;		//�÷������� �о���� ������ ����
MagicPass.isSetting			= false;		//�����н� �ٿ�ε�/��ġ ������ ����
MagicPass.isPageLoaded		= false;		//�������� �÷����� �ε� �Ϸ� ����
MagicPass.isJobExecuted		= false;		//����� job�� ���� ����
MagicPass.versionVerified	= false;		//�����н��� ���� Ȯ�� ����
MagicPass.serverCertificate	= null;		//��Ƽ�����ο���ɶ� ���� ���ø����̼� �ڵ� ����
MagicPass.loginType			= null;		//�α���Ÿ��
MagicPass.cookieName		= "_MPSC_" + window.location.host + "_";		//������������ ���� ��Ű��

/* Setting Definitions */
MagicPass.alias				= "MagicPassPlugin";		//�÷����� ��Ī
MagicPass.element			= document.getElementById("MagicPassPluginArea");
MagicPass.object			= document.getElementById(MagicPass.alias);		//ActiveX�� MagicPassX ��ü
MagicPass.objectLoaderX		= document.getElementById("MagicLoaderX");		//ActiveX�� MagicLoadeX ��ü
MagicPass.objectCertX		= document.getElementById("MagicLine");		    //ActiveX�� (N)MPCertX ��ü
MagicPass.executeFile		= "DreamSecurity\\MagicPass\\MagicPass.exe";
MagicPass.offlineUrl		= MagicPass.path + "/installer.html";

MagicPass.configFile		= "http://" + window.location.host + MagicPass.path + "/plugins/setup.conf";
MagicPass.onlineFile		= "http://" + window.location.host + MagicPass.path + "/plugins/setupOnLine.exe";
MagicPass.updateFile		= "http://" + window.location.host + MagicPass.path + "/plugins/setupOnLine_update.exe";
MagicPass.settingFile		= "http://" + window.location.host + MagicPass.path + "/plugins/setupOnLine_update_setting_file.exe";
MagicPass.onlineUrl			= "http://" + window.location.host + MagicPass.secureUrl + "?actionName=CIPHER&source=" + MagicPass.onlineFile;
MagicPass.updateUrl			= "http://" + window.location.host + MagicPass.secureUrl + "?actionName=CIPHER&source=" + MagicPass.updateFile;
MagicPass.settingUrl		= "http://" + window.location.host + MagicPass.secureUrl + "?actionName=CIPHER&source=" + MagicPass.settingFile;
MagicPass.executeUrl		= "http://" + window.location.host + MagicPass.secureUrl + "?actionName=CIPHER&source=" + MagicPass.executeFile;

//2012.03.28 applet ����� ���� URL define
MagicPass.appleteUrl		= "http://" + window.location.host + MagicPass.path + "/plugins/applet/";

MagicPass.isMacCheck=false;

/* Login Settings Definitions */
MagicPass.ID				= 0;		        //���̵� �α���
MagicPass.SSN				= 1;		        //�ֹι�ȣ �α���
MagicPass.EMPNO				= 2;		        //�����ȣ �α���
MagicPass.CERT				= 3;		        //������ �α���
MagicPass.CRYPTO_ALGO		= "48";		        //�α��� ��ȣȭ �˰���
MagicPass.MULTI_LOGIN       = 4;
MagicPass.MACCHECK		    = 7;		        //���̵�+MacAddress

/* Client Environment Definitions */
Client = new Object();
Client.os					= null;		//����� OS ����
Client.browser				= null;		//����� ������ ����
(function(){
	var userAgent=navigator.userAgent.toUpperCase();
	var browserList=["MSIE","FIREFOX","CHROME","SAFARI","OPERA"];
	
	Client.browser = "OTHERS";
	for(var i in browserList)
	{
		if(userAgent.indexOf(browserList[i])>-1)
		{
			Client.browser=browserList[i];
			break;
		}
	}
	
	var platform = navigator.platform.toUpperCase();
	var osList = ["WIN", "MAC", "LINUX"];

	Client.os = "OTHERS";
	for(var i in osList)
	{
		if(platform.indexOf(osList[i])>-1)
		{
			Client.os=(osList[i]=="WIN")?"WINDOWS":osList[i];
			break;
		}
	}
	
	if(Client.os != "WINDOWS")
		MagicPass.option.useMagicPassS=true;
	//alert("Client.browser : "+navigator.userAgent.toUpperCase());
	if(Client.browser != "MSIE")
		MagicPass.option.useApplet = true;

	if(window.addEventListener) document.addEventListener("DOMContentLoaded", function(){MagicPass.isPageLoaded = true;}, false);
	else if(window.attachEvent) document.attachEvent("onreadystatechange", function(){MagicPass.isPageLoaded = true;});
})();

/*--------------------------------------------------------------
	Function Definitions
--------------------------------------------------------------*/
/**
 * �����н� �÷������� �ε��� ���� �����ϵ���, �۾��� ������ Queue�� �����մϴ�.
 * �̹� �ε� �Ǿ��ִ� ���, �ٷ� �����Ų��.
 * 
 * @param {String} title �۾���(�۾��νĿ� �ؽ�Ʈ)
 * @param {Function} job �۾� ��ũ��Ʈ �Լ�
 * @param {Function} functionClass �۾� ��ü�� Ŭ���������� ���, Ŭ���� �Է�(��������)
 * @since MagicPass Prototype 2.2 
 */
MagicPass.job = function(title, job, functionClass)
{

	if(!MagicPass.isJobExecuted)
	{
		if(MagicPass.job.queue == null)
		{
			MagicPass.job.queue = [];
		}
		else
		{
			for(var i in MagicPass.job.queue)
			{
				if(MagicPass.job.queue[i][0] === title)
				{
					MagicPass.job.queue[i][0] = title;
					MagicPass.job.queue[i][1] = job;
					MagicPass.job.queue[i][2] = functionClass;
					return;
				}
			}
		}
		
		MagicPass.job.queue.push([title, job, functionClass]);
	}
	else
	{
		MagicPass.log("INFO", title);
		(job).call(functionClass);
	}
};

/**
 * MagicPass.job���� ������ �۾��� �����մϴ�.
 * 
 * @since MagicPass Prototype 2.2
 */
MagicPass.jobExecute = function()
{ 
	try
	{
		if(MagicPass.object.GetStatus(MagicPass.siteName))
		{
			MagicPass.usable = true;
	
			if(Client.browser == "MSIE" || document.readyState === "complete" || MagicPass.isPageLoaded)
			{	
				if(MagicPass.job.queue != null)
				{
					if(!MagicPass.isJobExecuted)
					{
						MagicPass.isJobExecuted = true;
						
						for(var i = 0; i < MagicPass.job.queue.length; i++)
						{
							MagicPass.log("INFO", MagicPass.job.queue[i][0]);
							(MagicPass.job.queue[i][1]).call(MagicPass.job.queue[i][2]);
						}
					}
				}
			}
			else
				throw "Page loading is not yet";
		}
	}
	catch(e)
	{
		window.setTimeout(MagicPass.jobExecute, 3000);
	}
};

/**
 * ������ �ֿܼ� �α��մϴ�. 
 * (��, ������ �ܼ��� ���� ���ϴ� ������(IE, Opera��)�� ����� �ܼ��� <div>�� �����մϴ�.)
 * 
 * @param {String} type �α�Ÿ��(LOG, INFO, ERROR) ��������
 * @param {String} str �α׸޼���
 * @since MagicPass Prototype 2.1
 */
MagicPass.log = function(type, str)
{
	if(!MagicPass.option.debugScript) return;

	try
	{
		if(type === "INFO")
			console.info(str);
		else if(type === "ERROR")
			console.error(str);
		else
			console.log(type);
	}
	catch(e){}
};

/**
 * �����н��� �ʱ�ȭ �մϴ�.
 * 
 * @since MagicPass Prototype 2.1
 */
MagicPass.init = function(siteName)
{
	MagicPass.log("INFO", "init");

	var site = siteName || MagicPass.siteName;
	
	var pkiType = (MagicPass.pkiType == "GPKI")? 0 : 1;
//	alert(MagicPass.ID);
	MagicPass.loginType = (MagicPass.loginType == null) ? MagicPass.ID : MagicPass.loginType;
//	alert(MagicPass.object);
	var retval = (MagicPass.object.Init(pkiType, MagicPass.CRYPTO_ALGO, MagicPass.loginType, site) == 0) ? true : false;
	
	return retval;
//	return (MagicPass.object.Init(pkiType, MagicPass.CRYPTO_ALGO, MagicPass.loginType, site) == 0) ? true : false;
};

/**
 * �ش縮�ҽ��� ���ٰ������� üũ
 * return 0: ���Ѿ��� 1:���ҽ����ٰ���
 */
MagicPass.isResc = function(siteName,applcode,resccode)
{
        MagicPass.log("INFO", "isResc");

        var site = siteName || MagicPass.siteName;

        return MagicPass.object.isResc(site,applcode,resccode); 
};

/**
 * ���ҽ��� ���α��� üũ
 */
MagicPass.getRoleFlag = function(siteName,applcode,resccode)
{
        MagicPass.log("INFO", "isResc");

        var site = siteName || MagicPass.siteName;

        MagicPass.object.getRoleFlag(site,applcode,resccode); 
	return MagicPass.object.Result;
};



/**
 * ��� ���� ��, ������� �޽��ϴ�.
 * 
 * @since MagicPass Prototype 2.2
 */
MagicPass.getResult = function()
{
	return (MagicPass.option.useApplet) ? MagicPass.object.Result() : MagicPass.object.Result;
	
};

/**
 * �ش� ����Ʈ���� ��ū�� �α׾ƿ���ŵ�ϴ�.
 *
 * @param {String} siteName ����Ʈ��(��������)
 * @since MagicPass Prototype 1.0
 */
MagicPass.logout = function(siteName)
{
	var site = siteName || MagicPass.siteName;
    //alert("MagicPass.logout_start");
	MagicPass.log("INFO", "logout");
    //alert("11111111111111111111MagicPass.object.Logout_start");
	try
	{
		//try{MagicPass.writeLog(" MagicPass.logout : START","orange");}catch(e){}
		//alert("MagicPass.logout : START");
		MagicPass.object.Logout(site);
		//alert("MagicPass.logout : END");
		//try{MagicPass.writeLog(" MagicPass.logout : END" ,"orange");}catch(e){}
	}
	catch(e){}
};

/**
 * ����Ʈ�� �α׾ƿ��մϴ�.
 * 
 * @param {String} returnUrl �α׾ƿ� ���� �̵��� URL
 * @param {String} siteName ����Ʈ��
 * @since MagicPass Prototype 2.0
 */
MagicPass.siteLogout = function(returnUrl, siteName)
{
	var site = siteName || MagicPass.siteName;
	var url = new String(returnUrl);

	MagicPass.log("INFO", "site logout");

	MagicPass.logout(site);
	MagicPass.request(null, null, null, null, MagicPass.logoutUrl);
	
	if(url.isNull())
		window.location.reload();
	else
		window.location.replace(returnUrl);
	
};

/**
 * �α׾ƿ��� logout.jsp�� ȣ���մϴ�.
 * 
 * @param {String} logoutUrl logout.jsp�� Ǯ���
 * @param {String} siteName ����Ʈ��
 * @since MagicPass Prototype 2.0
 */
MagicPass.directLogout = function(siteName, logoutUrl)
{
 var site = siteName || MagicPass.siteName;
 var URL = logoutUrl || MagicPass.directLogoutUrl;
 //alert(MagicPass.directLogoutUrl);
 MagicPass.log("INFO", "logout");
 try
 {
  MagicPass.object.SetLogoutURL(site, URL);
 }
 catch(e){}
};

/**
 * ������������ ����(Envelope)�� Ű���� ���մϴ�.
 *
 * @param {Boolean} isConnect ����ó�� ����
 * @param {String} siteName ����Ʈ��(��������)
 * @param {String} applCode ���ø����̼��ڵ�(��������)
 * @return {Number} 0�̸� ����
 * @since MagicPass Prototype 2.2
 */
MagicPass.getEnvKey = function(isConnect, siteName, applCode)
{
	var site = siteName || MagicPass.siteName;
	var appl = applCode || MagicPass.applCode;
	var code = null;
	
	MagicPass.log("INFO", "getEnvKey " + (isConnect ? "for connect " : "for login "));

	return (isConnect) ? MagicPass.object.GetAppEnvKey(site, appl, MagicPass.serverCertificate) : MagicPass.object.GetLogonEnvKey(site, MagicPass.serverCertificate);
};

/**
 * ��ȣȭ ������ ���� ����Ű�� ��ȯ�մϴ�.
 *
 * @param {String} encryptKey ��ȣȭŰ
 * @param {String} siteName	 ����Ʈ��(��������)
 * @return {Number} 0�̸� ����
 * @since MagicPass Prototype 2.2
 */
MagicPass.changeKey = function(encryptKey, isConnect, siteName, applCode)
{
	var site = siteName || MagicPass.siteName;
	var appl = applCode || MagicPass.applCode;
	
	MagicPass.log("INFO", "changeKey " + (isConnect ? "for connect " : "for login "));

	return (isConnect) ? MagicPass.object.ChangeAppKey(site, appl, encryptKey) : MagicPass.object.ChangeLogonKey(site, encryptKey);
};

/**
 * ��ȣȭ�� �����մϴ�. (�α��ο��� ���)
 * 
 * @param {HTMLElement} id �α��� ���̵� �Է� <input>�±� ���
 * @param {HTMLElement} password �α��� �н����� �Է� <input>�±� ���
 * @param {String} siteName	 ����Ʈ��(��������)
 * @since MagicPass Prototype 1.0
 */
MagicPass.encryptLogin = function(id, password, siteName)
{
    var site = siteName || MagicPass.siteName;
	var result = null;
	
    MagicPass.log("INFO", "encryptLogin");

	switch(MagicPass.loginType)
	{
		case MagicPass.ID :
			result = MagicPass.object.EncryptLogonID(site, decodeURI(id.value), decodeURI(password.value));
			break;
		case MagicPass.CERT :
			result = MagicPass.object.EncryptAuth(site, id);
			break;
		case MagicPass.MULTI_LOGIN : 
			result = MagicPass.object.EncryptLogonID(site, id, password);
			break;
		case MagicPass.MACCHECK :
			result = MagicPass.object.EncryptLogonID(site, decodeURI(id), decodeURI(password));
			break;
		case MagicPass.CERTMACCHECK :
			result = MagicPass.object.EncryptAuth(site, id);
			break;			
	}

	return result;
};

/**
 * ��ȣȭ�� �����մϴ�.
 * 
 * @param {String} ��ȣȭ�� ��
 * @param {String} siteName ����Ʈ��(��������)
 * @param {String} applCode ���ø����̼� �ڵ�(��������)
 * @since MagicPass Prototype 2.0
 */
MagicPass.encryptKey = function(text, siteName, applCode)
{
	var site = siteName || MagicPass.siteName;
	var appl = applCode || MagicPass.applCode;

	MagicPass.log("INFO", "encryptKey");

	return MagicPass.object.EncryptKey(site, appl, text); 
};

/**
 * ��ū�� �����մϴ�.
 *
 * @param {String} encryptedToken ��ȣȭ�� ��ū
 * @param {String} siteName ����Ʈ��(��������)
 * @return {Number} 0�̸� ����
 * @since MagicPass Prototype 1.0
 */
MagicPass.setToken = function(encryptedToken, siteName)
{
	var site = siteName || MagicPass.siteName;

	MagicPass.log("INFO", "setToken");

	return MagicPass.object.SetToken(site, encryptedToken);
};

/**
 * ��ū�� �����ϴ�.
 *
 * @param {String} siteName ����Ʈ��(��������)
 * @param {String} applCode	 ���ø����̼� �ڵ�(��������)
 * @return {Number} 0�̸� ����
 * @since MagicPass Prototype 1.0
 */
MagicPass.getToken = function(siteName, applCode)
{
	var site = siteName || MagicPass.siteName;
	var appl = applCode || MagicPass.applCode;

	MagicPass.log("INFO", "getToken");

	return MagicPass.object.GetToken(site, appl);
};

/**
 * ����(�Ǵ� ���ڷ� ����) ����Ʈ�� �α��� ������ Ȯ���մϴ�.
 *
 * @param {String} siteName	 ����Ʈ��(��������)
 * @return {Boolean}
 * @since MagicPass Prototype 1.0
 */
MagicPass.isLogin = function(siteName)
{
	var site = siteName || MagicPass.siteName;
	var result = false;

	if(MagicPass.object.GetStatus(site) == 150)
	{
		if(MagicPass.option.MP_monitor.use) 
			MagicPass.monitor(0);

		MagicPass.log(site + " logined.");
		result = true;
	}
	
	return result;
};

/**
 * �����н��� �ٿ�ε��Ͽ� �ڵ���ġ�մϴ�.
 *
 * @param {String} url �ٿ�ε��� �¾������� URL
 * @return {Boolean}
 * @since MagicPass Prototype 2.0
 */
MagicPass.downloadAndSetup = function(url)
{
	if(MagicPass.isSetting) return;
		
	var message = "";
	var code = -1;

	if (confirm(MagicPass.siteTitle + " ����Ʈ�� ������� ���ȼ� ��ȭ�� ���Ǽ� ���븦 ���� �ش� ���α׷� �̿��� �����մϴ�.\n\n���ȷα��� ���α׷�(�����н�)�� ��ġ �Ǵ� ������Ʈ�մϴ�.\n��� ��ġ�� �����Ͻðڽ��ϱ�?"))
	{
		MagicPass.log("INFO", "downloadAndSetup");

		MagicPass.isSetting = true;

		if(window.location.port == "") //MagicPass�� ��ġ�ɶ�, ��Ʈ�� ������ ��ġ�� �ȵǴϱ� :80�� �ٿ��ݴϴ�.
			url = "http://" + window.location.host + ":80" + url.replace("http://" + window.location.host, ""); //https(SSL)�� ���, ���̳ʸ������� ���������� http�� �����մϴ�.
			//alert("URL:"+url);
		code = MagicPass.objectLoaderX.Download(url);
		if(code != 0)
		{
			MagicPass.isSetting = false;

			switch (code)
			{
				case 400:
					message = "������� ������û";
					break;
				case 404:
					message = "�߸��� �ٿ�ε� URL";
					break;
				default:
					message = "�˼����� ����";
					break;
			}
			
			MagicPass.error(message + "(��)�� �ٿ�ε尡 �����Ǿ����ϴ�.\n[" + code + "]");
		}
		else
			return;
	}

	MagicPass.setupOffLine();
	throw "";
};

/**
 * �����н��� �����Ų��.
 *
 * @since MagicPass Prototype 2.2
 */
MagicPass.run = function()
{
	MagicPass.log("INFO", "run");
	try{MagicPass.writeLog(" MagicPass.run start ~ ","blue");}catch(e){}
	try
	{
		if(MagicPass.option.useApplet)
		{
			try{MagicPass.writeLog(" MagicPass.object : "+MagicPass.object,"blue");}catch(e){}
			if(!MagicPass.object.ProgramCheck())
			{
				//alert("ProgramCheck OK");
				if(!MagicPass.object.ProgramRun()){
					throw "failure";
				}
					
			}
		}
		else
		{
			if(MagicPass.objectLoaderX)
			{
				if(MagicPass.objectLoaderX.ProgramCheck(MagicPass.alias) != 0)
				{
					if(!MagicPass.versionVerified)
					{
						var repNo = MagicPass.objectLoaderX.VersionCheck(MagicPass.configFile);
						switch(repNo)
						{
							case 0 :
								break;
							case 2 :
								MagicPass.downloadAndSetup(MagicPass.onlineUrl);
								break;
							case 3 :
								MagicPass.downloadAndSetup(MagicPass.updateUrl);
								break;
							case 4 :
								MagicPass.downloadAndSetup(MagicPass.settingUrl);
								break;
							default :
								throw repNo;
								break;
						}
						
						MagicPass.versionVerified = true;
					}

					if(MagicPass.objectLoaderX.ProgramRun(MagicPass.executeUrl, "", MagicPass.alias) != 0)
						throw "failure";
				}
			}
		}
	}
	catch(e)
	{
		if(!window.isNaN(e)){
			error = parseInt(e);
		    MagicPass.error(error, true);
		}else{
			error = e;
			MagicPass.error(error, false);
		}
		//MagicPass.error(e);
		window.setTimeout(MagicPass.run, 3000);
		return;
	}
	MagicPass.jobExecute();
};

/**
 * �����н� �������� ��ġ�� �����մϴ�.
 * 
 * @since MagicPass Prototype 1.0
 */
MagicPass.setupOffLine = function()
{
	MagicPass.log("INFO", "setupOffLine");

	var sizeWidth = (document.body) ? document.body.offsetWidth : window.screen.availWidth;
	var parentTag = (document.getElementsByTagName("body")) ? document.getElementsByTagName("body")[0] : document.getElementsByTagName("html")[0];
	
	MagicPass.isSetting = true;
	
	with(parentTag.style){width="100%";height="100%";overflow="hidden";};
	parentTag.innerHTML	= "<div style='z-index:100;position:absolute;top:0;left:0;min-weight:100%;min-height:100%;width:100%;height:100%;background:#000;filter:alpha(opacity=50);-moz-opacity:0.5;opacity:0.5'></div>"
						+ "<div style='z-index:101;position:absolute;top:200px;left:" + ((sizeWidth - 450) >> 1) + "px;'><iframe src='" + MagicPass.offlineUrl + "' frameborder='0' border='0' width='450' height='300'></iframe></div>"
						+ parentTag.innerHTML;
};

/**
 * �����н� �÷�����(ActiveX/Applet)�� �ε��մϴ�.
 * 
 * @since MagicPass Prototype 2.2
 */
MagicPass.ready = function(flag)
{
	try{MagicPass.writeLog(" MagicPass.ready start ~ ","blue");}catch(e){}
	if(MagicPass.usable) return;
	if(!MagicPass.isReady)
	{
    MagicPass.isReady = true;
		MagicPass.log("INFO", "ready");
	}
	else if(!flag)
		return;
	try
	{
		if(!MagicPass.element)
		{
			
			var parent = document.getElementsByTagName("body")[0];
			
			// body���� �±׵��� MagicPassPluginArea �±׸� ã�� ������ div�±� ����
			if(parent.innerHTML.indexOf("MagicPassPluginArea") < 0)
			{
				var c = document.createElement("div");
				c.setAttribute("id", "MagicPassPluginArea");
				parent.appendChild(c);
			}
			MagicPass.writeLog("MagicPass element - MagicPassPluginArea TAG created","blue");
			MagicPass.element = document.getElementById("MagicPassPluginArea");
			throw "";
			
		}
		else if(!MagicPass.object)
		{
			MagicPass.writeLog("MagicPass.object �̻���","red");
			if(MagicPass.element.innerHTML.indexOf(MagicPass.alias) < 0)
			{  
				if(MagicPass.option.useApplet)
				{
					  try{MagicPass.writeLog(" ##### APPLET_LOADING START ##### ","green");}catch(e){}
					  var attributes = {codebase:MagicPass.appleteUrl,
				      code:'com.naru.app.applet.PassPortApplet.class',
				      archive:'passport-applet.jar, passport-j.jar',
				      id:MagicPass.alias,
				      name:MagicPass.alias,
				      width:1, height:1} ;
					  try{MagicPass.writeLog(" ##### APPLET_URL : "+MagicPass.appleteUrl,"green");}catch(e){}
					  var parameters = {'java_code':'com.naru.app.applet.PassPortApplet.class',
						'java_codebase':MagicPass.appleteUrl,
						'java_archive':'passport-applet.jar, passport-j.jar',
						'type':'application/x-java-applet;version=1.6',
						'browser.type':Client.browser,
						'client.type':((MagicPass.option.useMagicPassS) ? 'passportj' : 'magicpass'),
						'passport.debug':MagicPass.option.debugApplet,
						'client.resources':'passport-resource.jar',
						'client.resources.version':MagicPass.version.passportApplet,
						'passport-j.resources':'passport-j-resource.jar',
						'passport-j.resources.version':MagicPass.version.passportJ,
						'isBrowserMonitoring':'false',
						'interval.browser.monitoring':MagicPass.option.MP_monitor.interval,
						'mayscript':'true'
						
						} ;
					var version = '1.6' ;
					deployJava.runApplet(attributes, parameters, version);
					
				  }
				  else
				  {
					try{MagicPass.writeLog(" ##### ACTIVEX_LOADING START ##### ","green");}catch(e){}
					MagicPass.element.innerHTML += "<object codebase='" + MagicPass.path + "/plugins/MagicPassX.cab#version=" + MagicPass.version.MagicPassX + "' classid='clsid:AD6870C0-44B7-42FB-A119-C2C6BD9CD005' id='" + MagicPass.alias + "' width='1' height='1'></object>";
				  }
			}
			MagicPass.writeLog("MagicPassPlugin(object) TAG created in MagicPassPluginArea(div)","blue");
			MagicPass.object = document.getElementById(MagicPass.alias);
			MagicPass.writeLog("MagicPass.object : "+MagicPass.object,"green");
			if(MagicPass.object == null)
			{
				throw "";
			}else{

			}
		}	
		
	}
	catch(e)
	{
		MagicPass.error("Loading object is not yet", false);
		try{MagicPass.writeLog("Loading object is not yet","red");}catch(e){}
		window.setTimeout(function(){
			MagicPass.ready(true);
		}, 200);

		return;
	}

	MagicPass.run();
};

/**
 * MagicLoaderX �÷������� �ε��մϴ�.
 * 
 * @since MagicPass Prototype 2.2
 */
MagicPass.readyLoaderX = function(flag)
{
	if(MagicPass.option.useApplet) return;

	try
	{
		if(!MagicPass.objectLoaderX && MagicPass.element.innerHTML.indexOf("MagicLoaderX") < 0)
			MagicPass.element.innerHTML += "<object codebase='" + MagicPass.path + "/plugins/MagicLoaderX.cab#version=" + MagicPass.version.MagicLoaderX + "' classid='clsid:3D64E58D-CB55-4344-B809-CFE38F900838' id='MagicLoaderX' width='1' height='1'></object>";

		MagicPass.objectLoaderX = document.getElementById("MagicLoaderX");
	}
	catch(e)
	{
		window.setTimeout(MagicPass.readyLoaderX, 200);
		return;
	}

	MagicPass.run();
};

/**
 * NMPCertX(MPCertX) �÷������� �ε��մϴ�.
 * 
 * @since MagicPass Prototype 2.0
 */
MagicPass.readyCertX = function(flag)
{
	if(!MagicPass.option.useCertificate) return;
	if(!flag) MagicPass.log("INFO", "Certificate Plugin ready");

	try
	{
		if(MagicPass.option.useApplet && flag != true)
		{
			var codebaseurl;
			var downPath;
			var sitebase;

			var libPath = mlEnv.RootPath+'plugins/applet';
			codebaseurl = mlEnv.RootContext;
			sitebase = mlEnv.RootPath;
			downPath = libPath;

			var MagicLineJar 				= 'MagicLine-'+mlEnv.MagicLineVer+'.jar';
			var MagicLineLauncherJar 		= 'MagicLineLauncher-'+mlEnv.MagicLineLauncherVer+'.jar';
			var MagicLineResJar 			= 'MagicLineRes-'+mlEnv.MagicLineResVer+'.jar';
			var MagicLineTrustedRootCertJar = 'MagicLineTrustedRootCert-'+mlEnv.MagicLineTrustedRootCertVer+'.jar';

			var JcoasJar 					= 'jcaos-'+mlEnv.JcoasVer+'.jar';
			var UbiKeyJar 					= 'ubikey-'+mlEnv.UbiKeyVer+'.jar';

			MagicLineMobilePhoneValue	= "infovine;";


  		var win60 =  window.navigator.userAgent.indexOf('Windows NT 6') >-1;

			var MagicLineInstallProgressValue = '';
			var SessionIDValue				= '1';
			var sUserAgent = window.navigator.userAgent;
			var modaless = false;
			
			var attributes = {codebase:MagicPass.appleteUrl,
		      code:'com.dreamsecurity.applet.launcher.MagicLineLauncher.class',
		      archive:libPath+'/'+MagicLineLauncherJar+','+libPath+'/'+JcoasJar+','+libPath+'/'+UbiKeyJar,
		      id:'MagicLine',
		      name:'MagicLine',
		      width:1, height:1} ;
			var parameters = {'archive':libPath+'/'+MagicLineLauncherJar+','+libPath+'/'+JcoasJar+','+libPath+'/'+UbiKeyJar,
				'separate_jvm':'true',
				'MagicLineCacheFile':MagicLineJar+';',
				'MagicLineCacheFileVersion':mlEnv.MagicLineVer+';',
				'MagicLinePath':downPath,
				'MagicLineResourceFile':MagicLineResJar+';',
				'MagicLineResoureVersion':mlEnv.MagicLineResVer+';',
				'MagicLineLauncherVersion':mlEnv.MagicLineLauncherVer,
				'MagicLineRealAppletName':'com.dreamsecurity.ui.MagicXSignRealAppletProcImpl',
				'MagicLineTrustedRootCertFile':MagicLineTrustedRootCertJar,
				'MagicLineTrustedRootCertVersion':mlEnv.MagicLineTrustedRootCertVer,
				'MagicLineDebugMode':mlProp.MagicLineDebugModeValue,
				'MagicLineTab':mlProp.MagicLineTabValue,
				'MagicLineStorageType':mlProp.MagicLineStorageTypeValue,
				'MagicLineDomain':mlProp.MagicLineDomainValue,
				'MagicLineCAName':mlProp.MagicLineCANameValue,
				'MagicLineCertPolicy':mlProp.MagicLineCertPolicyValue,
				'MagicLineKeyUsage':mlProp.MagicLineKeyUsageValue,
				'MagicLineKeyboardSec':mlProp.MagicLineKeyboardSecValue,
				'MagicLineMobilePhone':mlProp.MagicLineMobilePhoneValue,
				'InfovineInfo':mlProp.InfovineInfoValue,
				'MagicLineInstallProgress':MagicLineInstallProgressValue,
				'sitebase':sitebase,
				'SessionID':SessionIDValue,
				'Modaless':modaless,
				'sessionIDURL':mlEnv.RootContext+mlEnv.RootPath+'getCode.jsp;',
				
				'mayscript':'true'
				
				} ;
			var version = '1.6' ;
			deployJava.writeAppletTag(attributes, parameters, version);
					
	  }else{
	  	MagicPass.element.innerHTML += "<object codebase='" + MagicPass.path + "/plugins/MagicLineMBX.cab#version="+mlEnv.activeXVersion+"' classid='clsid:" + "C8223F3A-1420-4245-88F2-D874FC081574" + "' id='MagicLine' width='1' height='1'></object>";
	  }
			MagicPass.objectCertX = document.getElementById("MagicLine");
			MagicPass.object = document.getElementById(MagicPass.alias);
			if(MagicPass.objectCertX == null)
			{
				throw null;
			}else{
				MagicPass.usableCertX = true;
			}
	}
	catch(e)
	{
		window.setTimeout(function(){
			MagicPass.readyCertX(true);
		}, 1000);
	}
};

/**
 * �����н� ó������ �����޼����� MagicPass.errorUrl �� ������ �������� ����մϴ�.
 *
 * @param {Number} or {String} error �����ڵ�(�Ǵ� �����޼���)
 * @since MagicPass Prototype 2.3
 */
MagicPass.errorPage = function(error)
{
	if(new String(window.location).indexOf(MagicPass.errorUrl) < 0) 
		window.location.replace(MagicPass.errorUrl + "?code=" + error);
};

/**
 * �����н� ó������ �����޼����� ����մϴ�.
 *
 * @param {Number} or {String} error �����ڵ�(�Ǵ� �����޼���)
 * @param {Boolean} flag ��(True)�̸� Alert�޼����� ���
 * @return {String}
 * @since MagicPass Prototype 1.0
 */
MagicPass.error = function(error, flag)
{
	if(error == null || error == "") return

	var alertFlag = (typeof(flag) == "undefined") ? MagicPass.option.debugScript : flag;
	var message = null;
	var url = null;
	if(!window.isNaN(error))
		error = parseInt(error);

	if(typeof(error) == "number")
	{
		switch(error)
		{
			case 103	: message = "�����н��� ���������� Ʈ������ �������� Ȯ���� �ּ���."; break;
			case 203	: 
			case 151	: message = "�α����� �Ǿ����� �ʽ��ϴ�. �α��� ��, �ٽ� �õ��� �ּ���."; break;
			case 312	: message = "���� ������ ���� ���ø����̼�(�Ǵ� �޴�) �Դϴ�."; break;

			case 400	: message = " ���� ���� ���� "; break;
			case 401	: message = " SETUP URL ���� "; break;
			case 402	: message = " �����ų �� �ִ� ��ΰ� �ƴ�"; break;
			case 403	: message = " URL ��ȣȭ ����"; break;
			case 404	: message = " URL Base64 ���ڵ� ���� "; break;

			case 410	: message = " SETUP ���� ���� ����"; break;

			case 412	: message = " setup.conf ������ ã���� �����ϴ�"; break;
			case 513	:
			case 9999	: message = "��������(MAS)�� ������� �ʾҰų� �۵������� �ʽ��ϴ�."; break;

			case 10001	: message = "����� ������ �������� �ʽ��ϴ�."; break;
			case 10003	: message = "��й�ȣ �����Դϴ�. �ٽ� �õ��� �ֽñ� �ٶ��ϴ�."; break;
			case 10004	: message = "��ϵ��� ���� �������Դϴ�.\n ��������� �������� �̵��մϴ�."; break;
			case 10005	: message = "������ȣ �����Դϴ�. �ٽ� �õ��� �ֽñ� �ٶ��ϴ�."; break;
			
			case 10010	: message = "��й�ȣ/������ȣ ����ȸ�� �ʰ��� ������ �����ϴ�."; break;
			case 10011	: message = "��й�ȣ/������ȣ ����ȸ�� �ʰ��� ������ �����ϴ�."; break;
			
			case 30000	: message = "�̹� �α����� �Ǿ� �ֽ��ϴ�.\n �α׾ƿ� �����ּ���."; break;
			//case 31000	: message = "MAC ADDRESS�� �߰��Ϸ��Ͽ����ϴ�."; break;
			case 32000	: message = "�̹� �α����� �Ǿ� �ֽ��ϴ�.\n �α׾ƿ� �����ּ���."; break; 
			case 33000	: message = "MAC ADDRESS ���� ȹ�����."; break;
			case 34000	: message = "MAC ADDRESS DB �Է½���."; break;
			case 35000	: message = "�㰡���� ���� MAC ADDRESS �Դϴ�."; break;
			
			case 39000	: message = "MAC ADDRESS DB �Է½���."; break; 
			case 39001	: message = "ID�� �ٸ��ϴ�."; break;
			case 39002	: message = "Mac Address DB ��������"; break;
			case 39003	: message = "�α��� �������� �̵��մϴ�."; break; 
			case 50001	: message = "�ش� IP�� ���ٱ����� �����ϴ�. �����ڿ��� �����ϼ���."; break;	
			case 70000	: message = "�����н��� �ε����̰ų� ��ġ���� �ʾҽ��ϴ�. �ε� �Ǵ� ��ġ�� �Ϸ�� ��, �õ��Ͻñ� �ٶ��ϴ�.\n\n(1���̻� ������ ���, \"Ȯ��\"��ư�� Ŭ���Ͽ� ������ġ�� �����Ͻñ� �ٶ��ϴ�.)"; break;
			case 70001	: message = "�ƾƵ� �Է��� �ֽñ� �ٶ��ϴ�."; break;
			case 70002	: message = "��й�ȣ�� �Է��� �ֽñ� �ٶ��ϴ�."; break;
			case 70003	: message = "�ƾƵ� �Ǵ� ��й�ȣ�� �߸� �ԷµǾ����ϴ�."; break;
			case 70004	: message = "MagicPass(���� �α��� ���α׷�)�� ��ġ���� �ʾҰų� ��ġ�� �����ϰ� �ֽ��ϴ�.\n��ġ �Ϸ� ��, �ٽ� �α����� �õ��� �ֽñ� �ٶ��ϴ�."; break;
			case 70005	: message = "���������� ��ȸ�� �����Ͽ����ϴ�. �����ڿ��� �����Ͻñ� �ٶ��ϴ�."; break;
			case 70006	: message = "��ȣȭ Ű�� Ȯ���ϴ� �������� �����Ͽ����ϴ�."; break;
			case 70007	: message = "��ȣȭ ����Ű ��ȯ�������� ������ �߻��Ͽ����ϴ�."; break;
			case 70008	: message = "�α��� ������ ��ȣȭ �ϴ� �������� ������ �߻��Ͽ����ϴ�."; break;
			case 70009	: message = "��ȣȭ�� �����Ͱ� �����ϴ�. �����ڿ��� �����Ͻñ� �ٶ��ϴ�."; break;
			case 70010	: message = "��ȣȭ �����͸� ��ȣȭ �ϴ� �������� �ʿ��� �ð� �����Ͱ� ���ǵǾ����ϴ�."; break;
			case 70011	: message = "��ȣȭ �����͸� ��ȣȭ �ϴ� �������� �ʿ��� Ű �����Ͱ� ���ǵǾ����ϴ�."; break;
			case 70012	: message = "�����н��� �̹� �α��εǾ��ֽ��ϴ�.\n�α����� ��� �����Ͻðڽ��ϱ�?"; break;
			case 70013	: message = "ó���α��� �ϼ̽��ϴ�. \n��й�ȣ�� �����Ͻð� �ٽ� �α��� ���ּ���"; 
						  url = MagicPass.passwdChangeUrl;
						  break;
			case 70014	: message = "�α��� ��ȿ�Ⱓ���� �ѹ��� �α������� �����̽��ϴ�. \n��й�ȣ�� �����Ͻð� �ٽ� �α��� ���ּ���"; 
						  url = MagicPass.passwdChangeUrl;
						  break;
			case 70015	: message = "��й�ȣ ����Ⱓ�� ����Ͽ����ϴ�. \n��й�ȣ�� �����Ͻð� �ٽ� �α��� ���ּ���"; 
						  url = MagicPass.passwdChangeUrl;
						  break;
			case 70016	: message = "��й�ȣ ���� �˸� �Ⱓ�Դϴ�.\n ���� ��й�ȣ�� �����Ͻðڽ��ϱ�?"; break;
			
			case 70017	: message = "������ȣ ���� �˸� �Ⱓ�Դϴ�.\n ���� ��й�ȣ�� �����Ͻðڽ��ϱ�?"; break;
			
			case 80001	: message = "����ڼ��������� �����ϴ�. �ٽ� �α����� �ּ���."; break;
			
			case 81001	: message = "������ ���� IP�Դϴ�."; break;
			
			default	:
				if(error >= 801 && error < 1000) message = "������ ����Ȯ�ο� �����Ͽ����ϴ�. �ٽ� �ѹ� �õ����ֽñ� �ٶ��ϴ�.";
				else if(error >= 1000 && error <= 2013) message = "�۾��� ǥ�غ���API(GPKIAPI)���� ������ �߰��Ͽ����ϴ�.";
				else message = "�� �� ���� �����Դϴ�.\n������ ���ӵ� ���, �����ڿ��� �����Ͻñ� �ٶ��ϴ�.";
				break;
		}
		if(error == 70013 || error == 70014 || error == 70015)
			window.location.replace(url);
		if(MagicPass.option.debugScript) message += "\nCODE " + error;
	}
	else
		message = error;
	
	if(alertFlag)
		window.alert(message);
	
	MagicPass.log(message);
	return message;
};

/**
 * �����н��� ����Ǵ� �������� ĳ���ͼ��� �����մϴ�.
 * (ActiveX ������ ���)
 * 
 * @param {String} charsetName ��������: euc-kr, ansi (�ܴ̿� ���� ����. (0:ANSI, 1:euc-kr))
 * @since MagicPass Prototype 1.0
 */
MagicPass.setCharset = function(charsetName, siteName)
{
	var charset = charsetName || "euc-kr";
	var charN;
	if(charset == "euc-kr")
		charN = 1;
	else if(charset == "utf-8")
		charN = 2;
	else
		charN = 0;
	var site = siteName || MagicPass.siteName;

	MagicPass.log("INFO", "setCharset " + charset);

	if(!MagicPass.option.useApplet)
		MagicPass.object.SetCharSet(site, ((charset.toLowerCase() == "euc-kr") ? 1 : 0));
//		MagicPass.object.SetCharSet(site, charN);
};

/**
 * �����н� �α��� ������ ǥ�õǴ� �̸��� �����մϴ�.
 * 
 * @param {String} name �̸�(�����ϸ� MagicPass.siteTitle �� ����)
 * @param {String{ siteName ����Ʈ��(��������)
 * @since MagicPass Prototype 2.3
 */
MagicPass.setDelegateName = function(name, siteName)
{
	var delegateName = name || MagicPass.siteTitle;
	var site = siteName || MagicPass.siteName;

	MagicPass.log("INFO", "setDelegateName " + delegateName);

	MagicPass.object.SetSiteDelegate(site, delegateName);
};

/**
 * ������ ����Ǿ����� Ȯ���Ͽ� �α׾ƿ��� �����մϴ�.
 * 
 * @param {String} ����Ʈ��(��������)
 * @since MagicPass Prototype 2.0
 */
MagicPass.browserOffCheck = function(siteName)
{
	var processName = null;
	var site = siteName || MagicPass.siteName;

	if(Client.os == "WINDOWS")
	{
		switch(Client.browser)
		{
			case "FIREFOX"	: processName = "firefox.exe"; break;
			case "SAFARI"	: processName = "Safari.exe"; break;
			case "CHROME"	: processName = "chrome.exe"; break;
			case "OPERA"	: processName = "opera.exe"; break;
		}
	}
	else
	{
		switch(Client.browser)
		{
			case "FIREFOX"	: processName = "firefox"; break;
			case "SAFARI"	: processName = "Safari"; break;
			case "CHROME"	: processName = "chrome"; break;
			case "OPERA"	: processName = "opera"; break;
		}
	}

	MagicPass.log("INFO", "browserCheck " + processName);

	if(processName != null)
		MagicPass.object.setBrowserCheck(site, processName);
};

/**
 * �ڵ��α׾ƿ� ����� �����մϴ�. 
 * (������ �ð����� �̻� ��ũ��Ʈ�� �����н��� �׼����� ������ �����н��� ����Ʈ ��ū �α׾ƿ�)
 * 
 * @param {Number} interval üũ �ð�����(1/1000�� �ƴ�, ��������)
 * @param {String} siteName ����Ʈ��(��������)
 * @since MagicPass Prototype 2.0
 */
MagicPass.monitor = function(interval, siteName)
{
	if(!MagicPass.option.MP_monitor.use) return;
	if(interval > 0) MagicPass.log("INFO", "monitor " + (interval / 1000) + "sec.");
	
	var site = siteName || MagicPass.siteName;
	
	try
	{
		MagicPass.object.SetAutoLogoutSite(site, interval / 1000);
	}
	catch(e){}
};

/**
 * Ajax ó���� �����մϴ�.
 * 
 * @param {String} mode ������ ��ȣȭó��(secure.jsp)�� �ش� actionName�� ����
 * @param {Function} callbackFunction �ݹ��Լ�(Ajax ó�� ��, ȣ�� �Լ�)
 * @param {Function} funtionClass �ݹ��Լ��� Ŭ���������� ���, Ŭ������ �Է�
 * @param {String} or {Array} params ���� Request �Ķ���͸� ����(String �Ǵ� Map Ÿ��)
 * @param {String} url �ش� url�� Ajax Request�� ����(�����ϸ� secure.jsp ����)
 * @param {Boolean} async ��(true)�̸� �񵿱� ������� �ݹ��Լ� ȣ��
 * @since MagicPass Prototype 2.0
 */
var xmlHttpRequest = null;
MagicPass.request = function(mode, callbackFunction, funtionClass, params, url, async)
{
	if(xmlHttpRequest == null)
	{
		try
		{
			xmlHttpRequest = new XMLHttpRequest();
		}
		catch(e)
		{
			try
			{
				xmlHttpRequest = new ActiveXObject("Msxml2.HTTP");
			}
			catch(f)
			{
				xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
	}
	
	var actionUrl = url || MagicPass.secureUrl;		//Ajax�� ó���� �������� �����մϴ�
	var param = "actionName=" + mode;

	//�������� �Ķ���͸� ó���մϴ�
	for(var i in params)
	{
		try
		{
			param += "&" + i + "=" + encodeURIComponent(params[i]);
		}
		catch(e){
			
		};
	}

	//Ajax ȣ���� �õ��մϴ�
	xmlHttpRequest.open("POST", actionUrl, false);
	xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlHttpRequest.send(param);
	
	var sync = async || false;

	if(sync)
	{
		xmlHttpRequest.onreadystatechange = function()
		{
			if(xmlHttpRequest.readyState == 4)
			{
				if(xmlHttpRequest.status == 200)
					(callbackFunction).call(funtionClass, xmlHttpRequest.responseXML);
				else 
					MagicPass.error(xmlHttpRequest.statusText + " [" + xmlHttpRequest.status + "]");
			}
		};
	}
	else
	{
		if(typeof(callbackFunction) == "function")
			callbackFunction.call(funtionClass, xmlHttpRequest.responseXML);
	}
};

/**
 * XML���� Ư�� �±��� ���� �Ľ��մϴ�.
 * 
 * @param {XMLDocument} xmlData ���� Request�� ���� XML
 * @param {String} tag XML�� �����Ͱ�(nodeValue)�� ������ �±� ��
 * @return {String}
 * @since MagicPass Prototype 2.0
 */
MagicPass.xmlParse = function(xmlData, tag)
{
    var result = "";

    try
    {
    	result = xmlData.getElementsByTagName(tag)[0].firstChild.nodeValue;
    }
    catch(e)
    {
    	MagicPass.error("Undefined tag(" + tag + ") called", false);
    }

    return result;
};

/**
 * HTML��ҿ� �̺�Ʈ�� �����մϴ�.
 * 
 * @param {HTMLElement} or {String} targetObj �̺�Ʈ�� ������ ���
 * @param {String} eventType �̺�Ʈ ���� (click, keypress, ...)
 * @param {FUnction} callbackFunction �̺�Ʈ �߻���, ȣ��� �Լ�
 * @since MagicPass Prototype 2.2
 */
MagicPass.addEvent = function(targetObj, eventType, callbackFunction)
{
	var target = (typeof(targetObj) === "string") ? document.getElementById(targetObj) : targetObj;
	
	try
	{
		if(window.addEventListener)
			target.addEventListener(eventType, callbackFunction, false);
		else
			target.attachEvent("on" + eventType, callbackFunction);
	}
	catch(e)
	{
		MagicPass.error("To add '" + eventType + "' event is failure.\n cause : " + e.message, false);
	}
};

/**
 * ��Ű���� �������������� �ҷ��ɴϴ�.
 * (������������ ������ ��ȯ�� �Ź� ȣ���ϴ� ���ϸ� ���ֱ� ���� ��Ű�� �����صӴϴ�.)
 * 
 * @since MagicPass Prototype 2.3
 */
MagicPass.getServerCertificate = function()
{
	if(MagicPass.serverCertificate != null) return;
	MagicPass.log("INFO", "getServerCertificate");

	var currentCookie = document.cookie + ";";
	try{MagicPass.writeLog(" ## currentCookie : "+document.cookie ,"orange");}catch(e){}
	var startPoint = currentCookie.indexOf(MagicPass.cookieName + "=");
	
	if(startPoint > -1)
	{
		var s = currentCookie.substring(startPoint + MagicPass.cookieName.length + 1);
		s = s.substring(0, s.indexOf(";"));
		try{MagicPass.writeLog(" ## MagicPass.cookie : "+s ,"orange");}catch(e){}
		if(s.length > 5)
		{
			MagicPass.serverCertificate = window.unescape(s);
			return;
		}
	}
	
	MagicPass.request("GET_SERVER_CERTIFICATION", MagicPass.setServerCertificate);
};

/**
 * ������������ ���� �����մϴ�.
 * 
 * @param {XMLDocument} xmlData ���� Request�� ���� XML
 * @since MagicPass Prototype 2.3
 */
MagicPass.setServerCertificate = function(xmlData)
{
	var success = (MagicPass.xmlParse(xmlData, "success").toLowerCase() == "true") ? true : false;
	var code = MagicPass.xmlParse(xmlData, "code");
	var message = MagicPass.xmlParse(xmlData, "message");
	
	if(success)
	{
		MagicPass.serverCertificate = message;
		document.cookie = MagicPass.cookieName + "=" + window.escape(message) + ";domain=" + document.domain + ";"; 
		try{MagicPass.writeLog("afer_document.cookie : "+document.cookie);}catch(e){}
	}
	else
	{
		var error = (new String().isNull(code)) ? message : code;
		MagicPass.errorPage(error);
	}
};
/*--------------------------------------------------------------
	String object extension
--------------------------------------------------------------*/
/**
 * �Է¹��� StringŸ�� ��ü�� null, ""(���ڿ�), undefined �� ��츦 Ȯ���մϴ�.
 * ������ new String().isNull("���ڿ�") �Ǵ�, "���ڿ�".isNull()�� ��밡���մϴ�.
 * 
 * @param {String} str ���� ���ڿ�
 * @return {Boolean}
 * @since MagicPass Prototype 2.0
 */
String.prototype.isNull = function(str)
{
	var string = str || this;

	try
	{
		return !(string != null && string != undefined && string != "" && string != "null" && string != "undefined");
	}
	catch(e)
	{
		return true;
	}
};
/**
 * �Է¹��� StringŸ�� ��ü�� ��/�� ������ �����մϴ�.
 * ������ new String().trim("���ڿ�") �Ǵ�, "���ڿ�".trim()�� ���� ��밡���մϴ�.
 * 
 * @param {String} str ���ڿ�
 * @return {String}
 * @since MagicPass Prototype 2.0
 */
String.prototype.trim = function(str)
{
	var string = str || this;

	try
	{
		return string.replace(/^\s+|\s+$/g, "");
	}
	catch(e)
	{
		return string;
	}
};

/*--------------------------------------------------------------
	Using for Applet 
--------------------------------------------------------------*/
function afterStart()
{
	MagicPass.log("[applet] afterStart");
	return true;
}

function refreshPage()
{
	MagicPass.log("[applet] refreshPage");
	window.location.reload();
	
	return true;
}

function beforeInit()
{
	MagicPass.log("[applet] beforeInit");
	return true;
}

function afterInit()
{
	MagicPass.log("[applet] afterInit");
	return true;
}

function beforeStart()
{
	MagicPass.log("[applet] beforeStart");
	return true;
}

function closeWindow()
{
	if (window.opener)
		window.opener.close();
	
	window.close();
}

MagicPass.encryptSym = function(plainData)
{
   	var result = null;
		
    MagicPass.log("INFO", "encryptLogin");
    
    result = MagicPass.object.EncryptSym(decodeURI(plainData));
			
	return result;
};

MagicPass.getMacAddress = function(ipaddr, flag)
{	
	/** Applet ����*/
	if(MagicPass.option.useApplet)
	{
		if(flag==false)
		{
			try
			{
				if(MagicPass.option.useApplet)
				{
					var attributes = {codebase:MagicPass.appleteUrl,
				      code:'MacAddressA/MacAddressA',
				      archive:'MacAddressA.jar',
				      id:'MacAddressA',
				      name:'MacAddressA',
				      width:1, height:1} ;
					var parameters = {'java_code':'MacAddressA/MacAddressA',
						'java_codebase':MagicPass.appleteUrl,
						'java_archive':'MacAddressA.jar',
						'type':'application/x-java-applet;version=1.6',
						'interval.browser.monitoring':MagicPass.option.MP_monitor.interval,
						'mayscript':'true'
						
						} ;
					var version = '1.6' ;
					deployJava.runApplet(attributes, parameters, version);
					
					MagicPass.objectLoaderX = document.getElementById("MacAddressA");
					MagicPass.objectCertX = document.getElementById("MagicLine");
					MagicPass.object = document.getElementById(MagicPass.alias);
									
				}
			}
			catch(e)
			{
				window.setTimeout(function(){
					MagicPass.getMacAddress(ipaddr, true);
				}, 3000);
				return;
			}
		}
		MagicPass.objectLoaderX.setSep( "-" );
		var result = MagicPass.objectLoaderX.getMacAddressesJSON();
	}
	/** ActiveX ����*/
	else
	{
		var n_ret = MagicPass.objectLoaderX.GetClientMacAddress();
		if(0 == n_ret)
			result = MagicPass.objectLoaderX.Result;
	}
	//alert(" ## MacAddr : "+result);
	return result;
};



MagicPass.writeLog = function(msg){
	MagicPass.writeLog(msg, "black");
};

MagicPass.writeLog = function(msg, color){
	try{
		top.writeLog(msg, color);
	}catch(e){
		// not debugging mode
	}
};
/*--------------------------------------------------------
 * 	Auto Start
--------------------------------------------------------*/
try{MagicPass.writeLog(" ##### MagicPass START ##### ","orange");}catch(e){}
MagicPass.getServerCertificate();
MagicPass.ready();

