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
<script type="text/javascript">

</script>
</head>
<body>
<table width="630" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc10-1.gif"/>' alt="가. SMS발송"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 직접입력의 경우 수신자의 전화번호를 입력하고 <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' align="absmiddle"> 버튼을 클릭하여 발송하고자 하는 사용자를 추가한다. <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 발송하고자 하는 사용자를 삭제한다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② SMS발송 및 강사관리 SMS의 경우 선택한 사용자의 정보가 발송목록에 표시된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ SMS을 발송하려는 문구를 입력한다. (80 Byte - 한글 40자, 영문 80자)
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_sms.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 사용자에게 입력한 SMS를 발송한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
