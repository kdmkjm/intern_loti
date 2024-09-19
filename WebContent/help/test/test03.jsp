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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/test03.gif"/>' alt="3. 설문지 작성"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 연도를 선택하거나 설문제목을 입력하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 검색조건에 맞는 설문 데이터가 조회된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 해당 설문의 <img src='<html:rewrite page="/images/board/btn_s_view.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 설문 내용을 ‘설문 미리보기’ 팝업화면으로 확인한다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ 해당 설문의 <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 설문 내용을 수정하는 ‘설문지 작성 - 새 설문 등록’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ 해당 설문의 <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 설문을 삭제한다. 이 때 해당 설문에 등록되어 있는 답변도 같이 삭제된다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑥ 새로운 설문을 작성하고자 하는 경우 <img src='<html:rewrite page="/images/board/btn_poll_up.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘설문지 작성 - 새 설문 등록’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
