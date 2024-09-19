/*  MagicLine4 JavaScript version 4.2 by kj
 *  (c) 2007-2010 DreamSecurity
 *
 *  DreamSecurity license.
 *  For details, see the web site: http://www.dreamsecurity.com/
 *
 *--------------------------------------------------------------------------*/

/* 환경변수 정의*/

var mlEnv = {
	Product:'ALL', // MB, MBX, ALL
	RootPath:'/magicsso/', // Webcontext path
	RootContext:location.protocol +'//'+ location.host,
	JAVAInstallType:0, //0:ActiveX, 1:Download Page
	MagicLineInstallType:0, //0:ActiveX 바로설치, 1:Download Page
	/* JAVA Client Version old 
	MagicLineVer:'1.0.4.14',
	MagicLineLauncherVer:'1.0.7.14',
	MagicLineResVer:'1.0.2.1',
	MagicLineTrustedRootCertVer	:'1.0.1.1',
	JcoasVer:'1.4.5.2',
	UbiKeyVer:'1.0.1.3',
	*/
	/* JAVA Client Version new */
	MagicLineVer:'1.0.4.14',
	MagicLineLauncherVer:'1.0.7.14',
	MagicLineResVer:'1.0.2.2',
	MagicLineTrustedRootCertVer	:'1.0.1.1',
	JcoasVer:'1.4.5.2',
	UbiKeyVer:'1.0.1.4',

	/* ActiveX Client Version */
	activeXVersion:'1,0,4,8',
	debug:false
};


/* MagicLine Install Page*/
//var returnIndexPage 			= mlEnv.RootPath+'index.jsp'; // return page, 설치 후 돌아가는 페이지 index 페이지
var returnIndexPage 			= '/index.jsp'; // return page, 설치 후 돌아가는 페이지 index 페이지^M 
var returnJreInstallPage 		= mlEnv.RootPath+'java_install.jsp'; // return page, JAVA 설치 페이지^M
var returnMagicInstallPage 		= mlEnv.RootPath+'ml_install.jsp'; // return page, MagicLine 설치 페이지

