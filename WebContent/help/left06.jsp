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
<script language="javascript"> 
<!-- 
	function viewMenu(which, menuID)
	{ 
		if (which.style.display == 'none')
		{ 
			which.style.display = '';
			
			if(menuID == '01')
					document.all.menu01.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '02')
					document.all.menu02.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '03')
					document.all.menu03.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '04')
					document.all.menu04.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '05')
					document.all.menu05.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '06')
					document.all.menu06.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '07')
					document.all.menu07.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '08')
					document.all.menu08.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
		} 
		else
		{ 
			which.style.display = 'none' 
			
			if(menuID == '01')
				document.all.menu01.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '02')
				document.all.menu02.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '03')
				document.all.menu03.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '04')
				document.all.menu04.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '05')
				document.all.menu05.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '06')
				document.all.menu06.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '07')
				document.all.menu07.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '08')
				document.all.menu08.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
		}
	} 
--> 
</script>
</head>
<body>
<table width="254" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
	<tr>
		<td width="5"></td>
		<td>
			<!--첫번째 메뉴 설정-->
			<a href="#" onclick="viewMenu(menu1outline, '01')"><img id="menu01" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="교육계획"/> <b>교육계획</b></a><br> 
			<span id="menu1outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln01.jsp" 	target="iframe_Main"> <b>교육 수요조사</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln01-1.jsp" target="iframe_Main"> <b>기관별 엑셀업로드</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03.jsp" 	target="iframe_Main"> <b>계획서</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03-1.jsp" target="iframe_Main"> <b>신규등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03-2.jsp" target="iframe_Main"> <b>신규등록 및 수정(사이버)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln04.jsp" 	target="iframe_Main"> <b>계획서확정 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05.jsp" 	target="iframe_Main"> <b>교육과정편성</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05-1.jsp" target="iframe_Main"> <b>신규등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05-2.jsp" target="iframe_Main"> <b>신규등록 및 수정(사이버)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln06.jsp" 	target="iframe_Main"> <b>교육과정검색</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln06-1.jsp" target="iframe_Main"> <b>과정보기</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln07.jsp" 	target="iframe_Main"> <b>월별교육일정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln07-1.jsp" target="iframe_Main"> <b>과정보기</b></a><br>  
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln08.jsp" 	target="iframe_Main"> <b>과정별교육안내</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln08-1.jsp" target="iframe_Main"> <b>과정보기</b></a><br>  
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--두번째 메뉴 설정-->
			<a href="#" onclick="viewMenu(menu2outline, '02')"><img id="menu02" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="과정운영"/> <b>과정운영</b></a><br> 
			<span id="menu2outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"> <b>검색-과정조회 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr02.jsp" target="iframe_Main"> <b>과정조회</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr02-1.jsp" target="iframe_Main"> <b>과정보기</a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>교육시간표</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-1.jsp" target="iframe_Main"> <b>시간표 조회 - 일자별</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-2.jsp" target="iframe_Main"> <b>시간표 등록</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-2-1.jsp" target="iframe_Main"> <b>강사지정 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-3.jsp" target="iframe_Main"> <b>시간표 조회 - 월별</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>교육생 검색</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr07-1.jsp" target="iframe_Main"> <b>검색-교육생조회 (팝업)</b></a><br>
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr07-2.jsp" target="iframe_Main"> <b>교육생 검색</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr11.jsp" 	target="iframe_Main"> <b>이수실적조회</b></a><br>   
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--여섯번째 메뉴 설정-->
			<a href="#" onclick="viewMenu(menu6outline, '06')"><img id="menu06" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="지원관리" style="cursor:hand"/> <b>지원관리</b></a><br> 
			<span id="menu6outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/rsc/rsc07.jsp" 	target="iframe_Main"> <b>개인정보수정</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--일곱번째 메뉴 설정-->
			<a href="#" onclick="viewMenu(menu7outline, '07')"><img id="menu07" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="게시판" style="cursor:hand"/> <b>게시판</b></a><br> 
			<span id="menu7outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board01.jsp"		target="iframe_Main"> <b>Q&A 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board01-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board01-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board02.jsp" 	target="iframe_Main"> <b>자료실 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board02-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board02-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board03.jsp" 	target="iframe_Main"> <b>교육후기 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board03-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board03-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board04.jsp" 	target="iframe_Main"> <b>설문조사 (상시)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board04-1.jsp" target="iframe_Main"> <b>설문 참여하기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/board/board05.jsp" 	target="iframe_Main"> <b>과정요청 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/board/board05-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board05-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
</table>
</body>
</html>
