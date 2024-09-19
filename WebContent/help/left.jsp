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
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln01.jsp" 	target="iframe_Main"> <b>1. 교육 수요조사</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln01-1.jsp" target="iframe_Main"> <b>기관별 엑셀업로드</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln02.jsp" 	target="iframe_Main"> <b>2. 교육 수요조사 접수</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln02-1.jsp" target="iframe_Main"> <b>엑셀 업로드</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03.jsp" 	target="iframe_Main"> <b>3. 계획서</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03-1.jsp" target="iframe_Main"> <b>신규등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03-2.jsp" target="iframe_Main"> <b>신규등록 및 수정(사이버)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln04.jsp" 	target="iframe_Main"> <b>4. 계획서확정 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05.jsp" 	target="iframe_Main"> <b>5. 교육과정편성</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05-1.jsp" target="iframe_Main"> <b>신규등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05-2.jsp" target="iframe_Main"> <b>신규등록 및 수정(사이버)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln06.jsp" 	target="iframe_Main"> <b>6. 교육과정검색</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln06-1.jsp" target="iframe_Main"> <b>과정보기</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln07.jsp" 	target="iframe_Main"> <b>7. 월별교육일정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln07-1.jsp" target="iframe_Main"> <b>과정보기</b></a><br>  
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln08.jsp" 	target="iframe_Main"> <b>8. 과정별교육안내</b></a><br> 
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
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"> <b>1. 검색-과정조회 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr02.jsp" target="iframe_Main"> <b>2. 과정조회</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr02-1.jsp" target="iframe_Main"> <b>과정보기</a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>3. 교육시간표</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-1.jsp" target="iframe_Main"> <b>시간표 조회 - 일자별</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-2.jsp" target="iframe_Main"> <b>시간표 등록</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-2-1.jsp" target="iframe_Main"> <b>1) 강사지정 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-3.jsp" target="iframe_Main"> <b>시간표 조회 - 월별</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr04.jsp" 	target="iframe_Main"> <b>4. 교육선발명단 입력</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr05.jsp" 	target="iframe_Main"> <b>5. 교육 인원 확정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr05-1.jsp" target="iframe_Main"> <b>교육 인원 선발</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr06.jsp" 	target="iframe_Main"> <b>6. 교육생 관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr06-1.jsp" target="iframe_Main"> <b>개인 이력</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>7. 교육생 검색</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr07-1.jsp" target="iframe_Main"> <b>검색-교육생조회 (팝업)</b></a><br>
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr07-2.jsp" target="iframe_Main"> <b>교육생 검색</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr08.jsp" 	target="iframe_Main"> <b>8. 근태관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr08-1.jsp" target="iframe_Main"> <b>근태관리 - 세부</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr09.jsp" 	target="iframe_Main"> <b>9. 이수관리</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr10.jsp" 	target="iframe_Main"> <b>10. 사이버 이수관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr10-1.jsp" target="iframe_Main"> <b>엑셀업로드</b></a><br>
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr10-2.jsp" target="iframe_Main"> <b>엑셀업로드(동명이인)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr11.jsp" 	target="iframe_Main"> <b>11. 이수실적조회</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr12.jsp" 	target="iframe_Main"> <b>12. 사이버 미이수자 제한</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr13.jsp" 	target="iframe_Main"> <b>13. 교육생 명단 수신</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr13-1.jsp" target="iframe_Main"> <b>엑셀 업로드</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr14.jsp" 	target="iframe_Main"> <b>14. 교육인원 확정 및 이수전송</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--세번째 메뉴 설정-->
			<a href="#" onclick="viewMenu(menu3outline, '03')"><img id="menu03" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="강사관리" style="cursor:hand"/> <b>강사관리</b></a><br> 
			<span id="menu3outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf01.jsp"		target="iframe_Main"> <b>1. 검색-과정조회 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf02.jsp" 	target="iframe_Main"> <b>2. 강사정보 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/prf/prf02-1.jsp" target="iframe_Main"> <b>만족도조회</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/prf/prf02-2.jsp" target="iframe_Main"> <b>출강내역조회</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf02-3.jsp" target="iframe_Main"> <b>등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf03.jsp" 	target="iframe_Main"> <b>3. 출강관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf03-1.jsp" target="iframe_Main"> <b>강사지정 (팝업) </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf04.jsp" 	target="iframe_Main"> <b>4. 강사수당 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf05.jsp" 	target="iframe_Main"> <b>5. 강사료 지급기준 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf05-1.jsp" target="iframe_Main"> <b>수정 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/prf/prf06.jsp" 	target="iframe_Main"> <b>6. 강의실적확인 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/prf/prf06-1.jsp" target="iframe_Main"> <b>검색-강사조회 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/prf/prf06-2.jsp" target="iframe_Main"> <b>신규</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf06-3.jsp" target="iframe_Main"> <b>상세</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--네번째 메뉴 설정-->
			<a href="#" onclick="viewMenu(menu4outline, '04')"><img id="menu04" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="교육비" style="cursor:hand"/> <b>교육비</b></a><br> 
			<span id="menu4outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost01.jsp"		target="iframe_Main"> <b>1. 검색-과정조회 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost02.jsp" 	target="iframe_Main"> <b>2. 교육비지출 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost02-1.jsp" target="iframe_Main"> <b>신규</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost02-2.jsp" target="iframe_Main"> <b>수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/cost/cost02-3.jsp" target="iframe_Main"> <b>상세내역</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost03.jsp" 	target="iframe_Main"> <b>3. 교육비등록 (사이버민간)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost03-1.jsp" target="iframe_Main"> <b>신규(사이버민간)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost03-2.jsp" target="iframe_Main"> <b>수정(사이버민간)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/cost/cost03-3.jsp" target="iframe_Main"> <b>상세내역(사이버민간)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost04.jsp" 	target="iframe_Main"> <b>4. 과정별 교육비</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost05.jsp" 	target="iframe_Main"> <b>5. 교육비예산등록</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/cost/cost06.jsp" 	target="iframe_Main"> <b>6. 교육비분할</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--다섯번째 메뉴 설정-->
			<a href="#" onclick="viewMenu(menu5outline, '05')"><img id="menu05" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="평가설문" style="cursor:hand"/> <b>평가설문</b></a><br> 
			<span id="menu5outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/test/test01.jsp"		target="iframe_Main"> <b>1. 검색-과정조회 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/test/test02.jsp" 	target="iframe_Main"> <b>2. 성적관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/test/test02-1.jsp" target="iframe_Main"> <b>분임별점수입력 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test02-2.jsp" target="iframe_Main"> <b>평가점수입력</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/test/test03.jsp" 	target="iframe_Main"> <b>3. 설문지 작성</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/test/test03-1.jsp" target="iframe_Main"> <b>설문 미리보기 (팝업)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test03-2.jsp" target="iframe_Main"> <b>설문등록</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-1.jsp" target="iframe_Main"> <b>설문 등록/수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-2.jsp" target="iframe_Main"> <b>설문형태(단일)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-3.jsp" target="iframe_Main"> <b>설문형태(복수)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-4.jsp" target="iframe_Main"> <b>설문형태(단답)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-5.jsp" target="iframe_Main"> <b>설문형태(장문)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test03-2-6.jsp" target="iframe_Main"> <b>설문형태(강사만족도)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test04.jsp" 	target="iframe_Main"> <b>4. 만족도관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test04-1.jsp" target="iframe_Main"> <b>결과보기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test04-2.jsp" target="iframe_Main"> <b>설문답변 등록 (오프라인)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test04-3.jsp" target="iframe_Main"> <b>설문 참여하기 (팝업)</b></a><br> 
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
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc01.jsp"		target="iframe_Main"> <b>1. 기자재관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc01-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc01-2.jsp" target="iframe_Main"> <b>기자재별 통계</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc02.jsp" 	target="iframe_Main"> <b>2. 교재관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-1.jsp" target="iframe_Main"> <b>교재 등록</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-2.jsp" target="iframe_Main"> <b>교재 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-3.jsp" target="iframe_Main"> <b>교재 입출고 이력</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-4.jsp" target="iframe_Main"> <b>교재 입고</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc02-5.jsp" target="iframe_Main"> <b>교재 출고</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc03.jsp" 	target="iframe_Main"> <b>3. 도서관리</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-1.jsp" target="iframe_Main"> <b>도서 신규</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-2.jsp" target="iframe_Main"> <b>도서 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-3.jsp" target="iframe_Main"> <b>도서 대출 및 반납</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-4.jsp" target="iframe_Main"> <b>도서 대출 현황</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc03-5.jsp" target="iframe_Main"> <b>도서 분류별 통계 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc04.jsp" 	target="iframe_Main"> <b>4. 도서 검색</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>5. 교육장관리</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc05-1.jsp" target="iframe_Main"> <b>교육장 월 사용현황</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc05-2.jsp" target="iframe_Main"> <b>교육장 대여</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>6. 교육장대여신청</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc06-1.jsp" target="iframe_Main"> <b>교육장대여안내 </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc06-2.jsp" target="iframe_Main"> <b>교육장대여현황</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc06-3.jsp" target="iframe_Main"> <b>교육장대여신청</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/rsc/rsc06-3-1.jsp" target="iframe_Main"> <b>수정 및 등록</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc06-3-2.jsp" target="iframe_Main"> <b>상세</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc07.jsp" 	target="iframe_Main"> <b>7. 개인정보수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc08.jsp" 	target="iframe_Main"> <b>8. 담당자초기메뉴</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc09.jsp" 	target="iframe_Main"> <b>9. 증명서인쇄</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc10.jsp" 	target="iframe_Main"> <b>10. SMS/EMAIL발송</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc10-1.jsp" target="iframe_Main"> <b>SMS발송</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc10-2.jsp" target="iframe_Main"> <b>EMAIL발송</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/rsc/rsc11.jsp" 	target="iframe_Main"> <b>11. SMS발송현황</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc11-1.jsp" target="iframe_Main"> <b>SMS발송현황상세</b></a><br> 
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
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board01.jsp"		target="iframe_Main"> <b>1. Q&A 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board01-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board01-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board02.jsp" 	target="iframe_Main"> <b>2. 자료실 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board02-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board02-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board03.jsp" 	target="iframe_Main"> <b>3. 교육후기 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board03-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board03-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board04.jsp" 	target="iframe_Main"> <b>4. 설문조사 (상시)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board04-1.jsp" target="iframe_Main"> <b>설문 참여하기</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/board/board05.jsp" 	target="iframe_Main"> <b>5. 과정요청 게시판</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/board/board05-1.jsp" target="iframe_Main"> <b>신규 등록 및 수정</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board05-2.jsp" target="iframe_Main"> <b>상세 보기</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
</table>
</body>
</html>