var mlProp = {

	// 서버 인증서
	ServerCert:'MIIEgjCCA+ugAwIBAgICB6AwDQYJKoZIhvcNAQEFBQAwRDELMAkGA1UEBhMCS1IxFjAUBgNVBAoTDURyZWFtU2VjdXJpdHkxDjAMBgNVBAsTBVdpcmVkMQ0wCwYDVQQDEwRST09UMB4XDTA0MDUxNzA2MDMwMloXDTA1MDUxNzA2MDMwMlowTjELMAkGA1UEBhMCS1IxFjAUBgNVBAoTDURyZWFtU2VjdXJpdHkxDjAMBgNVBAsTBVdpcmVkMRcwFQYDVQQDDA5BTllfMDAwMDAwMTM3NDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA8oiK9s24U15Zc27yPSXvruwlgsngL9+dGiALMSG0ug3U9yUdJ+NqgBfMTvu2LE2EgoVObbwEWfdMCE8xmjlWVJzQRQATtvlGHiKXvAIwSjZq/gBIKLdKYmHQxBJk9NNE1nhHE6u0dlvVulNpDqO8hPj0P0OplWxHFZtEBpkSsDECAwEAAaOCAncwggJzMGwGA1UdIwRlMGOAFIwdeyOqAicpnNHLlhqKYmCRRZpBoUikRjBEMQswCQYDVQQGEwJLUjEWMBQGA1UEChMNRHJlYW1TZWN1cml0eTEOMAwGA1UECxMFV2lyZWQxDTALBgNVBAMTBFJPT1SCAQMwHQYDVR0OBBYEFL+l1vv7eUOivC/pmfP4xbZtjJW3MA4GA1UdDwEB/wQEAwIAMDB7BgNVHSAEdDByMHAGCiqDGoyaRAUCPAEwYjBgBggrBgEFBQcCAjBUMBQaDURyZWFtU2VjdXJpdHkwAwIBARo8VGhpcyBDZXJ0aWZpY2F0ZSBpcyBnZW5lcmF0ZWQgYnkgRHJlYW1zZWN1cml0eSBmb3IgQ0Fvc19YNTA5MCEGA1UdEQQaMBigFgYJKoMajJpECgEBoAkwBwwDQU5ZMAAwgecGA1UdHwSB3zCB3DBRoE+gTYZLbGRhcDovL2Nhb3MuZHJlYW1zZWN1cml0eS5jb206Mzg5L2NuPWNybDExZHAyLG91PVdpcmVkLG89RHJlYW1TZWN1cml0eSxjPUtSMIGGoIGDoIGAhn5odHRwOi8vY2Fvcy5kcmVhbXNlY3VyaXR5LmNvbS9jcmw/aWg9b0N4RlRlMWFtZGdoV3NrbnlGdmt2ZG4yRG9nJTNkJmRwPWNuJTNkY3JsMTFkcDIlMmNvdSUzZFdpcmVkJTJjbyUzZERyZWFtU2VjdXJpdHklMmNjJTNkS1IwSgYIKwYBBQUHAQEEPjA8MDoGCCsGAQUFBzABhi5odHRwOi8vY2Fvcy5kcmVhbXNlY3VyaXR5LmNvbToxNDIwMy9PQ1NQU2VydmVyMA0GCSqGSIb3DQEBBQUAA4GBACYZfFj6/Ixe3VViMpURAyYX7zBnoUDbCputCTuETzWMEuAc7/ciMGrnGVXitbRmpFlRINWnvDbrwHGF88xCRM1MTzEbLaBcDIMMCvIerUSW2/ocwd/vY6RRN38RAvVuYyNogbphVPaHJv85ivmdT47F7WcvyTz2XCAOJY5QJnJ5',
	//ServerCert:'MIID5jCCAs6gAwIBAgIQS0vbHgNYyQjpEtOBpXxMOjANBgkqhkiG9w0BAQUFADBQMQswCQYDVQQGEwJLUjEcMBoGA1UEChMTR292ZXJubWVudCBvZiBLb3JlYTENMAsGA1UECxMER1BLSTEUMBIGA1UEAxMLQ0ExMzEwMDAwMDEwHhcNMTAwMTEyMDIxNDU0WhcNMTIwNDEyMDIxNDU0WjBdMQswCQYDVQQGEwJLUjEcMBoGA1UECgwTR292ZXJubWVudCBvZiBLb3JlYTEYMBYGA1UECwwPR3JvdXAgb2YgU2VydmVyMRYwFAYDVQQDDA1TVlIxMzMwNzY0MDAxMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCjcpEm37CmH60edcVbBZzVSb3g6PXme7wNUUByVK7BDb/LKJmPO3s22ofv1DgABsQ924A/qbfCD15T1itzxy7eT4uxgkDvzqAY92YLQqoYzeAlqJelU/73JTZ2tMGp8nZMVkRkH2r1JRtq1X/bYAX4rcEq4aQIx6gkdb3zviuY/wIDAQABo4IBMTCCAS0wHwYDVR0jBBgwFoAUAc8XrgSNh8y3VQtxbGtInOaxspUwHQYDVR0OBBYEFNIHiALinQzTSJydy9W8+V1xeyZIMA4GA1UdDwEB/wQEAwIFIDAYBgNVHSAEETAPMA0GCSqDGoaNIQIBAjAAMIGIBgNVHR8EgYAwfjB8oHqgeIZ2bGRhcDovL2Nlbi5kaXIuZ28ua3I6Mzg5L2NuPWNybDAwMjYsY249Q0ExMzEwMDAwMDEsb3U9R1BLSSxvPUdvdmVybm1lbnQgb2YgS29yZWEsYz1LUj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25saXN0O2JpbmFyeTA2BggrBgEFBQcBAQQqMCgwJgYIKwYBBQUHMAGGGmh0dHA6Ly9ndmEuZ3BraS5nby5rcjo4MDgwMA0GCSqGSIb3DQEBBQUAA4IBAQBqjeYuUnBokVhPJNDI/T0gpM/3xkeE3fTmpNvHRqBWWZAWHqZfasUKO1in0bkS4PikqAM1ppmZP9EKPm3KRWV9PSUEGVty4lBvd69yjJNmJyobbcWJ69Uq8q7OT6FpF4a1VPaf5+SeSpcZMAKINRm0XyutM2BNtj2EOjSUm4WAM3PuJMBADbpfId3hYqjtu1VKAo5ZO4Nk+n9tWU4opqFdIni404R0ztXDO//XMx5Q5iO0filoN0fKtMkjK3XDmd2f4OG/XY93iz492SBTuXK59fE1ZZ94AOQvH3z+z9BJsLDJYI+fSu1QG05i7cpF3XCQHAX903vewKUu5fA1BseR',
	SiteID:'Dream',				// SiteID :세션정보를 획득하는 키값
	AlgoMode:0x30, 							//0x20 : SYM_ALG_3DES_CBC, 0x30 : SYM_ALG_SEED_CBC, 0x40 : SYM_ALG_NEAT_CBC,
		//0x50 : SYM_ALG_ARIA_CBC,0x60 : SYM_ALG_NES_CBC
	WorkDir:'DreamSecurity/MagicLineMBX',



	/**
	 * MagicLine Client JAVA Properties
	 */
	MagicLineDebugModeValue:'false',			//  false :사용안함 , true : 사용함
	MagicLineTabValue:'ALL',   			//  ALL : 일반/관리 , General : 일반, Management : 관리
	//MagicLineStorageTypeValue:'Disk;RemovableDisk;SmartCard;PKCS11Token;phone;', 		//  Disk : 하드, RemovableDisk:이동식, SmartCard:저장토큰, PKCS11Token:보안토큰
	MagicLineStorageTypeValue:'ALL', 		//  Disk : 하드, RemovableDisk:이동식, SmartCard:저장토큰, PKCS11Token:보안토큰
	MagicLineDomainValue:'ALL',				//  ALL :모든인증서 , NPKI : NPKI , GPKI : GPKI
	MagicLineCANameValue:'ALL',				//	ALL :모든인증기관, YESSIGN, SIGNKOREA, TRADESIGN,
											//	SIGNGATE, CROSSCERT,NCASIGN,MOPAS(행안부)
	MagicLineCertPolicyValue:'ALL',
	//MagicLineCertPolicyValue:'1.2.410.200004.5.1.1.5;1.2.410.200004.5.1.1.7;1.2.410.200004.5.2.1.1;1.2.410.200004.5.2.1.2;1.2.410.200004.5.4.1.1;1.2.410.200004.5.4.1.2;1.2.410.200005.1.1.1;1.2.410.200005.1.1.5;1.2.410.200012.1.1.1;1.2.410.200012.1.1.3', 		// 	ALL : 모든 인증서 정책 OID,  기타 세부 OID 는 각 인증 도메인별 규격
	MagicLineKeyUsageValue:'ALL',			// 	ALL : 모든 키사용 용도, SIGN : 서명용, KM : 암호용
	MagicLineKeyboardSecValue:'none',		//	none : 사용안함, softforum : 소프트포럼
	MagicLineMobilePhoneValue:'infovine',  // infovine 또는 인포바인 : 인포바인 휴대폰 서비스
																		    // signgate 또는 정보인증 : 정보인증 모바일키 휴대폰 서비스
	InfovineInfoValue:'CHANNELNAME:4INSURE;CERT_COMPANY:DREAMSECURITY;', //인포바인일 경우 사용
	MagicLineSite:'',						// MagicLine Site 주소 표시


	/**
	 *  MagicLine Client ActiveX Properties
	 */


	GNCertType:0x00,	 					// all:0x00, GPKI:0x01, NPKI:0x02, MPKI:0x04, Private:0x08
	ValidCertInfo:'',
	//ValidCertInfo:'1 2 410 200012 1 1 1|1 2 410 200012 1 1 3|1 2 410 200005 1 1 1|1 2 410 200005 1 1 5|1 2 410 200004 5 1 1 5|1 2 410 200004 5 1 1 7|1 2 410 200004 5 4 1 1|1 2 410 200004 5 4 1 2|1 2 410 200004 5 2 1 1|1 2 410 200004 5 2 1 2|',						// "1 2 410 100001 2 2 1|1 2 410 100001 2 1 2|";
	                                  		// 특정인증서만 로딩 할 경우에 정책코드를 나열한다.
	ReadCertType:0x01,				// 서명용인증서 : 0x01, 암호키분배용 인증서 : 0x02
	KeyStrokeType:0x00,				// 키보드 보안 API (0x00:사용안함, 0x01:softcamp, 0x02:INCA, 0x03:Ahnlab, 0x04:softforum, 0x05:Space International)
	CertOption:0x01,					// 0x00 : 로그인한 세션인증서로만 서명한다. (해당인증서만 로딩한다.)
	PhoneCertOpt:2,						// 0:none, 1:all, 2:Ubikey, 3: MobileKey
	MobileKeyURL:'http://www.mkey.kr/popup/mkey.htm',
	UbikeyVersion:'1.1.0.5',
	UbikeyPopupURL:'http://'+window.location.host+'/infovine/download.html',
	
	
	UbikeyWParam:'4INSURE|NULL',
	UbikeylParam:'DREAMSECURITY|NULL',
	ToolTip:0x01,							// 0x00 : 사용안함, 0x01: 사용
	ExpiredCert:1,						// 0 : 사용안함, 1: 만료된 인증서 로드 사용
	LanguageOpt:0,							// 0 : defulat, 1: ENG , 2: KOR , -1 : system Language 언어팩 사용 여부
	CertTabOpt:1,								// 0 : 일반 탭, 1:관리 탭, 2: all
	CertManageOpt:0x01,						//관리탭 사용 여부- 관리탭 사용 ( 0x00: 사용 안함, 0x01: User, 0x02: CA, 0x04: root, 0x08: private )
	LogoURL:mlEnv.RootContext+mlEnv.RootPath+'img/ksad_logo.bmp',

	getClassId:function(){
		var is64 = window.navigator.userAgent.toLowerCase().indexOf('win64') >-1;
		if(is64)
			return 'CLASSID="CLSID:C8223F3A-1420-4245-88F2-D874FC081576"';
		else
			return 'CLASSID="CLSID:C8223F3A-1420-4245-88F2-D874FC081574"';
	},
	activeXCodeBase:function(){
		var is64 = window.navigator.userAgent.toLowerCase().indexOf('win64') >-1;
		if(is64)
			return mlEnv.RootPath+'plugins/MagicLineMBX64.cab#version='+mlEnv.activeXVersion;
		else
			return mlEnv.RootPath+'plugins/MagicLineMBX.cab#version='+mlEnv.activeXVersion;
	}


};


