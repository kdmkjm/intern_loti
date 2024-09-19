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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc02-3.gif"/>' alt="다. 교재 입출고 이력"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 해당 교재의 입출고 내역이 나타난다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> 버튼을 클릭하면 입출고시에 등록한 정보를 수정할 수 있다.  입고는 ‘교재관리 - 교재입고’ 팝업화면을 오픈하고, 출고는 ‘교재관리 - 교재출고’ 팝업화면을 오픈한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 도서의 입출고 이력을 엑셀 파일로 다운로드한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘교재 관리’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
