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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc10-2.gif"/>' alt="나. EMAIL발송"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 직접입력의 경우 받는 사람 및 참조에 EMAIL 주소를 입력하고 한다.  EMAIL 발송 및 강사관리 EMAIL의 경우 선택한 사용자의 정보가 받는 사람 및 참조에 표시된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 발송하고자하는 EMAIL의 제목을 입력하고, 첨부 파일이 있을 시에는 찾아보기를 클릭 하여 첨부하려는 파일을 선택한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 발송하려는 EMAIL의 문구를 입력한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_email.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 사용자에게 입력한 EMAIL을 발송한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
