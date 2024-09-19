<%@ page language="java" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src='/script/Prf_ProfInfo.js'></script>
<script language="JavaScript">
	$.noConflict();
	function goList()
	{
		document.forms[0].action = 'prfBaseInfo.act?task=list';
		document.forms[0].target = '_self';
		document.forms[0].submit();
	}
	
	//오즈리포트출력(출강확인서)
	function ozReport(k)
	{
		var professorNo = ${rsPrf_ProfInfo.professorNo};
		var searchFromDate = document.forms[1].searchFromDate.value.trim();
		var searchToDate = document.forms[1].searchToDate.value.trim();
		
		if(k==1)
			{ //출강확인서
				url = '<html:rewrite page="/ozMenu.act"/>?report=prf_study&professorNo='+professorNo + "&searchFromDate="+ searchFromDate +"&searchToDate=" +searchToDate;
				window.open(url,'prf_study','scrollbars = no, resizable=yes, menubar = no, width=710 height=750, status=yes');
			}
	}

	//엑셀 다운로드
	function excelDown(num)
	{
		var professorNo = num;
		var url = '${pageContext.request.contextPath}/prfBaseInfo.act?task=excel&professorNo=' + professorNo;
		document.location.href = url;
	}

	function newLectInfo(){
		var size_w = 560;
  		var size_h = 190;
  		var top = (screen.height-size_h)/2;
  		var left = (screen.width-size_w)/2;
  		var url = '/prfBaseInfo.act?task=newLectInfoForm&professorNo=${rsPrf_ProfInfo.professorNo}';
  		var target = '_blank';
		window.open(url, target, "width="+size_w+", height="+size_h+", top="+top+", left="+left+", scrollbars=yes, toolbar=no, menubar=no, location=no");
	}

	function updateCareer(lectDate, courseCode, timeSeq, lectHour, lecturetype){
		var size_w = 560;
  		var size_h = 190;
  		var top = (screen.height-size_h)/2;
  		var left = (screen.width-size_w)/2;
  		var target = 'carrerPop';

  		var f = document.forms[0];
  		try {
	  		f.action = 'prfBaseInfo.act?do=update';
	  		f.task.value = 'newLectInfoForm';
	  		f.professorNo.value = '${rsPrf_ProfInfo.professorNo}';
	  		f.courseCode.value = courseCode;
	  		f.searchCourseCode.value = courseCode;
	  		f.searchColumn.value = courseCode.substring(3,7);
	  		f.subjName.value = timeSeq;
	  		f.lectDate.value = lectDate;
	  		f.lectHour.value = lectHour;
// 	  		f.lectureType.value = lecturetype;
			document.getElementById('lectureType').value = lecturetype;
  		} catch (e) {
  			alert('처리중 오류가 발생했습니다.\n'+e.message);
  			return;
  		}
  		window.open('', target, "width="+size_w+", height="+size_h+", top="+top+", left="+left+", scrollbars=yes, toolbar=no, menubar=no, location=no");
  		f.target = target;
		f.submit();
	}

	function deleteCareer(lectDate, courseCode, timeSeq, lectHour){
		var frm = document.forms[0];
		frm.action='prfBaseInfo.act';
		frm.task.value = 'deleteCareer';
		frm.courseCode.value = courseCode;
		frm.subjName.value = timeSeq;
		frm.lectDate.value = lectDate;
		frm.lectHour.value = lectHour;
		frm.submit();
	}
	
	function doSearch1(frm){
		var searchFromDate = frm.searchFromDate.value.trim();
		var searchToDate = frm.searchToDate.value.trim();
		var professorNo = frm.professorNo.value.trim();
		
		frm.action = "prfBaseInfo.act?task=lecInfo";
		frm.submit();
	}
	
</script>
<style type="text/css">
	.t1 {padding : 8px 0;}
	.t3 {padding : 3px 10px 2px;}
</style>
</head>
<body>
<html:form method="POST" action="/prfBaseInfo.act?task=list" styleId="mainForm">
	<html:hidden property="professorNo" />
	<html:hidden property="searchProfLevel" value="${searchProfLevel}" />
	<html:hidden property="searchCourseName" value="${searchCourseName }" />
	<html:hidden property="searchSubjName" value="${searchSubjName }" />
	<html:hidden property="searchFromDate" value="${searchFromDate }" />
	<html:hidden property="searchToDate" value="${searchToDate }" />
	<html:hidden property="searchName" value="${searchName }" />
	<html:hidden property="searchGradeCode" value="${searchGradeCode }" />
	<html:hidden property="task" />
	<html:hidden property="lectDate" />
	<html:hidden property="courseCode" />
	<html:hidden property="subjName" />
	<html:hidden property="lectHour" />
	<html:hidden property="lectureType" styleId="lectureType"/>
	<html:hidden property="searchCourseCode"/>
	<html:hidden property="searchColumn"/>
