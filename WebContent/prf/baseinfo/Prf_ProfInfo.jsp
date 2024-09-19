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

<script language="JavaScript">
	// 강사정보 다운로드
	function exceldownProf()
	{
		var year = document.forms[0].excelDownYear.value;
		if(year == "전체") {
			if(confirm("검색조건을 전체로 선택하시면 시간이 많이 소요될 수 있습니다.\n계속하시겠습니까?")) {
  			document.location.href = '/prfBaseInfo.act?task=exceldown&excelDownYear=';
			}
		} else {
  		document.location.href = '/prfBaseInfo.act?task=exceldown&excelDownYear='+year;
		}
	}
	// 강사집계 다운로드
	function excelProfTotal()
	{
		var year = document.forms[0].excelDownYear.value;
		if(year == "전체") {
			if(confirm("검색조건을 전체로 선택하시면 시간이 많이 소요될 수 있습니다.\n계속하시겠습니까?")) {
  			document.location.href = '/prfBaseInfo.act?task=excelProfTotal&excelDownYear=';
			}
		} else {
  		document.location.href = '/prfBaseInfo.act?task=excelProfTotal&excelDownYear='+year;
		}
	}
	function openSMS(profname, proftel)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/cmnPopupSendSMS.act?task=list&popflag=prof&username_array=' + profname + '&cellphone_array=' + proftel +'"/>', 'course', 'scrollbars=no, menubar=no, width=650, height=490, status=yes top=' + wint + ', left=' + winl);
	}

	function openEMAIL(profname, profemail)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/cmnPopupSendEMail.act?task=list&username_array='+profname+'&email_array='+profemail +'"/>', 'course', 'scrollbars=no, menubar=no, width=650, height=490, status=yes top=' + wint + ', left=' + winl);
	}
	function ozReport(profno)
	{
		window.open('<html:rewrite page="/ozMenu.act"/>?report=professor_info&profno=' + profno, 'professor_info', 'scrollbars=no, resizable=yes, menubar=no, width=710, height=550, status=yes');
	}
	
	function excelUpload()
	{
		var file = document.forms[1].file.value;

		if(file == "") {
			alert("업로드 파일을 선택하여 주십시요.");
			document.forms[1].file.focus();
			return;
		}
		
		document.forms[1].submit();
	}
	

// 	jQuery(function(){
// 		jQuery('#searchKeyword').on('change', function(){
// 			jQuery.ajax({
// 				url : '/prfBaseInfo.act',
// 				data : 'task=selectSubject&searchCourseCode='+jQuery('#searchCourseName').val()+'0'+jQuery('#searchKeyword').val()+'000',
// 				dataType : 'json',
// 				success : function(data){
// 					jQuery('#searchSubject').empty().append('<option value="">과목 선택</option>');
// 					jQuery.each(data, function(){
// 						jQuery('#searchSubject').append('<option value="'+this.subjseq+'">'+this.subjname+'</option>');
// 					});
// 				}
// 			});
// 		});

// 	});
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="강사정보" src="/images/teacher/title_01.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--검색 -->
			<html:form method="POST" action="prfBaseInfo.act?task=list">
				<html:hidden property="professorNo" />
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
						<td width="90" class="s1">기간</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:text property="searchFromDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true" />
							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[0].searchFromDate);" />
							~&nbsp;
							<html:text property="searchToDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true" />
							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[0].searchToDate);" />
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">과정명</td>
						<td class="sBar"></td>
						<td class="s2">
							<%-- <select id="searchYear"></select>
							<select id="searchCourseName" >
								<option value="">과정 선택</option>
							</select>
							<select id="searchKeyword">
								<option value="">과정기수 선택</option>
							</select>
							<html:hidden property="searchColumn"/>
							<html:hidden property="searchCourseCode"/> --%>
							<html:text property="searchCourseName" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">과목명</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:text property="searchSubjName" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
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
						<td class="s1">성명</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:text property="searchName" style="width:114px;" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
						<td class="sBar"></td>
						<td class="s2" colspan="7"></td>
						<td width="60" align="center">
							<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor: hand" align="absbottom" />
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
									<td class="t1Line" width="40"></td>
									<td class="t1Line" width="50">성명</td>
									<td class="t1Line" width="60">생년월일</td>
									<td class="t1Line" >소속</td>
									<td class="t1Line" width="90">직위</td>
									<td class="t1Line" width="90">직업군</td>
									<!-- <td class="t1Line">강의분야</td> -->
									<!-- <td class="t1Line" width="90">SMS/E-mail</td> -->
									<td class="t1Line" width="35">출강횟수</td>
<!-- 									<td class="t1Line" width="45">만족도</td> -->
									<td class="t1Line" width="45">출강</td>
									<!-- <td class="t1Line" width="45">소개서</td> -->
									<td class="t1Line" width="62">강사이력</td>
								</tr>
							</table>
							<!--테이블 헤더 끝-->
							<!--리스트 시작-->
							<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
									<c:forEach var="list" items="${rsPrf_ProfInfoList}" varStatus="i">
										<c:if test="${i.count%2 == 0}">
											<c:set var="lineBg" scope="request" value="tbg3" />
										</c:if>
										<c:if test="${i.count%2 == 1}">
											<c:set var="lineBg" scope="request" value="" />
										</c:if>
										<tr class="${lineBg}">
											<c:if test="${list.infoDelYn != 'Y'}">
												<td class="t2Line" width="40">
													<c:out value="${i.count}" />
												</td>
												<td class="t2Line" width="50">
													&nbsp;<a href="#" onclick="modifyProf('${list.professorNo}','');"><u>${list.profName}</u></a>
												</td>
												<td class="t2Line" width="60">
													&nbsp;${fn:substring(list.juminNo, 0, 6)}
												</td>
												<td class="t3Line" >
													&nbsp;
													<c:out value="${list.workPlace}" />
												</td>
												<td class="t2Line" width="90">
													<c:out value="${list.workPos}" />
												</td>
												<td class="t2Line" width="90">
													<c:out value="${list.jobCode}" />
												</td>
