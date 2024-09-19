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
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(185);
	}
	function checkAll()
	{
		var max = Number(document.all.count.value);
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.check_array.checked == false)
			{
				document.all.check_array.checked = true;
			}
			else
			{
				document.all.check_array.checked = false;
				document.all.chkpay_array.checked = false;
			}
		}
		else
		{
			if(document.all.check_array[0].checked == false)
			{
				for(var i=0; i<max; i++)
				{
					document.all.check_array[i].checked = true;
				}
			}
			else
			{
				for(var i=0; i<max; i++)
				{
					document.all.check_array[i].checked = false;
					document.all.chkpay_array[i].checked = false;
				}
			}
		}
	}
	
	function checkPay(chk)
	{
		var max = Number(document.all.count.value);
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.check_array.checked == false)
			{
				document.all.chkpay_array.checked = false;
			}
		}
		else
		{
			if(document.all.check_array[chk-1].checked == false)
			{
				document.all.chkpay_array[chk-1].checked = false;
			}
		}
	}
	
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	function doSearch(frm)
	{
		document.all.searchCourseCode.value = document.getElementById('searchCourseName').value + '%' + document.getElementById('searchKeyword').value + '%';
		if(document.all.searchCourseCode.value == "")
		{
			alert("과정을 선택하세요");
			return;
		}
			
		frm.submit();
	}
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs)
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	function openWinSetPo(courseCode, subjSeq, lectDate, timeSeq, profno)
	{
		window.open('<html:rewrite page="/cmnProf.act?task=list&courseCode=' + courseCode +'&subjseq='+subjSeq+'&lectdate='+lectDate+'&timeseq='+timeSeq+'&profno='+profno+'"/>', 'popup', 'scrollbars=no, menubar=no, width=760, height=490, status=yes top=150, left=150');
	}
	
	function excelDown()
	{

		var searchdate = document.all.searchdate.value;
		var coursecode = document.all.searchCourseCode.value;
		document.location.href = "crsLectureMgmt.act?task=excel&courseCode="+coursecode+"&searchdate="+searchdate;
	}
	
	function formSubmit()
	{
		var frm = document.forms[1];
		if(frm.all.count.value == 0)
		{
			alert("출강처리할 자료가 없습니다.");
			return;
		}
		document.forms[1].lectdate.value 	 = document.forms[0].searchdate.value;
		document.forms[1].courseCode.value = document.forms[0].searchCourseCode.value;
		document.forms[1].courseName.value = document.forms[0].searchCourseName.value;
		
		frm.submit();
	}

