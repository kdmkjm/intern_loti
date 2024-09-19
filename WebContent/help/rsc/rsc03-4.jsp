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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc03-4.gif"/>' alt="라. 도서 대출 현황"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 해당 도서의 대출구분과 대여기간 FROM, TO를 선택하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 해당 검색조건의 도서 대출 현황이 조회된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘도서 관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
