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
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/rsc03.gif"/>' alt="3. 도서관리"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
① 검색조건의 검색하려는 도서의 정보를 입력하고 <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> 버튼을 클릭한다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
② 해당 검색조건으로 조회된 데이터가 나타난다. 도서명을 클릭하면 해당 도서의 정보를 수정할 수 있는 ‘도서 관리 - 신규 등록 및 수정’ 화면으로 이동한다. 
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
③ 도서를 대출할 때, 대출하려는 도서를 선택하고 <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle"> 버튼을 클릭하여 대출자를 선택한다. 추가로 대출자의 소속과 연락처를 입력하고 <img src='<html:rewrite page="/images/board/btn_borrow.gif"/>' align="absmiddle"> 버튼을 클릭하여 도서를 대출한다. 도서를 반납할 때, 반납하려는 도서를 선택하고 <img src='<html:rewrite page="/images/board/btn_return.gif"/>' align="absmiddle"> 버튼을 클릭하여 도서를 반납한다. <img src='<html:rewrite page="/images/board/btn_reset.gif"/>' align="absmiddle"> 버튼을 클릭하면 대출자, 소속, 연락처 입력란의 입력한 데이터를 지운다.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
④ <img src='<html:rewrite page="/images/board/btn_book_search.gif"/>' align="absmiddle"> 버튼을 클릭하면 도서 대출 현황을 볼 수 있는 ‘도서 대출 현황’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑤ <img src='<html:rewrite page="/images/board/btn_book_sum.gif"/>' align="absmiddle"> 버튼을 클릭하면 분류별 도서통계를 볼 수 있는 ‘도서 분류별 통계’ 화면으로 이동한다.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
⑥ <img src='<html:rewrite page="/images/board/btn_book_up2.gif"/>' align="absmiddle"> 버튼을 클릭하면 ‘도서 관리 - 신규 등록 및 수정’ 화면으로 이동한다. 
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
