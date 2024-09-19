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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/edu_pln05.gif"/>' alt="5. 교육과정편성"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 연도, 분류를 선택하거나 과정명을 입력해서 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당하는 과정을 수정하는 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ <img src='<html:rewrite page="/images/board/btn_send2.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택된 과정들의 데이터를 인사행정 인사랑 시스템으로 전송한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 교육과정을 엑셀 파일로 다운로드한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_new_up.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘집합과정 신규 등록’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_new_cyberup.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘사이버과정 신규 등록’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
<b> ※ "계획서확정" 처리시 계획서DB가 과정편성DB로 복사된다. </b>
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
