<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<table id="mainTable2" width="361" border="0" cellspacing="1" cellpadding="0" bgcolor="">
	<c:set var="no" scope="request" value="1"/>
	<c:forEach var="userList" items="${rsSysGroupUserList}" varStatus="i" >
	<!-- 열 배경 -->
	<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
	<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
	  <tr class=${lineBg}>
			<td width=172 class="t2"><c:out value="${userList.userName}"/></td>
			<td class="sBg"></td>
      <td width=100 class="t2">
      <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" style="cursor:hand" alt="삭제" onclick="delUser('${userList.juminNo}','${userList.groupNo}');"/>
      </td>
	  </tr>
		<tr><td class="lbg3" colspan="3"></td></tr>
		<c:set var="no" scope="request" value="${no + 1}"/>
	</c:forEach>
	<c:if test="${no==1}">
		<tr class="tbg3" height="21"><td class="t2" colspan="99">조회된 데이터가 없습니다.</td></tr>
	</c:if>
</table>
