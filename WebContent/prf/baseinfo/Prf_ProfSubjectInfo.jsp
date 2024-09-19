<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script type="text/javascript" src='<html:rewrite page="/script/Prf_ProfInfo.js"/>'></script>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<!-- <script src="/common/js/CommonCourseSearch.js"></script> -->

<script language="JavaScript">
	function ozReport(profno)
	{
		window.open('<html:rewrite page="/ozMenu.act"/>?report=professor_info&profno=' + profno, 'professor_info', 'scrollbars=no, resizable=yes, menubar=no, width=710, height=550, status=yes');
	}
	function doSearch1(frm){
		var searchYearFrom = frm.searchYearFrom.value.trim();
		var searchYearTo = frm.searchYearTo.value.trim();
		var searchCourseName = frm.searchCourseName.value.trim();
		var searchSubjName = frm.searchSubjName.value.trim();
		var searchLecType = frm.searchLecType.value.trim();
		var searchProfLevel = frm.searchProfLevel.value.trim();
		var searchGradeCode = frm.searchGradeCode.value.trim();
		var searchAreaCode = frm.searchAreaCode.value.trim();
		var searchName = frm.searchName.value.trim();
		var searchIsInnerCode = frm.searchIsInnerCode.value.trim();
		
		if(searchCourseName == '' && searchSubjName == '' && searchLecType == '' && searchProfLevel == '' && searchGradeCode == ''
			&& searchAreaCode == '' && searchName == '' && searchIsInnerCode == '')
		{
			if(!confirm("검색조건을 입력 안하시면 시간이 오래걸릴 수 있습니다.\n검색하시겠습니까?")) {
				return;
			}
		}
		frm.action = "prfSubjectInfo.act?task=list";
		frm.submit();
	}
	
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="강사현황조회" src="/images/teacher/title_07.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--검색 -->
			<html:form method="POST" action="prfBaseInfo.act?task=list">
				<html:hidden property="professorNo" />
				<html:hidden property="courseCode" />
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
					<colgroup>
						<col width="100px"/>
						<col width="2px"/>
						<col width="260px"/>
						<col width="2px"/>
						<col width="100px"/>
						<col width="2px"/>
						<col width="180px"/>
						<col width="2px"/>
						<col width="100px"/>
						<col width="2px"/>
						<col />
					</colgroup>
					<tr valign="middle">
						<td width="90" class="s1">연도</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
						<html:select property="searchYearFrom" style="width:65px">
							<%String toDate = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
							  int selectYear = Integer.parseInt(toDate) - 2;
								for (int i=Integer.parseInt(toDate); i>=1962; i--) {
									if(i == selectYear){											
							%>
							<option value="<%=selectYear%>" selected="selected"><%=selectYear%>년</option>
							<%} else { %>							
							<option value="<%= i %>"><%= i %>년</option>
							<% }}%>
						</html:select>
						~
						<html:select property="searchYearTo" style="width:65px">
							<%String toDate1 = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
								for (int i=Integer.parseInt(toDate1) ; i>=1962; i--) {
							%>
							<option value="<%= i %>"><%= i %>년</option>
							<% }%>
						</html:select>
						
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">과정명</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:text property="searchCourseName" style="width:114px;" />
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">과목명</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:text property="searchSubjName" style="width:114px;" />
						</td>
					</tr>
					<tr>
						<td colspan="12" class="lbg3"></td>
					</tr>
					<tr valign="middle">
						<td width="90" class="s1">강의분야</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:select property="searchLecType" style="width:120px">
								<html:optionsCollection name="prfLecCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">강사등급</td>
						<td class="sBar"></td>
						<td class="s2" width="140">
							<html:select property="searchProfLevel" style="width:120px">
								<html:optionsCollection name="prfProLevelCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">직업군</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:select property="searchGradeCode" style="width:130px">
								<html:optionsCollection name="prfGradeCode" property="beanCollection" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td colspan="12" class="lbg3"></td>
					</tr>
					<tr>
						<td width="90" class="s1">지역</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:select property="searchAreaCode" style="width:50px">
								<html:optionsCollection name="prfAreaCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td class="s1">원내구분</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:select property="searchIsInnerCode" style="width:50px">
								<html:optionsCollection name="prfisInnerCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td class="s1">성명</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:text property="searchName" style="width:114px;" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
						<td class="sBar"></td>
						<td class="s2" colspan="7"></td>
						<td width="60" align="center">
							<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch1(document.forms[0]);" style="cursor: hand" align="absbottom" />
						</td>
					</tr>
				</table>
				<!--검색 끝-->
				<table width="750" cellspacing="0" cellpadding="0">
					<tr valign="bottom">
						<td class="t4" height="25" id="prof_count"></td>
					</tr>
				</table>
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--테이블 헤더 시작-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<td class="t1Line" width="30"></td>
									<td class="t1Line" width="210">과정</td>
									<td class="t1Line" width="210">과목</td>
									<td class="t1Line" width="60">원내구분</td>
									<td class="t1Line" width="60">소속</td>
									<td class="t1Line" width="51">성명</td>
									<td class="t1Line" width="64">교육일자</td>
									<td class="t1Line" width="63">만족도</td>
								</tr>
							</table>
							<!--테이블 헤더 끝-->
							<!--리스트 시작-->
							<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
									<c:forEach var="list" items="${rsPrf_ProfSubjectList}" varStatus="i">
										<c:if test="${i.count%2 == 0}">
											<c:set var="lineBg" scope="request" value="tbg3" />
										</c:if>
										<c:if test="${i.count%2 == 1}">
											<c:set var="lineBg" scope="request" value="" />
										</c:if>
										<tr class="${lineBg}">
											<c:if test="${list.infoDelYn != 'Y'}">
												<td class="t2Line" width="30">
													<c:out value="${i.count}" />
												</td>
												<td class="t3Line" width="210">
													&nbsp;<c:out value="${list.courseName}" />
												</td>
												<td class="t3Line" width="210">
													&nbsp;<c:out value="${list.subjName}" />
												</td>
												<td class="t2Line" width="60">
													&nbsp;<c:out value="${list.isInnerProf}" />
												</td>
												<td class="t2Line" width="60">
													&nbsp;<c:out value="${list.workPlace}" />
												</td>
												<td class="t2Line" width="51">
													&nbsp;<c:out value="${list.profName}" />
												</td>
												<td class="t2Line" width="64">
													${fn:substring(list.lectDate,0,4) }.${fn:substring(list.lectDate,4,6) }.${fn:substring(list.lectDate,6,8) }  
												</td>
												<td class="t2Line" width="45">
													<c:if test="${list.professorNo != null}">
														<img src='<html:rewrite page="/images/board/btn_s_search2.gif"/>' align="absmiddle" alt="조회" onclick='showSatis(${list.professorNo}, ${list.courseCode})' style="cursor: hand" />
													</c:if>
												</td>
											</c:if>
										</tr>
										<c:set value="${i.count}" var="count"></c:set>
									</c:forEach>
									<c:if test="${count==null}">
										<tr class="tbg3" height="21">
											<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
										</tr>
									</c:if>
								</table>
							</div>
							<!--리스트 끝-->
						</td>
					</tr>
				</table>
			</html:form>
		</td>
	</tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<!-- <script type="text/javascript">
<!--
	tresize(245);
	var count = Number(${count});
	document.all.prof_count.innerHTML = '<b>강사현황 : '+count+'/${prof_count}</b>';
//-->
</script>