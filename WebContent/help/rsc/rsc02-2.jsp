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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc02-2.gif"/>' alt="나. 교재수정"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 수정하려는 교재 정보를 입력한다. 입고수량과 입고일은 초기 등록에만 입력가능하며 이후에 변경하려면 재고이력 화면에서 수정하면 된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 해당 교재와 연결할 과정이 있을 때, <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle"> 버튼을 클릭하면 ③의 ‘과정연결’ 팝업화면이 나타난다. 팝업화면에서 연결하려는 과정을 선택하면 팝업화면이 닫히면서 화면에 해당 과정이 입력된다. 과정과 담당자를 선택하고 나서 반드시 <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' align="absmiddle"> 버튼을 클릭한다. 연결한 과정을 삭제 하려면 <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 된다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 교재를 삭제한다. 삭제 시에는 해당 교재에 연결된 교육과정이 있으면 삭제가 불가함으로, 연결된 교육과정을 먼저 삭제한 후에 교재가 과정과 연결되지 않은 상태에서 삭제하여야 한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교재관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
⑦ <img src='<html:rewrite page="/images/board/btn_up3.gif"/>' align="absmiddle"> 버튼을 클릭하면 현재의 교재 정보를 저장하고 ‘교재관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
