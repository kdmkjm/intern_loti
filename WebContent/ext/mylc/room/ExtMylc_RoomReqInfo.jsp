<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<style type="text/css">
*{margin:0; padding:0;}
body, input, textarea, select, button{color:#5E5E5E; font-family: dotum,"돋움",NanumGothic; font-size: 12px; letter-spacing: 0px; line-height: 120%; margin:10px 10px;}
img{border:0;}
li, dd {list-style: none outside none;}
table, tbody, tr, th, td {border: medium none; margin: 0; padding: 0;}
.valign {vertical-align: top;}
#con_body {clear: both; line-height: 18px; margin-bottom: 20px; padding-top: 0px; width: 725px;}
.ico001nomar li {background: url(/images/resources/liImg.gif) no-repeat scroll 0 4px transparent; line-height: 17px; margin-left: 20px; padding-left: 15px;}
h2 {background: url(/images/resources/hIconBg.png) no-repeat scroll left 10px transparent; color: #00639A; font-size: 14px; padding: 10px 0 10px 20px; font-weight:bold;}
h3 {background: url(/images/resources/hIconBg.png) no-repeat scroll 0 -51px transparent; color: #0C88A1; font-size: 13px; line-height: 140%; margin: 0 0 0 8px; padding: 0 0 5px 18px; font-weight:bold;}
h4 {background: url(/images/resources/hIconBg.png) no-repeat scroll 8px -98px transparent; color: #666666; font-size: 12px; line-height: 140%; margin: 0 0 0 15px; padding: 0 0 5px 20px; font-weight:bold;}
caption {font-size: 0; height: 1px; line-height: 0; overflow: hidden; position: absolute; visibility: hidden; width: 1px;}
#con_body table {-moz-border-bottom-colors: none; -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none; background: none repeat scroll 0 0 transparent; border-color: #1F7CE9; border-image: none; border-right: 0 none; border-style: solid none none; border-width: 3px 0 0; margin-bottom: 10px; width: 100%;}
.tb_list{width:700px; margin-left:20px;}
.tb_list th {background: none repeat scroll 0 0 transparent; border-left: 1px solid #E8E8E5; color: #1F7CE9; font-family: NanumGothicExtraBold; line-height: 130%; padding: 0; text-align: center; border-bottom:1px solid #E8E8E5; padding:10px 0;}
.tb_list td {background: none repeat scroll 0 0 transparent; border-bottom: 1px solid #E8E8E5; border-left: 1px solid #E8E8E5; color: #555555; letter-spacing: 0; line-height: 130%; padding: 7px;}
.tb_list th.first {background: none repeat scroll 0 0 transparent; border-left: medium none; border-bottom:1px solid #E8E8E5;}
.tb_list tbody th.first {border-bottom: 1px solid #E8E8E5;}
.tb_list td.first {background: none repeat scroll 0 0 transparent; border-left: medium none;}
.center{text-align:center;}
.top_mar5 {margin-top: 5px;}
.top_mar10 {margin-top: 10px;}
.top_mar15 {margin-top: 15px;}
.top_mar20 {margin-top: 20px;}
.top_mar25 {margin-top: 25px;}
.top_mar30 {margin-top: 30px;}
.btm_mar5 {margin-bottom: 5px;}
.btm_mar10 {margin-bottom: 10px;}
.btm_mar15 {margin-bottom: 15px;}
.btm_mar20 {margin-bottom: 20px;}
.btm_mar25 {margin-bottom: 25px;}
.btm_mar30 {margin-bottom: 30px;}
.left_mar10 {margin-left: 10px;}
.left_mar15 {margin-left: 15px;}
.left_mar20 {margin-left: 20px;}
.left_mar30 {margin-left: 30px;}
.left_mar40 {margin-left: 40px;}
.left_mar65 {margin-left: 65px;}
.left_mar70 {margin-left: 70px;}
.left_mar105 {margin-left: 105px;}
</style>
<body>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="시설대여안내" src="/images/resources/title_12.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td height="38" width="550" valign="bottom">
		<div id="con_body">
		<h2 class="top_mar10">부지면적</h2>
		<ul class="ico001nomar">
			<li>163,040㎡ (49,319 평)</li>
		</ul>
		
		<h2 class="top_mar10">건물면적</h2>
		<ul class="ico001nomar">
			<li>11개동 16,116㎡ (4,875 평)</li>
		</ul>
		
		<h3 class="top_mar10">교육시설</h3>
		<div class="line"></div>
		<table cellpadding="0" summary="자치연수원 교육시설 정보테이블 입니다." class="tb_list">
		<caption><span>자치연수원 교육시설안내</span></caption>
		<colgroup>
		<col width="*">
		</colgroup>
		<thead>
		<tr>
			<th class="first" scope="col">강의실</th>
			<th scope="col">강당</th>
			<th scope="col">전산실</th>
			<th scope="col">어학실</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="center first">9개실, 400명</td>
			<td class="center">2개실, 410명</td>
			<td class="center">2개실, 104명</td>
			<td class="center">1개실, 40명</td>
		</tr>
		</tbody>
		</table>
		
		<h3 class="top_mar10">체육시설</h3>
		<div class="line"></div>
		<table cellpadding="0" summary="자치연수원 체육시설 정보테이블 입니다." class="tb_list">
		<caption><span>자치연수원 체육시설안내</span></caption>
		<colgroup>
		<col width="50%">
		</colgroup>
		<thead>
		<tr>
			<th class="first" scope="col">운동장</th>
			<th scope="col">테니스장</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="center first">잔디축구장 5,115㎡ (1,547 평)</td>
			<td class="center">2면</td>
		</tr>
		</tbody>
		</table>
		
		<h3 class="top_mar10">기타시설</h3>
		<div class="line"></div>
		<table cellpadding="0" summary="자치연수원 기타시설 정보테이블 입니다." class="tb_list">
		<caption><span>자치연수원 기타시설안내</span></caption>
		<colgroup>
		<col width="10%">
		</colgroup>
		<thead>
		<tr>
			<th class="first" scope="col">식당</th>
			<th scope="col">등산로</th>
			<th scope="col">농기계<br>훈련관</th>
			<th scope="col">농기계<br>실습장</th>
			<th scope="col">주차장</th>
			<th scope="col">의무실</th>
			<th scope="col">구내<br>매점</th>
			<th scope="col">분임<br>토의실</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="center first">200석</td>
			<td class="center">백족산(412m)<br>1시간 소요 </td>
			<td class="center">1,008㎡<br>(305 평)</td>
			<td class="center">4,954㎡<br>(1,499 평)</td>
			<td class="center">1,065 평<br>(100대)</td>
			<td class="center">1실<br>(병상 2개)</td>
			<td class="center">-</td>
			<td class="center">8실<br>180명</td>
		</tr>
		</tbody>
		</table>
		
		<h2 class="top_mar10">시설대여안내</h2>
		<h3 class="top_mar10">대여시설</h3>
		<ul class="ico001nomar">
			<li>교육시설 : 대강당2실, 강의실7실, 전산교육장 2실, 분임토의실 6실</li>
			<li>체육시설 : 운동장 1면, 테니스장 2면</li>
			<li>생 활 관 : 124실</li>
		</ul>
		
		<h3 class="top_mar10">신청기간 : 연중(해당 이용일 2주전까지) </h3>
		
		<h3 class="top_mar10">신청방법 :  <a href="employ.hwp"><img alt="사용신청서 제출 다운로드" class="valign" src="/images/resources/down_btn1.gif" /></a></h3>
		
		<h3 class="top_mar10">시설사용료 :  <a href="facilities.hwp"><img alt="시설사용료 다운로드" class="valign" src="/images/resources/down_btn2.gif" /></a></h3>
		
		<h3 class="top_mar10">시설 이용시 유의사항 </h3>
		<ul class="ico001nomar">
			<li>시설물 이용 신청전 사용가능 여 · 부 연수원과 협의 후 사용 신청서 제출</li>
			<li>시설물 내에서 취사, 음주, 엠프 사용 금지</li>
			<li>신청자가 중복일 경우 우선 신자에게 사용권 부여</li>
			<li>사용자는 시설물 이용 후 이용시설을 청소하고 발생한 쓰레기는 사용자 수거 회수</li>
			<li>사용자가 시설물 훼손 및 분실시 원상복구 및 변상조치</li>
		</ul>
		
		<h3 class="top_mar10">신청문의 : 행정지원과 관리팀</h3>
		<ul class="ico001nomar">
			<li>전화 : 043-220-5422</li>
			<li>팩스 : 043-220-5419</li>
		</ul>
		
		
	</div>
	  </td>
	</tr>
	</table>
	
	<%--<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="550" valign="bottom">
		<table width="308" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr> 
		  <td width="103">
			<img name="Image10" border="0" src='<html:rewrite page="/images/resources/tab_01_over.gif"/>' alt="교육장 대여안내" 
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
			<img name="Image12" border="0" src='<html:rewrite page="/images/resources/tab_03.gif"/>' alt="대여신청" 
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
	  <td colspan="2" height="15"></td>
	</tr>
	<tr>
	  <td colspan="2" >
		<!--내용 시작 --> 
		<table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr> 
		  <td>&nbsp;</td>
		</tr>
		<tr> 
		  <td><img src='<html:rewrite page="/images/resources/s_title_01.gif"/>' alt="교육장대여절차" /></td>
		</tr>
		<tr> 
		  <td align="center" height="155">
			<img src='<html:rewrite page="/images/resources/img_process.gif"/>' alt="1.교육장대여 신청접수→2.심의→3.대여승인→4.승인통보→5.교육장사용" />
		  </td>
		</tr>
		<tr> 
		  <td align="center"><img src='<html:rewrite page="/images/resources/img_bar.gif"/>' alt=""></td>
		</tr>
		<tr> 
		  <td>&nbsp;</td>
		</tr>
		<tr> 
		  <td><img src='<html:rewrite page="/images/resources/s_title_02.gif"/>' alt="강의실정보" /></td>
		</tr>
		<tr> 
		  <td>&nbsp;</td>
		</tr>
		<tr> 
		  <td> 
			<table width="680" border="0" cellspacing="0" cellpadding="0" align="center" style="border:2px solid #50a1f0">
			<tr> 
			  <td> 
				<table width="680" border="0" cellspacing="0" cellpadding="0" class="cbg">
				<tr> 
				  <td class="t1">구    분</td>
				  <td class="sBg" width="1"></td>
				  <td class="t1" width="412">일반 강의실 (4)</td>
				  <td class="sBg" width="1"></td>
				  <td class="t1" width="206">전산 강의실 (2)</td>									
				</tr>
				</table>
				<table width="680" border="0" cellspacing="0" cellpadding="0">
				<tr> 
				  <td class="t1">강 의 실</td>
				  <td class="sBg" width="1"></td>
				  <td class="t2" width="103"> 1501호 </td>
				  <td class="sBg" width="1"></td>
				  <td class="t2" width="102"> 1502호 </td>	
				  <td class="sBg" width="1"></td>
				  <td class="t2" width="102"> 1503호 </td>	
				  <td class="sBg" width="1"></td>
				  <td class="t2" width="102"> 1401호 </td>		
				  <td class="sBg" width="1"></td>
				  <td class="t2" width="102"> 1403호 </td>	
				  <td class="sBg" width="1"></td>
				  <td class="t2" width="103"> 1404호 </td>								
				</tr>
				<tr> 
				  <td class="lbg3" colspan="13"></td>
				</tr>
				<tr class="tbg3"> 
				  <td class="t1">수용인원</td>
				  <td class="sBg" width="1"></td>
				  <td class="t2"> 100명 </td>
				  <td class="sBg" width="1"></td>
				  <td class="t2"> 40명 </td>			
				  <td class="sBg" width="1"></td>
				  <td class="t2"> 40명 </td>	
				  <td class="sBg" width="1"></td>
				  <td class="t2"> 40명 </td>		
				  <td class="sBg" width="1"></td>
				  <td class="t2"> 25명 </td>
				  <td class="sBg" width="1"></td>
				  <td class="t2"> 25명 </td>					
				</tr>
				<tr> 
				  <td class="lbg3" colspan="13"></td>
				</tr>
				<tr> 
				  <td class="t1">시    설</td>
				  <td class="sBg" width="1"></td>
				  <td class="t2">빔프로젝트<br>스크린<br>전자교탁<br>유선마이크<br>Network(외부망)</td>
				  <td class="sBg" width="1"></td>
				  <td class="t2">빔프로젝트<br>스크린<br>전자교탁<br>유선마이크<br>Network(외부망)</td>			
				  <td class="sBg" width="1"></td>
				  <td class="t2">빔프로젝트<br>스크린<br>전자교탁<br>유선마이크<br>Network(외부망)</td>
				  <td class="sBg" width="1"></td>
				  <td class="t2">빔프로젝트<br>스크린<br>전자교탁<br>유선마이크<br>Network(외부망)</td>	
				  <td class="sBg" width="1"></td>
				  <td class="t2">빔프로젝트<br>스크린<br>유선마이크<br>강의용PC<br>데스크탑PC:29대<br>Network(외부망)</td>		
				  <td class="sBg" width="1"></td>
				  <td class="t2">빔프로젝트<br>스크린<br>유선마이크<br>강의용PC<br>데스크탑PC:29대<br>Network(외부망)</td>							
				</tr>
				<tr> 
				  <td class="lbg3" colspan="13"></td>
				</tr>
				</table>
			  </td>
			</tr>
			</table>
		  </td>
		</tr>
		</table>
	  </td>
	</tr>
	</table>--%>
  </td>
</tr>
</table>
</body>