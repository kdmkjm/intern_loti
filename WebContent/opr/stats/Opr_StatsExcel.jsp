<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%
response.setHeader("Content-Type", "application/vnd.ms-xls");
response.setHeader("Content-Disposition", "attachment; filename="+request.getAttribute("coursename")+"_교육생현황.xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25">소속별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center">구분</td>

		  <td class="t1" style="text-align:center">계</td>

		  <td class="t1" style="text-align:center" width="43">충북</td>

		  <td class="t1" style="text-align:center" width="43">청주</td>

		  <td class="t1" style="text-align:center" width="43">충주</td>

		  <td class="t1" style="text-align:center" width="43">제천</td>

		  <td class="t1" style="text-align:center" width="43">보은</td>

		  <td class="t1" style="text-align:center" width="43">옥천</td>

		  <td class="t1" style="text-align:center" width="43">영동</td>

		   <td class="t1" style="text-align:center" width="43">증평</td>

		  <td class="t1" style="text-align:center" width="43">진천</td>

		  <td class="t1" style="text-align:center" width="43">괴산</td>

		  <td class="t1" style="text-align:center" width="43">음성</td>

		  <td class="t1" style="text-align:center" width="43">단양</td>

		  <td class="t1" style="text-align:center" width="43">기타</td>
		  <td class="t1" style="text-align:center" width="56">(구)청주</td>
		  <td class="t1" style="text-align:center" width="43">청원</td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
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
			<tr>

			  <td class="t2" style="text-align:center">${gubun }</td>

			  <td class="t2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="43">${list.assignChungBuk}</td>

			  <td class="t2" width="43">${list.assignCheongju}</td>


			  <td class="t2" width="43">${list.assignChungJu}</td>

			  <td class="t2" width="43">${list.assignJaeChon}</td>



			  <td class="t2" width="43">${list.assignBoUn}</td>

			  <td class="t2" width="43">${list.assignOkChon}</td>

			  <td class="t2" width="43">${list.assignYoungDong}</td>

			  <td class="t2" width="43">${list.assignJungPyong}</td>

			  <td class="t2" width="43">${list.assignJinChon}</td>

			  <td class="t2" width="43">${list.assignGoeSan}</td>

			  <td class="t2" width="43">${list.assignUmSung}</td>

			  <td class="t2" width="43">${list.assignDanYang}</td>

			  <td class="t2" width="43">${list.assignEtc}</td>
			  <td class="t2" width="56">${list.assignChongJu}</td>
			  <td class="t2" width="43">${list.assignChongWon}</td>
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
	  <td height="25">직급별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">계</td>

		  <td class="t1" style="text-align:center">4급이상</td>

		  <td class="t1" style="text-align:center" width="72">5급</td>

		  <td class="t1" style="text-align:center" width="72">6급</td>

		  <td class="t1" style="text-align:center" width="72">7급</td>

		  <td class="t1" style="text-align:center" width="72">8급</td>

		  <td class="t1" style="text-align:center" width="72">9급</td>

		  <td class="t1" style="text-align:center" width="72">10급</td>

		  <td class="t1" style="text-align:center" width="72">연구지도</td>

		  <td class="t1" style="text-align:center" width="72">별정</td>

		  <td class="t1" style="text-align:center" width="72">기타</td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_RankList}" varStatus="i" >
			<!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="72">${list.rank4Geubup}</td>

			  <td class="t2" width="72">${list.rank5Geub}</td>

			  <td class="t2" width="72">${list.rank6Geub}</td>

			  <td class="t2" width="72">${list.rank7Geub}</td>

			  <td class="t2" width="72">${list.rank8Geub}</td>

			  <td class="t2" width="72">${list.rank9Geub}</td>

			  <td class="t2" width="72">${list.rank10Geub}</td>

			  <td class="t2" width="72">${list.rankYeonGuJiDo}</td>

			  <td class="t2" width="72">${list.rankByeolJeong}</td>

			  <td class="t2" width="72">${list.rankEtc}</td>
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
	  <td height="25">직렬별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">계</td>

		  <td class="t1" style="text-align:center" width="65">행정</td>

		  <td class="t1" style="text-align:center" width="65">세무</td>

		  <td class="t1" style="text-align:center" width="65">정보통신</td>

		  <td class="t1" style="text-align:center" width="65">사회복지</td>

		  <td class="t1" style="text-align:center" width="65">시설</td>

		  <td class="t1" style="text-align:center" width="65">환경</td>

		  <td class="t1" style="text-align:center" width="65">농수산</td>

		  <td class="t1" style="text-align:center" width="65">보건의무</td>

		  <td class="t1" style="text-align:center" width="65">기능</td>

		  <td class="t1" style="text-align:center" width="65">기타</td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_JobList}" varStatus="i" >
		    <!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="65">${list.jobHaengJeong}</td>

			  <td class="t2" width="65">${list.jobSeMu}</td>

			  <td class="t2" width="65">${list.jobJeongBoTongSin}</td>

			  <td class="t2" width="65">${list.jobSaHoiBokJi}</td>

			  <td class="t2" width="65">${list.jobSiSeol}</td>

			  <td class="t2" width="65">${list.jobHwanKyeong}</td>

			  <td class="t2" width="65">${list.jobNongSuSan}</td>

			  <td class="t2" width="65">${list.jobBoGeonEuiMu}</td>

			  <td class="t2" width="65">${list.jobGiNeung}</td>

			  <td class="t2" width="65">${list.jobEtc}</td>
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
	  <td height="25">연령별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">계</td>

		  <td class="t1" style="text-align:center" width="70">평균</td>

		  <td class="t1" style="text-align:center" width="99">20세이하</td>

		  <td class="t1" style="text-align:center" width="99">21~30세</td>

		  <td class="t1" style="text-align:center" width="99">31~40세</td>

		  <td class="t1" style="text-align:center" width="99">41~50세</td>

		  <td class="t1" style="text-align:center" width="99">51~60세</td>

		  <td class="t1" style="text-align:center" width="99">61세이상</td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_AgeList}" varStatus="i" >
			<!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="70">${list.ageavg}</td>

			  <td class="t2" width="99">${list.age20down}</td>

			  <td class="t2" width="99">${list.age21to30}</td>

			  <td class="t2" width="99">${list.age31to40}</td>

			  <td class="t2" width="99">${list.age41to50}</td>

			  <td class="t2" width="99">${list.age51to60}</td>

			  <td class="t2" width="99">${list.age61up}</td>
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
	  <td height="25">근무년수별</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="1" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" style="text-align:center" colspan="2">계</td>

		  <td class="t1" style="text-align:center" width="70">평균</td>

		  <td class="t1" style="text-align:center" width="79">5년이하</td>

		  <td class="t1" style="text-align:center" width="79">6~10년</td>

		  <td class="t1" style="text-align:center" width="79">11~15년</td>

		  <td class="t1" style="text-align:center" width="79">16~20년</td>

		  <td class="t1" style="text-align:center" width="79">21~25년</td>

		  <td class="t1" style="text-align:center" width="79">26~30년</td>

		  <td class="t1" style="text-align:center" width="79">31년이상</td>

		  <td class="t1" style="text-align:center" width="79">기타</td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		<!--리스트 시작-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="1" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_InidateList}" varStatus="i" >
			<!-- 열 배경 -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" colspan="2" style="text-align:center">${list.total}</td>

			  <td class="t2" width="70">${list.inidateavg}</td>

			  <td class="t2" width="79">${list.inidate5down}</td>

			  <td class="t2" width="79">${list.inidate6to10}</td>

			  <td class="t2" width="79">${list.inidate11to15}</td>

			  <td class="t2" width="79">${list.inidate16to20}</td>

			  <td class="t2" width="79">${list.inidate21to25}</td>

			  <td class="t2" width="79">${list.inidate26to30}</td>

			  <td class="t2" width="79">${list.inidate31up}</td>

			  <td class="t2" width="79">${list.inidateunknown}</td>
			</tr>
			<c:set var="countini" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${countini==null}">
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