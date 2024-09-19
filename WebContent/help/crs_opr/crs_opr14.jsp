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
<table width="630" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr14.gif"/>' alt="14. 교육인원 확정 및 이수전송"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 기간From, 기간To, 분류를 선택하고 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 선택하려 할 때, 선택을 누르면 전체선택/전체선택해제가 된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 해당하는 과정의 확정명단을 전송한 일자를 보여준다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 해당하는 과정의 이수명단을 전송한 일자를 보여준다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ 해당하는 과정의 이수처리 여부를 보여준다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_send3.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 과정을 인사랑 인사행정으로 확정명단을 전송한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑦ <img src='<html:rewrite page="/images/board/btn_completion_send.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 과정을 인사랑 인사행정으로 이수명단을 전송한다.
		</td>
	</tr>
</table>
</body>
</html>
