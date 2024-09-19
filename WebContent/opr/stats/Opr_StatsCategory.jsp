<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
<!--
	function stats()
	{
		var frm = document.forms[0];
		frm.action = "oprStats.act?task=category";
		frm.submit();
	}
	function ExcelDownload()
	{
		size_w = 100;
  		size_h = 100;

  		var url = '<html:rewrite page="/oprStats.act';
  		url += '?task=categoryExcel';
  		url += '&searchCrsType=' + document.forms[0].searchCrsType.value;
  		url += '&searchFrom=' + document.forms[0].searchFrom.value;
  		url += '&searchTo=' + document.forms[0].searchTo.value;
  		url += '"/>';
  		target = '_blank';
		openWinSetPo(url, target, '', size_w, size_h);
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육생 현황 통계" src="/images/operation/title_20.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--검색 -->
	<html:form method="POST" action="oprStats.act?task=category">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td width="89" class="s1">기간</td>
		<td class="sBar"></td>
		<td class="s2" width="250">
		  <html:text property="searchFrom" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchFrom);">
		  <html:text property="searchTo" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchTo);">
		</td>
		<td class="sBar"></td>
		<td width="89" class="s1">분류</td>
		<td class="sBar"></td>
		<td class="s2">
		  <html:select property="searchCrsType">
			<html:optionsCollection name="crsTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="document.forms[0].submit();" style="cursor:hand" align="absmiddle"/>
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--검색 끝-->
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />소속별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" width="42">구분</td>
		  <td class="sBg"></td>
		  <td class="t1">계</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">충북</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">청주</td>

		  <td class="sBg"></td>
		  <td class="t1" width="40">충주</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">제천</td>

		  <td class="sBg"></td>
		  <td class="t1" width="40">보은</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">옥천</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">영동</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">증평</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">진천</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">괴산</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">음성</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">단양</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">기타</td>
		  <td class="sBg"></td>
		  <td class="t1" width="56">(구)청주</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">청원</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_AssignList}" varStatus="i" >
			<c:if test="${fn:substring(list.gubun,0,1) == '1'}">
				<c:set var="gubun" value="전체"/>
			</c:if>
			<c:if test="${fn:substring(list.gubun,0,1) == '2'}">
				<c:set var="gubun" value="남성"/>
			</c:if>
			<c:if test="${fn:substring(list.gubun,0,1) == '3'}">
				<c:set var="gubun" value="여성"/>
			</c:if>
			<tr class="">
			  <td class="t2" width="42">${gubun }</td>
			  <td class="sBg"></td>
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignChungBuk}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignCheongju}</td>

			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignChungJu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignJaeChon}</td>

			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignBoUn}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignOkChon}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignYoungDong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignJungPyong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignJinChon}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignGoeSan}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignUmSung}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignDanYang}</td>
			  <td class="sBg"></td>

			  <td class="t2" width="40">${list.assignEtc}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="56">${list.assignChongJu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignChongWon}</td>
			</tr>
			<tr>
			  <td colspan="33" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2">조회된 데이터가 없습니다.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--리스트 끝-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />직급별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">계</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">4급이상</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">5급</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">6급</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">7급</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">8급</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">9급</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">10급</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">연구지도</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">별정</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">기타</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_RankList}" varStatus="i" >
			<!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank4Geubup}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank5Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank6Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank7Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank8Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank9Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank10Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rankYeonGuJiDo}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rankByeolJeong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rankEtc}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
		  <tr class="tbg3">
			<td class="t2">조회된 데이터가 없습니다.</td>
		  </tr>
		  </c:if>
		  </table>
		</div>
		<!--리스트 끝-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />직렬별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">계</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">행정</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">세무</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">정보통신</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">사회복지</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">시설</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">환경</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">농수산</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">보건의무</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">기능</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">기타</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_JobList}" varStatus="i" >
		    <!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobHaengJeong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobSeMu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobJeongBoTongSin}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobSaHoiBokJi}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobSiSeol}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobHwanKyeong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobNongSuSan}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobBoGeonEuiMu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobGiNeung}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobEtc}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
		    <tr class="tbg3">
			  <td class="t2">조회된 데이터가 없습니다.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--리스트 끝-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />연령별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">계</td>
		  <td class="sBg"></td>
		  <td class="t1" width="70">평균</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">20세이하</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">21~30세</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">31~40세</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">41~50세</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">51~60세</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">61세이상</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_AgeList}" varStatus="i" >
			<!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="70">${list.ageavg}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age20down}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age21to30}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age31to40}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age41to50}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age51to60}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age61up}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2">조회된 데이터가 없습니다.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--리스트 끝-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />근무년수별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">계</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">평균</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">5년이하</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">6~10년</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">11~15년</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">16~20년</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">21~25년</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">26~30년</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">31년이상</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">기타</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_InidateList}" varStatus="i" >
			<!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidateavg}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate5down}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate6to10}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate11to15}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate16to20}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate21to25}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate26to30}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate31up}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidateunknown}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="countini" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${countini==null}">
			<tr class="tbg3">
			  <td class="t2">조회된 데이터가 없습니다.</td>
			</tr>
		  </c:if>
		  </table>
		<!--리스트 끝-->
	  </td>
	</tr>
	</table>
  </td>
</tr>
<tr>
  <td height="5"></td>
</tr>
<tr>
	<td>
		<c:if test="${count != null }">
		<img src="/images/board/btn_excel.gif" style="cursor:hand" alt="교육생 현황 통계 엑셀 다운로드" onclick="ExcelDownload()"/>
		</c:if>
		<c:if test="${count == null }">
		<img src="/images/board/btn_excel_off.gif" alt="교육생 현황 통계 엑셀 다운로드"/>
		</c:if>
	</td>
</tr>
</table>