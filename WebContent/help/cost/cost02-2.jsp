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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/cost02-2.gif"/>' alt="나. 교육비지출 - 수정"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 교육비 계산을 수정 하려는 경우, 해당 교육비 계산 내역의 회차가 보이고 검색조건에서 기준년월 FROM, TO를 선택하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 이미 처리된 처리년월을 보여준다. 경비처리년월은 변경할 수 없다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 선택한 검색조건의 과정이 나타난다. 이미 경비처리 연월로 계산되어있는 과정은 선택되어 있으며, 계산하려는 과정을 선택하고 교육안내, 공통교재, 부교재, 출제수당을 수정한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교육비 관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 교육비를 입력하고 선택한 과정을 저장한다. 정상적으로 저장되면 ‘교육비 관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
