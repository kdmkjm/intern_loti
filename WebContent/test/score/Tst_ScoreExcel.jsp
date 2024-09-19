<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "attachment; filename="+request.getAttribute("coursename")+"_성적일람표.xls");
response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table width="790" border="1" cellspacing="0" cellpadding="0">
	<tr>
		<td>교번</td>
		<td>소속</td>
		<td>직급</td>
		<td>이름</td>
		<td>생년월일</td>
		<td>성별</td>
		<td>근태</td>
		<td>현장학습</td>
		<td>분임조</td>
		<td>학습평가</td>
		<td>실습/실기평가</td>
		<td>외국어학습</td>
		<td>외국어회화</td>
		<td>연구논문</td>
		<td>개인강의</td>
		<td>분임토의</td>
		<td>핵심가치</td>
		<td>취미소양</td>
		<td>기초체력</td>
		<td>정보화</td>
		<td>가점</td>
		<td>총점</td>
		<td>석차</td>
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