var MagicLine_install			= true;
var tagStart					= "<MagicLine:ENCRYTPED_DATA>";
var tagEnd						= "</MagicLine:ENCRYTPED_DATA>";


deployJava.getBrowser();
var browser =	deployJava.browserName2;
var isMsie  =   browser.indexOf('MSIE') > -1;

var mlFunc = {

	objBlur:function(obj)
	{
		obj.blur();
		document.focus();
	},
	activeXNotInstalled:function()
	{
		if(mlEnv.MagicLineInstallType == 1){
			MagicLine_install = false;

			location.href=returnMagicInstallPage;
		}else{
			MagicLine_install = false;

		}
	},

	magicLineActiveXTag:function(installprocess, sessionId, keyboard, domain)
	{
		var objHtml =  '<OBJECT ID="MagicLine"  '+mlProp.getClassId();
		if(mlEnv.MagicLineInstallType == '0')
			objHtml += ' CODEBASE="'+mlProp.activeXCodeBase()+'"';
	//	objHtml += ' WIDTH = 0 HEIGHT = 0 onError="mlFunc.activeXNotInstalled()"></OBJECT>';
	
objHtml += ' WIDTH = 0 HEIGHT = 0 ></OBJECT>';
	MagicPass.element.innerHTML += objHtml;

		if(mlEnv.MagicLineInstallType == '1')
		{
			if(!mlFunc.activeXinstalled())
			{
					mlFunc.activeXNotInstalled();
					return false;
			}
			else
				return true;
		}
		//mlFunc.insertHtml('MagicElement',objHtml);
		return true;
	},

	activeXinstalled:function()
	{
	   try{
	    	var pluginML = MagicPass.objectCertX;
	    	if(pluginML &&( typeof(pluginML.ActiveXVersion) != 'undefined')){
	    		pluginML.ActiveXVersion = mlProp.WorkDir;
	    		for (i=0; i<4;i++) {
	                var tmp01 = parseInt(mlEnv.activeXVersion.split(',')[i]);  // server 배포 버전
	                var tmp02 = parseInt(pluginML.ActiveXVersion.split(',')[i]); // pc   설치 버전
	                if (tmp01 > tmp02){
	               // 	alert(2);
	                    return false;
	                }
					else if (tmp01 < tmp02)
					{
					//	alert(3);
					    return true;
					}
	            }
	            return true;
	    	}else{
	    		return false;
	    	}
	    }
	    catch(exception)
	    {
	    	alert(exception.message);
	        return false;
	    }
	},

	magicLineAppletTag:function(installprocess, sessionId, keyboard, domain)
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

			if(browser != 'MSIE')
				MagicLineMobilePhoneValue	= "infovine;";


  		var win60 =  window.navigator.userAgent.indexOf('Windows NT 6') >-1;

			var MagicLineInstallProgressValue = installprocess;
			var SessionIDValue				= sessionId;
			var sUserAgent = window.navigator.userAgent;
			var modaless = (browser.toLowerCase().indexOf('safari')==-1) && (sUserAgent.toLowerCase().indexOf('mac')>-1);

			var MagicLineHTML2 = '';
			if(browser == 'MSIE'){
				MagicLineHTML2 += ' <object id="MagicLine" name="MagicLine" classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" codetype="application/java" type="application/x-java-applet" width="0" height="0" onfocus="mlFunc.objBlur(this);" alt="매직라인" >';
				MagicLineHTML2 += ' <param name="java_code" value="com.dreamsecurity.applet.launcher.MagicLineLauncher.class"/>';
				MagicLineHTML2 += ' <param name="java_codebase" value="'+codebaseurl+';"/>';
				MagicLineHTML2 += ' <param name="type" value="application/x-java-applet;jpi-version=1.5"/>';
			}else{
				MagicLineHTML2 += '<div style="position:absolute;top:0px;left:0px;width:0px;height:0px;z-index:1;visibility:hidden;">';
				MagicLineHTML2 += '<applet id="MagicLine" codebase="'+codebaseurl+'"  code="com.dreamsecurity.applet.launcher.MagicLineLauncher.class" width=200 height=75 MAYSCRIPT >'; // style="visibility:hidden;" width="0" height="0" style="outline: none;display:inline" style="visibility:hidden;overflow:hidden;width:0;height:0;margin:0;padding:0;"
			}
			MagicLineHTML2 += ' <param name="archive" value="'+libPath+'/'+MagicLineLauncherJar+','+libPath+'/'+JcoasJar+','+libPath+'/'+UbiKeyJar+'"/>';
			//MagicLineHTML2 += ' <param name="cache_archive" value="'+libPath+'/'+NTSMagicLineLauncherJar+','+libPath+'/'+MagicLineLauncherJar+','+libPath+'/'+JcoasJar+','+libPath+'/'+UbiKeyJar+'"/>';
			//MagicLineHTML2 += ' <param name="cache_version" value="'+NTSMagicLineLauncherVer+','+MagicLineLauncherVer+','+JcoasVer+','+UbiKeyVer+'"/>';
			if((installprocess == 'check') && win60){
				MagicLineHTML2 += ' <param name="separate_jvm" value="true"/>';
			}
			// ## MagicLine's Parameter. ##
			MagicLineHTML2 += ' <param name="MagicLineCacheFile" value="'+MagicLineJar+';"/>';
			MagicLineHTML2 += ' <param name="MagicLineCacheFileVersion" value="'+mlEnv.MagicLineVer+';"/>';
			MagicLineHTML2 += ' <param name="MagicLinePath" value="'+downPath+'"/>';
			MagicLineHTML2 += ' <param name="MagicLineResourceFile" value="'+MagicLineResJar+';"/>';
			MagicLineHTML2 += ' <param name="MagicLineResoureVersion" value="'+mlEnv.MagicLineResVer+';"/>';
			MagicLineHTML2 += ' <param name="MagicLineLauncherVersion" value="'+mlEnv.MagicLineLauncherVer+'"/>';
			MagicLineHTML2 += ' <param name="MagicLineRealAppletName" value="com.dreamsecurity.ui.MagicXSignRealAppletProcImpl"/>';
			MagicLineHTML2 += ' <param name="MagicLineTrustedRootCertFile" value="'+MagicLineTrustedRootCertJar+'"/>';
			MagicLineHTML2 += ' <param name="MagicLineTrustedRootCertVersion" value="'+mlEnv.MagicLineTrustedRootCertVer+'"/>';
			MagicLineHTML2 += ' <param name="MagicLineDebugMode" value="' + mlProp.MagicLineDebugModeValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineTab" value="' + mlProp.MagicLineTabValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineStorageType" value="' + mlProp.MagicLineStorageTypeValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineDomain" value="' + mlProp.MagicLineDomainValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineCAName" value="' + mlProp.MagicLineCANameValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineCertPolicy" value="' + mlProp.MagicLineCertPolicyValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineKeyUsage" value="' + mlProp.MagicLineKeyUsageValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineKeyboardSec" value="' + mlProp.MagicLineKeyboardSecValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineMobilePhone" value="' + mlProp.MagicLineMobilePhoneValue + '"/>';
			MagicLineHTML2 += ' <param name="InfovineInfo" value="' + mlProp.InfovineInfoValue + '"/>';
			MagicLineHTML2 += ' <param name="MagicLineInstallProgress" value="'+MagicLineInstallProgressValue+'"/>';
			//MagicLineHTML2 += ' <param name="MagicLineSite" value="' + MagicLineSite + '"/>';
			MagicLineHTML2 += ' <param name="sitebase" value="' + sitebase + '"/>';
			MagicLineHTML2 += ' <param name="SessionID" value="' + SessionIDValue + '"/>';//Modaless
			MagicLineHTML2 += ' <param name="Modaless" value="' + modaless + '"/>';

			MagicLineHTML2 += ' <param name="sessionIDURL" value="' + mlEnv. RootContext+mlEnv.RootPath+"getCode.jsp" + '"/>';


			if(browser == 'MSIE' ){
				MagicLineHTML2 += ' </object>';
			}else{
				MagicLineHTML2 += '</applet>';
				MagicLineHTML2 += '</div>';
			}
			if(browser == 'MSIE'){
				mlFunc.insertHtml('MagicLineElement',MagicLineHTML2);
			}else{
				MagicPass.element.innerHTML += MagicLineHTML2;
			}
			return true;
	},

	insertHtml:function(eleName, html)
	{
		var magicElement = document.createElement('div');
		magicElement.id=eleName;
		magicElement.innerHTML = html;
		var ref_node =  document.getElementsByTagName("HEAD")[0];
		ref_node.parentNode.insertBefore(magicElement, ref_node);
	}

};

