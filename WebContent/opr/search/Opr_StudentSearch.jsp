<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(325);
	}
	function ozReport(data,data1,k)
	{
		var courseCode = data;
		var seq = data1;
		
		if(k==1)
		{//수료증
			url ='<html:rewrite page="/ozMenu.act"/>?report=finish&courseCode='+ courseCode +'&seq=' + seq; 	
			window.open(url,'popup', 'scrollbars = no, menubar = no, width = 710 height =550, status = yes');
		}
		if(k==2)
		{ //교육훈련이수증명원
			url ='<html:rewrite page="/ozMenu.act"/>?report=endconfirm&check_array='+ courseCode+ seq; 	
			window.open(url,'popup', 'scrollbars = no, menubar = no, width = 710 height =550, status = yes');
		}
		if(k==3)
		{ //교육훈련증명원
			url ='<html:rewrite page="/ozMenu.act"/>?report=hun&courseCode='+ courseCode +'&seq=' + seq; 	
			window.open(url,'popup', 'scrollbars = no, menubar = no, width = 710 height =550, status = yes');
		}		if(k==4)		{			url = '<html:rewrite page="/ozMenu.act"/>?report=hak&courseCode='+ courseCode;			window.open(url,'popup', 'scrollbars = no, menubar = no, width = 710 height =550, status = yes');		}
	}
	
	function doSearch(frm)
	{
		if(frm.searchCode.value == "")
		{
			alert("교육생을 선택하고 검색하세요.");
			return;
		}
		frm.submit();
	}
	
	function getUser()
	{
		var searchName 			= document.all.searchName.value;
		var searchPosition 	= document.all.searchPosition.value;
		var searchTrue = false;

		if(searchName == "")
		{
			searchTrue = false;
		}
		else
		{
			searchTrue = "popup";
		}
		window.open('<html:rewrite page="/cmnUser.act?task=list&getType=parent&type=notLend&searchTrue=' + searchTrue + '&searchKeywordUserName=' + searchName + '"/>', 'user', 'scrollbars=no, menubar=no, width=400, height=361, status=yes');
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="학적부관리" src="/images/operation/title_09.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="oprStudentSearch.act?task=list&flag=true" onsubmit="false">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr> 
		<td width="120" class="s1">성명/소속</td>
		<td class="sBar"></td>
		<td class="s2"> 
          <html:hidden property="searchCode"/>
		  <html:text property="searchName" style="width:70px;" maxlength="12" onkeydown="if(event.keyCode==13)getUser();"/>&nbsp;
		  <html:text property="searchPosition" style="width:130px;" readonly="true"/>
		  <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle" alt="교육생 지정" onClick="getUser();" style="cursor:hand"/> 
		</td>
		<td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor:hand"/></td>
	  </tr>
	  </table>
	</html:form>
	<!--검색 끝-->
	<div id="stdInfo" style="visibility:hidden">
	  <table>
	  <tr>
		<td height="15"></td>
	  </tr>
	  <tr>
		<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />개인정보</td>
	  </tr>
	  </table>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--인적사항 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
			<td class="t1 cbg4" width="99">성명</td>
			<td class="sBg"></td>
			<td class="t3" width="272">&nbsp;<c:out value="${rsOpr_StudentSearch.userName}"/></td>
			<td class="sBg"></td>
			<td class="t1 cbg4" width="99">대체키</td>
			<td class="sBg"></td>
			<td class="t3">&nbsp;<c:out value="${rsOpr_StudentSearch.juminNo}"/></td>
		  </tr>
		  <tr>
			<td colspan="7" class="lbg3"></td>
		  </tr>
		  <tr> 
		    <td class="t1 cbg4" width="99">소속</td>
			<td class="sBg"></td>
			<td class="t3" width="272">&nbsp;<c:out value="${rsOpr_StudentSearch.position}"/></td>
			<td class="sBg"></td>
			<td class="t1 cbg4" width="99">직급</td>
			<td class="sBg"></td>
			<td class="t3">&nbsp;<c:out value="${rsOpr_StudentSearch.grade}"/></td>
		  </tr>
		  <tr>
			<td colspan="7" class="lbg3"></td>
		  </tr>
		  <tr> 
			<td class="t1 cbg4" width="99">연락처</td>
			<td class="sBg"></td>
			<td class="t3" width="272">&nbsp;<c:out value="${rsOpr_StudentSearch.cellPhone}"/></td>
			<td class="sBg"></td>
			<td class="t1 cbg4" width="99">이메일</td>
			<td class="sBg"></td>
			<td class="t3">&nbsp;<c:out value="${rsOpr_StudentSearch.email}"/></td>
		  </tr>
		  </table>
		  <!--인적사항 끝-->
		</td>
	  </tr>
	  </table>	
	  <table>
	  <tr>
		<td height="15"></td>
	  </tr>
	  <tr>
		<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />개인이수정보</td>
	  </tr>
	  </table>					
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--테이블 헤더 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr>
			<td class="t1" width="44">번호</td>
			<td class="sBg"></td>
			<td class="t1">과정명</td>
			<td class="sBg"></td>
			<td class="t1" width="109">교육기간</td>
			<td class="sBg"></td>
			<td class="t1" width="69">이수여부</td>
			<td class="sBg"></td>
			<td class="t1" width="89">수료증</td>
			<td class="sBg"></td>
			<td class="t1" width="120">교육훈련이수증명원</td>
			<td width="17"></td>
		  </tr>
		  </table>
		  <!--테이블 헤더 끝-->
		  <!--리스트 시작-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll; overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="total" scope="request" value="0"/>
			<c:set var="no" scope="request" value="1"/>
			<c:forEach var="list" items="${rsOpr_StudentSearchList}" varStatus="i" >
			  <!-- 열 배경 -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
				<td class="t2" width="44"><c:out value="${no}"/></td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;<c:out value="${list.courseName}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="109"><c:out value="${list.eduDate}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="69"><c:out value="${list.isFinish}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="89">
				  <c:if test="${list.isFinish == '이수'}">
				    <img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle" alt="인쇄" style="cursor:hand" onclick="ozReport('${list.courseCode}','${list.seq}','1');"/>
				  </c:if>
				</td>
				<td class="sBg"></td>
				<td class="t2" width="120">
				  <c:if test="${list.isFinish == '이수'}">
					<img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle" alt="인쇄" style="cursor:hand" onclick="ozReport('${list.courseCode}','${list.seq}','2');"/>
				  </c:if>
				</td>
			  </tr>
			  <tr>
				<td colspan="13" class="lbg3"></td>
			  </tr>
			  <c:set var="no" scope="request" value="${no + 1}"/>
			</c:forEach>											
			<html:hidden property="max" value="${no}"/>
			<input type="hidden" id="flag" name="flag" value="${flag}"/>
			<c:if test="${no==1}">
			  <tr class="tbg3" height="21">
				<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
			  </tr>
			</c:if>
			</table>
		  </div>
		  <!--리스트 끝-->
		  <!--리스트 계 시작-->
		  <c:if test="${total != 0}">
			<table width="746" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td class="t2BgRed">계 </td>
			  <td class="sBg"></td>
			  <td class="t2BgRed" width="90"><c:out value="${total}"/> 시간 </td>
			  <td class="t2BgRed" width="17"></td>
			</tr>
			</table>
		  </c:if>
		  <!--리스트 계 끝-->
		  
		</td>
	  </tr>
	  </table>
	  <!--하단버튼 테이블 끝-->
	  <div style="float:left; margin-top:5px;">
		  <img src='<html:rewrite page="/images/board/btn_name_print5.gif"/>' width="86" height="25" align="absmiddle" alt="학적부인쇄" style="cursor:hand" onclick="ozReport('${rsOpr_StudentSearch.juminNo2}','',4)"/>
		</div>
	</div>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(325);
	document.forms[0].searchName.focus();
	
	var flag = document.all.flag.value;	
	if(flag == 'Y')
	{
		document.all.stdInfo.style.visibility = "visible";
	}
//-->
</script>