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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/edu_pln01.gif"/>' alt="1. 교육 수요조사"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 연도, 분류, 기관명을 선택하고 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> 버튼을 클릭하면 ③번 영역에 해당하는 과정의 데이터가 보인다. <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당하는 과정이 삭제된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 신규과정을 등록하거나 등록된 과정을 수정할 때, 데이터를 입력/수정하고 <img src='<html:rewrite page="/images/board/btn_save3.gif"/>' align="absmiddle"> 버튼을 클릭한다. <img src='<html:rewrite page="/images/board/btn_cancle3.gif"/>' align="absmiddle"> 버튼을 클릭하면 신규과정등록 또는 과정수정 작업을 취소한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_import.gif"/>' align="absmiddle"> 버튼을 클릭하면 전년도의 자료를 가져온다. 이때 등록되어 있는 현재년도의 자료는 모두 삭제된다. (현재가 2010년일 때, 2009년의 자료를 가져옴. 이때 2010년의 자료는 모두 삭제된다.)
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 교육 수요조사 데이터를 엑셀 파일로 다운로드한다.  이때 ①에서 기관명을 전체로 선택하면 현재화면의 표시형식으로 다운되고, 전체가 아닌 각각의 기관명을 선택하면 해당 기관의 엑셀업로드의 양식에 맞도록 다운된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_excelup2.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교육 수요조사 - 기관별 엑셀업로드’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑦ <img src='<html:rewrite page="/images/board/btn_ending.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 연도의 교육 수요조사 접수를 마감하여, 수요조사 화면에서 데이터를 더 이상 입력할 수 없도록 한다. 집계마감 상태에는 <img src='<html:rewrite page="/images/board/btn_ending2.gif"/>' align="absmiddle"> 버튼을 클릭하면 수요조사 화면에서 데이터를 입력할 수 있게 된다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑧ <img src='<html:rewrite page="/images/board/btn_print6.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 검색조건의 교육 수요조사 집계표를 인쇄한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
<b>※ 수요인원은 시,구.군 교육담당자가 “교육 수요조사 접수”화면에서 입력한 자료임.</b>
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
