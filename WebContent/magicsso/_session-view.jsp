<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.dreamsecurity.web.agent.config.SSOConfig" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="com.dreamsecurity.framework.util.EAMCrypt" %>
<%@ include file="./ssoCommon.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>MagicSSO Login Session view(확인 후, 삭제 요망)</title>
	<style type="text/css" media="screen">
		dl.row{border-top:1px dotted #777; magin:0; padding:0;clear:left;}
		dl.row dt{float:left; margin:0; padding:0; width:200px; height:25px; font-weight: bold; border-right:1px solid #AAA;}
		dl.row dd{float:left; margin:0; padding-left:2em;}
	</style>
	<script type="text/javascript" src="./js/deployJava.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/MagicPass.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Connect.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Monitor.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Encrypt.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/EtcFunc.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/Logout.js" charset="utf-8"></script>
	<script type="text/javascript">
		window.onunload = function()
		{
			MagicPass.monitor(7000);
		};
		
		function encStart(flag){
			if(flag==0){
				var frm = document.sView;
				var rlt1 = b64_sha256(frm.tartxt.value.trim());
				var rlt2 = hex_sha256(frm.tartxt.value.trim());
				frm.rlttxt.value=rlt2;
				alert("b64_sha256(var plainTxt) : \n"+rlt1+"\n-------------------------------------\nhex_sha256(var plainTxt) : \n"+rlt2);
			}else{
				hsf.start();
			}
		}
		
		function openPop(url){
			window.open(url,'mpop','width=510,height=360,status=yes,scrollbars=yes,resizable=yes');
		}
		
		function openPop1(url){
			window.open(url,'mpop','width=700,height=500,status=yes,scrollbars=yes,resizable=yes');
		}
		function symTest(){
			var txt = document.getElementById("symTxt").value;
			var n_ret = MagicPass.encryptSym(txt);
			alert(n_ret);
			var rlt="def";
			if(n_ret == 0)
				rlt = new String(MagicPass.getResult());
			alert(rlt);
		}
		
	</script>
</head>
<body>
<form id="sView" name="sView">
	<dl>
	    <%
	    File tmpF = new File(".");
	    if(session.getAttribute(S_LOGIN_ID) != null){%>
		<dd>
			<!-- a href="javascript:MagicPass.siteLogout(MagicPass.baseUrl);">로그아웃</a> -->
			<a href="./logout.jsp">로그아웃</a>
		</dd>
		<%}else{%>
		<dd>
			<a href="./login.jsp">로그인</a>
		</dd>
		<%}%>
		
	</dl>
	<dl>
		<dd>
			<%=EAMCrypt.getInstance().encrypt("1234") %>
		</dd>
	</dl>
	<dl>
		<dd>
			<input type="text" id="symTxt" name="symTxt" />
			<input type="button" id="test" name="test" value="테스트" onclick="symTest();return false;"/>
		</dd>
	</dl>
<table border='1'>
<tr>
<th>SESSION FIELD NAME</th>
<th>SESSION FIELD VALUE</th>
</tr>
<tr>
<td>File Encoding</td>
<td><%=System.getProperty("file.encoding") %></td>
</tr>
<tr>
<td>Absolute Path</td>
<td><%=tmpF.getAbsolutePath() %></td>
</tr>
<%
	Enumeration sNames = session.getAttributeNames();
    List<String> li = new ArrayList<String>();
	while(sNames.hasMoreElements())
	{
		Object so = sNames.nextElement();
		li.add((null == so)?"":(String)so);
	}
	Collections.sort(li);
	for(String sName : li){
		out.println("<tr><td>"+sName+"</td>");
		out.println("<td>"+session.getAttribute(sName)+"</td></tr>");
	}
%>
</table>

</form>
<div id="MagicLineArea"></div>
</body>
</html>