var javaFunc = {

	/*
	* JAVA Install 페이지로 이동.
	*/
	javaInstallProc:function()
	{

		if(browser == 'Safari' || browser == 'Opera'){
			if(!javaFunc.java16VersionSafariCheck()){
					location.href = returnJreInstallPage;
			}
		}else if(browser == 'MSIE'){
			if(!javaFunc.java16VersionMSIECheck()){
					location.href = returnJreInstallPage;
			}
		}else{
			if(!javaFunc.java16VersionCheck()){
					location.href =	returnJreInstallPage;
			}
		}

		return true;
	},

	installJRE:function()
	{
//			if(browser == 'MSIE'){
//				if(javaFunc.java16VersionMSIECheck())
//					location.href = returnIndexPage;
//			}else if(browser == 'Safari' || browser == 'Opera'){
//				if(javaFunc.java16VersionSafariCheck())
//					location.href = returnIndexPage;
//			}else{
//				if(javaFunc.java16VersionCheck())
//					location.href = returnIndexPage;
//			}
			if(mlEnv.JAVAInstallType==0){
				mlFunc.insertHtml('javaElement',javaFunc.getInstallJRETag(browser));
				//document.write(javaFunc.getInstallJRETag(browser));
				//deployJava.installLatestJRE();
			}
		},

		java16VersionMSIECheck:function()
		{

			var jres = deployJava.getJREs();
			if(deployJava.versionCheck('1.5.0_20+') ){
				for(var i=0; i< jres.length; i++){
					if(jres[i].indexOf('1.6.0') >-1){
						if(deployJava.versionCheck('1.6.0_17+')){
							return	true;
						}else{
							return false;
						}
					}
				}
				return true;
			}else{
				for(var i=0; i<jres.length; i++){
					if(jres[i].indexOf('1.5.0')>-1 || jres[i].indexOf('1.6.0')>-1)
						return true;
				}
				return false;
			}
		},

//Netscape Family JRE Version Check!!
		java16VersionCheck:function()
		{
			var nPlatfrom = window.navigator.platform;
			var isMac = (nPlatfrom =='Mac68K')||(nPlatfrom == 'MacPPC') || (nPlatfrom == 'MacIntel') || (nPlatfrom.indexOf("Mac") > -1 ) ;
			if(isMac){
				Java0StatusS = PluginDetect.isMinVersion('Java', '1.5.0+', mlEnv.RootPath+'js/getJavaInfo.jar');
				if(Java0StatusS == 1){
					return true;
				}else{
					return false;
				}
			}if(isMac){
				Java0StatusS = PluginDetect.isMinVersion('Java', '1.5.0+', mlEnv.RootPath+'js/getJavaInfo.jar');
				if(Java0StatusS == 1){
					return true;
				}else{
					return false;
				}
			}else{
				if(deployJava.versionCheck('1.6.0_17+')){
					return true;
				}
			}
			return false;
		},

//Safari JRE Version Check!!
	 java16VersionSafariCheck:function()
	 {
			var nPlatfrom = window.navigator.platform;
			var isMac = (nPlatfrom =='Mac68K')||(nPlatfrom == 'MacPPC') || (nPlatfrom == 'MacIntel') || (nPlatfrom.indexOf("Mac") > -1 ) ;
			var JavaVersionS = "";
			var Java0StatusS;
			JavaVersionS = PluginDetect.getVersion('Java', mlEnv.RootPath+'js/getJavaInfo.jar');
			Java0StatusS = PluginDetect.isMinVersion('Java', '1.5.0', mlEnv.RootPath+'js/getJavaInfo.jar');

			if(JavaVersionS == null)
				return false;

			if(JavaVersionS.indexOf('1,5')>-1){
				if(isMac){
					return true;
				}
				return false;
			}else if(JavaVersionS.indexOf('1,6')>-1 || JavaVersionS.indexOf('1,7')>-1)
				 return true;
			else{
				 return false;
			}
	},

	getInstallJRETag:function(current_browser){

	   var objectTag = "";
	      objectTag = ' <OBJECT ';
	      objectTag +=' ID = "MagicXSign1"';
	      objectTag +=' classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"';
	      objectTag +=' width="0"';
	      objectTag +=' height="0"';
	      objectTag +=' codebase="http://java.sun.com/update/1.6.0/jinstall-6u24-windows-i586.cab#Version=6,0,2,6">';
	      objectTag +='</OBJECT> ';

		var embedTag = ' <object';
		    embedTag +=' classid = "clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"';
		    embedTag +=' codebase = "http://java.sun.com/update/1.6.0/jinstall-6u24-windows-i586.cab#Version=6,0,2,6"';
		    embedTag +=' WIDTH = "0px" HEIGHT = "0px" >';
		    embedTag +=' <PARAM NAME = CODEBASE VALUE = "http://java.sun.com/update/1.6.0/jinstall-6-fcs-windows-i586.cab" >';
		    embedTag +=' <param name = "type" value = "application/x-java-applet;jpi-version=1.6.0_07">';
		    embedTag +=' <param name = "scriptable" value = "true">';
				embedTag +=' <comment>';
				embedTag +='	 <embed';
		    embedTag +='      type = "application/x-java-applet"';
		    embedTag +='      JAVA_CODEBASE = "http://java.sun.com/update/1.6.0/jinstall-6-fcs-windows-i586.cab"';
		    embedTag +='      WIDTH = "0px"';
		    embedTag +='      HEIGHT = "0px"';
		    embedTag +='			scriptable = true';
		    embedTag +='			pluginspage = "http://javadl.sun.com/webapps/download/GetFile/1.6.0_24-b07/windows-i586/xpiinstall.exe">';
		    embedTag +='			<noembed>';
		    embedTag +='      </noembed>';
				embedTag +='	</embed>';
		    embedTag +=' </comment>';
				embedTag +=' </object>';

		if(current_browser == "MSIE")
			return objectTag;
		else if(current_browser == "Netscape Family")
			return embedTag;
		else
			return objectTag + embedTag;
	}
};






