<%@ page language="java" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/common/js/CommonCourseSearch.js"></script>
<script src='/common/js/popupcalendar.js'></script>
<script language="JavaScript">
// 	$.noConflict();
	/* jQuery(function(){
		jQuery('#searchKeyword').on('change', function(){
			jQuery.ajax({
				url : '/prfBaseInfo.act',
				data : 'task=selectSubject&searchCourseCode='+jQuery('#searchCourseName').val()+'0'+jQuery('#searchKeyword').val()+'000',
				dataType : 'json',
				success : function(data){
					jQuery('#searchSubject').empty().append('<option value="">과목 선택</option>');
					jQuery.each(data, function(){
						jQuery('#searchSubject').append('<option value="'+this.subjseq+'">'+this.subjname+'</option>');
					});
				}
			});
		});

	}); */

	function insertSubmit(){
		if(jQuery('#courseName').val() == ''){
			alert('과정명을 입력해주세요.');
			return;
		}
		if(jQuery('#subjName').val() == ''){
			alert('과목명을 입력해주세요.');
			return;
		}
		if(jQuery('#date').val() == ''){
			alert('강의일자를 선택해주세요.');
			return;
		}
		if(jQuery('#time').val() == ''){
			alert('강의시간을 입력해주세요.');
			return;
		}
		var f  = document.forms[0];
		f.target = window.opener.name;
		f.action = '/prfBaseInfo.act';
		f.courseCode.value = getSearchCourseCode();
		if('${do}' == 'update'){
			f.task.value = 'updateCareer';
		}else{
			f.task.value= 'insertCareer';
		}
		f.submit();

		window.close();
	}

</script>
</head>
<body>
	<html:form method="POST" action="/prfBaseInfo.act?task=update">
		<html:hidden property="professorNo" />
		<html:hidden property="searchProfLevel" value="${searchProfLevel}" />
		<html:hidden property="searchCourseName" value="${searchCourseName }" />
		<html:hidden property="searchSubjName" value="${searchSubjName }" />
		<html:hidden property="searchFromDate" value="${searchFromDate }" />
		<html:hidden property="searchToDate" value="${searchToDate }" />
		<html:hidden property="searchName" value="${searchName }" />
		<html:hidden property="searchGradeCode" value="${searchGradeCode }" />
		<html:hidden property="task" />
		<html:hidden property="courseCode" />
		<html:hidden property="prevSubjName" value="${profInfo.subjName }" />
		<html:hidden property="prevLectDate" value="${profInfo.lectDate }" />
		<html:hidden property="prevLectHour" value="${profInfo.lectHour }" />
		<html:hidden property="prevCourseCode" value="${profInfo.courseCode }" />
		<table width="550" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="25" class="stitle">
					<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />
					출강내역 신규입력
				</td>
			</tr>
			<tr>
				<td align="center">
					<table border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #91B475">
						<tr>
							<td align="left">
								<!-- table body -->
								<table width="506" border="0" cellspacing="1" cellpadding="0">
									<tr>
										<td class="t1">과정</td>
										<td class="sBar"></td>
										<td class="s2">
											<%-- FIXME !!! 강의만족도 연계를 위해서는 여기서 기 등록된 과정과 과목을 선택할 수 있도록 해야함.--%>
											<%-- 아니 그전에 강의만족도 점수를 뽑아올수있나?? --%>
											<%-- <input type="text" id="courseName" name="courseName" style="width: 240px;" value="${profInfo.courseName }"/> --%>
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
									</tr>
									<tr>
										<td class="t1">과목명</td>
										<td class="sBar"></td>
										<td class="s2">
											<input type="text" id="subjName" name="subjName" style="width: 240px;" value="${profInfo.subjName }"/>
										</td>
									</tr>
									<tr>
										<td class="t1">강의분야</td>
										<td class="sBar"></td>
										<td class="s2">
											<html:select property="lectureType" style="width:150px;">
												<html:optionsCollection name="prfLecCode" property="beanCollection" />
											</html:select>
										</td>
									</tr>
									<tr>
										<td class="t1">강의일자</td>
										<td class="sBar"></td>
										<td class="s2">
											<input type="text" id="date" name="lectDate" style="width: 60px" value="${profInfo.lectDate }"/>
											<img src="/images/icon/calendaricon.gif" align="absbottom" style="cursor: hand" onclick="Calendar_D(this, date, 'yyyymmdd');"/>
										</td>
									</tr>
									<tr>
										<td class="t1">강의시간</td>
										<td class="sBar"></td>
										<td class="s2">
											<input id="time" name="lectHour" type="text" size="5" value="${profInfo.lectHour }" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<!--하단버튼-->
					<table width="506" border="0" cellspacing="0" cellpadding="0" height="28">
						<tr valign="bottom">
							<td align="right">
								<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="insertSubmit();" style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="window.close();" style="cursor: hand" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</html:form>
</body>