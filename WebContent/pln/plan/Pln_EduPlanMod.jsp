<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
<!--


	// 과정 추가
	function addCourse()
	{
		var dataList = $('course_list');

		var seq = $('courseSeq').value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;

		var max = $('courseMax').value
		var maxRow = Number(max);
		var nMaxRow = maxRow + 1;
		
		if(!checkCourse(maxRow,maxRow)) return;

		var ref_row = dataList.insertRow(maxRow);

		ref_row.id = "course" + seqRow;

    $('courseMax').value = nMaxRow;
		$('courseSeq').value = nSeqRow;

		//기수
		ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.width="49";
        ref_cell.id = "course";


        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";


		//교육기간
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('eduFromTo').innerHTML;


		//라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//교육인원
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('count').innerHTML;
        ref_cell.width="119";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //강의실
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('room').innerHTML;
        ref_cell.width="119";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //버튼
         var id = "course" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "cBtn" + String(seqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick=deleteCourse("'+id+'"); style="cursor:hand" />';
        ref_cell.width="60";

        resetCourse(nMaxRow);

		checkCourseNo();


	}

	// 과정 삭제
	function deleteCourse(obj)
	{
		var frm = document.forms[0];
		
		var dataList = $('data_list');
		var node = $(obj);

		var max = frm.courseMax.value
		var maxRow = Number(max);
		var nMaxRow = max - 1;

		frm.courseMax.value = nMaxRow;
		frm.courseSeq.value = frm.courseSeq.value - 1;

		node.parentNode.removeChild(node);

		if(nMaxRow == 0) return;
		checkCourseNo();
	}

	// 기수번호 정렬
	function checkCourseNo()
	{
		var i = 0;

		if(document.all.course.length)
		{

			while(document.all.course[i])
			{

				var value = i + 1;
				document.all.course[i].innerHTML = value;
				document.all.course[i].innerHTML += '<input type="hidden" name="turnNo" id="turnNo" value="'+value+'">'
				i++;
			}
		}
		else
		{
				document.all.course.innerHTML = 1;
				document.all.course.innerHTML += '<input type="hidden" name="turnNo" id="turnNo" value="1">'
		}
	}


		// 과목추가
	function addSubject()
	{
		var frm = document.forms[0];
		var dataList = $('subject_list');

		var seq = frm.subjectSeq.value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;

		var max = frm.subjectMax.value;
		var maxRow = Number(max);
		var nMaxRow = maxRow + 1;

		if(!checkSubject(maxRow,maxRow)) return;

		var ref_row = dataList.insertRow(maxRow);

		ref_row.id = "subject" + seqRow;

    frm.subjectMax.value = nMaxRow;
		frm.subjectSeq.value = nSeqRow;


		//교과목
		ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.id = "subject";
        ref_cell.innerHTML = $('name').innerHTML;

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//분야
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('type').innerHTML;
        ref_cell.width="100";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //교육시간(강의식)
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('lectd').innerHTML;
        ref_cell.width="62";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";
        
        //교육시간(참여학습)
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('pattd').innerHTML;
        ref_cell.width="62";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";  
        
        //교육시간(기타)
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('etctd').innerHTML;
        ref_cell.width="62";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

       	//순서
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('order').innerHTML;
        ref_cell.width="60";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //버튼
        var id = "subject" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "sBtn" + String(seqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick=deleteSubject("'+id+'"); style="cursor:hand" />';
        ref_cell.width="60";

        resetSubject(nMaxRow);


	}

	// 과목 삭제
	function deleteSubject(obj)
	{
		var frm = document.forms[0];

		var dataList = $('subject_list');
		var node = $(obj);

		var max = frm.subjectMax.value
		var maxRow = Number(max);
		var nMaxRow = max - 1;

		frm.subjectMax.value = nMaxRow;
		frm.subjectSeq.value = frm.subjectSeq.value - 1;

		node.parentNode.removeChild(node);

	}
	// 기수 초기화
	function resetCourse(row)
	{
		document.all.eduFrom[row].value = "";
		document.all.eduTo[row].value = "";
		document.all.eduCount[row].value = "";
		document.all.lecRoomNo[row].selectedIndex = 0;


	}


		// 과목 초기화
	function resetSubject(row)
	{
		document.all.subjName[row].value = "";
		document.all.subjType[row].value = "";
		document.all.lecHour[row].value = "";
		document.all.patHour[row].value = "";
		document.all.etcHour[row].value = "";
		//document.all.eduMethod[row].selectedIndex = 0;
		document.all.ord[row].value = "";


	}

	//수정시 조회된 기수 및 과목수 설정
	function checkList()
	{

	}

	//교육계획서 저장
	function insertPlan()
	{
		if(!checkPlan()) return;

		var cMax = $('courseMax').value;
		var cMaxRow = Number(cMax);
		var sMax = $('subjectMax').value;
		var sMaxRow = Number(sMax);

		for(var i = 0; i<cMax; i++)
		{
			if(!checkCourse(i, cMax)) return;
		}

		for(var i = 0; i<sMax; i++)
		{
			if(!checkSubject(i, sMax)) return;
		}

		if(document.all.subjName[0] == null)
		{
			alert("교육내용을 입력하세요.");
			document.all.subjName.focus();
			return;
		}
		
		var frm = document.forms[0];

		frm.submit();
	}

		//교육계획서 삭제
	function deletePlan()
	{
		if(confirm('삭제하시겠습니까?'))
		{
			var code = document.all.crsClumpCode.value;
			document.location.href = "eduPlan.act?task=delete&crsClumpCode="+code;
		}
	}

	//신규화면시 초기값 설정
	function setDefault(key)
	{
		if(key == 'create')
		{
			document.all.applyYear.selectedIndex = 6;
			document.all.subjectMax.value = 0;
			document.all.courseMax.value = 0;
			document.all.subjectSeq.value = 0;
			document.all.courseSeq.value = 0;
		}
	}

	//계획서  정보 체크
	function checkPlan()
	{
		var frm = document.forms[0];

		if(frm.crsType.value=='')
		{
			alert('분류를 선택하세요');
			frm.crsType.focus();
			return false;
		}

		if(frm.crsClumpName.value=='')
		{
			alert('과정명을 입력하세요');
			frm.crsClumpName.focus();
			return false;
		}

		var courseNameLength = byteCheck(frm.crsClumpName.value)
		if(courseNameLength > 70)
		{
			alert('과정명은 70자를 초과하여 입력할 수 없습니다.\n계산:한글(2)+영어(1)+특수문자(1)\n현재 입력된 길이 : ' + courseNameLength);
			frm.crsClumpName.focus();
			return;
		}

		if(frm.applyYear.value=='')
		{
			alert('적용년도를 입력하세요');
			frm.applyYear.focus();
			return false;
		}
		
		// 교육기간 From 값이 To 값보다 큰지 체크
		var courseNum = frm.courseSeq.value;		
		var eduFrom = null;
		var eduTo = null;		
		var eduYear = frm.applyYear.value;		
		
		if(courseNum == 0)
		{
			eduFrom = frm.eduFrom.value;
			eduTo   = frm.eduTo.value;
			
			if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
			{
				alert('교육기간을 잘못 입력하셨습니다.');
				frm.eduFrom.focus();
				return false;
			}
		}
		else
		{
			for(var i=0; i<courseNum; i++)
			{
				eduFrom = frm.eduFrom[i].value;
				eduTo   = frm.eduTo[i].value;
				
				if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
				{
					alert('교육기간을 잘못 입력하셨습니다.');
					frm.eduFrom[i].focus();
					return false;
				}
			}
		}
		
		
		// 교육기간 및 교육인원를 입력했으나 추가버튼을 누르지 않았을 경우
		
		if(courseNum == 0)
		{
			if(frm.eduFrom.value != "" || frm.eduTo.value != "" || frm.eduCount.value != "")
			{
				alert('입력한 교육기간 및 교육인원 정보를 추가하세요.');
				frm.eduFrom.focus();
				return false;
			}
		}
		else 
		{
			if(frm.eduFrom[courseNum].value != "" || frm.eduTo[courseNum].value != "" || frm.eduCount[courseNum].value != "")
			{
				alert('입력한 교육기간 및 교육인원 정보를 추가하세요.');
				frm.eduFrom[courseNum].focus();
				return false;
			}
		}
		
		// 교육내용을 입력했으나 추가버튼을 누르지 않았을 경우
		var subjectNum = frm.subjectSeq.value;				
		if(subjectNum == 0)
		{
			if(frm.subjName.value != "")
			{
				alert('입력한 교육내용 정보를 추가하세요.');
				frm.subjName.focus();
				return false;
			}
		}
		else 
		{
			if(frm.subjName[subjectNum].value != "")
			{
				alert('입력한 교육내용 정보를 추가하세요.');
				frm.subjName[subjectNum].focus();
				return false;
			}
		}
		
		return true;
	}


	//기수 정보 체크
	function checkCourse(idx, cMax)
	{
		var frm = document.forms[0];

		if(cMax>0)
		{

			if(frm.eduFrom[idx].value == '')
			{
				alert("교육기간을 입력하세요");
				frm.eduFrom[idx].focus();
				return false;
			}

			if(frm.eduTo[idx].value == '')
			{
				alert("교육기간을 입력하세요");
				frm.eduTo[idx].focus();
				return false;
			}

			if(frm.eduCount[idx].value == '')
			{
				alert("교육인원을 입력하세요");
				frm.eduCount[idx].focus();
				return false;
			}
		}

		else
		{

			if(frm.eduFrom.value == '')
			{
				alert("교육기간을 입력하세요");
				frm.eduFrom.focus();
				return false;
			}

			if(frm.eduTo.value == '')
			{
				alert("교육기간을 입력하세요");
				frm.eduTo.focus();
				return false;
			}

			if(frm.eduCount.value == '')
			{
				alert("교육인원을 입력하세요");
				frm.eduCount.focus();
				return false;
			}
		}

		return true;

	}

	//과목정보 체크
	function checkSubject(idx, sMax)
	{
		var frm = document.forms[0];

		if(sMax>0)
		{

			if(frm.subjName[idx].value == '')
			{
				alert("과목명을 입력하세요");
				frm.subjName[idx].focus();
				return false;
			}
			var subjNameLength = byteCheck(frm.subjName[idx].value);
			if(subjNameLength > 50)
			{
				alert('과목명은 50자를 초과하여 입력할 수 없습니다.\n계산:한글(2)+영어(1)+특수문자(1)\n현재 입력된 길이 : ' + subjNameLength);
				frm.subjName[idx].focus();
				return false;
			}
		}
		else
		{
			if(frm.subjName.value == '')
			{
				alert("과목명을 입력하세요");
				frm.subjName.focus();
				return false;
			}
			var subjNameLength = byteCheck(frm.subjName.value);
			if(frm.subjName.value == '')
			{
				alert('과목명은 50자를 초과하여 입력할 수 없습니다.\n계산:한글(2)+영어(1)+특수문자(1)\n현재 입력된 길이 : ' + subjNameLength);
				frm.subjName.focus();
				return false;
			}
		}

		return true;

	}

	//교육계획서 삭제
	function deletePlan()
	{
		if(confirm('삭제하시겠습니까?'))
		{
			var frm = document.forms[0];
			var code = frm.crsClumpCode.value;
			var selPlanYear = frm.selPlanYear.value;
			var selCrsType 	= frm.selCrsType.value;
			document.location.href = "eduPlan.act?task=delete&crsClumpCode="+code+"&selPlanYear="+selPlanYear+"&selCrsType="+selCrsType;
		}
	}
	
	//교육계획 목록으로
	function goList()
	{
		var selPlanYear 	= document.all.selPlanYear.value;
		var selCrsType 		= document.all.selCrsType.value;
		var searchKeyword = document.all.searchKeyword.value;
		document.forms[0].action = 'eduPlan.act?task=list&selPlanYear='+selPlanYear+'&selCrsType='+selCrsType+'&searchKeyword='+searchKeyword;
		document.forms[0].submit();
	}
	
	function checkSubjname()
	{
		var frm = document.forms[0];
		var idx = frm.subjectMax.value;
		
		if(idx>0)
		{
			var subjNameLength = byteCheck(frm.subjName[idx].value);
			if(subjNameLength > 50)
			{
				alert('과목명은 50자를 초과하여 입력할 수 없습니다.\n계산:한글(2)+영어(1)+특수문자(1)\n현재 입력된 길이 : ' + subjNameLength);
				frm.subjName[idx].focus();
				return false;
			}
		}
		else
		{
			var subjNameLength = byteCheck(frm.subjName.value);
			if(subjNameLength > 50)
			{
				alert('과목명은 50자를 초과하여 입력할 수 없습니다.\n계산:한글(2)+영어(1)+특수문자(1)\n현재 입력된 길이 : ' + subjNameLength);
				frm.subjName.focus();
				return false;
			}
		}
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<c:if test="${key eq 'create'}">
	  <h1><img alt="계획서-신규등록" src="/images/edu/title_03-2.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create'}">
	  <h1><img alt="계획서-수정" src="/images/edu/title_03-5.gif" /></h1>
	</c:if>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>

                  <!--테이블 헤더 시작-->
                  <html:form  action="/eduPlan.act" method="POST">
                  <input type="hidden" name="task" value="insert">
                  <html:hidden property="crsClumpCode"/>
                  <html:hidden property="selPlanYear" value="${year}"/>
                  <html:hidden property="selCrsType" value="${crs}"/>
                	<html:hidden property="searchKeyword" value="${searchKeyword}"/>
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="lbg"></td>
                      <td class="cbg4" >
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr >
                            <td width="109" class="t1up"><span class="red">*</span>기본정보</td>
                            <td class="s3none">
                              <!--기본정보 테이블 시작-->
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="74" class="s1up">분류</td>
                                  <td class="sBar"></td>
                                  <td class="s2" width="129">
                                    <html:select property="crsType">
			    														<html:optionsCollection name="crsType" property="beanCollection" />
			    			 										</html:select>
			    			 										<!-- 
                            				<c:if test="${crs != null}">
	                                    <html:select property="crsType" value="${crs}">
				    														<html:optionsCollection name="crsType" property="beanCollection" />
				    			 										</html:select>
				    			 									</c:if>
                            				<c:if test="${crs == null}">
	                                    <html:select property="crsType">
				    														<html:optionsCollection name="crsType" property="beanCollection" />
				    			 										</html:select>
				    			 									</c:if>
				    			 									 -->
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="11" class="lbg3"></td>
                                </tr>
                                <tr>
                                  <td width="74" class="s1up">과정명</td>
                                  <td class="sBar"></td>
                                  <td class="s2" colspan="9">
                                    <html:text property="crsClumpName" style="width:250px;"></html:text>
                                  </td>
                                </tr>
                              </table>
                              <!--기본정보 테이블 끝-->
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">교육목표</td>
                            <td class="s3">
															<c:if test="${eduObjectives eq '' || eduObjectives eq null}">
                            		<html:textarea property="eduObjectives" style="width:98%;" rows="3" value="○
○"></html:textarea>
															</c:if>
															<c:if test="${eduObjectives ne '' && eduObjectives ne null}">
	                            	<html:textarea property="eduObjectives" style="width:98%;" rows="3"></html:textarea>
	                            </c:if>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">교육대상<br>및 <br> 일수</td>
                            <td class="s3none">
                            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                            		<tr>
                            			<td class="s1up">교육대상</td>
                                  <td class="sBar"></td>
                            			<td class="s1up">교육일수</td>
                                </tr>
                                <tr>
                                  <td colspan="3" class="lbg3"></td>
                                </tr>                                
                                <tr>                                  
                            			<td class="s2Center"><html:text property="eduTarget" style="width:450px;" maxlength="50"></html:text></td>
                                  <td class="sBar"></td>
                            			<td class="s2Center"><html:text property="dayCount" style="width:90px; IME-MODE:disabled" maxlength="3" onkeydown="key_num();"></html:text></td>
			                          </tr>
															</table>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up"><span class="red">*</span>교육기간<br>및 <br> 교육인원</td>
                            <td class="s3none">
                              <!--교육기간 및 교육인원 테이블 시작-->

                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="49" class="s1up">기수</td>
                                  <td class="sBar"></td>
                                  <td class="s1up">교육기간</td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s1up">교육인원</td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s1up">강의실</td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">처리</td>
                                </tr>
                                <tr>
                                  <td colspan="9" class="lbg3"></td>
                                </tr>

															<tbody id="course_list">
															<c:forEach var="crsList" items="${crsList}" varStatus="i" >
																<tr id="course${i.count - 1}">

                                  <td width="49" class="s2Center" id="course" style="border-bottom:1px solid #D6D6D6">${i.count} <input type="hidden" name="turnNo" id="turnNo" value="${crsList.num}"></td>

                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="eduFrom" style="width:90px" readonly="true" value="${crsList.eduFrom}"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                                    ~
                                    <input type="text" name="eduTo" style="width:90px" readonly="true" value="${crsList.eduTo}"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd');">
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="119" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="eduCount" style="width:60%; IME-MODE:disabled" onkeydown="key_num();" value="${crsList.eduCount}">
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="119" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <html:select property="lecRoomNo" value="${crsList.lecRoomNo}">
											    						<html:optionsCollection name="roomInfo" property="beanCollection" />
											    			 		</html:select>
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="60" class="s2Center" id="cBtn${i.count - 1}" style="border-bottom:1px solid #D6D6D6"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick="deleteCourse('course${i.count - 1}');" style="cursor:hand" /></td>
                                </tr>
                                <c:set var="crsCount" value="${i.count}"/>
                                </c:forEach>
                                </tbody>
                                <tr>
                                  <td width="49" class="s2Center" ><input type="hidden" name="turnNo" id="turnNo" ></td>
                                  <td class="sBar"></td>
                                  <td class="s2Center" id="eduFromTo">
                                    <input type="text" name="eduFrom" style="width:90px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                                    ~
                                    <input type="text" name="eduTo" style="width:90px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd');">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s2Center" id="count">
                                    <input type="text" name="eduCount" style="width:60%; IME-MODE:disabled" onkeydown="key_num();">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s2Center" id="room">
                                    <html:select property="lecRoomNo" >
											    						<html:optionsCollection name="roomInfo" property="beanCollection" />
											    			 		</html:select>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="추가" align="absmiddle"  onclick="addCourse();" style="cursor:hand"/></td>
                                </tr>
                              </table>
															<input type="hidden" id="courseSeq" name="courseSeq" value="${crsCount}" >
                              <input type="hidden" id="courseMax" name="courseMax" value="${crsCount}" >
                              <!--교육기간 및 교육인원 테이블 끝-->
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up"><span class="red">*</span>교육내용</td>
                            <td class="s3none">
                            
                              <!--교육내용 테이블 시작-->
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td class="s1up">교과목</td>
                                  <td class="sBar"></td>
                                  <td width="100" class="s1up">분야</td>
                                  <td class="sBar"></td>
                                  <td class="s1up" width="188" colspan="5">
                                  	<table width="100%"> 
                                  		<tr>
                                  			<td class="s1up" colspan="5">교육시간</td>
                                  		</tr>
                                  		<tr>
                                  			<td class="sBar" colspan="5"></td>
                                  		</tr>
                                  		<tr>
			                                  <td width="62" class="s1up">강의식</td>
			                                  <td class="sBar"></td>
																				<td width="62" class="s1up">참여학습</td>
			                                  <td class="sBar"></td>
			                                  <td width="62" class="s1up">기타</td>
			                                </tr>
			                              </table>	
			                            <td class="sBar"></td>
                                  <td width="60" class="s1up">순서</td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">처리</td>
                                </tr>
                                <tbody id="subject_list">
                                <c:forEach var="subList" items="${subList}" varStatus="i" >
																<tr id="subject${i.count - 1}">
                                  <td class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="subjName" style="width:90%;" value='<c:out value="${subList.subjName}" escapeXml="false"/>' onkeydown="checkSubjname();">
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="100" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <html:select property="subjType" value="${subList.subjType}">
			    														<html:optionsCollection name="subType" property="beanCollection" />
			    			 										</html:select>
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="62" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="lecHour" style="width:80%; IME-MODE:disabled" onkeydown="key_num()" value="${subList.lecHour}" >
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="62" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="patHour" style="width:80%; IME-MODE:disabled" onkeydown="key_num()" value="${subList.patHour}" >
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="62" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="etcHour" style="width:80%; IME-MODE:disabled" onkeydown="key_num()" value="${subList.etcHour}" >
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="60" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="ord" style="width:80%; IME-MODE:disabled" onkeydown="key_num()" value="${subList.ord}" >
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="60" class="s2Center" id="sBtn${i.count - 1}" style="border-bottom:1px solid #D6D6D6">
                                  	<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick="deleteSubject('subject${i.count - 1}');" style="cursor:hand"/>
                                  </td>
                                </tr>
                                <c:set var="subCount" value="${i.count}"/>
                                </c:forEach>
                                </tbody>
                                <tr>
                                  <td class="s2Center" id="name">
                                    <input type="text" name="subjName" style="width:90%;" onkeydown="checkSubjname();">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="100" class="s2Center" id="type">
                                    <html:select property="subjType">
			    														<html:optionsCollection name="subType" property="beanCollection" />
			    			 										</html:select>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="62" class="s2Center" id="lectd">
                                    <input type="text" name="lecHour" style="width:80%; IME-MODE:disabled" onkeydown="key_num()">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="62" class="s2Center" id="pattd">
                                    <input type="text" name="patHour" style="width:80%; IME-MODE:disabled" onkeydown="key_num()">
                                  </td>
                                 	<td class="sBar"></td>
                                  <td width="62" class="s2Center" id="etctd">
                                    <input type="text" name="etcHour" style="width:80%; IME-MODE:disabled" onkeydown="key_num()">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center" id="order">
                                    <input type="text" name="ord" style="width:80%; IME-MODE:disabled" onkeydown="key_num()">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center"> <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="추가" align="absmiddle" onclick="addSubject();" style="cursor:hand"/>
                                  </td>
                                </tr>
                              </table>
															<input type="hidden" id="subjectSeq" name="subjectSeq" value="${subCount}" >
                              <input type="hidden" id="subjectMax" name="subjectMax" value="${subCount}" >
                              <!--교육내용 테이블 끝-->
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">담당자</td>
                            <td class="s3">
                              	<html:select property="charger">
                              	<html:option value=""></html:option>
			    						<html:optionsCollection name="crsUser" property="beanCollection" />
			    			 	</html:select>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">적용년도</td>
                            <td class="s3">
                            	<c:if test="${mode != 'modify'}">
                              	<html:hidden property="applyYear" value="${year}"/><font color="#000000">${year}</font>
                              </c:if>                              
                            	<c:if test="${mode == 'modify'}">
                              	<html:hidden property="applyYear"/><font color="#000000">${rsPln_EduPlan.applyYear}</font>
                              </c:if>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  </html:form>
                  <!--테이블 헤더 시작-->
                </td>
              </tr>
              <tr>
                <td>
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom">
                      <td align="right">
                      	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" align="absmiddle" onclick="insertPlan();" style="CURSOR: hand" />
												<c:if test="${key==null}">
                        	<img src='<html:rewrite page="/images/board/btn_del.gif"/>' width="57" height="25" alt="삭제" align="absmiddle" onclick="deletePlan();" style="CURSOR: hand"/>
                        </c:if>
                        <img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록" onclick="goList();" style="CURSOR: hand"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<script type="text/javascript">
<!--
	setDefault('${key}');
//-->
</script>