</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="출강관리" src="/images/operation/title_03.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<html:form action='crsLectureMgmt.act?task=list'>
				<html:hidden property="courseYear" />
				<html:hidden property="crsUser" />
				<!--검색 테이블 시작-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
					<tr>
						<td width="80" class="s1">과정</td>
						<td class="sBar"></td>
						<td class="s2" width="380">
							<select id="searchYear"></select>
							<select id="searchCourseName" style="width: 200px;">
								<option value="">과정 선택</option>
							</select>
							<select id="searchKeyword" style="width: 100px;">
								<option value="">과정기수 선택</option>
							</select>
							<html:hidden property="searchColumn" />
							<html:hidden property="searchCourseCode" />
						</td>
						<td class="sBar"></td>
						<td width="79" class="s1">일자</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:text property="searchdate" style="width:100px" readonly="true" />
							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand"
								onclick="Calendar_D(this, searchdate, 'yyyy-mm-dd');">
						</td>
						<td width="60" align="center">
							<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor: hand" align="absbottom" />
						</td>
					</tr>
				</table>
				<!--검색 테이블 끝-->
			</html:form>
			<table width="750" cellspacing="0" cellpadding="0">
				<tr valign="bottom">
					<td class="t4" height="25">
						<c:if test="${eduDate != null}">
							<b>교육기간 : <c:out value="${eduDate}" /></b>
						</c:if>
					</td>
				</tr>
			</table>
			<html:form action="crsLectureMgmt.act?task=save_lect">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--테이블 헤더 시작-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<td class="t1" width="39">
										<a href="#" onclick="checkAll();">
											<u>선택</u>
										</a>
									</td>
									<td class="sBg"></td>
									<td class="t1" width="69">시작시각</td>
									<td class="sBg"></td>
									<td class="t1" width="69">종료시각</td>
									<td class="sBg"></td>
									<td class="t1" width="59">시간</td>
									<td class="sBg"></td>
									<td class="t1">과목</td>
									<td class="sBg"></td>
									<td class="t1" width="99">강사</td>
									<td class="sBg"></td>
									<td class="t1" width="39">강사료</td>
									<td class="sBg"></td>
									<td class="t1" width="99">지출결의</td>
									<td class="sBg"></td>
									<td class="t1" width="60">강사지정</td>
									<td width="17"></td>
								</tr>
							</table>
							<!--테이블 헤더 시작-->
							<!--리스트 시작-->
							<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
									<c:forEach var="lectureList" items="${rsCrs_LectureMgmtList}" varStatus="i">
										<input type="hidden" name="timeseq_array" value="${lectureList.timeseq}">
										<input type="hidden" name="coursecode_array" value="${lectureList.courseCode }">
										<input type="hidden" name="lectdate_array" value="${lectureList.lectdate }">
										<input type="hidden" name="profnoarray" value="${lectureList.profno }">
										<c:if test="${i.count%2 == 0}">
											<c:set var="lineBg" scope="request" value="tbg3" />
										</c:if>
										<c:if test="${i.count%2 == 1}">
											<c:set var="lineBg" scope="request" value="" />
										</c:if>
										<tr class="${lineBg}">
											<td class="t2" width="39">
												<c:if test="${lectureList.lectureflag ne '0' }">
													<input type="checkbox" name="check_array" value="${i.count}">
												</c:if>
												<c:if test="${lectureList.lectureflag eq '0' }">
													<input type="checkbox" name="check_array" value="${i.count}" checked>
												</c:if>
											</td>
											<td class="sBg"></td>
											<td class="t2" width="69">${lectureList.fromtime}</td>
											<td class="sBg"></td>
											<td class="t2" width="69">${lectureList.totime}</td>
											<td class="sBg"></td>
											<td class="t2" width="59">${lectureList.lecttime}</td>
											<td class="sBg"></td>
											<td class="t3">&nbsp;${lectureList.subjname}</td>
											<td class="sBg"></td>
											<td class="t2" width="99">${lectureList.profname}<c:if test="${lectureList.profcnt>1}">외 ${lectureList.profcnt-1}</c:if>
											</td>
											<td class="sBg"></td>
											<td class="t2" width="39">
												<c:if test="${lectureList.profpayflag eq '0' }">
													<c:if test="${lectureList.isinnerprof eq '00001' }">
														<input type="checkbox" name="chkpay_array" value="${i.count }" checked>
													</c:if>
													<c:if test="${lectureList.isinnerprof ne '00001' }">
														<input type="checkbox" name="chkpay_array" value="${i.count }">
													</c:if>
												</c:if>
												<c:if test="${lectureList.profpayflag eq 'N' }">
													<input type="checkbox" name="chkpay_array" value="${i.count }">
												</c:if>
												<c:if test="${lectureList.profpayflag eq 'Y' }">
													<input type="checkbox" name="chkpay_array" value="${i.count }" checked>
												</c:if>
											</td>
											<td class="sBg"></td>
											<td class="t2" width="99">
												<c:if test="${lectureList.ispayed ne '0' }">미지급</c:if>
												<c:if test="${lectureList.ispayed eq '0' }">지급완료</c:if>
											</td>
											<td class="sBg"></td>
											<td class="t2" width="60">
<%-- 												<c:if test="${lectureList.ispayed ne '0' }"> --%>
													<img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' width="19" height="19" align="absmiddle" alt="강사지정"
														onclick="openWinSetPo('${lectureList.courseCode}','${lectureList.subjseq}','${lectureList.lectdate}','${lectureList.timeseq}','${lectureList.profno}')"
														style="cursor: hand" />
<%-- 												</c:if> --%>
<%-- 												<c:if test="${lectureList.ispayed eq '0' }"> --%>
<%-- 													<img src='<html:rewrite page="/images/board/btn_zoom_off.gif"/>' align="absmiddle" alt="강사지정" /> --%>
<%-- 												</c:if> --%>
											</td>
										</tr>
										<tr>
											<td class="lbg3" colspan="17"></td>
										</tr>
										<c:set var="count" value="${i.count}" />
										<c:if test="${lectureList.ispayed eq '0' }">
											<c:set var="ispayed" value="OK" />
										</c:if>
									</c:forEach>
									<c:if test="${count==null}">
										<tr class="tbg3">
											<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
										</tr>
									</c:if>
								</table>
								<input type="hidden" name="count" value="${count}"> <input type="hidden" name="ispayed" value="${ispayed}"> <input type="hidden"
									name="lectdate"> <input type="hidden" name="courseCode"> <input type="hidden" name="courseName">
							</div>
							<!--리스트 끝-->
						</td>
					</tr>
				</table>
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="bottom">
						<td align="left">
<%-- 							<c:if test="${ispayed != 'OK'}"> --%>
								<img src='<html:rewrite page="/images/board/btn_lecture_up2.gif"/>' width="72" height="25" alt="출강처리" align="absmiddle" onclick="formSubmit()"
									style="CURSOR: hand" />
<%-- 							</c:if> --%>
<%-- 							<c:if test="${ispayed == 'OK'}"> --%>
<%-- 								<img src='<html:rewrite page="/images/board/btn_lecture_up2_off.gif"/>' alt="출강처리" align="absmiddle" /> --%>
<%-- 							</c:if> --%>
						</td>
<!-- 						<td align="right"> -->
<%-- 							<img src='<html:rewrite page="/images/board/btn_lecture_status.gif"/>' width="116" height="25" alt="외래강사 출강현황" align="absmiddle" onclick="excelDown();" --%>
<!-- 								style="CURSOR: hand" /> -->
<!-- 						</td> -->
					</tr>
				</table>
			</html:form>
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(185);
//-->
</script>
