<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="사용자/교육생 비교" src="/images/system/title_01-7.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td colspan="2">
		<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--테이블 헤더 시작-->
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr>
			  <td class="t1" width="49">연번</td>
			  <td class="sBg"></td>
			  <td class="t1" width="90">대체키</td>
			  <td class="sBg"></td>
			  <td class="t1" width="80">성명</td>
			  <td class="sBg"></td>
			  <td class="t1">소속</td>
			  <td class="sBg"></td>
			  <td class="t1" width="80">직위</td>
			  <td class="sBg"></td>
			  <td class="t1" width="170">직급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="100">직렬</td>
			  <td width="17"></td>
			</tr>
			</table>
			<!--테이블 헤더 끝-->
			<!--리스트 시작-->
			<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="list" items="${rsStudentList}" varStatus="i" >
				<!-- 열 배경 -->
				<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="49"><c:out value="${i.count}"/></td>
				  <td class="sBg"></td>
				  <td class="t2" width="90"><c:out value="${list.juminNo}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="80">&nbsp;<c:out value="${list.userName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;<c:out value="${list.assignName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="80">&nbsp;<c:out value="${list.gradeName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="170">&nbsp;<c:out value="${list.rankName}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="100">&nbsp;<c:out value="${list.jobName}"/></td>																							
				</tr>
				<tr>
				  <td colspan="19" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			  <c:if test="${no == null}">
				<tr class="tbg3">
				  <td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
				</tr>
			  </c:if>
			  </table>
			</div>
			<!--리스트 끝-->
		  </td>
		</tr>							
		</table>						
	  </td>
	</tr>
	<tr>
	  <td height="30">
		※ 사용자(LDAP) 테이블에 존재하지 않는 교육생을 표시합니다.
	  </td>
	  <td align="right"><img src='<html:rewrite page="/images/board/btn_refresh.gif"/>' alt="새로고침" style="cursor:hand" onclick="document.location.reload();"/></td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(170);
//-->
</script>