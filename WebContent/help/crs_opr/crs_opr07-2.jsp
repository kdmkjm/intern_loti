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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr07-2.gif"/>' alt="나. 교육생 검색"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr07-1.jsp" target="iframe_Main"><b>“가. 검색부분 교육생조회 (팝업화면)” 을 참조한다.</b></a>
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 해당 강의에 대한 이수, 미이수, 수강중의 이수여부 상태를 보여준다. 해당 강의에 관한 인쇄는 강의를 이수한 경우에만 할 수 있으며, 미이수했거나 수강중인 상태에는 해당 과정에 관한 인쇄를 할 수 없다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 이수증의 <img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle"> 버튼을 클릭하여 이수증을 인쇄한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④  교육이수확인서의 <img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle"> 버튼을 클릭하여 교육이수확인서를 인쇄한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ 교육훈련증명원의 <img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle"> 버튼을 클릭하여 교육훈련증명원을 인쇄한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
