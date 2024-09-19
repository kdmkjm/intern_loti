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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/test02.gif"/>' alt="2. 성적관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a> 검색조건의 과정과 정렬기준을 선택하고 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 검색한 해당 과정을 수강하는 교육생의 성적 정보가 조회된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ <img src='<html:rewrite page="/images/board/btn_up5.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘성적관리 - 분임별 점수 입력’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_input.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘성적관리 - 평가 점수 입력’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ 분임별 점수와 평가 점수 입력을 마치고, <img src='<html:rewrite page="/images/board/btn_level.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 과정의 교육생의 석차를 계산한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_print7.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 과정의 성적일람표를 인쇄한다.  성적일람표는 정렬기준에 따라서 교번순, 석차순의 성적일람표를 인쇄할 수 있다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
