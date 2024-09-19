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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc01.gif"/>' alt="1. 기자재관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 종류를 선택하거나 제품명을 입력하여 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 검색조건에 해당하는 기자재가 검색되며, 제품명을 클릭하면 해당 기자재의 정보를 수정할 수 있는 ‘기자재 관리 - 신규 등록 및 수정’ 화면으로 이동한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle"> 버튼을 클릭하면 해당 기자재를 삭제한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_sum3.gif"/>' align="absmiddle"> 버튼을 클릭하면 기자재의 종류별 통계를 볼 수 있는 ‘기자재별 통계’ 화면으로 이동한다.  
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_up2.gif"/>' align="absmiddle"> 버튼을 클릭하면 신규 기자재를 등록할 수 있는 ‘기자재 관리 - 신규 등록 및 수정’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
