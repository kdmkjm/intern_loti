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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/crs_opr03-2.gif"/>' alt="나. 교육시간표 등록"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① <a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"><b>“1. 검색부분 과정조회 (팝업화면)” 을 참조한다.</b></a> 과정과 날짜를 선택한 후에 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다. 해당하는 과정의 교육일자와 관계없는 일자를 입력하였을 검색할 경우에는 일자가 교육시작일로 변경되어 검색된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 과정을 선택하여 검색했을 때, 해당하는 과정의 교육기간이 나타난다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 교과목을 신규로 추가하려 할 때, <img src='<html:rewrite page="/images/board/btn_plus.gif"/>' align="absmiddle"> 버튼을 클릭하면 ③영역이 ④처럼 변경된다. 여기서 새로운 교과목을 입력하고 <img src='<html:rewrite page="/images/board/btn_save3.gif"/>' align="absmiddle"> 버튼을 클릭하면 된다. <img src='<html:rewrite page="/images/board/btn_minus.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당하는 과목이 삭제된다. <img src='<html:rewrite page="/images/board/btn_cancle3.gif"/>' align="absmiddle"> 버튼을 클릭하면 과목을 신규로 추가하려던 작업을 취소하고 원래 상태로 되돌린다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘강사지정’ 팝업화면에서 강사를 선택할 수 있으며,  소속이나 강사가 수정작업이 필요한 경우 수정할 수 있다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당하는 시간표를 삭제한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑦ 해당하는 과정의 교육기간 범위 안의 날짜를 선택하여 <img src='<html:rewrite page="/images/board/btn_timecopy.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재의 화면에 등록된 시간표를 선택한 날짜로 복사한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑧ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교육시간표 조회 - 일자별’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑨ <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 시간표 등록을 위해 입력한 데이터를 저장한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
