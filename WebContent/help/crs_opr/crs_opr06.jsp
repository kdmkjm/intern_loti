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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr06.gif"/>' alt="6. 교육생 관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a>
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 해당하는 교육생의 성명을 클릭하면 교육생 관리 - 개인이력 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 과정에 수강료가 무료인 교육생이 있다면, 해당하는 교육생의 무료를 체크하고 ⑬의 <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 자치회장을 지정하려면, 해당하는 교육생의 자치회장을 체크하고 ⑬의 <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ 분임조를 지정하려면, 교육생 별로 분임조를 선택하고 ⑬의 <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ 과정에 현재 화면의 순서와 다르게 교번을 생성하려면,  해당하는 교육생의 <img src='<html:rewrite page="/images/board/up.gif"/>' height="15" align="absmiddle"> 버튼을 클릭하여 교육생의 순서를 위로 올리거나,  해당하는 교육생의 <img src='<html:rewrite page="/images/board/dawn.gif"/>' height="15" align="absmiddle"> 버튼을 클릭하여 교육생의 순서를 아래로 내릴 수 있다.  그리고 ⑦의 <img src='<html:rewrite page="/images/board/btn_num.gif"/>' align="absmiddle"> 버튼을 클릭하여 새로운 교번을 생성한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑦ <img src='<html:rewrite page="/images/board/btn_num.gif"/>' align="absmiddle"> 버튼을 클릭하면 과정에 현재화면 나타난 순서대로 교번을 생성한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑧ <img src='<html:rewrite page="/images/board/btn_listdawn.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 교육생 명단을 엑셀 파일로 다운로드한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑨ <img src='<html:rewrite page="/images/board/btn_name_print2.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 명찰을 인쇄한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑩ <img src='<html:rewrite page="/images/board/btn_name_print3.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 분임조를 인쇄한다.  
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑪ <img src='<html:rewrite page="/images/board/btn_name_print4.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 출석부를 인쇄한다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑫ <img src='<html:rewrite page="/images/board/btn_name_print5.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 학적부를 인쇄한다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑬ <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 화면의 데이터를 저장한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
