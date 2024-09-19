<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(218);
	}

	function doSearch(frm)
	{
		if(frm.searchFromDate.value == "" || frm.searchToDate.value == "")
		{
			alert("기간을 입력해주세요.");
			return;
		}
		frm.submit();
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="사이버 미이수자 제한" src="/images/operation/title_17.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="oprPassAcom.act?task=notpass">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr> 
		<td width="89" class="s1">기간</td>
		<td class="sBar"></td>
		<td class="s2" width="250">
		  <html:text property="searchFromDate" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchFromDate);">
			~&nbsp;<html:text property="searchToDate" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchToDate);">
		</td>
		<td class="sBar"></td>
		<td width="89" class="s1">성명</td>
		<td class="sBar"></td>
		<td class="s2">
		  <html:text property="searchStdName" style="width:150px;"/>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor:hand" align="absmiddle"/>
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--검색 끝-->
	<table>
	<tr>
	  <td height="15"></td>
	</tr>
	</table>
	<html:form method="POST" action="oprPassAcom.act?task=excelDown">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--테이블 헤더 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
			<td class="t1" width="44">연번</td>
			<td class="sBg"></td>
			<td class="t1" width="60">성명</td>
			<td class="sBg"></td>
			<td class="t1" width="79">생년월일</td>
			<td class="sBg"></td>
			<td class="t1" >과정명</td>
			<td class="sBg"></td>
			<td class="t1" width="119">학습기간</td>
			<td class="sBg"></td>
			<td class="t1" width="128">제한 월</td>
			<td width="17"></td>
		  </tr>
		  </table>
		  <!--테이블 헤더 끝-->
		  <!--리스트 시작-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
			<c:forEach var="list" items="${rsOpr_CyberNotPassAcom}" varStatus="i" >
			  <!-- 열 배경 -->
			  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
				<td class="t2" width="44"><c:out value="${i.count}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="60"><c:out value="${list.stdName}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="79"><c:out value="${list.juminNo}"/></td>
				<td class="sBg"></td>
				<td class="t3" >&nbsp;<c:out value="${list.courseName}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="119"><c:out value="${list.eduDate }"/></td>
				<td class="sBg"></td>
				<td class="t2" width="128"><c:out value="${list.restrict }"/></td>
			  </tr>
			  <tr>
				<td colspan="31" class="lbg3"></td>
			  </tr>
			  <c:set var="count" scope="request" value="${i.count}"/>
			</c:forEach>
			<html:hidden property="fromDate"/>
			<html:hidden property="toDate"/>
			<html:hidden property="crsType"/>
			<c:if test="${count==null}">
			  <tr class="tbg3" height="21">
				<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
			  </tr>
			</c:if>
			</table>	
		  </div>
		  <!--리스트 끝-->
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(218);
	document.forms[0].searchStdName.focus();
//-->
</script>