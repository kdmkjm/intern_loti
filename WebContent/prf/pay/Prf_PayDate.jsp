<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(198);
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
	
	function doSearch(frm)
	{
		frm.submit();
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="지급 내역 조회" src="/images/teacher/title_05.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="/prfPay.act?task=searchDate" >
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr valign="middle">
		<td width="119" class="s1">검색기준일</td>
		<td class="sBar"></td>
		<td class="s2"> 
		  <html:text property="searchFrom" style="width:75px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="middle" style="cursor:hand" onclick="Calendar_D(this, searchFrom, 'yyyy-mm-dd');">
			&nbsp;~&nbsp;
		  <html:text property="searchTo" style="width:75px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="middle" style="cursor:hand" onclick="Calendar_D(this, searchTo, 'yyyy-mm-dd');">
		</td>
        <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor:hand" align="absbottom"/></td>
	  </tr>
	  </table>
	</html:form>
	<!--검색 끝-->
	<table>
	  <tr>
		<td height="15"></td>
	  </tr>
	</table>
	<html:form method="POST" action="/prfPay.act?task=insert" >
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--테이블 헤더 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr>
			<td class="t1" width="39"><a href="#" onclick="checkAll();"><u>선택</u></a></td>
			<td class="sBg"></td>
			<td class="t1" width="89">출강일자</td>
			<td class="sBg"></td>
			<td class="t1">과정명</td>
			<td class="sBg"></td>
			<td class="t1" width="99">강사명</td>
			<td class="sBg"></td>
			<td class="t1" width="89">강사구분</td>
			<td class="sBg"></td>
			<td class="t1" width="109">강의시간</td>
			<td class="sBg"></td>
			<td class="t1" width="79">이체내역</td>
			<td class="t1" width="17"></td>
		  </tr>
		  </table>
		  <!--테이블 헤더 끝-->
		  <!--리스트 시작-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="0"/>
			<c:forEach var="list" items="${rsPrf_PaySearchDate}" varStatus="i" >
			  <!-- 열 배경 -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
				<td class="t2" width="39"><input type="checkbox" name="checkbox" value="${list.courseCode}${list.lectDate}${list.profNo}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="89">${list.lectDate}</td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;${list.courseName}</td>
				<td class="sBg"></td>
				<td class="t2" width="99">${list.profName}</td>
				<td class="sBg"></td>
				<td class="t2" width="89">${list.profLevel}</td>
			    <td class="sBg"></td>
				<td class="t2" width="109">${list.eduTime}<br>${list.lectHour}</td>
				<td class="sBg"></td>
				<td class="t4" width="79"><fmt:formatNumber value="${list.netPay}" pattern="#,##0"/>&nbsp;</td>
			  </tr>
			  <tr>
				<td colspan="21" class="lbg3"></td>
			  </tr>
			  <c:set var="no" scope="request" value="${no + 1}"/>
			</c:forEach>
			<html:hidden property="max" value="${no}"/>
			<c:if test="${no==0}">
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
	  <c:if test="${no!=0}">
		<!--하단버튼 테이블 시작-->
		<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
		<tr valign="middle" class="stitle">
		  <td width="180">
			<img src='<html:rewrite page="/images/board/dot.gif"/>' align="middle"/>출력일 <html:text property="printDate" style="width:75px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="middle" style="cursor:hand" onclick="Calendar_D(this, printDate, 'yyyy-mm-dd');">
		  </td> 
		  <td width="220">
			<img src='<html:rewrite page="/images/board/dot.gif"/>' align="middle"/>확인자 <html:text property="printUser" style="width:150px;"/>
		  </td>
		  <td align="right">
			<img src='<html:rewrite page="/images/board/btn_print.gif"/>' alt="인쇄" align="middle" style="cursor:hand" onclick="ozReport();" />
		  </td>
		</tr>
		</table>
	  </c:if>
	</html:form>
  </td>
</tr>
</table>
<form name="toFrm">
<input type="hidden" name="report">
<input type="hidden" name="check_array" size="50">
<input type="hidden" name="profNo" size="50">
<input type="hidden" name="printDate">
<input type="hidden" name="printUser">
</form>
<script type="text/javascript">
<!--
	tresize(198);

	function ozReport()
	{	   
	    var ch="";
		var max = Number(document.forms[1].max.value);
		var count = 0;
		var check ="";
		var ProfNo="";
		var profName="";
		document.forms[2].printDate.value =  document.forms[1].printDate.value;
		document.forms[2].printUser.value =  document.forms[1].printUser.value;
		
		
		//검색결과가 없을경우 - 오즈리포트창을 열지않음
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		//검색결과가 하나일경우
		if(max == 1)
		{
			if(document.forms[1].checkbox.checked == true)
			{
				ch = ch + document.forms[1].checkbox.value + ",";
				check = true;	
			}				
			count++;
		}		
		//검색결과가 여러개일 경우
		else
		{
			for(var i=0; i<max; i++)
			{
				if(document.all.checkbox[i].checked == true)
				{
					ch = ch+ document.all.checkbox[i].value+ ",";
					check = true;
						
				}
				else
				{
					check = false;
				}
				count++;
			}
		}
		 document.all.check_array.value = ch.substring(0, ch.length - 1); 
		//체크박스 선택을 하지 않았을때
		if(ch == 0)
		{
			alert("한 건 이상 선택하여 주세요.");
			return;
		}
		
		document.forms[2].report.value = "prf";
		
		var str 
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "toolbar=no,location=no,directories=no,'scrollbars = no,resizable=yes, menubar = no,status = yes, width = 710 height =550',top="+wint+",left="+winl;  	
		window.open('','popup', str);
		document.forms[2].action = "ozMenu.act"
		document.forms[2].target = "popup";			
		document.forms[2].submit();		
		document.forms[2].target = "";
	}	
//-->
</script>