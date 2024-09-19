<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style type="text/css">
*{margin:0; padding:0;}
body, input, textarea, select, button{color:#5E5E5E; font-family: dotum,"돋움",NanumGothic; font-size: 12px; letter-spacing: 0px; line-height: 120%; margin:10px 10px;}
img{border:0;}
li, dd {list-style: none outside none;}
h2 {background: url(/images/resources/hIconBg.png) no-repeat scroll left 8px transparent; color: #00639A; font-size: 14px; padding: 10px 0 10px 20px; margin-top:20px; font-weight:bold;}
h3 {background: url(/images/resources/hIconBg.png) no-repeat scroll 0 -51px transparent; color: #0C88A1; font-size: 13px; line-height: 140%; margin: 0 0 0 8px; padding: 0 0 5px 18px; font-weight:bold;}
h4 {background: url(/images/resources/hIconBg.png) no-repeat scroll 8px -99px transparent; color: #666666; font-size: 12px; line-height: 140%; margin:5px 0 10px 25px; padding: 0 0 5px 20px; font-weight:bold;}
.ico001h5 li {background: url(/images/resources/liImg.gif) no-repeat scroll 0 3px transparent; line-height: 17px; margin-left: 20px; padding-left: 15px;}
ul.con_tab{border: 1px solid #B2CFE1; height: 15px; padding: 10px; width: 688px;}
ul.con_tab li {background: url(/images/resources/icodot.gif) no-repeat scroll left 5px transparent; float: left; height: 20px; padding: 0 15px 0 8px;}
a:link{color:#666; text-decoration:none;}
a:hover{color:#0030AE; text-decoration:underline;}
.top_mar10 {margin-top: 10px;}
</style>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
		tresize(185);
	}
	
	function viewintro(id){
		for(var i=1; i<9; i++){
			document.getElementById('ta0'+i).style.display = "none";
		}
		document.getElementById('ta0'+id).style.display="block";
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="시설현황" src="/images/resources/title_13.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td height="38" width="550" valign="bottom">
		<ul class="con_tab">
	<li><a href="#" onclick="viewintro(1);return false;">공무원교육관 </a></li>
	<li><a href="#" onclick="viewintro(2);return false;">도민교육관</a></li>
    <li><a href="#" onclick="viewintro(3);return false;">생활관</a></li>
    <li><a href="#" onclick="viewintro(4);return false;">운동장</a></li>
    <li><a href="#" onclick="viewintro(5);return false;">주차장</a></li>
    <li><a href="#" onclick="viewintro(6);return false;">식당</a></li>
    <li><a href="#" onclick="viewintro(7);return false;">의무실</a></li>
    <li><a href="#" onclick="viewintro(8);return false;">도서관</a></li>
</ul>


<div id="ta01">
<h2 class="top_mar20">공무원교육관</h2>
<h3 class="top_mar10">대강당</h3>
<ul class="ico001h5">
	<li>형태 : 1층 극장식( 200석 )</li>
</ul>
<p class="center top_mar10"><img alt="대강당 " src="/images/resources/photo01.gif"></p>
<h3 class="top_mar10">강의실</h3>
<ul class="ico001h5">
	<li>제 2강의실 : 80∼90명, -제 3강의실 : 40∼50명, -제 4강의실 : 40∼50명,</li>
	<li>제 5강의실 : 40∼50명, -제 6강의실 : 30명, -제 7강의실 : 50명</li>
</ul>
<p class="center top_mar10"><img alt="강의실" src="/images/resources/photo02.gif"></p>
<h3 class="top_mar10">정보화교육장</h3> 
<ul class="ico001h5">
	<li>제 1,2 전산교육장 (각50명) </li>
</ul>
<p class="center top_mar10"><img alt="정보화교육장" src="/images/resources/photo03.gif"></p>

</div>

<div id="ta02" style="display:none;">
<h2 class="top_mar20">도민교육관</h2>
<h3 class="top_mar10">대강당</h3>
<ul class="ico001h5">
	<li>형태 : 1층 극장식(210석)</li>
</ul>
<p class="center top_mar10"><img alt="대강당" src="/images/resources/photo04.gif"></p>
<h3 class="top_mar10">강의실</h3>
<ul class="ico001h5">
	<li>제 1강의실 : 80명, -제 2강의실 : 40명</li>
</ul>
<p class="center top_mar10"><img alt="강의실" src="/images/resources/photo05.gif"></p>
</div>
<div id="ta03" style="display:none;">
<h2 class="top_mar20">생활관</h2>
<h3 class="top_mar10">공무원생활관</h3>
<ul class="ico001h5">
	<li>규모 : 100실 200명 수용 (3층)</li>
	<li>실구조 : 2인 1실, 싱글침대 2조, 냉난방 및 온수</li>
	<li>부대시설 : 휴게실, 세탁실, 사이버탐험실(PC방), 체력단련실</li>
</ul>
<h4>내실 </h4>
<p class="center top_mar10"><img alt="내실" src="/images/resources/photo06.gif"></p>
<h4>사이버 탐험실</h4>
<p class="center top_mar10"><img alt="사이버 탐험실" src="/images/resources/photo07.gif"></p>
<h4>체력단련실 </h4>
<p class="center top_mar10"><img alt="체력단련실 " src="/images/resources/photo08.gif"></p>
<h3 class="top_mar10">도민생활관</h3>
<ul class="ico001h5">
	<li>규모 : 25실 100명 수용 (3층)</li>
	<li>실구조 : 4인 1실, 싱글침대 4개, 냉난방 및 온수 </li>
	<li>부대시설 : 휴게실, 탁구대, 사이버탐험실(PC방)등</li>
</ul>
<h4>내실 </h4>
<p class="center top_mar10"><img alt="내실 " src="/images/resources/photo09.gif"></p>
</div>
<div id="ta04" style="display:none;">
<h2 class="top_mar20">운동장</h2>
<ul class="ico001h5">
	<li>규모 : 5.115㎡ (1,547 평) / 공인 규격운동장은 아님(용도 : 축구 외 유사경기)</li>
</ul>
<p class="center top_mar10"><img alt="운동장 " src="/images/resources/photo10.gif"></p>
</div>
<div id="ta05" style="display:none;">
<h2 class="top_mar20">주차장</h2>
<ul class="ico001h5">
		<li>생활관 뒷편</li>
	</ul>
<p class="center top_mar10"><img alt="주차장 " src="/images/resources/photo11.gif"></p>
</div>
<div id="ta06" style="display:none;">
<h2 class="top_mar20">식당</h2>
<ul class="ico001h5">
		<li>규모 : 795.6 ㎡ / 수용 : 200명</li>
	</ul>
<p class="center top_mar10"><img alt="식당 " src="/images/resources/photo12.gif"></p>
</div>
<div id="ta07" style="display:none;">
<h2 class="top_mar20">의무실</h2>
<ul class="ico001h5">
			<li>위치 : 공무원 교육관 1층</li>
			<li>규모 : 병상 2개 </li>
			<li>약품 : 40여 품목</li>
			<li>간호사 상주  </li>
	</ul>
<p class="center top_mar10"><img alt="의무실 " src="/images/resources/photo13.gif"></p>
</div>
<div id="ta08" style="display:none;">
<h2 class="top_mar20">도서실 (본관, 3층 서편)</h2>
<ul class="ico001h5">
				<li>보유장서 : 17,600권 정도(일반도서, 교육훈련자료, 논문, 정기간행물 등) </li>
				<li>이용대상 : 재한없음(신분증 제시) </li>
		</ul>
<h2 class="top_mar20">이용안내</h2>
<ul class="ico001h5">
			<li>동절기(11월부터) 이용시간 09:00 ~17:00</li>
			<li>하절기(4월부터) 이용시간 09:00 ~18:00 </li>
			<li>대출 : 1인1회 3권, 대출기간 : 7일 </li>
			<li>제한자료 : 논문, 정기간행물(열람, 복사가능) </li>
	</ul>
<p class="center top_mar10"><img alt="도서실 " src="/images/resources/photo14.gif"></p>
</div>
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<%-- 
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육장 대여신청" src="/images/resources/title_09-3.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="550" valign="bottom">
		<table width="308" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr> 
		  <td width="103">
			<img name="Image10" border="0" src='<html:rewrite page="/images/resources/tab_01.gif"/>' alt="교육장 대여안내" 
				onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=lentInfo"/>'"  
				onMouseOut="MM_swapImgRestore()" 
				onMouseOver="MM_swapImage('Image10','','<html:rewrite page="/images/resources/tab_01_over.gif"/>',1)" style="cursor:hand"/>
		  </td>
		  <td width="103">
			<img name="Image11" border="0" src='<html:rewrite page="/images/resources/tab_02.gif"/>' alt="대여현황"
				onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=month"/>'"  
				onMouseOut="MM_swapImgRestore()" 
				onMouseOver="MM_swapImage('Image11','','<html:rewrite page="/images/resources/tab_02_over.gif"/>',1)" style="cursor:hand"/>
		  </td>
		  <td width="102">
			<img name="Image12" border="0" src='<html:rewrite page="/images/resources/tab_03_over.gif"/>' alt="대여신청" 
				onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=list"/>'"  
				onMouseOut="MM_swapImgRestore()" 
				onMouseOver="MM_swapImage('Image12','','<html:rewrite page="/images/resources/tab_03_over.gif"/>',1)" style="cursor:hand"/>
		  </td>
		</tr>
        </table>
	  </td>
	  <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="200"></td>
	</tr>
	<tr>
	  <td colspan="2" height="10"></td>
	</tr>
	<tr>
	  <td colspan="2" >
		<!--	상단 검색 테이블 시작	-->
		<html:form method="POST" action="extMylcRoom.act?task=list">
		  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
		  <tr>
			<td class="s1" width="104">강의실</td>
			<td class="sBg" width="1"></td>
            <td class="s2"> 
              <html:select property="searchKeyword" style="width:100px" onchange="document.forms[0].submit();">
				<html:optionsCollection name="roomNoCode" property="beanCollection" />
			  </html:select>
			</td>
		  </tr>
		  </table>
		</html:form>
		<!--	상단 검색 테이블 끝	-->
		<table>
		<tr>
		  <td height="10"></td>
		</tr>
		</table>
		<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--	테이블 헤더 시작	-->
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="59">강의실</td>
			  <td class="sBg"></td>
			  <td class="t1" width="79">대여시작</td>
			  <td class="sBg"></td>
			  <td class="t1" width="79">대여종료</td>
			  <td class="sBg"></td>
			  <td class="t1" width="79">대여자</td>
			  <td class="sBg"></td>
			  <td class="t1" width="115">연락처</td>
			  <td class="sBg"></td>
			  <td class="t1">대여사유</td>
			  <td class="sBg"></td>
			  <td class="t1" width="110">대여상태</td>
			  <td width="17"></td>
			</tr>
			</table>
	        <!--	테이블 헤더 끝	-->
	        <!--	목록 시작		-->
			<html:form method="POST" action="extMylcRoom.act?task=list">
			  <div id="mainList" style="width:746px; z-index:1; overflow-y:scroll ;overflow-x:hidden">
				<c:set var="no" scope="request" value="1"/>
				<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
				<c:forEach var="list" items="${rsExtMylc_RoomReqList}" varStatus="i" >
				  <!-- 열 배경색깔 처리 -->
				  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				  <!-- 대여상태 글자색깔 처리 -->
				  <c:set var="fontColor" scope="request" value="lend2"/>
				  <c:if test="${list.status == '승인'}"><c:set var="fontColor" scope="request" value="lend1"/></c:if>
				  <tr class="${lineBg}"> 
					<td class="t2" width="59"><c:out value="${list.roomNo}"/></td>
					<td class="sBg"></td>
					<td class="t2" width="79"><c:out value="${list.lendFrom}"/></td>
					<td class="sBg"></td>
					<td class="t2" width="79"><c:out value="${list.lendTo}"/></td>
					<td class="sBg"></td>
					<td class="t2" width="79">
					  <a href="extMylcRoom.act?task=info&lendSeq=${list.lendSeq}">
						<u><c:out value="${list.reqName}"/></u>
					  </a>
					</td>
					<td class="sBg"></td>
					<td class="t2" width="115"><c:out value="${list.reqPhone}"/></td>
					<td class="sBg"></td>
					<td class="t3">
					  <c:if test="${fn:length(list.lendWhy) > 15}">&nbsp;<span title="${list.lendWhy}"><c:out value="${fn:substring(list.lendWhy, 0, 15)}…"/></span></c:if>
					  <c:if test="${fn:length(list.lendWhy) < 15}">&nbsp;<c:out value="${list.lendWhy}"/></c:if>
					</td>
					<td class="sBg"></td>
					<td class="t2" width="110"><span class="${fontColor}"><c:out value="${list.status}"/></span></td>
				  </tr>
				  <tr>
					<td colspan="13" class="lbg3"></td>
				  </tr>
				  <c:set var="no" scope="request" value="${no + 1}"/>
				</c:forEach>
				<c:if test="${no==1}">
				  <tr class="tbg3" height="21">
					<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
				  </tr>
				</c:if>
				</table>
			  </div>
			</html:form>
			<!--	목록 끝		-->
		  </td>
		</tr>
		</table>
		<!--	게시물 아래 버튼 시작	-->
		<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
		<tr valign="bottom">
		  <td align="right">
			<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' align="absmiddle" style="cursor:hand" alt="신규등록" onclick="location.href='<html:rewrite page="/extMylcRoom.act?task=create"/>'" /> 
		  </td>
		</tr>
		</table>
		<!--게시물 아래 버튼 끝-->
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>

<script type="text/javascript">
<!--
	tresize(220);
//-->
</script>
--%>