/* MagicLine default Version */
document.writeln('<form name="magicLine4Form" METHOD="POST">');
document.writeln('      <input name="encryptedData" type="hidden"/>');
document.writeln('      <input name="signedData" type="hidden"/>');
document.writeln('</form>');


//====================================================================
//JRE Install Start !!
//====================================================================

function runMagicLine(installProcess, sessionId, keyboard, domain)
{

	if(mlEnv.Product == 'ALL'){
		if(browser == 'MSIE'){
			return mlFunc.magicLineActiveXTag(installProcess, sessionId, keyboard, domain);
		}else{
			javaFunc.javaInstallProc();
			return mlFunc.magicLineAppletTag(installProcess, sessionId, keyboard, domain);
		}
	}else if(mlEnv.Product == 'MB'){
		javaFunc.javaInstallProc();
		return mlFunc.magicLineAppletTag(installProcess, sessionId, keyboard, domain);
	}else if(mlEnv.Product == 'MBX'){
		if(browser != 'MSIE'){
			alert('지원하지 않는 브라우져 입니다.');
			return;
		}
		return mlFunc.magicLineActiveXTag(installProcess, sessionId, keyboard, domain);

	}else{
		alert(mlEnv.Product+' product invalid.');
	}


}






//====================================================================
//MagicLine4 Run END !!
//====================================================================


