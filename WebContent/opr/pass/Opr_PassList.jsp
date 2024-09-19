<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   윈도우 사이즈 변경 셋팅 코드
		tresize(195);
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
		var check = false;
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		// 검색결과가 1개일 경우
		if(max == 1)
		{				
			if(frm.checkbox.checked == true)
			{
				frm.arraySelect.value = "Y";
				check = true;
			}
			else
			{
				frm.arraySelect.value = "N";
			}
		}
		// 검색결과가 여러개일 경우
		else
		{
			for(var i=0; i<max; i++)
			{				
				if(frm.checkbox[i].checked == true)
				{
					frm.arraySelect[i].value = "Y";
					check = true;
				}
				else
				{
					frm.arraySelect[i].value = "N";
				}
			}
		}
		
		frm.courseCode.value 	= document.all.searchCourseCode.value;
		frm.courseName.value 	= document.all.searchCourseName.value;
		frm.orderRule.value 	= document.all.searchOrderRule.value;
		
		var do_confirm;
		
		if(check == false)
		{
			do_confirm = confirm('선택하신 교육생이 없습니다.\n모두 미이수 처리하시겠습니까?');
			if(do_confirm == false)
			{
				return;
			}
		}
		else
		{		
			do_confirm = confirm('이수처리 하시겠습니까?');
			if(do_confirm == false)
			{
				return;
			}
		}
		
		frm.submit();
	}
	
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&isCyber=false&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	function passList(){
		if(document.forms[0].searchCourseName.value == ''){
			alert('과정을 선택해주세요.');
			return;
		}
		if(document.forms[0].searchKeyword.value == ''){
			alert('과정기수를 선택해주세요.');
			return;
		}
		var courseCode = getSearchCourseCode();
		window.open('<html:rewrite page="/oprPassList.act?task=list&searchCourseCode=' + courseCode +'"/>', '수료자명단', 'scrollbars=no, menubar=no, width=50, height=50, status=no top=150, left=150');
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="과정별 이수현황" src="/images/operation/title_35.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--검색 -->
	<html:form method="POST" action="oprPassList.act?task=list">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr> 
		<td width="59" class="s1">과정</td>
            <td class="sBar"></td>
			<td class="s2" width="400"> 
			  <select id="searchYear"></select>
			  <select id="searchCourseName" style="width:200px;">
			  	<option value="">과정 선택</option>
			  </select>
			  <select id="searchKeyword" style="width:100px;">
			  	<option value="">과정기수 선택</option>
			  </select>
			  <html:hidden property="searchColumn"/>
			  <html:hidden property="searchCourseCode"/>
			</td>
		<td class="sBar"></td>
		<td width="59" class="s1">이수</td>
		<td class="sBar"></td>
		<td class="s2" width="70"> 
		  <html:select property="searchIsFinish" style="width:60px">
			<html:option value="">전체</html:option>
			<html:option value="Y">이수</html:option>
			<html:option value="N">미이수</html:option>
		  </html:select>
		</td>
		<td class="sBar"></td>
		<td width="59" class="s1">정렬</td>
		<td class="sBar"></td>
		<td class="s2" width="70"> 
		  <html:select property="searchOrderRule" style="width:60px">
			<html:option value="stdNo">교번</html:option>
			<html:option value="ranking">석차</html:option>
		  </html:select>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch()" style="cursor:hand" align="absbottom"/>
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--검색 끝-->
	<table>
	  <tr>
		<td height="15"></td>
	  </tr>
	  <tr> 
	  <td height="15" align="left">
	  	<c:if test="${stdcount != null}">
	  		총 ${stdcount }명
	  	</c:if>
	  </td>
	</tr>
	</table>
	<html:form method="POST" action="oprPassList.act?task=list">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--테이블 헤더 시작-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
		  	<td class="t1" width="49"><a href="#" onclick="checkAll();"><u>선택</u></a></td>
			<td class="sBg"></td>
			<td class="t1" width="79">이수번호</td>
			<td class="sBg"></td>
			<td class="t1" width="59">교번</td>
			<td class="sBg"></td>
			<td class="t1">부서</td>
			<td class="sBg"></td>
			<td class="t1" width="89">성명</td>
			<td class="sBg"></td>
			<td class="t1" width="69">근태</td>
			<td class="sBg"></td>
			<td class="t1" width="69">총점</td>
			<td class="sBg"></td>
			<td class="t1" width="69">석차</td>
			<td class="sBg"></td>
			<td class="t1" width="79">이수<br>판정</td>
			<td width="17"></td>
		  </tr>
		  </table>
		  <!--테이블 헤더 끝-->
		  <!--리스트 시작-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
			<c:set var="checked" scope="request" value=""/>
			<c:forEach var="list" items="${rsOpr_PassList}" varStatus="i" >
			  <!-- 열 배경 -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <html:hidden property="arraySelect" />
			  <html:hidden property="arrayCourseCode" value="${list.courseCode}"/>
			  <html:hidden property="arraySeq" value="${list.seq}"/>
			  <html:hidden property="arrayScoreTotal" value="${list.scoreTotal}"/>
			  <html:hidden property="arrayStdNo" value="${list.stdNo}"/>
			  <html:hidden property="arrayPassseq" value="${list.passseq }"/>
			  <tr class="${lineBg}">
			  <td class="t2" width="49">
				  <c:if test="${list.isFinish == 'Y'}">
				    <input type="checkbox" name="checkbox" checked="checked" value="${list.courseCode}${list.seq}">
				  </c:if>
				  <c:if test="${list.isFinish != 'Y'}">
				    <input type="checkbox" name="checkbox" value="${list.courseCode}${list.seq}">
				  </c:if>
				</td>
				<td class="sBg"></td>
				<td class="t2" width="79">
				<c:out value="${list.passseq }"/>
				</td>
				<td class="sBg"></td>
				<td class="t2" width="59"><c:out value="${list.stdNo}"/></td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;<c:out value="${list.assignName} ${list.workPlace}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="89"><c:out value="${list.stdName}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="69"><c:out value="${list.scoreAttend}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="69"><c:out value="${list.scoreTotal}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="69"><c:out value="${list.ranking}"/></td>
				<td class="sBg"></td>
				<td class="t2" width="79">
				  <c:if test="${list.isFinish == 'Y'}">
					<span class="lend1">이수</span>
					<html:hidden property="isFinish" value="Y"/>
				  </c:if>
				  <c:if test="${list.isFinish == 'N'}">
					<span class="lend2">미이수</span>
					<html:hidden property="isFinish" value="N"/>
				  </c:if>
				  <c:if test="${list.isFinish == null}">
					<html:hidden property="isFinish" value="NOTPASS"/>
				  </c:if>
				</td>
			  </tr>
			  <tr>
				<td colspan="31" class="lbg3"></td>
			  </tr>
			  <c:set var="no" scope="request" value="${no + 1}"/>
			  <c:set var="ranking" scope="request" value="${list.ranking}"/>
			</c:forEach>
			<html:hidden property="max" value="${no - 1}"/>
			<html:hidden property="courseCode"/>
			<html:hidden property="courseName"/>
			<html:hidden property="orderRule"/>
			<html:hidden property="lectureType" value="collection"/>
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
		  <img src='<html:rewrite page="/images/pass_list_print.gif"/>' align="absmiddle" alt="과정별 수료자명부 인쇄" style="cursor:hand" onclick="ozReport('3');"/>
		  <img src='<html:rewrite page="/images/board/btn_print3.gif"/>' align="absmiddle" alt="수료증인쇄" style="cursor:hand" onclick="ozReport('1');"/>
		  <img src='<html:rewrite page="/images/board/btn_print5.gif"/>' align="absmiddle" alt="교육훈련이수증명원 인쇄" style="cursor:hand" onclick="ozReport('2');"/> 
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<form name="toFrm">
<input type="hidden" name="report">
<input type="hidden" name="check_array" size="50">
<input type="hidden" name="arrayStdNo" size="50">
</form>
<script type="text/javascript">
<!--
	tresize(195);
	
	function ozReportPassLog()
	{		
		window.open('<html:rewrite page="/ozMenu.act"/>?report=passLog','popup', 'scrollbars = no, resizable=yes,menubar = no, width = 710 height =550, status = yes');
	}
	
	function ozReport(gubun)
	{
	  var ch="";
		var max = Number(document.forms[1].max.value);
		var count = 0;
		var check ="";
		var stdNo="";
			
		//검색결과가 없을경우 - 오즈리포트창을 열지않음
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		if(gubun == 1 || gubun == 2){
			//검색결과가 하나일경우
			if(max == 1)
			{
				if(document.forms[1].checkbox.checked == true)
				{
					stdNo = document.forms[1].arrayStdNo.value;
					
					if(document.forms[1].isFinish.value == "Y")
					{
						ch = ch + document.forms[1].checkbox.value + ",";
						check = true;
					}
					else if(document.forms[1].isFinish.value == "NOTPASS")
					{
						check = false;
						alert("이수처리하지 않은 데이터는 인쇄할 수 없습니다.\n[교번:" + stdNo + "]");
						return;
					}
					else
					{
						check = false;
						alert("미이수 인원이 선택되어 있습니다.\n[교번:" + stdNo + "]");
						return;
					}
					count++;
				}
			}//검색결과가 여러개일 경우
			else
			{
				for(var i=0; i<max; i++)
				{
					var stdNo = document.forms[1].arrayStdNo[i].value;
					
					if(document.all.checkbox[i].checked == true)
					{
						if(document.forms[1].isFinish[i].value == "Y")
						{
							ch = ch+ document.all.checkbox[i].value+ ",";
							check = true;
						}
						else if(document.forms[1].isFinish[i].value == "NOTPASS")
						{
							check = false;
							alert("이수처리하지 않은 데이터는 인쇄할 수 없습니다.\n[교번:" + stdNo + "]");
							return;
						}
						else
						{
							check = false;
							alert("미이수 인원이 선택되어 있습니다.\n[교번:" + stdNo + "]");
							return;
						}
						count++;
					}
				}
			}
			document.all.check_array.value = ch.substring(0, ch.length - 1); 
			//체크박스 선택을 하지 않았을때
			if(count == 0)
			{
				alert("한 건 이상 선택하여 주세요.");
				return;
			}
			document.forms[2].action = "ozMenu.act";
		}
		
		
		var str;
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=710,height=550,top="+wint+",left="+winl;  	
	    
	  if(gubun==1)
		{
			document.forms[2].report.value = "end";
		}
		else if(gubun==2)
		{
			document.forms[2].report.value = "endconfirm";
		}
		if(gubun == 1 || gubun == 2){
		window.open('','popup', str);
		
		document.forms[2].target = "popup";			
		document.forms[2].submit();		
		document.forms[2].target = "";
		}
		else if(gubun==3)
			{
			if(document.forms[0].searchCourseName.value == ''){
				alert('과정을 선택해주세요.');
				return;
			}
			if(document.forms[0].searchKeyword.value == ''){
				alert('과정기수를 선택해주세요.');
				return;
			}
			var courseCode = getSearchCourseCode();
			window.open('ozMenu.act?report=finishList&courseCode='+courseCode,'popup',str);

			}
	 	
		
	}
//-->
</script>