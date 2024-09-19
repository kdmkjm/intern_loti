<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(205);
	}
		
	function setCrs() {
		var searchCode = document.forms[0].searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	function doExcel() {
		var searchType = document.forms[0].searchType.value;
		if(searchType == "course") {
			var searchCourseCode 	= document.getElementById('searchCourseName').value + '%' + document.getElementById('searchKeyword').value + '%';
			//var searchCourseIsAll = document.forms[0].searchCourseIsAll.checked;
			if(searchCourseCode == "") {
				alert("조회하려는 과정을 선택하세요.");
				return;
			}
			document.getElementById("actionFrame").src = '<html:rewrite page="/crsTimeTblCourseAndDay.act?task=course&searchType='+searchType+'&searchCourseCode='+searchCourseCode+'"/>'; //+'&searchCourseIsAll='+searchCourseIsAll+'"/>';
		} else if(searchType == "day") {
			var searchFromDate 	= document.forms[0].searchFromDate.value;
			var searchToDate 		= document.forms[0].searchToDate.value;
			document.getElementById("actionFrame").src = '<html:rewrite page="/crsTimeTblCourseAndDay.act?task=day&searchType='+searchType+'&searchFromDate='+searchFromDate+'&searchToDate='+searchToDate+'"/>';		
		}
	}
	
/* 	function doSearch() {
		var searchType = document.forms[0].searchType.value;
		if(searchType == "course") {
			var searchCourseCode 	= document.getElementById('searchCourseName').value + '%' + document.getElementById('searchKeyword').value + '%';
			
			//var searchCourseCode 	= document.forms[0].searchCourseCode.value;
			alert(searchCourseCode);
			//var searchCourseIsAll = document.forms[0].searchCourseIsAll.checked;
			if(searchCourseCode == "") {
				alert("조회하려는 과정을 선택하세요.");
				return;
			}
			document.location.href = "/crsTimeTblCourseAndDay.act?task=list&searchType="+searchType+"&searchCourseCode="+searchCourseCode;
		}
	} */
	
	function changeSearch() {
		var searchType = document.forms[0].searchType.value;
		if(searchType == "course") {
			document.getElementById("sCourse").style.display = "";
			document.getElementById("sCourse2").style.display = "";
			document.getElementById("sDay").style.display = "none";
			document.getElementById("sDay2").style.display = "none";
		} else if(searchType == "day") {
			document.getElementById("sCourse").style.display = "none";
			document.getElementById("sCourse2").style.display = "none";
			document.getElementById("sDay").style.display = "";		
			document.getElementById("sDay2").style.display = "";		
		}			
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육시간표 조회 - 과정/기간별" src="/images/operation/title_32.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='crsTimeTblCourseAndDay.act?task=list'>
      <!--검색 테이블 시작-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="69" class="s1">검색구분</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="99">
	          <html:select property="searchType" style="width:90px" onclick="changeSearch()">
	            <html:option value="course">과정</html:option>
	            <html:option value="day">기간</html:option>
	 		  </html:select>
		    </td>
			<td class="sBar"></td>
			<td>
			  <div id="sCourse">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td width="80" class="s1">과정</td>
		            <td class="sBar"></td>
					<td class="s2" width="420"> 
					  <select id="searchYear"></select>
					  <select id="searchCourseName" style="width:240px;">
					  	<option value="">과정 선택</option>
					  </select>
					  <select id="searchKeyword" style="width:100px;">
					  	<option value="">과정기수 선택</option>
					  </select>
					  <html:hidden property="searchColumn"/>
					  <html:hidden property="searchCourseCode"/>
					</td>
				  <td class="s2" width="60"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor:hand" align="absbottom"/></td>
				</tr>
				</table>
			  </div>
			  <div id="sDay" style="display:none">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td width="69" class="s1">기간</td>
				  <td class="sBar"></td>
				  <td class="s2"> 
					<html:text property="searchFromDate" style="width:70px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, document.forms[0].searchFromDate, 'yyyy-mm-dd')">&nbsp;~
					<html:text property="searchToDate" style="width:70px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, document.forms[0].searchToDate, 'yyyy-mm-dd')">
				  </td>
				</tr>
				</table>
			  </div>
			</td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--검색 테이블 끝-->
      </html:form>
	  <div id="sCourse2">
		<table width="750" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td height="20" align="left">${rsCrs_TimeTblCrsTotalInfo}</td>
		</tr>
		</table>
		<c:out value="${timeTable }" escapeXml="false" />
		<!-- <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
			<tr>
 				<td>
	   				<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			    		<tr>
			    			<td class="t1" width="39">교시</td>
			    			<td class="sBg"></td>
			    			<td class="t1" width="117">시간</td>
			    			<td class="sBg"></td>
			    			<td class="t1" width="117">6.20 <br /> 월</td>
			    			<td class="sBg"></td>
			    			<td class="t1" width="117">6.21 <br /> 화</td>
			    			<td class="sBg"></td>
			    			<td class="t1" width="117">6.22 <br /> 수</td>
			    			<td class="sBg"></td>
			    			<td class="t1" width="117">6.22 <br /> 목</td>
			    			<td class="sBg"></td>
			    			<td class="t1" width="117">6.22 <br /> 금</td>
			    			<td class="sBg"></td>
						</tr>
					</table>
		  		</td>
			</tr>
			<tr>
 				<td>
	   				<table width="746" cellspacing="0" cellpadding="0" border="0">
			    		<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="39" height="50">1</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="117">09:00 ~ 09:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="117">과정안내</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" rowspan="3" width="117">갈등과 의사소통</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg" rowspan="3"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="117">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="117">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="117">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
						<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="39" height="50">2</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">10:00 ~ 10:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" rowspan="2">통합과 갈등 이해</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg" rowspan="2"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" rowspan="2">웃음꽃 힐링 행복에너지</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg" rowspan="2"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
						<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="39" height="50">3</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">11:00 ~ 11:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
						<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5; background-color: #ddf0ff;" class="t1" width="39" height="50"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5; background-color: #ddf0ff;" class="t1">12:00 ~ 12:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5; background-color: #ddf0ff;" class="t1" colspan="9">중식</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
						<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="39" height="50">5</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">13:00 ~ 13:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" rowspan="4">갈등해결을 위한<br />인간행동의 이해</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg" rowspan="4"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">갈등과 의사소통</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" rowspan="3">참여형 의사결정</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg" rowspan="3"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
						<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="39" height="50">6</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">14:00 ~ 14:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" rowspan="3">갈등영향분석</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg" rowspan="3"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
						<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="39" height="50">7</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">15:00 ~ 15:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
						<tr>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1" width="39" height="50">8</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">16:00 ~ 16:50</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">주요시책</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="t1">생활과 건강</td>
			    			<td style="border-bottom: 1px solid #D5D5D5;" class="sBg"></td>
						</tr>
					</table>
		  		</td>
			</tr>
		</table> -->
		
	  </div>
      <!--하단버튼-->
      <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
      <tr valign="bottom" align="right">
        <td class="t2" width="650"><div id="sDay2" style="display:none"><b>검색조건을 기간으로 선택시에는 엑셀 다운로드만 가능합니다.</b></div></td>
        <%-- <td><img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" alt="엑셀다운" align="absmiddle" onclick="doExcel()" style="cursor:hand"/></td> --%>
      </tr>
      </table>
  </td>
</tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script language="JavaScript">
	tresize(215);
</script>