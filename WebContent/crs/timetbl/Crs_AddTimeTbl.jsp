<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/common/js/CommonCourseSearch.js"></script>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	var tmpSubject = 0;						// 셀렉트 박스 과목리스트 길이
	var tmpSelectSubject = -1;		// 선택된 과목 기억
	var tmpSelectI = 0;						// 추가눌렀을때 I값
	var tmpSelectJ = 0;						// 추가눌렀을때 J값
	var tmpSubjectName = [];			// 셀렉트 박스 과목명 기억
	var tmpSubjectValue = [];			// 셀렉트 박스 과목VALUE값 기억
	
	function newSubject(i, j)
	{
		var idx = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		
		// 이미 추가를 선택한 과목 있다면  취소 해버림
		for(var z=0; z<10; z++)
		{
			if(tmpSelectI == "0" && tmpSelectJ == "0")
			{
				tmpSelectI = 0;
				tmpSelectJ = 0;
			}
			else
			{
				cancleSubject(tmpSelectI, tmpSelectJ);
			}
		}
		
		// 이전에 배열로 사용한 데이터 버림. (과목데이터 추가/삭제 고려해서)
		if(tmpSubject != "0")
		{
			for(var z=0; z<tmpSubject; z++)
			{
				tmpSubjectName[z] = null;
				tmpSubjectValue[z] = null;
			}
			tmpSubject == "0";
		}
		
		// 현재 선택된 과목, 과목갯수, 과목명[], 과목속성값[], 현재i값, 현재j값 기억
		tmpSelectSubject = frm.subjseq[idx].options.selectedIndex;	// 현재 선택되어 있는 과목의 인덱스 기억
		tmpSubject = frm.subjseq[idx].options.length;				// 과목 길이 기억
		for(var x=0; x<frm.subjseq[idx].options.length; x++)
		{
			tmpSubjectName[x]  = frm.subjseq[idx].options[x].text;		// 과목 기억
			tmpSubjectValue[x] = frm.subjseq[idx].options[x].value;		// 과목 value 기억
		}
		tmpSelectI = Number(i);				// i값 기억
		tmpSelectJ = Number(j);				// j값 기억
		
		var html = '<input type="text" name="newSubjName" style="width:63%;">&nbsp;&nbsp;';
			 html += '<img src=<html:rewrite page="/images/board/btn_save3.gif"/> align="absmiddle" alt="저장" onclick="saveSubject('+Number(i)+', '+Number(j)+')" style="cursor:hand"/>&nbsp;';
			 html += '<img src=<html:rewrite page="/images/board/btn_cancle3.gif"/> align="absmiddle" alt="취소" onclick="cancleSubject('+Number(i)+', '+Number(j)+')" style="cursor:hand"/>';
			
		document.all.subject_zone[idx].innerHTML = html;
	}
	
	function cancleSubject(i, j)
	{
		var idx = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		var selected;
		
		var html = '<select name="subjseq" style="width:65%;">';
		for(var x=0; x<tmpSubject; x++)
		{
			if(tmpSelectSubject == x)
				selected = "selected";
			else
				selected = "";
			html += '<option value="'+tmpSubjectValue[x]+'"'+selected+'>'+tmpSubjectName[x]+'</option>';
		}
		html += '</select>&nbsp;&nbsp;';
		html += '<img src=<html:rewrite page="/images/board/btn_plus.gif"/> align="absmiddle" alt="추가" onclick="newSubject('+Number(i)+', '+Number(j)+')" style="cursor:hand"/>&nbsp;';
		html += '<img src=<html:rewrite page="/images/board/btn_minus.gif"/> align="absmiddle" alt="삭제" onclick="delSubject('+Number(i)+', '+Number(j)+')" style="cursor:hand"/>';
		
		// 현재 i값, j값 초기화
		tmpSelectI = 0;
		tmpSelectJ = 0;
		document.all.subject_zone[idx].innerHTML = html;
	}
	
	function saveSubject(i, j)
	{
		var idx = Number(i) + Number(j) - 1;
		var sfrm = document.forms[0];
		var frm = document.forms[1];
		
		var addsubjname =  frm.newSubjName.value;
		frm.coursecode.value = sfrm.searchCourseCode.value;
		frm.subjname.value 	 = frm.newSubjName.value;
		if(addsubjname !='')
		{
		 
			var url = "crsTimeTblDay.act?task=add_subject";
			var pars = Form.serialize(frm);
			
			var myAjax = new Ajax.Request(
							url,
	                      {
	                          method: 'post',
	                          parameters: pars,
	                          onComplete: add_subject
	                         });
	  }
	  else
	  {
	  	alert("입력한 내용이 없습니다.");
	  	frm.newSubjName.focus();
	  	return;
	  }
	}
	add_subject = function(request)
	{
		var result = request.responseXML.documentElement.firstChild;
		var chkDate = result.getAttribute('chkDate');

		var frm = document.forms[1];
		if(chkDate=='0')
		{
			alert('과목 추가에 실패하였습니다.');
			return;
		}
		alert('과목을 추가하였습니다.');
		
		var idx = Number(tmpSelectI) + Number(tmpSelectJ) - 1;
		var subjname = frm.newSubjName.value;
		
		cancleSubject(tmpSelectI, tmpSelectJ);
		
		for(var z=0; z<10; z++)
		{
			var obj = frm.subjseq[z];
			obj.options[obj.options.length] = new Option(subjname, chkDate);
		}
		frm.subjseq[idx].selectedIndex = Number(chkDate)+2;
	};
	
	function delSubject(i, j)
	{
		var ok_confirm = confirm('삭제하시겠습니까?');
		if(ok_confirm != true)
		{
			return;
		}
	
		var idx = Number(i) + Number(j) - 1;
		var sfrm = document.forms[0];
		var frm = document.forms[1];
		
		if(frm.subjseq[idx].value == "" || frm.subjseq[idx].value == "98" || frm.subjseq[idx].value == "99")
		{
			alert("삭제할 수 없습니다.");
			return;
		}
		frm.coursecode.value = sfrm.searchCourseCode.value;
		frm.subjname.value 	 = frm.subjseq[idx].value;
		frm.gubun.value 		 = frm.subjseq[idx].selectedIndex;
		
		var url = "crsTimeTblDay.act?task=del_subject";
			var pars = Form.serialize(frm);
		
		var myAjax = new Ajax.Request(
						url,
                      {
                          method: 'post',
                          parameters: pars,
                          onComplete: del_subject
                      });
	}
	del_subject = function(request)
	{
		var result = request.responseXML.documentElement.firstChild;
    var chkDate = result.getAttribute('chkDate');

		var frm = document.forms[1];

		if(chkDate=='0')
		{
			alert('과목 삭제에 실패하였습니다.');
			return;
		}
		alert('과목을 삭제하였습니다.');
				
		for(var z=0; z<10; z++)
		{
			if(frm.subjseq[z].selectedIndex == chkDate)
			{
				frm.subjseq[z].selectedIndex = 0;
			}
			frm.subjseq[z].remove(chkDate);
		}
	};
	
	function insertTime()
	{
		if(!checkTime()) return;
		var frm = document.forms[1];
		var sFrm = document.forms[0];
		
		frm.coursecode.value = sFrm.searchCourseCode.value;
		frm.lectdate.value = sFrm.searchdate.value;
		
		checkLectDate();
	}
	
	function copyTime()
	{
		if(!checkTime()) return;
		var sFrm = document.forms[0];
		var frm = document.forms[1];

		var disedufrom = sFrm.disEduFrom.value;
		var diseduto = sFrm.disEduTo.value;
		var today = sFrm.today.value;
		var lectDate = sFrm.searchdate.value.replace("-","").replace("-","");
		var copyDate = document.all.copyDate.value.replace("-","").replace("-","");

		if(lectDate=='' || copyDate=='')
		{
			alert('날짜를 입력하세요.');
			return;
		}
		if(copyDate > diseduto || lectDate > diseduto)
		{
			alert('과정 종료일 이후  날짜입니다.');
			return;
		}
		if(copyDate < disedufrom || lectDate < disedufrom)
		{
			alert('과정 시작일 이전  날짜입니다.');
			return;
		}
		if(lectDate == copyDate)
		{
			alert('동일한 날짜입니다.');
			return;
		}
		if(today > copyDate)
		{
			alert('과거일자 시간표는 변경할 수 없습니다.');
			return;
		}
		if(!confirm(sFrm.searchdate.value+'자료를 '+document.all.copyDate.value+'로 복사합니다. \n계속 하시겠습니까?')) return;
		
		frm.coursecode.value = sFrm.searchCourseCode.value;
		frm.lectdate.value = document.all.copyDate.value;
				
		checkLectDate();
	}
	
	function checkLectDate()
	{
		var frm = document.forms[1];
		var url = "crsTimeTblDay.act?task=chk_lect";
      	var pars = Form.serialize(frm);

		var myAjax = new Ajax.Request(
						url,
                      {
                          method: 'post',
                          parameters: pars,
                          onComplete: success
                         });
	}

	success = function(request)
	{
		var result = request.responseXML.documentElement.firstChild;
    var chkDate = result.getAttribute('chkDate');

		var frm = document.forms[1];

		if(chkDate=='0')
		{
			alert('교육기간에 없는 날짜입니다.');
			return;
		}
		frm.action = "crsTimeTblDay.act?task=save_time";
		frm.submit();
	};
	
	
	
	function showTime(i,j,obj)
	{
		var idx = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		
		var fromtime = Number(frm.fromtime[idx].value.substr(0,2));
		var totime = Number(frm.totime[idx].value.substr(0,2));
		var hour = totime-fromtime;

		if(totime!=0 && fromtime!=0)
		{
			if(hour<1)
			{
				alert('잘못된 시간입니다.');
				obj.focus();
				obj.value="";
				document.all.time[idx].innerHTML = "";

				return;
			}
			document.all.time[idx].innerHTML = totime-fromtime;
		}
		else
		{
			document.all.time[idx].innerHTML = "";
		}
	}

	function checkTime()
	{
		var frm = document.forms[1];

		for(var i = 0; i<10 ; i++)
		{
			var fromtime = Number(frm.fromtime[i].value.replace(":",""));
			var totime = Number(frm.totime[i].value.replace(":",""));

			if(fromtime!=0 && totime!=0)
			{
				if(fromtime >= totime)
				{
					alert('잘못된 시간입니다.');
					frm.totime[i].focus();
					return false;
				}
				else
				{
					for(var j=0; j<10;j++)
					{
						var fTime = Number(frm.fromtime[j].value.replace(":",""));
						var tTime = Number(frm.totime[j].value.replace(":",""));

						if(i!=j)
						{
							if(fromtime >= fTime && fromtime < tTime)
							{
								alert('잘못된 시간입니다.');
								return false;
							}
						}
					}
				}
			}
		}
		return true;
	}

	function eatingTime(i, j, type)
	{
		var num  = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		var subjseq = frm.subjseq[num].value;
		var html = null;
		
 		if(subjseq == '98' || subjseq == '99')
		{
			frm.profnoarray[num].value	= "";
			frm.profAssign[num].value	= "";
			frm.profLevel[num].value	= "";
			frm.profName[num].value 	= "";
			frm.profAssign[num].readOnly = true;
			frm.profLevel[num].readOnly = true;
			frm.profName[num].readOnly = true;
			frm.profName[num].style.backgroundColor = "#E1E1E1";
			frm.profAssign[num].style.backgroundColor = "#E1E1E1";
			frm.profLevel[num].style.backgroundColor = "#E1E1E1";
			frm.profName[num].style.borderStyle = "groove";
			frm.profAssign[num].style.borderStyle = "groove";
			frm.profLevel[num].style.borderStyle = "groove";
			frm.popup_prof[num].src = '<html:rewrite page="/images/board/btn_zoom_off.gif"/>';
			frm.popup_prof[num].onclick = "";
		}
		else
		{ 
			html = '<input type="text" name="profName" style="width:70px;" value='+ frm.profName[num].value +'><input type="hidden" name="profnoarray" style="width:70px;" value='+ frm.profnoarray[num].value+'>&nbsp;';
			if(type == 1)
				html += '<img id="popup_prof" name="popup_prof" src=<html:rewrite page="/images/board/btn_zoom.gif"/> width="19" height="19" align="absmiddle" alt="찾아보기" onclick="setProf('+Number(i)+',0)" style="cursor:hand"/>';
			else
				html += '<img id="popup_prof" name="popup_prof" src=<html:rewrite page="/images/board/btn_zoom.gif"/> width="19" height="19" align="absmiddle" alt="찾아보기" onclick="setProf('+Number(i)+','+Number(j)+')" style="cursor:hand"/>';
			document.all.prof_zone[num].innerHTML = html;

			frm.profLevel[num].readOnly = false;
			frm.profLevel[num].style.backgroundColor = "";
			frm.profLevel[num].style.borderStyle = "";

//			html = '<input type="text" name="profLevel" style="width:90%;" value='+ frm.profLevel[num].value +'>&nbsp;';
//			html += '<input type="hidden" name="profAssign" style="width:90%;" value='+ frm.profAssign[num].value +'>';
//			document.all.assign_zone[num].innerHTML = html;
		 } 
	}
	function deleteTime(i, j, type)
	{
		var idx = Number(i) + Number(j) - 1;
		var frm = document.forms[1];
		
		// 이미 추가를 선택한 과목 있다면  취소 해버림
		for(var z=0; z<10; z++)
		{
			if(tmpSelectI == "0" && tmpSelectJ == "0")
			{
				tmpSelectI = 0;
				tmpSelectJ = 0;
			}
			else
			{
				cancleSubject(tmpSelectI, tmpSelectJ);
			}
		}
		frm.timesubject[idx].value="";
		frm.fromtime[idx].value="";
		frm.totime[idx].value="";
		document.all.time[idx].innerHTML = "";
		frm.subjseq[idx].value="";
		frm.profName[idx].value="";
		frm.profAssign[idx].value="";
		frm.profLevel[idx].value="";
		
		var html;
		html = '<input type="text" name="profName" style="width:70px;" value='+ frm.profName[idx].value +'><input type="hidden" name="profnoarray" style="width:70px;" value='+ frm.profnoarray[idx].value+'>&nbsp;';
		if(type == 1)
			html += '<img id="popup_prof" name="popup_prof" src=<html:rewrite page="/images/board/btn_zoom.gif"/> width="19" height="19" align="absmiddle" alt="찾아보기" onclick="setProf('+Number(j)+',0)" style="cursor:hand"/>';
		else
			html += '<img id="popup_prof" name="popup_prof" src=<html:rewrite page="/images/board/btn_zoom.gif"/> width="19" height="19" align="absmiddle" alt="찾아보기" onclick="setProf('+Number(i)+','+Number(j)+')" style="cursor:hand"/>';

		document.all.prof_zone[idx].innerHTML = html;

		frm.profLevel[num].readOnly = false;
		frm.profLevel[num].style.backgroundColor = "";
		frm.profLevel[num].style.borderStyle = "";
		
//		html = '<input type="text" name="profLevel" style="width:90%;" value='+ frm.profLevel[num].value +'>&nbsp;';
//		html += '<input type="hidden" name="profAssign" style="width:90%;" value='+ frm.profAssign[num].value +'>';
//		document.all.assign_zone[idx].innerHTML = html;
	}
	function setProf(i,j)
	{
		var idx = Number(i) + Number(j) - 1;
		var frm1 = document.forms[0];
		var frm2 = document.forms[1];
		var courseCode = frm1.searchCourseCode.value;
		var lectDate = frm1.searchdate.value;
		var subjseq = frm2.subjseq[idx].value;
		var profno = frm2.profnoarray[idx].value;
		
 		window.open('<html:rewrite page="/cmnProf.act?task=list&courseCode=' + courseCode + '&lectdate='+lectDate+'&subjseq='+subjseq+'&timeseq='+(idx+1)+'&rowidx='+idx+'&profno='+profno+'"/>', 'popup', 'scrollbars=no, menubar=no, width=760, height=490, status=yes top=150, left=150');
	}
	
	function setCrs()
	{
		var searchCode = document.forms[0].searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs)
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	function goList()
	{
		var searchdate = document.forms[0].searchdate.value;
		document.location.href = "crsTimeTblDay.act?task=list&searchdate="+searchdate;
	}
	
	function excel_upload()
	{
 		var file = document.forms[2].file.value;
 		
  		if(file == "")
		{
			alert("업로드 파일을 선택하여 주십시요.");
			document.forms[2].file.focus();
			return;
		}
  		document.forms[2].coursecode.value=document.forms[0].searchCourseCode.value;
  		document.forms[2].searchdate.value=document.forms[0].searchdate.value;		
		document.forms[2].submit();
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="교육시간표-등록" src="/images/operation/title_02-3.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td>
						<!--검색 -->
						<html:form method="POST" action="crsTimeTblDay.act?task=search_time">
							<input type="hidden" name="disEduFrom" id="disEduFrom" value="${disEduFrom}" />
							<input type="hidden" name="today" id="disEduFrom" value="${today}" />
							<input type="hidden" name="disEduTo" id="disEduTo" value="${disEduTo}" />
							<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
								<tr>
									<td width="119" class="s1">과정</td>
									<td class="sBar"></td>
									<td class="s2" width="370">
										<select id="searchYear"></select>
										<select id="searchCourseName" style="width: 200px;">
											<option value="">과정 선택</option>
										</select>
										<select id="searchKeyword" style="width: 100px;">
											<option value="">과정기수 선택</option>
										</select>
										<html:hidden property="searchColumn" />
										<html:hidden property="searchCourseCode" />
										<%--<html:text property="searchCourseCode" style="width:80px;" maxlength="12" onkeydown="if(event.keyCode==13)setCrs();"/>&nbsp;
										<html:text property="searchCourseName" style="width:220px" readonly="true"/> --%>
									</td>
									<%--
									<td class="s2" width="25">
										<img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' alt="과정 연결" onClick="setCrs();" style="cursor:hand" align="absbottom">
									</td> --%>
									<td class="sBar"></td>
									<td width="79" class="s1">날짜</td>
									<td class="sBar"></td>
									<td class="s2">
										<html:text property="searchdate" style="width:75px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()" readonly="true" />
										<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_D(this, searchdate, 'yyyy-mm-dd');">
									</td>
									<td width="60">
										<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="doSearch(document.forms[0]);" style="cursor: hand" align="absbottom" />
									</td>
								</tr>
							</table>
						</html:form>
						<!--검색 끝-->
						<table width="750" cellspacing="0" cellpadding="0">
							<tr valign="bottom">
								<td class="t3" height="25">
									<c:if test="${eduDate != null}">
										<b>교육기간 : <c:out value="${eduDate}" /></b>
									</c:if>
								</td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
							<tr>
								<td>
									<!--테이블 헤더 시작-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="69">
												<span class="red">*</span>시작시각
											</td>
											<td class="sBg"></td>
											<td class="t1" width="69">
												<span class="red">*</span>종료시각
											</td>
											<td class="sBg"></td>
											<td class="t1" width="39">시간</td>
											<td class="sBg"></td>
											<td class="t1">
												<span class="red">*</span>과목명
											</td>
											<td class="sBg"></td>
											<td class="t1" width="119">
												<span class="red">*</span>강사등급
											</td>
											<td class="sBg"></td>
											<td class="t1" width="119">
												<span class="red">*</span>강사소속
											</td>
											<td class="sBg"></td>
											<td class="t1" width="119">
												<span class="red">*</span>강사
											</td>
											<td class="sBg"></td>
											<td class="t1" width="50">비고</td>
										</tr>
									</table>
									<!--테이블 헤더 끝-->
									<!--리스트 시작-->
									<html:form action="crsTimeTblDay.act?task=save_time" method="post">
										<html:hidden property="coursecode" />
										<html:hidden property="lectdate" />
										<html:hidden property="subjname" />
										<html:hidden property="gubun" />
										<table width="746" border="0" cellspacing="0" cellpadding="0">
											<c:if test="${eduDate != null}">
												<!-- 기등록된 시간표 -->
												<c:forEach var="timeList" items="${rsCrs_TimeTblList}" varStatus="i">
													<tr>
														<td class="t2" width="69">
															<html:select property="fromtime" value="${timeList.fromtime}" onchange="showTime(${i.count},0,this);">
																<html:option value=""></html:option>
																<html:option value="09:00">09:00</html:option>
																<html:option value="10:00">10:00</html:option>
																<html:option value="11:00">11:00</html:option>
																<html:option value="12:00">12:00</html:option>
																<html:option value="13:00">13:00</html:option>
																<html:option value="14:00">14:00</html:option>
																<html:option value="15:00">15:00</html:option>
																<html:option value="16:00">16:00</html:option>
																<html:option value="17:00">17:00</html:option>
																<html:option value="18:00">18:00</html:option>
																<html:option value="19:00">19:00</html:option>
																<html:option value="20:00">20:00</html:option>
																<html:option value="21:00">21:00</html:option>
															</html:select>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="69">
															<html:select property="totime" value="${timeList.totime}" onchange="showTime(${i.count},0,this);">
																<html:option value=""></html:option>
																<html:option value="10:00">09:50</html:option>
																<html:option value="11:00">10:50</html:option>
																<html:option value="12:00">11:50</html:option>
																<html:option value="13:00">12:50</html:option>
																<html:option value="14:00">13:50</html:option>
																<html:option value="15:00">14:50</html:option>
																<html:option value="16:00">15:50</html:option>
																<html:option value="17:00">16:50</html:option>
																<html:option value="18:00">17:50</html:option>
																<html:option value="19:00">18:50</html:option>
																<html:option value="20:00">19:50</html:option>
																<html:option value="21:00">20:50</html:option>
																<html:option value="22:00">21:50</html:option>
															</html:select>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="39" id="time">${timeList.eduhour}</td>
														<td class="sBg"></td>
														<td class="t2" id="subject_zone">
															<%-- <html:select property="subjseq" value="${timeList.subjseq}" style="width:65%;" onchange="eatingTime(${i.count}, 0, 1);">
																<html:optionsCollection name="rsSubject" property="beanCollection" />
															</html:select> --%>
															<html:hidden property="subjseq" value="${i.count}"/>
															<html:text property="timesubject" style="width:95%;" onkeyup="eatingTime(${i.count}, 0, 1);" value="${timeList.timesubject }" />
															
															<%-- &nbsp;
															<c:if test="${eduDate != null}">
																<c:if test="${searchday >= today }">
																	<img onclick="newSubject(${i.count}, 0)" src='<html:rewrite page="/images/board/btn_plus.gif"/>' align="absmiddle" alt="추가" style="cursor: hand" />
																	<img onclick="delSubject(${i.count}, 0)" src='<html:rewrite page="/images/board/btn_minus.gif"/>' align="absmiddle" alt="삭제" style="cursor: hand" />
																</c:if>
																<c:if test="${searchday < today }">
																	<img src='<html:rewrite page="/images/board/btn_plus_off.gif"/>' align="absmiddle" alt="추가" />
																	<img src='<html:rewrite page="/images/board/btn_minus_off.gif"/>' align="absmiddle" alt="삭제" />
																</c:if>
															</c:if> --%>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="119" id="assign_zone">
															<html:select property="profLevel" value="${timeList.profLevel}" style="width:90%;">
																<html:optionsCollection name="rsProfLevel" property="beanCollection" />
															</html:select>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="119">
															<input type="text" name="profAssign" value="${timeList.profAssign}" style="width: 70px;" readonly="readonly">
														</td>
														<td class="sBg"></td>
														<td class="t2" width="119" id="prof_zone">
															<input type="text" name="profName" value="${timeList.profName}" style="width: 70px;">
														 	<input type="hidden" name="profnoarray" value="${timeList.profNo}" style="width: 70px;">
															<img id="popup_prof" name="popup_prof" onclick="setProf('${i.count }',0)" src='<html:rewrite page="/images/board/btn_zoom.gif"/>' width="19" height="19" align="absmiddle" alt="찾아보기"  style="cursor: hand" />
														</td>
														<td class="sBg"></td>
														<td class="t2" width="50">
															<c:if test="${eduDate != null}">
																<c:if test="${searchday >= today }">
																	<img onclick="deleteTime('${j.count}','${i.count}', 1);" src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="삭제" style="cursor: hand" />
																</c:if>
																<c:if test="${searchday < today }">
																	<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" />
																</c:if>
															</c:if>
														</td>
													</tr>
													<tr>
														<td class="lbg3" colspan="20"></td>
													</tr>
													<c:set var="count" value="${i.count}" />
												</c:forEach>
												<!-- 기 등록된 시간표 끝 -->
												<!-- 기본 시간표 입력 폼 -->
												<c:forEach varStatus="j" begin="${count}" end="9" step="1">
													<tr>
														<td class="t2" width="69">
															<html:select property="fromtime" onchange="showTime('${j.count}','${count}',this);">
																<html:option value=""></html:option>
																<html:option value="09:00">09:00</html:option>
																<html:option value="10:00">10:00</html:option>
																<html:option value="11:00">11:00</html:option>
																<html:option value="12:00">12:00</html:option>
																<html:option value="13:00">13:00</html:option>
																<html:option value="14:00">14:00</html:option>
																<html:option value="15:00">15:00</html:option>
																<html:option value="16:00">16:00</html:option>
																<html:option value="17:00">17:00</html:option>
																<html:option value="18:00">18:00</html:option>
																<html:option value="19:00">19:00</html:option>
																<html:option value="20:00">20:00</html:option>
																<html:option value="21:00">21:00</html:option>
															</html:select>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="69">
															<html:select property="totime" onchange="showTime('${j.count}','${count}',this);">
																<html:option value=""></html:option>
																<html:option value="10:00">09:50</html:option>
																<html:option value="11:00">10:50</html:option>
																<html:option value="12:00">11:50</html:option>
																<html:option value="13:00">12:50</html:option>
																<html:option value="14:00">13:50</html:option>
																<html:option value="15:00">14:50</html:option>
																<html:option value="16:00">15:50</html:option>
																<html:option value="17:00">16:50</html:option>
																<html:option value="18:00">17:50</html:option>
																<html:option value="19:00">18:50</html:option>
																<html:option value="20:00">19:50</html:option>
																<html:option value="21:00">20:50</html:option>
																<html:option value="22:00">21:50</html:option>
															</html:select>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="39" id="time"></td>
														<td class="sBg"></td>
														<td class="t2" id="subject_zone">
															<%-- <html:select property="subjseq" style="width:65%;" onchange="eatingTime('${j.count}','${count}', 2);">
																<html:optionsCollection name="rsSubject" property="beanCollection" />
															</html:select> --%>
															<html:hidden property="subjseq" value="${j.count}"/>
															<html:text property="timesubject" style="width:95%;" onkeyup="eatingTime('${j.count}','${count}', 2);" value="${timeList.timesubject }" />
														<%-- 	&nbsp;
															<c:if test="${eduDate != null}">
																<c:if test="${searchday >= today }">
																	<img onclick="newSubject('${j.count}','${count}')" src='<html:rewrite page="/images/board/btn_plus.gif"/>' align="absmiddle" alt="추가" style="cursor: hand" />
																	<img onclick="delSubject('${j.count}','${count}')" src='<html:rewrite page="/images/board/btn_minus.gif"/>' align="absmiddle" alt="삭제" style="cursor: hand" />
																</c:if>
																<c:if test="${searchday < today }">
																	<img src='<html:rewrite page="/images/board/btn_plus_off.gif"/>' align="absmiddle" alt="추가" />
																	<img src='<html:rewrite page="/images/board/btn_minus_off.gif"/>' align="absmiddle" alt="삭제" />
																</c:if>
															</c:if> --%>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="119" id="assign_zone">
															<html:select property="profLevel" value="${timeList.profLevel}" style="width:90%;">
																<html:optionsCollection name="rsProfLevel" property="beanCollection" />
															</html:select>
														</td>
														<td class="sBg"></td>
														<td class="t2" width="119">
															<input type="text" name="profAssign" value="${timeList.profAssign}" style="width: 70px;" readonly="readonly">
														</td>
														<td class="sBg"></td>
														<td class="t2" width="119" id="prof_zone">
															<input type="text" name="profName" style="width: 70px;"> <input type="hidden" name="profnoarray" style="width: 70px;">
															<img id="popup_prof" name="popup_prof" onclick="setProf('${j.count}','${count}')" src='<html:rewrite page="/images/board/btn_zoom.gif"/>' width="19" height="19" align="absmiddle" alt="찾아보기" style="cursor: hand" />
														</td>
														<td class="sBg"></td>
														<td class="t2" width="50">
															<c:if test="${eduDate != null}">
																<c:if test="${searchday >= today }">
																	<img onclick="deleteTime('${j.count}','${count}', 2);" src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="삭제" style="cursor: hand" />
																</c:if>
																<c:if test="${searchday < today }">
																	<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" align="absmiddle" />
																</c:if>
															</c:if>
														</td>
													</tr>
													<tr>
														<td class="lbg3" colspan="20"></td>
													</tr>
													<c:set var="count_j" value="${j.count}" />
												</c:forEach>
												<!-- 기본 시간표 입력 폼 끝 -->
											</c:if>
											<c:if test="${eduDate == null}">
												<tr class="tbg3" height="21">
													<td class="t2" colspan="20">조회된 데이터가 없습니다.</td>
												</tr>
											</c:if>
										</table>
									</html:form>
								</td>
							</tr>
						</table>
						<input type="hidden" id="max" name="max" value="${count_j + count}" />
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom">
								<td align="right">
									<%-- <c:if test="${eduDate != null}">
										<c:if test="${searchday >= today }"> --%>
											
											<html:form action="crsTimeTblDay.act?task=save_time_xls" method="post" enctype="multipart/form-data">
												<html:hidden property="coursecode" />
												<html:hidden property="lectdate" />
												<html:hidden property="subjname" />
												<html:hidden property="searchdate" />
												<html:hidden property="gubun" />
												<img src='<html:rewrite page="/images/board/btn_dawnload.gif"/>' align="absmiddle" alt="입력양식 다운로드" onclick="location.href='<html:rewrite page="/crsTimeTblDay.act?task=sample"/>'" style="CURSOR:hand" />
												<html:file property="file" style="width:330px;"></html:file>
												<img src='<html:rewrite page="/images/board/btn_upload.gif"/>' align="absmiddle" alt="업로드" onclick="excel_upload();" style="CURSOR:hand" />
											</html:form>
											
											<input type="text" name="copyDate" id="copyDate" style="width: 70px" value="${lectDate}" readonly="true" />
											<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absmiddle" style="cursor: hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
											<img src='<html:rewrite page="/images/board/btn_timecopy.gif"/>' align="absmiddle" alt="시간표 복사" onclick="copyTime();" style="CURSOR: hand" />
											<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList()" style="CURSOR: hand" />
											<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="insertTime();" style="CURSOR: hand" />
										<%-- </c:if>
										<c:if test="${searchday < today }">
											<input type="text" name="copyDate" id="copyDate" style="width: 70px" value="${lectDate}" readonly="true" />
											<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absmiddle" style="cursor: hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
											<img src='<html:rewrite page="/images/board/btn_timecopy_off.gif"/>' align="absmiddle" alt="시간표 복사" />
											<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList()" style="CURSOR: hand" />
											<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' align="absmiddle" alt="저장" />
										</c:if>
									</c:if> --%>
									<c:if test="${eduDate == null}">
										<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="목록" onclick="goList()" style="CURSOR: hand" />
									</c:if>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
	document.forms[0].searchCourseCode.focus();
	if(document.all.max.value != 0)
	{
		var frm = document.forms[1];
		for(var no=0; no<9; no++)
		{
			var subjseq = frm.subjseq[no].value;
			if(subjseq == '98' || subjseq == '99')
			{
				frm.profAssign[no].value	= "";
				frm.profnoarray[no].value	= "";
				frm.profName[no].value 	= "";
				frm.profAssign[no].readOnly = true;
				frm.profName[no].readOnly = true;
				frm.profName[no].style.backgroundColor = "#E1E1E1";
				frm.profAssign[no].style.backgroundColor = "#E1E1E1";
				frm.profName[no].style.borderStyle = "groove";
				frm.profAssign[no].style.borderStyle = "groove";
				frm.popup_prof[no].src = '<html:rewrite page="/images/board/btn_zoom_off.gif"/>';
				frm.popup_prof[no].onclick = "";
			}
		}
	}
</script>
