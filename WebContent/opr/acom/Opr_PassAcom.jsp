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
		tresize(185);
	}
	function ozReport()
	{
		var  searchCrsType = document.all.searchCrsType.value; 

		var  searchFromDate = document.all.searchFromDate.value;
		var  searchToDate = document.all.searchToDate.value;
		
		window.open('<html:rewrite page="/ozMenu.act"/>?report=eduplan&searchCrsType='+ searchCrsType +'&searchFromDate=' +  searchFromDate+'&searchToDate=' +  searchToDate,'popup', 'scrollbars = no, resizable=yes,menubar = no, width = 710 height =550, status = yes');
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
		
	function excel()
	{
		var searchFromDate = document.all.searchFromDate.value;
		var searchToDate = document.all.searchToDate.value;
		var searchCrsType = document.all.searchCrsType.value;
		var searchType = document.all.searchType.value;
		
		document.location.href = '${pageContext.request.contextPath}/oprPassAcom.act?task=excelDown&searchFromDate='+searchFromDate+'&searchToDate='+searchToDate+'&searchCrsType='+searchCrsType+'&searchType='+searchType;
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="기간별이수현황" src="/images/operation/title_36.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="oprPassAcom.act?task=list">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr> 
		<td width="69" class="s1">기간</td>
		<td class="sBar"></td>
		<td class="s2" width="180">
		  <html:text property="searchFromDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchFromDate);">
		  ~&nbsp;<html:text property="searchToDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchToDate);">
		</td>
		<td class="sBar"></td>
		<td width="69" class="s1">분류</td>
		<td class="sBar"></td>
		<td class="s2" width="180">
		  <html:select property="searchCrsType">
			<html:optionsCollection name="crsTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td class="sBar"></td>
		<td width="69" class="s1">구분</td>
		<td class="sBar"></td>
		<td class="s2">
		  <html:select property="searchType">
			<html:option value="001">계획/이수</html:option>
			<html:option value="002">기관</html:option>
			<html:option value="003">직급</html:option>
		  </html:select>
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
		  <c:if test="${searchType eq '001'}">
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="44">번호</td>
			  <td class="sBg"></td>
			  <td class="t1">과정명</td>
			  <td class="sBg"></td>
			  <td class="t1" width="89">교육기간</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">계획</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">신청</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">이수</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">미이수</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">이수율</td>
			  <td width="17"></td>
			</tr>
			</table>
			<c:if test="${rsOpr_PassAcom ne null}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t2BgRed"><b>계&nbsp;</b></td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.planCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.notComplyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.complyRate}" pattern="#,##0"/>%&nbsp;</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  <tr>
				<td colspan="99" class="lbg3"></td>
			  </tr>
			  </table>
			</c:if>
		  </c:if>
		  <c:if test="${searchType eq '002'}">
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="20">번<br>호</td>
			  <td class="sBg"></td>
			  <td class="t1">과정명</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">교육<br>기간</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">신청</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">이수</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">충북</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">청주</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">충주</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">제천</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">청원</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">보은</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">옥천</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">영동</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">진천</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">괴산</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">음성</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">단양</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">증평</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">타시도</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">기타</td>
			  <td width="17"></td>
			</tr>
			</table>
			<c:if test="${rsOpr_PassAcom ne null}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t2BgRed"><b>계&nbsp;</b></td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org6430000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4360000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4390000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4400000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4410000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4420000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4430000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4440000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4450000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4460000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4470000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4480000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org5570000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.orgOther}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org9999999}" pattern="#,##0"/>&nbsp;</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  <tr>
				<td colspan="99" class="lbg3"></td>
			  </tr>
			  </table>
			</c:if>
		  </c:if>
		  <c:if test="${searchType eq '003'}">
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="20">번<br>호</td>
			  <td class="sBg"></td>
			  <td class="t1">과정명</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">교육<br>기간</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">신청</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">이수</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">2급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">3급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">4급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">5급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">6급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">7급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">8급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">9급</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">기능</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">연구<br>지도</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">별정</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">계약</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">기타</td>
			  <td width="17"></td>
			</tr>
			</table>
			<c:if test="${rsOpr_PassAcom ne null}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t2BgRed"><b>계&nbsp;</b></td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank2}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank3}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank4}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank5}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank6}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank7}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank8}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank9}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankGN}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankYGJD}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankBJ}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankGY}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankETC}" pattern="#,##0"/>&nbsp;</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  <tr>
				<td colspan="99" class="lbg3"></td>
			  </tr>
			  </table>
			</c:if>
		  </c:if>
		  <!--테이블 헤더 끝-->
		  <!--리스트 시작-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:if test="${searchType eq '001'}">
			  <c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
				<!-- 열 배경 -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="44">${i.count}</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;${list.courseName}</td>
				  <td class="sBg"></td>
				  <td class="t2" width="89">${list.eduDate}</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.planCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.applyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.complyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.notComplyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.complyRate}" pattern="#,##0"/>%&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="31" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			</c:if>
			<c:if test="${searchType eq '002'}">
			  <c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
				<!-- 열 배경 -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="20">${i.count}</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;${list.courseName}</td>
				  <td class="sBg"></td>
				  <td class="t2" width="39">${list.eduDate}</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39">${list.applyCount}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39">${list.complyCount}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org6430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4360000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4390000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4400000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4410000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4420000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4440000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4450000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4460000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4470000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4480000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org5570000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.orgOther}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org9999999}&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="99" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			</c:if>
			<c:if test="${searchType eq '003'}">
			  <c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
				<!-- 열 배경 -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="20">${i.count}</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;${list.courseName}</td>
				  <td class="sBg"></td>
				  <td class="t2" width="39">${list.eduDate}</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39"><fmt:formatNumber value="${list.applyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39"><fmt:formatNumber value="${list.complyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank2}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank3}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank4}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank5}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank6}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank7}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank8}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank9}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankGN}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankYGJD}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankBJ}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankGY}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankETC}" pattern="#,##0"/>&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="99" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			</c:if>
			<html:hidden property="max" value="${no}"/>
			<c:if test="${no eq null}">
			  <tr class="tbg3">
				<td class="t2" colspan="99">조회된 데이터가 없습니다.</td>
			  </tr>
			</c:if>
			</table>	
		  </div>
		  <!--리스트 끝-->
		</td>
	  </tr>
	  </table>
	  <!--하단버튼 테이블 시작-->
	  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	  <tr valign="bottom">
		<td align="right">
		  <c:if test="${searchType eq '001'}">
		    <img src='<html:rewrite page="/images/operation/btn23.gif"/>' align="absmiddle" alt="분야별실적" style="cursor:hand" onclick="ozReport();"/>
		  </c:if> 
          <img src='<html:rewrite page="/images/operation/btn24.gif"/>' align="absmiddle" alt="과정별실적" style="cursor:hand" onclick="excel();" />
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(215);
//-->
</script>