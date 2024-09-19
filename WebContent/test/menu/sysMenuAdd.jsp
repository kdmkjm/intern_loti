<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title></title>

<link rel="stylesheet" href='/loti/style/main.css' type="text/css" />


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

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
		<h1><a href="#"><img src='/loti/images/logo.gif' alt="대구광역시" /></a></h1>


    <ul class="lnb">
      <li><a href="#"><strong>홍길동 [교육관리과]</strong></a></li>
      <li><a href="#">로그아웃</a></li>
    </ul>


		<h2 class="skip">주메뉴</h2>

    <ul id="topmenu" class="gnb">
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','/loti/images/m_01_over.gif',1)"><img name="Image15" border="0" src='/loti/images/m_01.gif' width="42" height="35" alt="교육계획" /></a></li>
      <li><img src='/loti/images/menu_bar.gif' alt="" /></li>
      <li> <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','/loti/images/m_02_over.gif',1)"><img name="Image16" border="0" src='/loti/images/m_02.gif' width="42" height="35" alt="과정관리" /></a></li>
      <li><img src='/loti/images/menu_bar.gif' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','/loti/images/m_03_over.gif',1)"><img name="Image11" border="0" src='/loti/images/m_03.gif' width="42" height="35" alt="교육관리" /></a></li>
      <li><img src='/loti/images/menu_bar.gif' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','/loti/images/m_04_over.gif',1)"><img name="Image12" border="0" src='/loti/images/m_04.gif' width="42" height="35" alt="강사관리" /></a></li>
      <li><img src='/loti/images/menu_bar.gif' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','/loti/images/m_05_over.gif',1)"><img name="Image13" border="0" src='/loti/images/m_05.gif' width="43" height="35" alt="평가설문" /></a></li>
      <li><img src='/loti/images/menu_bar.gif' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','/loti/images/m_06_over.gif',1)"><img name="Image14" border="0" src='/loti/images/m_06.gif' width="42" height="35" alt="자원관리" /></a></li>
      <li><img src='/loti/images/menu_bar.gif' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','/loti/images/m_07_over.gif',1)"><img name="Image17" border="0" src='/loti/images/m_07.gif' width="53" height="35" alt="시스템관리" /></a></li>
      <li><img src='/loti/images/menu_bar.gif' alt="" /></li>
    </ul>
	</div>

	<hr />

	<div id="img">
    <p><img src='/loti/images/system/img.jpg' alt="시스템관리" /></p>
    </div>
	<hr />


	<div id="container">
	<div id="mainContent">
		<!-- Left메뉴 지정 -->
		<jsp:include page="/include/sysLeftMenu.jsp?code=2" flush="true"/>
		<!-- Left메뉴 지정 끝 -->

		<div class="main">
		<p class="title"> <img src='/loti/images/system/title_01.gif' alt="사용자관리" /> </p>


		<form name="sysMenuForm" method="POST" action="/loti/testMenu.act?task=insert">
		<input type="hidden" name="oldMenuNo" value="7">

			<table cellpadding="3" cellspacing="0" border="1" width="650" >
			    <tr>
			        <td width=150 align="center"> 메뉴코드</td>
			      	<td width=500><input type="text" name="menuNo" value="7"></td>
			    </tr>
			    <tr>
			        <td align="center"> 부모코드</td>
			      	<td><input type="text" name="parent" value="5"></td>
			    </tr>
			    <tr>
			        <td align="center"> 메뉴표시명</td>
			      	<td><input type="text" name="menuName" value="그룹멸 메뉴관리"></td>
			    </tr>
			    <tr>
			        <td align="center"> 프로그램명</td>
			      	<td><input type="text" name="progName" value="그룹별 메뉴관리"></td>
			    </tr>
			    <tr>
			        <td align="center"> 실행경로</td>
			      	<td><input type="text" name="execPath" size="70" value=""></td>
			    </tr>
			    <tr>
			        <td align="center"> 프로그램ID</td>
			      	<td><input type="text" name="progId" value=""></td>
			    </tr>
			    <tr>
			        <td align="center"> Parameter</td>
			      	<td><input type="text" name="parms" value=""></td>
			    </tr>
			    <tr>
			        <td align="center"> ICON경로</td>
			      	<td><input type="text" name="iconPath" size="70" value=""></td>
			    </tr>
			    <tr>
			        <td align="center"> 메뉴구분</td>
			      	<td><select name="menuType"><option value="M" selected="selected">메뉴</option>
						<option value="F">폴더</option></select></td>
			    </tr>
			    <tr>
			        <td align="center"> 실행구분</td>
			      	<td><select name="execType"><option value="T" selected="selected">TEST용</option>
						<option value="R">Runtime용</option></select></td>
			    </tr>
			    <tr>
			        <td align="center"> 화면표시순서</td>
			      	<td><input type="text" name="dispOrder" value=""></td>
			    </tr>
			    <tr>
			        <td align="center"> 사용구분</td>
			      	<td><select name="use"><option value="U" selected="selected">사용</option>
						<option value="N">미사용</option></select></td>
			    </tr>
			</table>

<input type="submit" value="저장" class="button">
<input type="button" onclick="document.location.href=document.referrer;" class="button"  value="목록"/>
</form>

		</div>

	</div>
	</div>

	</div>

<br/>

</body>
</html>