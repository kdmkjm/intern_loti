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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/test04a.gif"/>' alt="4. 만족도관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a>
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 교육생이 강의 설문을 등록하려면 해당 강의와 해당 설문이 연결되어 있어야 한다. <img src='<html:rewrite page="/images/board/btn_s_select.gif"/>' align="absmiddle"> 버튼 클릭하면 ③과 같은 ‘설문지 연결’ 팝업 화면이 열린다. 여기서 해당하는 설문을 선택하여 해당 설문과 연결한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 설문을 강의와 연결하는 팝업화면이다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 설문명을 클릭하여 강의와 연결한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_close.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재의 ‘설문지 연결’ 팝업화면을 닫는다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
	<tr>
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/test04b.gif"/>' alt="4. 만족도관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a>
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 해당 강의와 연결된 설문에 대한 정보를 보여준다. 설문정보에는 설문대상자(교육생수), 응답자, 참여율, 만족도(강의만족도), 강사만족도가 있으며 만족도와 강사만족도는 해당하는 교육생들에 설문 응답의 평균점수다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ <img src='<html:rewrite page="/images/board/btn_result.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 설문의 ‘설문 결과’ 화면으로 이동한다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 설문의 결과를 엑셀 파일로 다운로드 한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_poll_reply.gif"/>' align="absmiddle"> 버튼을 클릭하면 온라인으로 설문 응답을 할 수 없는 과정을 고려하여 오프라인으로 등록할 수 있는 ‘설문답변 등록(오프라인)’ 화면으로 이동한다. 
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