/**
* by kj
* installProgressJRE(): java가 설치되어있는지 체크
* java 설치 페이지로 이동하여 java를 설치 할 수 있도록 구현함.
* java 설치 요건이 충족되면 return false
* java 설치 요건이 충족되지 못하면 java설치 페이지로 이동.
* @param flag
* @return java 설치 페이지 혹은 false
*/
function installProgressJRE(){
	javaFunc.javaInstallProc();
}

/**
* installJRE() : java 설치 페이지에서 사용
* installProgressJRE()에서 java 설치요건이 충족되지 못한경우
* 이 함수를 사용하고 혹 도중에 충족이 되었을경우 index 페이지로 이동함.
* @return
*/
function installJRE(){
	javaFunc.installJRE();
}



function javaInstallUrl(){

	var nPlatfrom = window.navigator.platform;
	var sUserAgent = window.navigator.userAgent;
	var isWin = (nPlatfrom =='Win32')||(nPlatfrom=='Windows');
	var isMac = (nPlatfrom =='Mac68K')||(nPlatfrom == 'MacPPC') || (nPlatfrom == 'MacIntel') || (nPlatfrom.indexOf("Mac") > -1 ) ;
	var isUnix = (nPlatfrom == 'X11') && !isWin && !isMac;
	var isWin98 = sUserAgent.indexOf('Win98')>-1 || sUserAgent.indexOf('Windows 98')>-1;
	var isWinME = sUserAgent.indexOf('Win 9x 4.90')>-1 || sUserAgent.indexOf('Windows ME')>-1;

	var installUrl = "";
	var port = location.port;
	var common_url = mlEnv.RootPath;

	if(isWin){ // windows
		if(isWin98 || isWinME){
			installUrl = common_url+"jre/jre-1_5_0_22-windows-i586-p.exe";		// win98 || winMe일 경우에 jre 1.5버전 설치
		}else{
			return installUrl = common_url+"jre/jre-6u25-windows-i586.exe";
		}
	}else if(isMac){ // mac
		if(sUserAgent.indexof('10_4')>-1){
			return installUrl = common_url+"jre/JavaForMacOSX10.5Update6.dmg";
		}else{
			return installUrl = common_url+"jre/JavaForMacOSX10.6Update1.dmg";
		}
	}else if(isUnix){ // unix
		return installUrl = common_url+"jre/jre-6u17-linux-i586-rpm.bin";
	}else{ // 기타 OS
		alert('지원하지 않는 OS 입니다.');
		return;
	}
}

