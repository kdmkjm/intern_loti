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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr10-2.gif"/>' alt="나. 사이버 이수관리 - 엑셀업로드(동명이인이 있을 때)"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 사이버 이수 정보가 담긴 엑셀 파일에서 해당하는 과정에 동명이인(이름, 주민번호 앞 6자리 + 1자리가 같은 경우)이 있을 경우, ①에 중복된 교육생 목록이 보인다. 이 때 사용자가 해당하는 교육생의 교번을 직접 입력해주어야 한다. 정상적인 교번을 입력하고 <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 화면의 데이터를 저장한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
