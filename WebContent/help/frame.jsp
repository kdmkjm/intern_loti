<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>온라인 도움말</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
</head>
<body>
<table width="930" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="5">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
    		<tr valign="bottom">
    			<td align="left"><a href='<html:rewrite page="/onHelp.act?task=index"/>'><img src='<html:rewrite page="/images/help/logo.gif"/>'></a></td>
					<td width="100" align="center"><a href='<html:rewrite page="/onHelp.act?task=index"/>'><b>HOME</b></a></td>
				</tr>
			</table>
		</td>
  </tr>
  <tr>
    <td colspan="5"><img src='<html:rewrite page="/images/back01.gif"/>'></td>
  </tr> 
  <tr height="420">
    <td width="21" background='<html:rewrite page="/images/back02_1.gif"/>'>&nbsp;</td>
    <td width="214" align="left" valign="top"><iframe id="iframe_Left" name="iframe_Left" width="214" height="420" src="${pageContext.request.contextPath}/help/${leftNumber}.jsp" scrolling="auto"></iframe></td>
    <td width="23" background='<html:rewrite page="/images/back02_2.gif"/>'>&nbsp;</td>
    <td width="650" valign="top"><iframe frameborder="0" id="iframe_Main" name="iframe_Main" width="650" height="420" src="${pageContext.request.contextPath}/help/main.jsp" scrolling="auto"></iframe></td>
    <td width="22" background='<html:rewrite page="/images/back02_3.gif"/>'>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><img src='<html:rewrite page="/images/back03.gif"/>'></td>
  </tr>
</table>
</body>
</html>