function returnPage(page){
	location.href = page;
}




//====================================================================
//JRE Install End !!
//====================================================================



/*********************************************************************/
//				init
/*********************************************************************/
function Init()
{
	var nResult;
	if(mlEnv.Product == 'ALL' ){
		if(browser == 'MSIE' && MagicPass.option.useApplet == false){
     
			nResult = MagicPass.objectCertX.Init(mlProp.WorkDir, mlProp.ServerCert, mlProp.AlgoMode,
								mlProp.GNCertType, mlProp.ValidCertInfo, mlProp.ReadCertType, mlProp.KeyStrokeType, mlProp.LogoURL);
			MagicPass.objectCertX.SetInitOption(mlProp.ToolTip, mlProp.ExpiredCert);
			MagicPass.objectCertX.SetPhoneCertOpt(mlProp.PhoneCertOpt);
			MagicPass.objectCertX.SetLanguageOption(mlProp.LanguageOpt);
			MagicPass.objectCertX.SetCertManageOption(mlProp.CertTabOpt,mlProp.CertManageOpt);
			MagicPass.objectCertX.InitSessionURL(mlEnv.RootContext+mlEnv.RootPath+"getCode.jsp");
		}else{
//alert("Wait for applet Loading");

			nResult = MagicPass.objectCertX.Init(mlProp.WorkDir, mlProp.ServerCert, mlProp.AlgoMode,
						mlProp.GNCertType, mlProp.ValidCertInfo, mlProp.ReadCertType, mlProp.KeyStrokeType);
		}
	}else if(mlEnv.Product == 'MB'){

				nResult = MagicPass.objectCertX.Init(mlProp.WorkDir, mlProp.ServerCert, mlProp.AlgoMode,	mlProp.GNCertType, mlProp.ValidCertInfo, mlProp.ReadCertType, mlProp.KeyStrokeType);
	}else if(mlEnv.Product == 'MBX'){
			nResult = MagicPass.objectCertX.Init(mlProp.WorkDir, mlProp.ServerCert, mlProp.AlgoMode,
								mlProp.GNCertType, mlProp.ValidCertInfo, mlProp.ReadCertType, mlProp.KeyStrokeType, mlProp.LogoURL);
			MagicPass.objectCertX.SetInitOption(mlProp.ToolTip, mlProp.ExpiredCert);
			MagicPass.objectCertX.SetPhoneCertOpt(mlProp.PhoneCertOpt);
			MagicPass.objectCertX.SetLanguageOption(mlProp.LanguageOpt);
			MagicPass.objectCertX.SetCertManageOption(mlProp.CertTabOpt,mlProp.CertManageOpt);
			MagicPass.objectCertX.InitSessionURL(mlEnv.RootContext+mlEnv.RootPath+"getCode.jsp");
	}

	if( nResult == 1 && browser == 'MSIE')
	{
		//infovine ActiveX
		if( mlProp.PhoneCertOpt == 1 || mlProp.PhoneCertOpt == 2 )
		 {
			MagicPass.objectCertX.UbiKeyInit(mlProp.UbikeyVersion, mlProp.UbikeyPopupURL, mlProp.UbikeyWParam, mlProp.UbikeylParam);
		 }
		return nResult;
	}
	else
	{
		strReturnData = MagicPass.objectCertX.GetReturnData();
		return nResult;
	}
}







