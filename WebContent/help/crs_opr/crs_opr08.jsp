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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr08.gif"/>' alt="8. 근태관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a> 검색조건의 과정, 날짜를 선택하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다. 해당하는 과정의 교육일자와 관계없는 일자를 입력하였을 검색할 경우에는 일자가 교육시작일로 변경되어 검색된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 과정을 선택하여 검색했을 때, 해당하는 과정의 교육기간이 나타난다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 출결상태를 선택한다. 출결을 선택하면 전체선택/선택해제를 할 수 있으며,  기본적으로 선택한 교육생은 출석을 의미하고 선택하지 않은 교육생은 결석(무단)을 의미한다. 선택 후에 <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 변경된 정보가 저장된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 해당하는 교육생의 출결 상태가 나타난다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ 해당하는 교육생의 <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> 버튼을 클릭하면 근태관리-세부 화면으로 이동한다. 세부화면에서는 해당 교육생의 출결상태와 감점점수를 입력할 수 있다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 화면의 교육생 출결 여부를 저장한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
