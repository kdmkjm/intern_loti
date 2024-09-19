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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr10-1.gif"/>' alt="가. 사이버 이수관리 - 엑셀업로드"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① ‘사이버 이수관리’ 화면에서 선택한 과정이 화면에 보이며, 사이버 이수 정보가 담긴 파일을 선택한다. <img src='<html:rewrite page="/images/board/btn_dawnload.gif"/>' align="absmiddle"> 버튼을 클릭하면 입력 양식 파일을 다운로드 한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘사이버 이수관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 사이버 이수 정보가 담긴 파일이 정상적으로 등록되었으면 '저장이 완려되었습니다.' 메시지가 나타나며, 확인을 누르면 ‘사이버 이수관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 해당 과정의 교육생 인원과 엑셀 파일의 교육생 인원이 동일할 때 등록할 수 있으며,  사이버 이수 정보가 담긴 파일의 교육생 인원과 해당 과정에 등록되어 있는 교육생 인원과 차이가 날 때, '과정 수강생 숫자와 엑셀에 등록된 숫자가 맞지 않습니다.' 메시지가 나타난다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
