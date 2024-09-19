<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(190);
	}
	
	function checkAll()
	{
		var max = Number(document.all.max.value);
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.checkbox.checked == false)
				document.all.checkbox.checked = true;
			else
				document.all.checkbox.checked = false;
		}
		else
		{
			if(document.all.checkbox[0].checked == false)
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = true;
			else
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = false;
		}
	}
	
	function doSubmit(frm)
	{
		var max = Number(frm.max.value);
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		// 검색결과가 1개일 경우
		if(max == 1)
		{
			frm.arrayEduDate.value = document.all.searchDate.value;
				
			if(frm.checkbox.checked == true)
			{
				frm.arrayAttendYN.value = "Y";
			}
			else
			{
				frm.arrayAttendYN.value = "N";
			}
		}
		// 검색결과가 여러개일 경우
		else
		{
			for(var i=0; i<max; i++)
			{
				frm.arrayEduDate[i].value = document.all.searchDate.value;
				
				if(frm.checkbox[i].checked == true)
				{
					frm.arrayAttendYN[i].value = "Y";
				}
				else
				{
					frm.arrayAttendYN[i].value = "N";
				}
			}
		}
		frm.courseCode.value 	= document.all.searchCourseCode.value;
		frm.eduDate.value 		= document.all.searchDate.value;
		frm.courseName.value 		= document.all.searchCourseName.value;
		
		var do_confirm = confirm('저장하시겠습니까?');
		if(do_confirm == true)
			frm.submit();
	}
	function doModify(seq)
	{
		document.forms[1].courseCode.value 	= document.forms[0].searchCourseCode.value;
		document.forms[1].courseName.value 	= document.forms[0].searchCourseName.value;
		document.forms[1].eduDate.value 		= document.forms[0].searchDate.value;
		document.forms[1].seq.value 				= seq;
		 
		document.forms[1].action = 'oprAttend.act?task=info';
		document.forms[1].submit();
	}
	
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="근태관리" src="/images/operation/title_12.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 --> 
	<html:form method="POST" action="oprAttend.act?task=list">
	<table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
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
            <td class="sBar"></td>
			<td width="59" class="s1">날짜</td>
			<td class="sBar"></td>
			<td class="s2"> 
			  <html:text property="searchDate" style="width:75px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchDate, 'yyyy-mm-dd');">
			</td>
			<td width="60">
			  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch()" style="cursor:hand" align="absbottom"/>
			</td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--검색 테이블 끝-->
	  
	</html:form>
	<!--검색 끝-->
	<table width="750" cellspacing="0" cellpadding="0">
	<tr valign="bottom">
	  <td class="t4" height="25">
	  <c:if test="${eduDate != null}">
		<b>교육기간 : <c:out value="${eduDate}"/></b>
	  </c:if>
	  </td>
	</tr>
	</table>
	<html:form method="POST" action="oprAttend.act?task=insert">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--테이블 헤더 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
            <td class="t1" width="44">교번</td>
            <td class="sBg"></td>
            <td class="t1">소속</td>
            <td class="sBg"></td>
            <td class="t1" width="129">직급</td>
            <td class="sBg"></td>
            <td class="t1" width="79">성명</td>
            <td class="sBg"></td>
            <td class="t1" width="74"><a href="#" onclick="checkAll();"><u>출결</u></a></td>
            <td class="sBg"></td>
            <td class="t1" width="99">비고</td>
            <td class="sBg"></td>
            <td class="t1" width="80">세부</td>
            <td width="17"></td>
          </tr>
		  </table>
		  <!--테이블 헤더 끝-->
		  <!--리스트 시작-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
			<c:forEach var="list" items="${rsOpr_AttendList}" varStatus="i" >
			  <!-- 열 배경 -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <html:hidden property="arrayAttendYN" value="${list.attendYN}"/>
			  <html:hidden property="arrayCourseCode" value="${list.courseCode}"/>
			  <html:hidden property="arraySeq" value="${list.seq}"/>
			  <html:hidden property="arrayEduDate" />
			  <tr class="${lineBg}">
				<td class="t2" width="44">&nbsp;<c:out value="${list.stdNo}"/></td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;<c:out value="${list.assignName}"/>&nbsp;<c:out value="${list.workPlace}"/></td>
                <td class="sBg"></td>
                <td class="t3" width="129">&nbsp;<c:out value="${list.rankName}"/></td>
                <td class="sBg"></td>
                <td class="t2" width="79"><c:out value="${list.stdName}"/></td>
                <td class="sBg"></td>
                <td class="t2" width="74">
                  <c:if test="${list.attendYN == 'Y'}">
                    <input type="checkbox" name="checkbox" value="checkbox" checked>
                  </c:if>
                  <c:if test="${list.attendYN != 'Y'}">
                    <input type="checkbox" name="checkbox" value="checkbox">
                  </c:if>
                </td>
                <td class="sBg"></td>																																																																							
                <td class="t2" width="99">
                  <c:if test="${list.attendYN == 'Y'}">
                    <c:out value="${list.attendName}"/>
                  </c:if>
                  <c:if test="${list.attendYN != 'Y'}">
                    <span class="lend1"><c:out value="${list.attendName}"/></span>
                  </c:if>                        		
                </td>
                <td class="sBg"></td>																																																																							
                <td class="t2" width="80">
                  <c:if test="${list.attendYN != null}">
                    <c:if test="${isPass == '0'}">
                      <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="수정" style="cursor:hand" onclick="doModify(${list.seq});"/>
                    </c:if>
                    <c:if test="${isPass != '0'}">
                      <img src='<html:rewrite page="/images/board/btn_modify_off.gif"/>' align="absmiddle" alt="수정"/>
                    </c:if>
                  </c:if>
                </td>
			  </tr>
			  <tr>
				<td colspan="15" class="lbg3"></td>
			  </tr>
			  <c:set var="no" scope="request" value="${no + 1}"/>
			</c:forEach>
			<html:hidden property="max" value="${no - 1}"/>
			<html:hidden property="courseCode"/>
			<html:hidden property="eduDate"/>
			<html:hidden property="courseName"/>
			<html:hidden property="seq"/>
			<c:if test="${no==1}">
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
	  <!--하단버튼 테이블 시작-->
	  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	  <tr valign="bottom"> 
		<td align="right">
		  <c:if test="${isPass == '0'}">
		    <img src='<html:rewrite page="/images/board/btn_save.gif"/>' alt="저장"  align="absmiddle" style="cursor:hand" onclick="doSubmit(document.forms[1]);"/>
		  </c:if>
		  <c:if test="${isPass != '0'}">
		    <img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' alt="저장"  align="absmiddle"/>
		  </c:if>
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(190);
//-->
</script>