<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script type="text/javascript" src='<html:rewrite page="/common/js/dtree.js"/>'></script>
<!--->
<!--게시물 목록 시작-->

<form name="" action="/sysMenu.act?task=ins_group_menu">
<script type="text/javascript">

	var menuTree = new dTree('menuTree');

	<c:forEach var="menuList" items="${rsSysMenuList}" varStatus="i" >
		menuTree.add(
			${menuList.menuNo},
			${menuList.parent},
			'${menuList.menuName}',
			'${menuList.checkYn}',
			'${menuList.menuType}');

	</c:forEach>

	document.write(menuTree);

</script>
	<input type="button" value="저장" onclick="insertMenu();"/>
	</form>

<script type="text/javascript">
		getCheck();
</script>
<!--게시물 목록 끝-->
