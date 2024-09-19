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
	
	function goList()
	{
		document.all.searchKeyword.value = "";
		
		document.forms[0].action = 'prfLectAcom.act?task=list';
		
		document.forms[0].submit();
	}
	function getPrf()
	{
		var searchKeyword = document.all.searchKeyword.value;
		
		window.open('<html:rewrite page="/prfLectAcom.act?task=getPrf&flag=true&searchKeyword=' + searchKeyword + '"/>', 'popup', 'scrollbars=no, menubar=no, width=400, height=361, status=yes top=150, left=150');
	}
	function doSearch(frm)
	{
		if(frm.searchCode.value == "")
		{
			alert("강사를 선택하세요.");
			return;
		}
		frm.submit();
	}
	function doSubmit(frm)
	{
		var max = Number(frm.max.value);
		var flag = "false";
			
		// 검색결과 1 (배열아님)
		if(max == 1)
		{
			if(frm.checkbox.checked == true)
			{
				frm.arraySelect.value = "true";
				flag = "true";
			}
			else
			{
				frm.arraySelect.value = "false";
			}
		}
		// 검색결과 1 이상 (배열)
		else
		{
			for(var i = 0; i < max; i++ )
			{
				if(frm.checkbox[i].checked == true)
				{
					frm.arraySelect[i].value = "true";
					flag = "true";
				}
				else
				{
					frm.arraySelect[i].value = "false";
				}
			}
		}
		if(flag == "false")
		{
			alert("발행할 강의내역을 선택하세요.")
			return;
		}
		
		frm.submit();		
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/teacher/title_04-3.gif"/>' alt="강의실적확인-신규"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<!--검색 -->
						<html:form method="POST" action="prfLectAcom.act?task=create&flag=true" onsubmit="false">
						<html:hidden property="searchKeywordYear" value="${searchKeywordYear}"/>
							<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
								<tr> 
								  <td width="120" class="s1">강사이름/소속</td>
								  <td class="sBar"></td>
								  <td class="s2"> 
                		<html:hidden property="searchCode"/>
								    <html:text property="searchKeyword" style="width:70px;" onkeydown="if(event.keyCode==13)getPrf();"/>
								    <html:text property="searchKeywordPosition" style="width:130px;" readonly="true"/>
								    <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle" alt="강사지정" onClick="getPrf();" style="cursor:hand"/> 
								  </td>
								  <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor:hand"/></td>
								</tr>
							</table>
						</html:form>
						<!--검색 끝-->
						<html:form method="POST" action="prfLectAcom.act?task=insert">
						<c:if test="${flag == 'Y'}">
						<table>
							<tr>
			        	<td height="10"></td>
							</tr>
							<tr>
			        	<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />인적사항</td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--인적사항 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<html:hidden property="profNo" value="${selectPrf_LectProfSearch.profNo}"/>
										<tr> 
										  <td class="t1 cbg4" width="99">소속</td>
											<td class="sBg"></td>
										  <td class="t3" width="272">
										  	&nbsp;<c:out value="${selectPrf_LectProfSearch.asSign}"/>
										  	<html:hidden property="asSign" value="${selectPrf_LectProfSearch.asSign}"/>
									  	</td>
											<td class="sBg"></td>
										  <td class="t1 cbg4" width="99">직위</td>
											<td class="sBg"></td>
										  <td class="t3">
										  	&nbsp;<c:out value="${selectPrf_LectProfSearch.position}"/>
										  	<html:hidden property="position" value="${selectPrf_LectProfSearch.position}"/>
									  	</td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr> 
										  <td class="t1 cbg4" width="99">성명</td>
											<td class="sBg"></td>
										  <td class="t3" width="272">&nbsp;<c:out value="${selectPrf_LectProfSearch.profName}"/></td>
											<td class="sBg"></td>
										  <td class="t1 cbg4" width="99">생년월일</td>
											<td class="sBg"></td>
										  <td class="t3">&nbsp;<c:out value="${selectPrf_LectProfSearch.profBirth}"/></td>
										</tr>
									</table>
									<!--인적사항 끝-->
								</td>
							</tr>
						</table>	
						<table>
							<tr>
			        	<td height="10"></td>
							</tr>
							<tr>
			        	<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />강의내역</td>
							</tr>
						</table>					
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="39"><a href="#" onclick="checkAll();"><u>선택</u></a></td>
											<td class="sBg"></td>
											<td class="t1" width="44">연도</td>
											<td class="sBg"></td>
											<td class="t1">과정명</td>
											<td class="sBg"></td>
											<td class="t1" width="79">교육일</td>
											<td class="sBg"></td>
											<td class="t1" width="79">교육시간</td>
											<td class="sBg"></td>
											<td class="t1" width="194">주제</td>
											<td class="sBg"></td>
											<td class="t1" width="80">강의시간</td>
											<td width="17"></td>
										</tr>
									</table>
									<!--테이블 헤더 끝-->
									<!--리스트 시작-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
										<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
											<c:set var="total" scope="request" value="0"/>
											<c:set var="no" scope="request" value="0"/>
											<c:forEach var="list" items="${rsPrf_LectAcomSearchList}" varStatus="i" >
												<html:hidden property="arraySelect"/>
												<html:hidden property="arrayLectYear" value="${list.year}"/>
												<html:hidden property="arrayCourseCode" value="${list.courseCode}"/>
												<html:hidden property="arrayCourseName" value="${list.courseName}"/>
												<html:hidden property="arraySubjSeq" value="${list.subjSeq}"/>
												<html:hidden property="arraySubjName" value="${list.subjName}"/>
												<html:hidden property="arrayLectDate" value="${list.lectDate}"/>
												<html:hidden property="arrayLectTime" value="${list.lectTime}"/>
												<html:hidden property="arrayLectHour" value="${list.eduHour}"/>
												<!-- 열 배경 -->
												<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
												<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
												<tr class="${lineBg}">
													<td class="t2" width="39"><input type="checkbox" name="checkbox" value="checkbox"></td>
													<td class="sBg"></td>
													<td class="t2" width="44"><c:out value="${list.year}"/></td>
													<td class="sBg"></td>
													<td class="t3">&nbsp;<c:out value="${list.courseName}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="79"><c:out value="${list.lectDate}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="79"><c:out value="${list.lectTime}"/></td>
													<td class="sBg"></td>
													<td class="t3" width="194">&nbsp;<c:out value="${list.subjName}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="80"><c:out value="${list.eduHour}"/> 시간</td>
												</tr>
												<tr>
													<td colspan="13" class="lbg3"></td>
												</tr>
												<c:set var="total" scope="request" value="${total + list.eduHour}"/>
												<c:set var="no" scope="request" value="${no + 1}"/>
											</c:forEach>
											<html:hidden property="max" value="${no}"/>
											<c:if test="${no==0}">
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
												<td class="t2BgRed" width="80"><c:out value="${total}"/> 시간 </td>
												<td class="t2BgRed" width="17"></td>
											</tr>
										</table>
									</c:if>
									<!--리스트 계 끝-->
								</td>
							</tr>
						</table>
						</c:if>
						<!--하단버튼 테이블 시작-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom">
								<td>
									<c:if test="${flag == 'Y'}">
										<img src='<html:rewrite page="/images/board/btn_make.gif"/>' align="absmiddle" alt="발행생성" onclick="doSubmit(document.forms[1]);" style="cursor:hand"/>
									</c:if>
								</td> 
								<td align="right">
                  <img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList();" style="cursor:hand"/>
								</td>
							</tr>
						</table>	
		    		</html:form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
	document.forms[0].searchKeyword.focus();
</script>
<c:if test="${flag == 'Y'}">
<!--하단버튼 테이블 끝-->
<script type="text/javascript">
<!--
	tresize(330);
//-->
</script>								    
</c:if>	