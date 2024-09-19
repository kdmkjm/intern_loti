<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script type="text/javascript" src='<html:rewrite page="/common/js/jquery-1.7.1.min.js"/>'></script>
<script type="text/javascript" src='<html:rewrite page="/common/js/DD_belated-min.js"/>'></script>
<script type="text/javascript" src='<html:rewrite page="/common/js/js/default.js"/>'></script>

<script language="JavaScript">
<!--
$.noConflict();
	function showLeftMenu(menuNo)
	{
		var url='mainMenu.act?task=left_list&parent='+menuNo;
		goMenuLinkLeft(url);
	}
	
	goMenuLinkLeft = function(url) 
	{
	var obj = parent.iframe_Left ;
	    	obj.location.href = '${pageContext.request.contextPath}/'+url;
	}
	function goMain()
	{
		//parent.location.href='index_f.jsp';
		parent.location.href='${pageContext.request.contextPath}/index.act';
	}

//-->
//<![CDATA[
	var gnbIndex = 0;
	jQuery().ready(function(){
		if(jQuery('#gnb > ul > .on')){
			gnbIndex = jQuery('#gnb > ul > li').index(jQuery('#gnb > ul > .on'));
			if(gnbIndex==-1)gnbIndex=0;
			jQuery('#gnb > ul > li').removeClass("on");
			jQuery("#gnb > ul > li:eq("+gnbIndex+")").addClass("on");
		}
		jQuery('#gnb > ul > li > a').mouseover(function(){
			gnbIndex = jQuery('#gnb > ul > li > a').index(jQuery(this));
			if(gnbIndex==-1)gnbIndex=0;
			jQuery('#gnb > ul > li').removeClass("on");
			jQuery("#gnb > ul > li:eq("+gnbIndex+")").addClass("on");
		});
	});
	
//]]>

	function goDmloti()
	{
		//alert("aa");
		var url='http://dmloti.cb21.net';
		parent.location.href = url;
	}
	
</script>

<!-- 스킵네비게이션 -->
<div id="accessibility"> 
  <ul>
    <li><a href="#gnb">주메뉴 바로가기</a></li>
    <li><a href="#content">콘텐츠 바로가기</a></li>
  </ul>
</div>
<hr />
<!--상단메뉴 시작-->
<div id="mainWrapper">
  <div class="wrap">
	<div id="header"> 
	  <h1><a href="#" onclick="goMain();"><img src='<html:rewrite page="/images/logo.gif"/>' alt="생명과태양의땅충북 자치연수원 교육관리시스템" border="0" /></a></h1>
	  <ul class="lnb">
	    <li class="end"><strong><c:out value="${userName}"/></strong></li>
	    <li><font color="#013fb3"><c:out value="[${organName}]"/></font></li>
	    <li><a href="/mainMenu.act?task=left_list&parent=30" target="iframe_Left" onclick="parent.iframe_Main.location.href='/extMainPrsn.act?task=list'">개인정보수정</a></li>
<%--    <li><div onclick="onHelp();" style="cursor:hand"/>온라인도움말</div></li>  --%>
	    <li class="end"><img src='<html:rewrite page="/images/logout.gif"/>' alt="로그아웃" style="cursor:hand" onclick="location.href='<html:rewrite page="/mainMenu.act?task=logout"/>'"/></li>
	  </ul>
	  <h2 class="skip">주메뉴</h2>
      <div class="menu_bg">
		<div id="gnb">
		  <ul class="depth2">
			<c:forEach var="menuList" items="${rsTopMenuList}" varStatus="i" >
			<c:if test="${menuList.menuNo == 150}">
			  <li class="top${i.index+1}m"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image${menuList.num}','','<html:rewrite page="${menuList.iconPathOn}"/>',1)" onclick="goDmloti();">
		      <img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPath}"/>'  height="42" alt="${menuList.menuName}" /></a>
			</c:if>
				
			<c:if test="${menuList.menuNo != 150}">
			  <li class="top${i.index+1}m"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image${menuList.num}','','<html:rewrite page="${menuList.iconPathOn}"/>',1)" onclick="showLeftMenu('${menuList.menuNo}');">
		      <img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPath}"/>'  height="42" alt="${menuList.menuName}" /></a>			
			</c:if>
			<ul class="top${i.count }m1m">
				<c:forEach items="${menuList.subMenuList }" var="submenu" varStatus="j">
					<c:if test="${submenu.parent != -1 }">
				      <li class="top${i.count }m1m${j.count}">
				      	<c:if test="${submenu.execType == 'N'}">
				      	<a href="${submenu.execPath }" target="_blank"><span>${submenu.menuName }</span></a>
				      	</c:if>
				      	<c:if test="${submenu.execType == 'T' || submenu.execType == null}">
				      	<a href="/mainMenu.act?task=left_list&parent=${menuList.menuNo }" target="iframe_Left" onclick="parent.iframe_Main.location.href='${submenu.execPath}'"><span>${submenu.menuName }</span></a>
				      	</c:if>
				      </li>
				    </c:if>
				</c:forEach>
			</ul>
			</c:forEach>
		  </ul>
		</div>
	  </div>
	</div>
  </div>
</div>