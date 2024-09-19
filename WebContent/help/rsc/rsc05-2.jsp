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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc05-1.gif"/>' alt="나. 교육장 대여"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 연월을 선택하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.  조회되어 나오는 데이터는 해당 연월에 교육장 대여 신청한 내역이다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 해당 교육장 대여에서 <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> 버튼을 클릭하면 ③의 처리상태를 수정할 수 있다. 처리 상태는 신청, 확인, 결제중, 승인, 반려, 신청자 취소로 구분된다. 처리 상태를 수정하고 <img src='<html:rewrite page="/images/board/btn_save2.gif"/>' align="absmiddle"> 버튼을 클릭하면 변경한 내용이 저장되고, <img src='<html:rewrite page="/images/board/btn_cancle.gif"/>' align="absmiddle"> 버튼을 클릭하면 변경한 내용이 취소된다. 해당 신청 내역을 삭제하려면 <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤  <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교육장 관리 - 교육장 월 사용현황’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
