<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(185);
	}
	//location.href='<html:rewrite page="/.act?task="/>'
	function doExelUpload()
	{
		var courseCode = document.all.searchCourseCode.value;
		var courseName = document.all.searchCourseName.value;
		if(courseCode == "")
		{
			alert("과정코드를 입력하세요.");
			return;
		}
		
		var url = '${pageContext.request.contextPath}/oprPass.act?task=uploadExcel&searchCourseCode='+courseCode+'&searchCourseName='+courseName;
		document.location.href = url;		
	}	
	
		
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&isCyber=true&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="사이버 이수관리" src="/images/operation/title_13.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="oprPass.act?task=cyberList">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr> 
		  <td width="59" class="s1">과정</td>
          <td class="sBar"></td>
		  <td class="s2" width="420"> 
			  <select id="searchYear"></select>
			  <select id="searchCourseName" style="width:260px;">
			  	<option value="">과정 선택</option>
			  </select>
			  <select id="searchKeyword" style="width:100px;">
			  	<option value="">과정기수 선택</option>
			  </select>
			  <html:hidden property="searchColumn"/>
			  <html:hidden property="searchCourseCode"/>
		  </td>
          <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch()" style="cursor:hand" align="absbottom"/></td>
	  </tr>
	  </table>
	</html:form>
	<!--검색 끝-->
	<table>
	<tr>
	  <td height="15"></td>
	</tr>
	</table>
	<html:form method="POST" action="oprPass.act?task=cyberPass">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--테이블 헤더 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
			<td class="t1" width="29">교번</td>
			<td class="sBg"></td>
			<td class="t1">성명</td>
			<td class="sBg"></td>
			<td class="t1" width="189">소속</td>
			<td class="sBg"></td>
			<td class="t1" width="49">진도율</td>
			<td class="sBg"></td>
			<td class="t1" width="49">과제물</td>
			<td class="sBg"></td>
			<td class="t1" width="54">평가</td>
			<td class="sBg"></td>
			<td class="t1" width="49">참여도</td>
			<td class="sBg"></td>
			<td class="t1" width="49">접속<br>횟수</td>
			<td class="sBg"></td>
			<td class="t1" width="49">취득<br>점수</td>
			<td class="sBg"></td>
			<td class="t1" width="49">인정율</td>
			<td class="sBg"></td>
			<td class="t1" width="54">인정시간</td>
			<td class="sBg"></td>
			<td class="t1" width="50">이수</td>
			<td width="17"></td>
		  </tr>
		  </table>
		  <!--테이블 헤더 끝-->
		  <!--리스트 시작-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
			<c:forEach var="list" items="${rsOpr_PassCyberList}" varStatus="i" >
			  <!-- 열 배경 -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
				<td class="t2" width="29">&nbsp;<c:out value="${list.stdNo}"/></td>
				<td class="sBg"></td>
				<td class="t2"><c:out value="${list.stdName}"/></td>
				<td class="sBg"></td>
				<td class="t3" width="189">&nbsp;<c:out value="${list.assignName}"/></td>
				<td class="sBg"></td>
				<td class="t4" width="49"><c:out value="${list.progressRate}"/>%&nbsp;</td>
				<td class="sBg"></td>
				<td class="t4" width="49"><c:out value="${list.homeStudy}"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t4" width="54"><c:out value="${list.studyHour}"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t4" width="49"><c:out value="${list.participate}"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t4" width="49"><c:out value="${list.connectCount}"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t4" width="49"><c:out value="${list.acquireScore}"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t4" width="49"><c:out value="${list.apvRate}"/>%&nbsp;</td>
				<td class="sBg"></td>
				<td class="t4" width="54"><c:out value="${list.apvHour}"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2" width="50" id="isFinish">
				  <c:if test="${list.isFinish == 'Y'}"><span class="lend1">이수</span></c:if>
				  <c:if test="${list.isFinish == 'N'}"><span class="lend2">미이수</span></c:if>
				</td>
			  </tr>
			  <tr>
				<td colspan="99" class="lbg3"></td>
			  </tr>
			  <c:set var="no" scope="request" value="${no + 1}"/>
			</c:forEach>
			<html:hidden property="max" value="${no - 1}"/>
			<html:hidden property="courseCode"/>
			<html:hidden property="lectureType" value="cyber"/>
			<c:if test="${no==1}">
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
		  <img src='<html:rewrite page="/images/board/btn_excelup.gif"/>' align="absmiddle" alt="엑셀업로드" style="cursor:hand" onclick="doExelUpload();"/>
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(195);
//-->
</script>