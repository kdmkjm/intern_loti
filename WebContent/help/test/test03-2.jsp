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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/test03-2.gif"/>' alt="나. 설문등록"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 새로운 설문을 작성하기 위해 제목, 설문종류, 설문기간, 설문개요, 설문문항수를 입력한다. 설문종류에 따라서 일반설문과 강의 과정을 연결하여 만족도 조사를 할 수 있는 강의 설문으로 구분된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 새로운 설문을 작성하기 위해 제목, 설문종류, 설문기간, 설문개요, 설문문항수를 입력하고 <img src='<html:rewrite page="/images/board/btn_make_poll.gif"/>' align="absmiddle"> 버튼을 클릭하면 입력한 문항 수 만큼의 질문을 생성한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 설문을 작성하는 중에 <img src='<html:rewrite page="/images/board/btn_poll_view2.gif"/>' align="absmiddle"> 버튼을 클릭하면 실제 화면에 보이는 내용을 ‘설문 미리보기’ 팝업화면으로 확인할 수 있다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘설문지 작성’ 목록 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재 작성한 설문을 저장하고 ‘설문지 작성’ 목록 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