<%--
												<td class="t2Line">
													<c:out value="${list.lectureType}" />
												</td>
--%>
 												<%-- <td class="t2Line" width="90">
				  <img src='<html:rewrite page="/images/board/btn_s_sms.gif"/>' align="absmiddle" alt="SMS" onclick="openSMS('${list.profName}','${list.cellPhone}')" style="cursor:hand"/>
				  <img src='<html:rewrite page="/images/board/btn_s_email.gif"/>' align="absmiddle" alt="E-mail" onclick="openEMAIL('${list.profName}','${list.email}')" style="cursor:hand" />
				</td> --%>
												<td class="t2Line" width="35">
													${list.lectCount }
												</td>
<!-- 												<td class="t2Line" width="45"> -->
<%-- 													<img src='<html:rewrite page="/images/board/btn_s_search2.gif"/>' align="absmiddle" alt="조회" onclick='showSatis(${list.professorNo})' style="cursor: hand" /> --%>
<!-- 												</td> -->
												<td class="t2Line" width="45">
													<img src='<html:rewrite page="/images/board/btn_s_search2.gif"/>' align="absmiddle" alt="조회" onclick='showLectList(${list.professorNo});' style="cursor: hand" />
												</td>
												<%--<td class="t2Line" width="45">
													<c:if test="${list.profIntroFile != null}">
														<c:set var="filetype" scope="request" value="N" />
														<c:if
															test="${list.realFileType == 'hwp' || list.realFileType == 'ppt' || list.realFileType == 'xls' || list.realFileType == 'doc' ||
					  list.realFileType == 'txt' || list.realFileType == 'pdf' || list.realFileType == 'bmp' || list.realFileType == 'gif' || list.realFileType == 'jpg'}">
															<c:set var="filetype" scope="request" value="Y" />
														</c:if>
														<c:if test="${filetype == 'Y'}">
															<img src='<html:rewrite page="/images/board/${list.realFileType}.gif"/>' align="absmiddle" alt="${list.profName}_소개서.${list.realFileType}" onclick="location.href= '<html:rewrite page="/downLoad.act?downType=prof_info&downName=${list.profName}&fileName=${list.profIntroFile}"/>'" style="cursor: hand" />
														</c:if>
														<c:if test="${filetype == 'N'}">
															<img src='<html:rewrite page="/images/board/etc.gif"/>' align="absmiddle" alt="${list.profName}_소개서.${list.realFileType}" onclick="location.href= '<html:rewrite page="/downLoad.act?downType=prof_info&downName=${list.profName}&fileName=${list.profIntroFile}"/>'" style="cursor: hand" />
														</c:if>
													</c:if>
												</td>--%>
												<td class="t2Line" width="45">
													<img src='<html:rewrite page="/images/board/btn_s_print.gif"/>' align="absmiddle" alt="인쇄" style="cursor: hand" onclick="ozReport(${list.professorNo});" />
												</td>
											</c:if>
											<c:if test="${list.infoDelYn == 'Y'}">
												<td class="t2Line" width="50">
													<c:out value="${i.count}" />
												</td>
												<td class="t2Line">
													&lt;
													<c:out value="${list.profName}" />
												</td>
												<td class="t2Line" width="470">개인정보삭제</td>
												<td class="t2Line" width="60">
													<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="수정" onclick='modifyProf(${list.professorNo});'
														style="cursor: hand" />
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
				<!--하단버튼 테이블 시작-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="middle">
						<td>
							<html:select property="excelDownYear" value="${thisYear}" style="width:70px;">
								<html:optionsCollection name="applyYear" property="beanCollection" />
							</html:select>
							<img src='<html:rewrite page="/images/board/btn_prof_info.gif"/>' alt="강사정보" align="absmiddle" onclick="exceldownProf();" style="cursor: hand">
							<img src='<html:rewrite page="/images/board/btn_prof_total.gif"/>' alt="강사별집계" align="absmiddle" onclick="excelProfTotal();" style="cursor: hand">
						</td>
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="엑셀다운로드" align="absmiddle" onclick="doExcel(document.forms[0])" style="cursor: hand" />
							<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="신규등록" align="absmiddle" onclick="newProf();" style="cursor: hand" />
						</td>
					</tr>
				</table>
				<!--하단버튼 테이블 끝-->
			</html:form>
			<html:form action='prfBaseInfo.act?task=excelUp' enctype="multipart/form-data" >
				<table width="750" border="0" cellspacing="0" cellpadding="0" >
					<tr valign="middle">
						<td align="right">
							<html:file property="file" style="width:330px;"></html:file>
							<img src='<html:rewrite page="/images/board/btn_upload.gif"/>' alt="업로드" align="absmiddle" onclick="excelUpload()" style="cursor:hand"/>
							<img src='<html:rewrite page="/images/board/btn_dawnload.gif"/>' align="absmiddle" alt="입력양식 다운로드" onclick="location.href='<html:rewrite page="/prfBaseInfo.act?task=sample"/>'" style="CURSOR:hand" />
						</td>
					</tr>
				</table>
			</html:form>
		</td>
	</tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(245);
	var count = Number(${count});
	document.all.prof_count.innerHTML = '<b>강사현황 : '+count+'/${prof_count}</b>';
//-->
</script>