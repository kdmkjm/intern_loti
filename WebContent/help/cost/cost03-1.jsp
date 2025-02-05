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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/cost03-1.gif"/>' alt="가. 교육비등록 - 신규(사이버민간)"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 신규로 사이버 교육비 계산을 작성하는 경우, 신규로 생성될 회차가 보인다.  시작 및 종료 기준년월 검색조건을 선택하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 교육비 계산 후에 처리되어지는 연월을 선택한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 검색조건에 맞는 과정내역 정보가 조회된다. 처리년월에 계산되어지고자 하는 과정을 선택항목을 체크하고 합계의 적용인원 대비 교육금액을 입력하여 인원비율에 따른 금액비율을 각 선택한 과정별 단가 및 교육비에 적용한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교육비 관리(사이버 민간)’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_price.gif"/>' align="absmiddle"> 버튼을 클릭하면 입력한 교육비 인원대비 교육금액을 인원비율에 따라서  금액비율을 계산 한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 사이버 교육비 계산 내용을 저장하고 ‘교육비 관리(사이버 민간)’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
