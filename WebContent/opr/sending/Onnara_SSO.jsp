<%@page contentType="text/html;charset=euc-kr" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/include/jsp_common_inc.jspf" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<script language='javascript'>
	//var naraIp = naraIp = '10.182.15.22';  //온나라 테스트 서버 설정	
	var naraIp = '107.0.111.101';         //온나라 본 서버 설정
	var URL = '';
	URL = 'http://'+ naraIp + '/bms/com/SSOToken.do?L1=<%=request.getAttribute("sEncrypt")%>';
	URL = URL + '&PATH=http://<%=request.getLocalAddr()%>${pageContext.request.contextPath}/recToken.act?num=<%=request.getAttribute("num")%>';
  document.location.href = URL;
</script>
</head>
<body>
	<table border="0">
		<tr>
			<td><img src="<html:rewrite page="/images/loading.gif"/>" width="250" height="125"/></td>
		</tr>
	</table>
</body>
</html>

