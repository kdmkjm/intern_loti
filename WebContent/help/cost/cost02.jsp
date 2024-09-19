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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/cost02.gif"/>' alt="2. 교육비지출"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 연도를 선택하고 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭하여 해당 연도의 교육비 계산 내역을 조회한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 검색조건에 맞는 교육비 계산 내역 정보가 조회된다.  처리년월을 클릭시 해당하는 교육비 내역화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 해당 처리년월 회차에 대하여 교육비 수정이 필요할 때, <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> 버튼을 클릭하여 ‘교육비 관리 - 수정’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 해당 처리년월 회차에 대하여 교육비 삭제가 필요할 때, <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하여 교육비 계산내역을 삭제한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ 신규 교육비 계산이 필요한 경우 <img src='<html:rewrite page="/images/board/btn_new.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교육비 계산 - 신규’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_price3.gif"/>' align="absmiddle"> 버튼을 클릭하면 월별경비 지급내역을 엑셀 파일로 다운로드 한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑦ 출력하고자 하는 교육비 계산 내역을 선택하고 <img src='<html:rewrite page="/images/board/btn_price_print.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 교육비 내역을 인쇄한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
