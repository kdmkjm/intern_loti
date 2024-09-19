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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr09.gif"/>' alt="9. 이수관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a> 검색조건의 과정, 이수여부, 정렬순서를 선택하고 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 이수하려는 교육생은 선택하고, 미이수자하려는 교육생은 선택하지 않은 상태로 ④의 <img src='<html:rewrite page="/images/board/btn_completion2.gif"/>' align="absmiddle"> 버튼을 클릭한다. 선택을 클릭하면 전체선택/선택해제를 할 수 있다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 해당하는 교육생의 이수/미이수 여부가 나타난다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_completion2.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 화면에서 선택한 교육생을 이수 처리하고, 선택하지 않은 교육생은 미이수 처리한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_print3.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 교육생의 이수증을 인쇄한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_print4.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 교육생의 교육이수 확인서를 인쇄한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
