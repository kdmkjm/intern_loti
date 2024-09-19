<%@ page contentType="text/html; charset=utf-8" %>
<%
	String code = request.getParameter("code");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Notice</title>
	<link href="./css/install_style.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src="./js/MagicPass.js"></script>
	<script type="text/javascript">
		MagicPass.ready = function(){};
		var code = "<%= code %>";
	</script>
</head>
<body>
	<div id="head" style="background-color:#B00">
		<div class="valignMiddle">로그인 / 연계 시스템 알림</div>
		<div id="buttonClose" title="닫기"></div>
	</div>
	<div id="main">
		<div class="boxCase">
			<div id="messageBox">잘못된 접근입니다. 정상적인 이용을 부탁드립니다.</div>
			<div id="buttonBox"><button id="closeWindow">창닫기</button></div>
		</div>
	</div>
	
	<script type="text/javascript">
	//<![CDATA[
		if(!new String().isNull(code))
		{
			document.getElementById("messageBox").innerHTML = MagicPass.error(code, false);
		}

		MagicPass.addEvent("buttonClose", "click", function(){ window.self.close(); });
		MagicPass.addEvent("closeWindow", "click", function(){ window.self.close(); });
	//]]>
	</script>
</body>
</html>