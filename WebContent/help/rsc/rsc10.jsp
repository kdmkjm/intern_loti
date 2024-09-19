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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc10.gif"/>' alt="10. SMS/EMAIL 발송"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 강사검색, 과정검색에서 검색하려는 조건을 선택한다.  강사검색을 선택하면 등록되어있는 강사를 선택할 수 있으며, 과정검색을 선택하면 해당과정에 등록된 교육생 목록이 나타난다. 검색 조건을 입력하고 <img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 검색조건에 맞는 강사 및 교육생 명단이 조회된다. 조회된 목록 중 SMS, EMAIL을 필요로 하는 사용자를 선택한다. 사용자를 선택하고 ③의 <img src='<html:rewrite page="/images/board/btn_s_add2.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 사용자를 발송목록에 추가한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ SMS, EMAIL을 발송하고자 사용자 목록이 나타난다. 발송목록 중에서 삭제하고자 하는 사용자가 있다면, 삭제하려는 사용자를 선택하고 ⑤의 <img src='<html:rewrite page="/images/board/btn_s_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 선택한 사용자를 발송목록에서 삭제한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_sms.gif"/>' align="absmiddle"> 버튼을 클릭하면 발송목록에 등록된 사용자에게 SMS를 보내는 ‘SMS발송' 팝업화면을 연다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑦ <img src='<html:rewrite page="/images/board/btn_email.gif"/>' align="absmiddle"> 버튼을 클릭하면 발송목록에 등록된 사용자에게 EMAIL을 보내는 ‘EMAIL발송’ 팝업화면을 연다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
