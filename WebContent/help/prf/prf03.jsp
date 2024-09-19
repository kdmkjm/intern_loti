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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/prf03.gif"/>' alt="3. 출강관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a> 검색조건의 과정과 날짜를 선택하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다. 해당하는 과정의 교육일자와 관계없는 일자를 입력하였을 검색할 경우에는 일자가 교육시작일로 변경되어 검색된다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 과정을 선택하여 검색했을 때, 해당하는 과정의 교육기간이 나타난다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 선택하려 할 때, 선택을 누르면 전체선택/전체선택해제가 된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘강사지정’ 팝업화면에서 강사를 선택할 수 있다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ 과정을 선택하고 <img src='<html:rewrite page="/images/board/btn_lecture_up2.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 과정을 출강 처리한다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_lecture_status.gif"/>' align="absmiddle"> 버튼을 클릭하면 외래강사 출강현황을 엑셀 파일로 다운로드한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