/*********************************************************************/
/** PKCS 7                                                           */
/*********************************************************************/
function ShowCertWindow(mCert, orgView, planText)
{
	var strSendData;
	var nResult = Init();
	if( nResult != 1 ){
		alert('초기화 실패 error code:'+nResult);
		return;
	}

	if( MagicPass.objectCertX.setSessionID('') != 1)
	{
		return;
	}
	nResult = MagicPass.objectCertX.SignedData_PKCS7(mCert,orgView, planText);

	if( nResult == 1 )
	{
			return MagicPass.objectCertX.GetReturnData();
	}
	else
	{
		if( nResult == 106 ||  nResult == 100)
			return 100;
		else
			return nResult;
	}

}
/*********************************************************************/
/** PKCS 7                                                           */
/*********************************************************************/
function ShowCertManage(){
	var strSendData;
	var nResult = Init();
	if( nResult != 1 ){
		alert('초기화 실패 error code:'+nResult);
		return;
	}

	return nResult = MagicPass.objectCertX.ShowCertManage();
}

function SignedData(data)
{
	var nResult;
	var strReturnData;
	nResult = Init();
	if( nResult == 117)
		return"";
	nResult = MagicPass.objectCertX.SignedData(mlProp.SiteID, mlProp.CertOption, data);
	if( nResult == 1) // Issue 실패
	{
			strReturnData = MagicPass.objectCertX.GetReturnData();
			return strReturnData;

	}
	else
	{
		if(nResult != 106 && strReturnData != null)
			alert(strReturnData)
		return "";
	}
}



// C/S 용 인증서 사용자 인터페이스
/*********************************************************************/
//                   `                //
/*********************************************************************/
var nResult = -1;


/*********************************************************************/
//		      WrapperTag 											//
/*********************************************************************/
//  <GPKI_ENC> Data </GPKI_ENC>	로 만든다.
function WrapperTag(Msg)
{
	var TagData;

	TagDat = "<GPKI_ENC>";
	TagData += Msg;
	TagData += "</GPKI_ENC>";
	return TagData;
}



function makeQueryString( form )
{
	var name  =  new Array(form.elements.length);
	var value =  new Array(form.elements.length);
	var flag  = false;
	var j     = 0;
	var plain_text ="";

	len = form.elements.length;

	for (i = 0; i < len; i++)
	{

		if( (form.elements[i].type != "button") && (form.elements[i].type != "reset") && (form.elements[i].type != "submit") )
		{
			if (form.elements[i].type == "radio" || form.elements[i].type == "checkbox")
			{
				if (form.elements[i].checked == true)
				{
					name[j] = form.elements[i].name;
					value[j] = form.elements[i].value;
					j++;
				}
			}
			else {
				name[j] = form.elements[i].name;
				if (form.elements[i].type == "select-one")
				{
					var ind = form.elements[i].selectedIndex;
					if (form.elements[i].options[ind].value != '')
						value[j] = form.elements[i].options[ind].value;
					else
						value[j] = form.elements[i].options[ind].text;
				}
				else
				{
					value[j] = form.elements[i].value;
				}
				j++;
			}
		}
	}

//	for (i = 0; i < j; i++)
//	{
//		str = value[i];
//		value[i] = replaceEscapeString(str);
//	}

	for (i = 0; i < j; i++)
	{
		if (flag)
			plain_text += "&";
		else
			flag = true;
		plain_text += name[i] ;
		plain_text += "=";
		plain_text += value[i];
	}
	return plain_text;
}

// submit 전송할 데이터 대체
function replaceEscapeString( qureyString )
{
	var i;
	var ch;
	var rstring = '';
	var qstring = '';

	qstring = String(qureyString);

	for (i = 0; i < qstring.length; i++)
	{
		ch = qstring.charAt(i);

		if (ch == ' ')  rstring += '%20';
		else
		if (ch == '%')  rstring += '%25';
		else
		if (ch == '&')  rstring += '%26';
		else
		if (ch == '+')  rstring += '%2B';
		else
		if (ch == '=')  rstring += '%3D';
		else
		if (ch == '?')  rstring += '%3F';
		else rstring += ch;
	}

	return rstring;
}

function getOSName(){
	var OSName="Unknown OS";
	if (navigator.platform.indexOf("Win")!=-1) OSName="Windows";
	if (navigator.platform.indexOf("Mac")!=-1) OSName="MacOS";
	if (navigator.platform.indexOf("X11")!=-1) OSName="UNIX";
	if (navigator.platform.indexOf("Linux")!=-1) OSName="Linux";
	return OSName;
}

