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
			msg = '����� �� �ִ� �����ڵ��Դϴ�.';
		}
		else
		{
			opener.document.forms[0].checkdup.value = "dup";
			msg = '�̹� �����ϴ� �����ڵ��Դϴ�.';
		}
		alert(msg);
		window.close();
	}
  
//-->
</script>

