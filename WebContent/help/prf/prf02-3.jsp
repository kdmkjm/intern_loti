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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/prf02-3.gif"/>' alt="다. 강사정보 - 등록 및 수정"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 학력의 연도, 학교명, 전공, 학위를 입력하고 <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' align="absmiddle"> 버튼을 클릭한다.  <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 입력한 학력 정보는 삭제된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 경력의 기간, 기관명, 직위를 입력하고 <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' align="absmiddle"> 버튼을 클릭한다.  <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 입력한 경력 정보는 삭제된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 주요논저를 입력하고 <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' align="absmiddle"> 버튼을 클릭한다.  <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 입력한 주요논저 정보는 삭제된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 찾아보기를 클릭해서 해당하는 강사의 강의소개서 파일을 등록한다. 해당하는 파일을 삭제할 때는 삭제를 선택하고 <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ 등록일에는 해당 강사를 최초에 등록한 날짜가 보이며,  갱신/재등록일에는 <img src='<html:rewrite page="/images/board/btn_renewal.gif"/>' align="absmiddle"> 버튼을 클릭하여 갱신한 날짜가 보인다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_renewal.gif"/>' align="absmiddle"> 버튼을 클릭하면 갱신/재등록을 현재 날짜로 갱신한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑦ <img src='<html:rewrite page="/images/board/btn_info_del.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 강사의 이름만 남겨두고 다른 정보는 삭제한다.  개인정보를 삭제한 강사를 검색하려할 때는 ‘강사정보’ 화면의 검색조건에서 2년초과를 선택하고 검색하면 된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑧ <img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당하는 강사를 삭제하고 ‘강사정보’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑨ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘강사정보’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑩ <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 입력한 강사 정보를 저장하고 ‘강사정보’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
