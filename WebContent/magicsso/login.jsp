<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>MagicSSO 3.0 DEFAULT 샘플로그인</title>  
	<script type="text/javascript" src="./js/deployJava.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/MagicLine.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/MagicPass.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Login.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Monitor.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Certificate.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/cookie.js" charset="utf-8"></script>
	 <script type="text/javascript">
	 	function ssoLogin()
	    {
	 		//var cid = document.getElementById("loginId");
	 		//Set_Cookie('tmpid',cid.value);
	 		
			login.start();
		 }
		 
		 function setId()
		 {
			var cid = document.getElementById("loginId");
			var tid = Get_Cookie('tmpid');
			tid = (tid==null || tid=='undefined')?'':tid;
			cid.value=tid;
		 }
		 
	 </script>
</head>
<body>
	<% if(session.getAttribute("SSO_ID") != null) { %>
	<div>
		<strong><%= session.getAttribute("SSO_ID") %></strong> 
		<span>login complete! - <a href="./logout.jsp"><!-- a href="javascript:MagicPass.siteLogout()" -->로그아웃</a></span>
	</div>
	<% } else { %>
	<noscript>
		<div style="font:normal 8pt 돋움,dotum">
			<span style="color:red;font-family:Courier">*</span> 자바스크립트를 사용하지 않으면, SSO로그인을 이용할 수 없습니다.
		</div>
	</noscript>

	<form id="loginForm" method="post" action="" onsubmit="return false">
	<div id="loginBox">
		<dl>
			<dd><label><b>http:<%=request.getRemoteHost()%>:<%=request.getLocalPort()%>/magicsso/login.jsp</b></label></dd>
			<dd><label for="loginIdL">ID </label><input type="text" id="loginId" name="loginId" /></dd>
			<dd><label for="loginPwdL">PW </label><input type="password" id="loginPwd" name="loginPwd" /></dd>
		</dl>
		<dl>
			<dd><input type="button" id="loginButton" value="OK" /></dd>
			<script type="text/javascript">
			   if(MagicPass.option.useCertificate)
			   	document.write("<dd><input type='button' id='certificateButton' value='certificate' /></dd>");
			</script>
			
		</dl>
	</div>
	<input type="hidden"  id="macAddr" name="macAddr" value=""/>
	</form>
	<% } %>
<div id="MagicLineArea"></div>
	<script type="text/javascript" defer="defer">
	//<![CDATA[
		var returnUrl = null;
		
		var login = new Login("loginId", "loginPwd", returnUrl);

		if(MagicPass.option.useCertificate)
			var certificate = new Certificate(returnUrl);
		
		MagicPass.addEvent("loginButton", "click", function(){
			MagicPass.job("Execute Login", function(){
				ssoLogin();
			});
		});
		
		MagicPass.job("로그인ID 포커스 이동", function() {
			var loginId = document.getElementById("loginId");
			if(loginId && !loginId.value) loginId.select();
		});
		var certificate;

		if(MagicPass.option.useCertificate && !MagicPass.option.useApplet)
			certificate = new Certificate(returnUrl);
		MagicPass.addEvent("certificateButton", "click", function(){
	    	if(MagicPass.option.useApplet)
				certificate = new Certificate(returnUrl);
			 certificate.start();
		});
	//]]>
	</script>
</body>
</html>