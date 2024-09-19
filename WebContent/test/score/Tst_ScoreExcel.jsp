<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "attachment; filename="+request.getAttribute("coursename")+"_�����϶�ǥ.xls");
response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table width="790" border="1" cellspacing="0" cellpadding="0">
	<tr>
		<td>����</td>
		<td>�Ҽ�</td>
		<td>����</td>
		<td>�̸�</td>
		<td>�������</td>
		<td>����</td>
		<td>����</td>
		<td>�����н�</td>
		<td>������</td>
		<td>�н���</td>
		<td>�ǽ�/�Ǳ���</td>
		<td>�ܱ����н�</td>
		<td>�ܱ���ȸȭ</td>
		<td>������</td>
		<td>���ΰ���</td>
		<td>��������</td>
		<td>�ٽɰ�ġ</td>
		<td>��̼Ҿ�</td>
		<td>����ü��</td>
		<td>����ȭ</td>
		<td>����</td>
		<td>����</td>
		<td>����</td>
	</tr>
	<c:forEach items="${rsScoreList}" var="score">
	<tr>
		<td>${score.sduno }</td>
		<td>${score.assignname }</td>
		<td>${score.rankname }</td>
		<td>${score.stdname }</td>
		<td>${score.juminno }</td>
		<td>${score.sex}</td>
		<td>${score.scoreattend }</td>
		<td>${score.scoreresearch }</td>
		<td>${score.scoreteam }</td>
		<td>${score.scorestudy }</td>
		<td>${score.scorepra }</td>
		<td>${score.scoreforeign }</td>
		<td>${score.scoreconver }</td>
		<td>${score.scorepaper }</td>
		<td>${score.scorepersonal }</td>
		<td>${score.scoreTeamDisc}</td>
		<td>${score.scoreValue}</td>
		<td>${score.scoreHobby}</td>
		<td>${score.scoreStamina}</td>
		<td>${score.scoreInfo}</td>
		<td>${score.scoreadd }</td>
		<td>${score.scoreavg }</td>
		<td>${score.ranking }</td>
	</tr>
	</c:forEach>
</table>
