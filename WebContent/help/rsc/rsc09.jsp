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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc09.gif"/>' alt="9. 증명서 인쇄"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a>
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 검색조건에 맞는 과정의 교육생 명단이 조회된다. 조회된 목록 중 증명서를 필요로 하는 교육생을 선택한다. 선택하려 할 때, 선택을 누르면 전체선택/전체선택해제가 된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 교육생을 선택하고 <img src='<html:rewrite page="/images/board/btn_print3.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 교육생의 이수증을 인쇄한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 교육생을 선택하고 <img src='<html:rewrite page="/images/board/btn_print4.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 교육생의 교육이수확인서를 인쇄한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ 교육생을 선택하고 <img src='<html:rewrite page="/images/board/btn_print5.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 교육생의 교육훈련증명원을  인쇄한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
