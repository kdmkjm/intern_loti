<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
</head>
<body>
		<div class="main">
		<div class="mainText">

	var menuTree = new dTree('menuTree');


	<c:forEach var="typeList" items="${typeList}" varStatus="i" >
		menuTree.add(
			${typeList.menuNo},
			${typeList.parent},
			'${typeList.menuName}',
			'${typeList.checkYn}',
			'${typeList.menuType}',
			'${typeList.menuNo}');

	</c:forEach>

	document.write(menuTree);


    </div>
    </div>
</body>
</html>