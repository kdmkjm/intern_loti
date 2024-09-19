<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
<!--
	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}

	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}

	function MM_findObj(n, d) { //v4.01
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && d.getElementById) x=d.getElementById(n); return x;
	}

	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}



//-->
</script>
</head>

<body>
<!--// 지표 13 - 스킵네비게이션 -->
<div id="accessibility">
  <ul>
    <li><a href="#gnb">주메뉴 바로가기</a></li>
    <li><a href="#content">콘텐츠 바로가기</a></li>
  </ul>
</div>
<hr />

<div id="wrap">

	<div id="header">
		<h1><a href="#"><img src='<html:rewrite page="/images/logo.gif"/>' alt="대구광역시" /></a></h1>


    <ul class="lnb">
      <li><a href="#"><strong>홍길동 [교육관리과]</strong></a></li>
      <li><a href="#">로그아웃</a></li>
    </ul>

		<!------ 상위 메뉴 부분 ------->
		<h2 class="skip">주메뉴</h2>

    <ul id="topmenu" class="gnb">
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','<html:rewrite page="/images/m_01_over.gif"/>',1)">
      <img name="Image15" border="0" src='<html:rewrite page="/images/m_01.gif"/>' width="42" height="35" alt="교육계획" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li> <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','<html:rewrite page="/images/m_02_over.gif"/>',1)">
      <img name="Image16" border="0" src='<html:rewrite page="/images/m_02.gif"/>' width="42" height="35" alt="과정관리" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','<html:rewrite page="/images/m_03_over.gif"/>',1)">
      <img name="Image11" border="0" src='<html:rewrite page="/images/m_03.gif"/>' width="42" height="35" alt="교육관리" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','<html:rewrite page="/images/m_04_over.gif"/>',1)">
      <img name="Image12" border="0" src='<html:rewrite page="/images/m_04.gif"/>' width="42" height="35" alt="강사관리" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','<html:rewrite page="/images/m_05_over.gif"/>',1)">
      <img name="Image13" border="0" src='<html:rewrite page="/images/m_05.gif"/>' width="43" height="35" alt="평가설문" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','<html:rewrite page="/images/m_06_over.gif"/>',1)">
      <img name="Image14" border="0" src='<html:rewrite page="/images/m_06.gif"/>' width="42" height="35" alt="자원관리" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','<html:rewrite page="/images/m_07_over.gif"/>',1)">
      <img name="Image17" border="0" src='<html:rewrite page="/images/m_07.gif"/>' width="53" height="35" alt="시스템관리" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
    </ul>
	</div>

	<hr />

		<!------ 상위 메뉴 부분 끝    ------->

		<!----------- Left메뉴  ----------->

	<div id="img">
    <p><img src='<html:rewrite page="/images/system/img.jpg"/>' alt="시스템관리" /></p>
    </div>
	<hr />


	<div id="container">
	<div id="mainContent">

		<jsp:include page="/include/sysLeftMenu.jsp?code=2" flush="true"/>

		<!----------- Left메뉴 끝 --------->

		<!---------- 메인 화면  ----------->

		<div class="main">
		<div class="mainText">


		<!--검색 -->
		&nbsp&nbsp&nbsp&nbsp<B>● 생활관 관리</B>
		<form method="POST"  action="" class="boardSearchForm" >
		<table border="0" cellspacing="0" width="660">
		<tr>
			<td>
				&nbsp&nbsp&nbsp&nbsp과정&nbsp&nbsp
				<select name="과정">
    				<option value="">신규임용자과정1기</option>
    			</select>

				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp날짜&nbsp&nbsp
				<select name="날짜">
    				<option value="">2009-09-06</option>
    			</select> ~
    			<select name="날짜">
    				<option value="">2009-09-06</option>
    			</select>

			</td>
			<td width="50">
				<a href="#"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="45" height="20" alt="검색" align="absmiddle" border="0" /></a>
			</td>
		</table>
		</form>
		<hr class="displayNone" />
		<!--검색 끝-->

		<!--게시물 목록 시작-->
		<br>
		&nbsp&nbsp&nbsp&nbsp&nbsp▶과정&nbsp&nbsp
		<fieldset>
		 <table border="1" cellspacing="0" class="boardList" summary="메뉴목록">

			<tr bgcolor="#FFFFFF" height="27" align="center">
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">날짜</th>
				<th scope="col">호실</th>
				<th scope="col">실장명</th>
				<th scope="col">총원</th>
				<th scope="col">사고원</th>
				<th scope="col">현인원</th>
				<th scope="col">지도교관</th>
				<th scope="col">인쇄</th>
				<th scope="col">조회</th>
			</tr>

	        <tr>
	      		<td>*</td>
	            <td>합숙생활지도일지</td>
	          	<td>2009-09-06</td>
	            <td>-</td>
	            <td>-</td>
	            <td>9</td>
	            <td>0</td>
	          	<td>8</td>
	            <td>홍길동</td>
	            <td>인쇄</td>
	            <td>보기</td>
	        </tr>

	        <tr>
	      		<td>1</td>
	            <td>생활관 일지</td>
	          	<td>2009-09-06</td>
	            <td>101</td>
	            <td>임민주</td>
	            <td>3</td>
	            <td>0</td>
	          	<td>3</td>
	            <td></td>
	            <td></td>
	            <td>보기</td>
	        </tr>

	        <tr>
	      		<td>2</td>
	            <td>생활관 일지</td>
	          	<td>2009-09-06</td>
	            <td>102</td>
	            <td>박인근</td>
	            <td>3</td>
	            <td>0</td>
	          	<td>3</td>
	            <td></td>
	            <td></td>
	            <td>보기</td>
	        </tr>

	        <tr>
	      		<td>3</td>
	            <td>생활관 일지</td>
	          	<td>2009-09-06</td>
	            <td>103</td>
	            <td>정덕용</td>
	            <td>3</td>
	            <td>0</td>
	          	<td>3</td>
	            <td></td>
	            <td></td>
	            <td>보기</td>
	        </tr>

	       <tr>
	      		<td>4</td>
	            <td>생활관 일지</td>
	          	<td>2009-09-06</td>
	            <td>104</td>
	            <td>김미경</td>
	            <td>3</td>
	            <td>1</td>
	          	<td>2</td>
	            <td></td>
	            <td></td>
	            <td>보기</td>
	        </tr>

</table>
	</fieldset>

    <!--게시물 목록 끝-->

		<!--게시물 아래 버튼 시작-->
		<div class="boardBottom">
		  <div class="buttonRight">
            <input type="button" name="Submit3" value="생활관일지등록" class="button" onclick="location.href='<html:rewrite page="/sysMenuAdd.jsp"/>'">
			<input type="button" name="Submit3" value="합숙생활지도일지등록" class="button" onclick="location.href='<html:rewrite page="/sysMenuAdd.jsp"/>'">

          </div>
          </div>

		<!--게시물 아래 버튼 끝-->
		</div>

		<!------ 메인화면 끝------>

	</div>
	  </div>

	</div>
	</div>


</body>
</html>