</html:form>
<html:form method="POST" action="/prfBaseInfo.act?task=lecInfo" styleId="mainForm">
	<table width="790" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
		</tr>
		<tr>
			<td>
				<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'>
							<img src='<html:rewrite page="/images/teacher/title_01.gif"/>' alt="강사정보" />
						</td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td>
							<table>
								<tr>
									<td height="25" class="stitle">
										<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />
										강사 기본 정보
									</td>
								</tr>
							</table>
							<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #91B475">
								<tr>
									<td>
										<!--테이블 헤더 시작-->
										<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="t1 cbg4" width="99">성명</td>
												<td class="sBg"></td>
												<td class="t3" width="220">
													<c:out value="${rsPrf_ProfInfo.profName}" />
												</td>
												<td class="sBg"></td>
												<td class="t1 cbg4" width="99">연락처</td>
												<td class="sBg"></td>
												<td class="t3">
													<c:out value="${rsPrf_ProfInfo.cellPhone}" />
												</td>
											</tr>
											<tr>
												<td class="lbg3" colspan="8"></td>
											</tr>
											<tr>
												<td class="t1 cbg4">생년월일</td>
												<td class="sBg"></td>
												<td class="t3">
													<c:out value="${rsPrf_ProfInfo.juminNo }"/>
												</td>
												<td class="sBg"></td>
												<td class="t1 cbg4">Email</td>
												<td class="sBg"></td>
												<td class="t3">
													<c:out value="${rsPrf_ProfInfo.email }"/>
												</td>
											</tr>
											<tr>
												<td class="lbg3" colspan="8"></td>
											</tr>
											<tr>
												<td class="t1 cbg4">소속</td>
												<td class="sBg"></td>
												<td class="t3">
													<c:out value="${rsPrf_ProfInfo.workPlace }"/>
												</td>
												<td class="sBg"></td>
												<td class="t1 cbg4">직위</td>
												<td class="sBg"></td>
												<td class="t3">
													<c:out value="${rsPrf_ProfInfo.workPos }"/>
												</td>
											</tr>
										</table>
										<!--테이블 헤더 끝-->
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td height="10"></td>
								</tr>
								<tr>
									<td height="25" class="stitle">
										<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />
										출강 내역
									</td>
								</tr>
							</table>
							<table>
							<tr>
								<td width="90" class="s1">기간</td>
									<td class="sBar"></td>
									<td class="s2" width="185">
										<html:text property="searchFromDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="false" />
										<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[1].searchFromDate);" />
										~&nbsp;
										<html:text property="searchToDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="false" />
										<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[1].searchToDate);" />
									</td>
									<html:hidden property="professorNo" value="${rsPrf_ProfInfo.professorNo}" />
									
									<td width="60" align="center">
										<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch1(document.forms[1]);" style="cursor: hand" align="absbottom" />
									</td>
							</tr>
							</table>
							<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #91B475">
								<tr>
									<td>
										<!--테이블 헤더 시작-->
										<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
											<tr>
												<td class="t1" width="99">날짜</td>
												<td class="sBg"></td>
												<td class="t1" width="190">과정</td>
												<td class="sBg"></td>
												<td class="t1">과목</td>
												<td class="sBg"></td>
												<td class="t1" width="80">강의분야</td>
												<td class="sBg"></td>
												<td class="t1" width="40">시간</td>
												<td class="sBg"></td>
												<td class="t1" width="100">수정/삭제</td>
												<td width="17"></td>
											</tr>
										</table>
										<!--테이블 헤더 끝-->
										<!--리스트 시작-->
										<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
											<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
												<c:forEach var="list" items="${rsPrf_LectureInfoList}" varStatus="i">
													<!-- 열 배경 -->
													<c:if test="${i.count%2 == 0}">
														<c:set var="lineBg" scope="request" value="tbg3" />
													</c:if>
													<c:if test="${i.count%2 == 1}">
														<c:set var="lineBg" scope="request" value="" />
													</c:if>
													<tr class="${lineBg}">
														<td class="t2" width="99">
															<c:out value="${list.lectDate}" />
														</td>
														<td class="sBg"></td>
														<td class="t3" width="170">
															<c:out value="${list.courseName}" />
														</td>
														<td class="sBg"></td>
														<td class="t3">
															<c:out value="${list.subjName}" />
														</td>
														<td class="sBg"></td>
														<td class="t3" width="60">
															<c:forEach items="${prfLecCode.beanCollection}" var="leccode">
																<c:if test="${leccode.value eq list.lectureType }"><c:set var="lecType">${leccode.label}</c:set></c:if>
															</c:forEach>
															<c:out value="${lecType}" />
														</td>
														<td class="sBg"></td>
														<td class="t2" width="40">
															<c:out value="${list.lecTime}" />
														</td>
														<td class="sBg"></td>
														<td class="t2" width="100">
															<img src="/images/board/btn_modify.gif" style="vertical-align: middle; cursor: hand;" alt="수정" onclick="updateCareer('${list.lectDate}','${list.courseCode }', '${list.subjName }', '${list.lecTime }', '${list.lectureType }')" />
															<img src="/images/board/btn_del2.gif" style="vertical-align: middle; cursor: hand;" alt="삭제" onclick="deleteCareer('${list.lectDate}','${list.courseCode }', '${list.subjName }','${list.lecTime }')" />
														</td>
													</tr>
													<tr>
														<td colspan="9" class="lbg3"></td>
													</tr>
													<c:set value="${i.count}" var="count"></c:set>
												</c:forEach>
												<c:if test="${count==null}">
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
							<!--하단버튼-->
							<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
								<tr valign="bottom">
									<td>
<%-- 										<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="엑셀다운로드" align="absmiddle" onclick="excelDown(${rsPrf_ProfInfo.professorNo});" style="cursor: hand" /> --%>
										<img src='<html:rewrite page="/images/board/btn_name_print4.gif"/>' width="86" height="25" align="absmiddle" alt="출강확인서" style="cursor:hand"  onclick="ozReport('1');"/>
									</td>
									<td align="right">
										<img src="/images/board/btn_up2.gif" onclick="newLectInfo()" alt="신규등록" style="cursor: hand; vertical-align: middle;" />
										<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList();" style="cursor: hand" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</html:form>
<script type="text/javascript">
<!--
	tresize(242);
//-->
</script>
</body>