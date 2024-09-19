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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr07-1.gif"/>' alt="가. 검색부분 교육생조회 (팝업화면)"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색하려는 교육생의 성명이나 소속을 입력하고 엔터키를 누르거나 <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle"> 버튼을 클릭한다. 만약에 검색된 결과가 한 건일 경우에는 자동으로 화면에 성명과 소속이 입력되고 ‘사용자 검색’ 팝업화면이 닫힌다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 검색 결과가 여러 건일 경우에는 ④와 같은 팝업화면이 나타난다. ⑤의 이름이나 소속을 입력하여 <img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당하는 교육생이 검색된다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ 해당하는 사용자의 이름을 클릭하게 되면 팝업화면이 닫히면서 선택한 사용자가 검색화면에 입력된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑧ 마지막으로 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭하여 해당하는 교육생의 데이터를 검색한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
