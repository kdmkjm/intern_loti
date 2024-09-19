<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
	<!--
	
	window.onload = function ()
	{
		var msg = '';
		if('${checkdup}' == 'Y')
		{
			opener.document.forms[0].checkdup.value = "pass";
			msg = '사용할 수 있는 과목코드입니다.';
		}
		else
		{
			opener.document.forms[0].checkdup.value = "dup";
			msg = '이미 존재하는 과목코드입니다.';
		}
		alert(msg);
		window.close();
	}
  
//-->
</script>

