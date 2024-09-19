<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	function searchList(tmp)
	{
		var frm = document.forms[0];
		frm.submit();
	}
	function showCourse(courseCode,crsType1)
	{
			LeftPosition=screen.width/2-(667/2);
			TopPosition=screen.height/2-(470/2);
			window.open('${pageContext.request.contextPath}/cmnCourseInfo.act?task=info&coursecode='+courseCode+'&crstype1='+crsType1,'pop1',
		  	'height=470,width=667,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=yes,top='+TopPosition+',left='+LeftPosition);
	}
	//설문조회로 이동
	function rePlySurvey(surveyno, coursecode, stdno, chkmod)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	
	 	if(surveyno == "")
		{
			alert("해당설문이 존재하지 않습니다.")
			return;
		}
		
		if(coursecode == "")
		{
			alert("해당과정이 존재하지 않습니다.")
			return;
		}
		window.open('<html:rewrite page="/extMylcSurvey.act?task=info&surveyno='+surveyno+'&coursecode='+coursecode+'&stdno='+stdno+'&chkmod='+chkmod+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=668, height=600, status=yes top='+wint+', left='+winl);
	}
	
	function ozReport(data,data1,k)
	{
		var courseCode = data;
		var seq = data1;
		
		if(k==1)
		{//수료증
			url ='<html:rewrite page="/ozMenu.act"/>?report=end&check_array='+ courseCode + seq;	
			window.open(url,'popup', 'scrollbars = no,resizable=yes, menubar = no, width = 710 height =550, status = yes');
		}
		if(k==2)
		{ //교육훈련이수증명원
			url ='<html:rewrite page="/ozMenu.act"/>?report=endconfirm&check_array='+ courseCode + seq; 	
			window.open(url,'popup', 'scrollbars = no, resizable=yes,menubar = no, width = 710 height =550, status = yes');
		}		
	}
	
	function popupScoreList(coursecode){
		var url = '/extMylcLecture.act?task=scorelist&coursecode=' + coursecode;
		var size_w = 780;
		var size_h = 600;
		window.open(url, 'popup','scrollbars=yes, menubar=no, width='+size_w+', height='+size_h+', status=yes top='+(screen.height/2 - size_h)+', left='+(screen.width/2 - size_w));
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/course/title_02.gif"/>' alt="수강내역조회"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<!--검색 -->
						<html:form method="POST"  action="extMylcLecture.act?task=list">
						<html:hidden property="searchCourseCode"/>
						<input type="hidden" name="searchType" value="이수"/>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr>
								<%--<td class="s1" width="75">이수구분</td>
								<td class="sBg"></td>
								<td class="s2" width="80">
									<html:select property="searchType" style="width:75px">
										<html:option value="">전체</html:option>
										<html:option value="이수">이수</html:option>
										<html:option value="미이수">미이수</html:option>
										<html:option value="교육중">교육중</html:option>
									</html:select>
								</td> --%>
								<td class="sBg"></td>
								<td class="s1" width="85">과정/과정명</td>
								<td class="sBg"></td>
								<td class="s2">									
									<html:text property="searchKeyword" title="교재명" style="width:170px"/>
								</td>
								<td class="sBg"></td>
								<td class="s1" width="50">기간</td>
								<td class="sBg"></td>
								<td class="s2" width="195">	
									<html:text property="searchFrom" style="width:65px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchFrom, 'yyyy-mm-dd');">
									~ <html:text property="searchTo" style="width:65px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchTo, 'yyyy-mm-dd');">
								</td>
								<td width="60">
									<input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" align="absmiddle"/>
								</td>
							</tr>
						</table>
						</html:form>
						<!--검색 끝-->
						<table style="width:100%;">
							<tr>
								<td height="15"></td>
							</tr>
							<tr>
								<td style="text-align: right; font-size: 8pt;">*총점이 동일한 경우, 석차는 1.학습점수, 2.실습점수, 3.분임조점수, 4.근태점수, 5.나이 순으로 산정됩니다.</td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="34">번호</td>
											<td class="sBg"></td>
											<td class="t1">과정명</td>
											<td class="sBg"></td>
											<td class="t1" width="104">교육기간</td>
											<td class="sBg"></td>
											<td class="t1" width="40">총점</td>
											<td class="sBg"></td>
											<td class="t1" width="40">석차</td>
											<td class="sBg"></td>
											<td class="t1" width="59">이수여부</td>
											<td class="sBg"></td>
<%-- 										<td class="t1" width="59">설문</td>
											<td class="sBg"></td>
											<td class="t1" width="74">이수증</td>
											<td class="sBg"></td> --%>
											<td class="t1" width="109">수료증</td>										
											<td width="17"></td>
										</tr>
									</table>
									<!--리스트 시작-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
										<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
											<c:set var="no" scope="request" value="1"/>
											<c:forEach var="list" items="${rsExtMylc_LectureListList}" varStatus="i" >
												<!-- 열 배경 -->
												<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
												<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
												<tr class="${lineBg}">
													<td class="t2" width="34"><c:out value="${no}"/></td>
													<td class="sBg"></td>
													<td class="t3">&nbsp;
														<c:if test="${list.year <= 2009}">
															<c:out value="${list.courseName}"/>
														</c:if>
														<c:if test="${list.year > 2009}">
															<a href="#" onclick="showCourse('${list.courseCode}','${list.crsType1}');""><u><c:out value="${list.courseName}"/></u></a>
														</c:if>														
													</td>
													<td class="sBg"></td>
													<td class="t2" width="104"><c:out value="${list.eduDate}"/></td>
													<td class="sBg"></td>
													<td class="t2" width="40">
														<c:if test="${list.scoreAvg ne '0'}">
															<a href="#" onclick="popupScoreList('${list.courseCode }')">
																<c:out value="${list.scoreAvg}"/>
															</a>
															</c:if>
														<c:if test="${list.scoreAvg eq '0'}"><c:out value="-"/></c:if>
													</td>
													<td class="sBg"></td>
													<td class="t2" width="40">${list.ranking }</td>
													<td class="sBg"></td>
													<td class="t2" width="59"><c:out value="${list.isFinish}"/></td>
													<td class="sBg"></td>
<%-- 												<td class="t2" width="59">
														<c:if test="${list.surveyNo == 'N' || list.year <= 2009}">
															<img src='<html:rewrite page="/images/board/btn_poll_search_off.gif"/>' align="absmiddle" alt="설문조회">
														</c:if>
														<c:if test="${list.surveyNo != 'N'}">
															<c:if test="${list.chkMod eq 'C' && list.year > 2009}">
																<img src='<html:rewrite page="/images/board/btn_poll.gif"/>' align="absmiddle" alt="설문참여" style="cursor:hand" onclick="rePlySurvey('${list.surveyNo }','${list.courseCode}','${list.stdNo }','C');">
															</c:if>	
															<c:if test="${list.chkMod ne 'C' && list.year > 2009}">
																<img src='<html:rewrite page="/images/board/btn_poll_search_off.gif"/>' align="absmiddle" alt="설문조회">
															</c:if>	
														</c:if>
													</td>
													<td class="sBg"></td>
													<td class="t2" width="74">
														<c:if test="${list.isFinish == '이수' && list.year > 2009}">
															<img src='<html:rewrite page="/images/board/btn_completion_print.gif"/>' align="absmiddle" alt="이수증출력" style="cursor:hand" onclick="ozReport('${list.courseCode}','${list.seq}','1');">
														</c:if>
														<c:if test="${list.isFinish != '이수' || list.year <= 2009}">
															<img src='<html:rewrite page="/images/board/btn_completion_print_off.gif"/>'>
														</c:if>
													</td>
													<td class="sBg"></td> --%>
													<td class="t2" width="109">
														<c:if test="${list.isFinish == '이수' && list.year > 2000}">
															<img src='<html:rewrite page="/images/board/btn_completion_print.gif"/>' align="absmiddle" alt="수료증출력" style="cursor:hand" onclick="ozReport('${list.courseCode}','${list.seq}','1');">
														</c:if>
														<c:if test="${list.isFinish != '이수' || list.year <= 2000}">
															<img src='<html:rewrite page="/images/board/btn_completion_print_off.gif"/>' align="absmiddle">
														</c:if>
													</td>												
												</tr>
												<tr>
													<td colspan="17" class="lbg3"></td>
												</tr>
												<c:set var="no" scope="request" value="${no + 1}"/>
											</c:forEach>
											<c:if test="${no==1}">
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
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>