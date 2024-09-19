<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
<!--

	// 교육 기간 추가
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


		//횟수
		ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.width="28";
        ref_cell.id = "course";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";


		//수강신청 기간
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('reqFromTo').innerHTML;
		//라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //학습 기간
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('eduFromTo').innerHTML;
        ref_cell.width="204";

		//라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//기준년월
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('applyYM').innerHTML;
        ref_cell.width="74";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//교육인원
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('count').innerHTML;
        ref_cell.width="52";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //버튼
        var id = "course" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "cBtn" + String(nSeqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick=deleteCourse("'+id+'"); style="cursor:hand" />';
        ref_cell.width="55";

        resetCourse(nMaxRow);

		checkCourseNo();


	}

	// 과정 삭제
	function deleteCourse(obj)
	{

		var dataList = $('data_list');
		var node = $(obj);

		var max = $('courseMax').value
		var maxRow = Number(max);
		var nMaxRow = max - 1;

		$('courseMax').value = nMaxRow;
		$('courseSeq').value = nMaxRow;

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

	// 교육내용 추가
	function addSubject()
	{
		var dataList = $('subject_list');

		var seq = $('subjectSeq').value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;

		var max = $('subjectMax').value
		var maxRow = Number(max);
		var nMaxRow = maxRow + 1;

		if(!checkSubject(maxRow,maxRow)) return;

		var ref_row = dataList.insertRow(maxRow);

		ref_row.id = "subject" + seqRow;


    $('subjectMax').value = nMaxRow;
		$('subjectSeq').value = nSeqRow;


		//차시
		ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "subject";
        ref_cell.innerHTML = $('subName').innerHTML;
        ref_cell.width="99";

        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//주요내용
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('contents').innerHTML;


        //라인
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //버튼
        var id = "subject" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "sBtn" + String(nSeqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick=deleteSubject("'+id+'"); style="cursor:hand" />';
        ref_cell.width="55";

        resetSubject(nMaxRow);


	}

	// 교육내용 삭제
	function deleteSubject(obj)
	{
		var dataList = $('subject_list');
		var node = $(obj);

		var max = $('subjectMax').value
		var maxRow = Number(max);
		var nMaxRow = max - 1;

		$('subjectMax').value = nMaxRow;
		$('subjectSeq').value = nMaxRow;

		node.parentNode.removeChild(node);

	}



	// 기수 초기화
	function resetCourse(row)
	{
		document.all.eduFrom[row].value = "";
		document.all.eduTo[row].value = "";
		document.all.reqFrom[row].value = "";
		document.all.reqTo[row].value = "";
		document.all.eduCount[row].value = "";
		document.all.applyYYMM[row].value = "";


	}

	// 교육내용 초기화
	function resetSubject(row)
	{
		document.all.subjName[row].value = "";
		document.all.eduContents[row].value = "";

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
		
		
		// 수강신청기간/학습기간 
		// From 값이 To 값보다 큰지 체크
		// 적용년도안에서 입력한 값인지 체크
		var courseNum = frm.courseSeq.value;	
		var eduYear = frm.applyYear.value;
		var reqFrom = null;
		var reqTo   = null;
		var eduFrom = null;
		var eduTo   = null;
		var applyYYMM = null;
			
		if(courseNum == 0)
		{
			reqFrom = frm.reqFrom.value;
			reqTo   = frm.reqTo.value;
			eduFrom = frm.eduFrom.value;
			eduTo   = frm.eduTo.value;
			applyYYMM = frm.applyYYMM.value;
			
			if(reqFrom>reqTo || reqFrom.substr(0,4) != eduYear || reqTo.substr(0,4) != eduYear)
			{
					alert('수강신청기간을 잘못 입력하셨습니다.');
					frm.reqFrom.focus();
					return false;
			}
			if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
			{
					alert('학습기간을 잘못 입력하셨습니다.');
					frm.eduFrom.focus();
					return false;
			}
			if(applyYYMM.substr(0,4) != eduYear)
			{
					alert('기준년월을 잘못 입력하셨습니다.');
					frm.applyYYMM.focus();
					return false;
			}
		}
		else
		{
			for(var i=0; i<courseNum; i++)
			{
				reqFrom = frm.reqFrom[i].value;
				reqTo   = frm.reqTo[i].value;
				eduFrom = frm.eduFrom[i].value;
				eduTo   = frm.eduTo[i].value;
				applyYYMM = frm.applyYYMM[i].value;
				
				if(reqFrom>reqTo || reqFrom.substr(0,4) != eduYear || reqTo.substr(0,4) != eduYear)
				{
						alert('수강신청기간을 잘못 입력하셨습니다.');
						frm.reqFrom[i].focus();
						return false;
				}
				if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
				{
						alert('학습기간을 잘못 입력하셨습니다.');
						frm.eduFrom[i].focus();
						return false;
				}
				if(applyYYMM.substr(0,4) != eduYear)
				{
						alert('기준년월을 잘못 입력하셨습니다.');
						frm.applyYYMM[i].focus();
						return false;
				}
			}
		}
		
		// 교육기간 및 교육인원를 입력했으나 추가버튼을 누르지 않았을 경우
		if(courseNum == 0)
		{
			if(frm.reqFrom.value != "" || frm.reqTo.value != "" || frm.eduFrom.value != "" || frm.eduTo.value != "" || frm.eduCount.value != "" || frm.applyYYMM.value != "")
			{
				alert('입력한 교육기간 및 교육인원 정보를 추가하세요.');
				frm.reqFrom.focus();
				return false;
			}
		}
		else 
		{
			if(frm.reqFrom[courseNum].value != "" || frm.reqTo[courseNum].value != "" || frm.eduFrom[courseNum].value != "" || frm.eduTo[courseNum].value != "" || frm.eduCount[courseNum].value != ""|| frm.applyYYMM[courseNum].value != "")
			{
				alert('입력한 교육기간 및 교육인원 정보를 추가하세요.');
				frm.reqFrom[courseNum].focus();
				return false;
			}
		}
		
		// 교육내용을 입력했으나 추가버튼을 누르지 않았을 경우
		var subjectNum = frm.subjectSeq.value;
		if(subjectNum == 0)
		{
			if(frm.subjName.value != "" || frm.eduContents.value != "")
			{
				alert('입력한 교육내용 정보를 추가하세요.');
				frm.subjName.focus();
				return false;
			}
		}
		else 
		{
			if(frm.subjName[subjectNum].value != "" || frm.eduContents[subjectNum].value != "")
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

			if(frm.reqFrom[idx].value == '')
			{
				alert("수강신청기간을 입력하세요");
				frm.reqFrom[idx].focus();
				return false;
			}

			if(frm.reqTo[idx].value == '')
			{
				alert("수강신청기간을 입력하세요");
				frm.reqTo[idx].focus();
				return false;
			}

			if(frm.eduFrom[idx].value == '')
			{
				alert("학습기간을 입력하세요");
				frm.eduFrom[idx].focus();
				return false;
			}

			if(frm.eduTo[idx].value == '')
			{
				alert("학습기간을 입력하세요");
				frm.eduTo[idx].focus();
				return false;
			}

			if(frm.applyYYMM[idx].value == '')
			{
				alert("기준년월을 입력하세요");
				frm.applyYYMM[idx].focus();
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

			if(frm.reqFrom.value == '')
			{
				alert("수강신청기간을 입력하세요");
				frm.reqFrom.focus();
				return false;
			}

			if(frm.reqTo.value == '')
			{
				alert("수강신청기간을 입력하세요");
				frm.reqTo.focus();
				return false;
			}

			if(frm.eduFrom.value == '')
			{
				alert("학습기간을 입력하세요");
				frm.eduFrom.focus();
				return false;
			}

			if(frm.eduTo.value == '')
			{
				alert("학습기간을 입력하세요");
				frm.eduTo.focus();
				return false;
			}

			if(frm.applyYYMM.value == '')
			{
				alert("기준년월을 입력하세요");
				frm.applyYYMM.focus();
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
				alert("차시를 입력하세요");
				frm.subjName[idx].focus();
				return false;
			}
			if(frm.eduContents[idx].value == '')
			{
				alert("교육내용을 입력하세요");
				frm.eduContents[idx].focus();
				return false;
			}

		}

		else
		{

			if(frm.subjName.value == '')
			{
				alert("차시를 입력하세요");
				frm.subjName.focus();
				return false;
			}
			if(frm.eduContents.value == '')
			{
				alert("교육내용을 입력하세요");
				frm.eduContents.focus();
				return false;
			}

		}

		return true;

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

-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<c:if test="${key eq 'create'}">
	  <h1><img alt="계획서 신규등록-사이버" src="/images/edu/title_03-3.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create'}">
	  <h1><img alt="계획서 수정-사이버" src="/images/edu/title_03-6.gif" /></h1>
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
                <html:form  action="/eduPlan.act" method="POST">
                <input type="hidden" name="task" value="insert_cyber">
                <html:hidden property="selPlanYear" value="${year}"/>
                <html:hidden property="selCrsType" value="${crs}"/>
                <html:hidden property="crsClumpCode"/>
                <html:hidden property="searchKeyword" value="${searchKeyword}"/>
                  <!--테이블 헤더 시작-->
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
                                  <td width="74" class="s1up">대분류</td>
                                  <td class="sBar"></td>
                                  <td class="s2" width="129">
                                    <html:select property="crsType">
			    														<html:optionsCollection name="crsTypeCyber" property="beanCollection" />
			    			 										</html:select>
			    			 										<!-- 
                            				<c:if test="${crs != null}">
	                                    <html:select property="crsType" value="${crs}">
				    														<html:optionsCollection name="crsTypeCyber" property="beanCollection" />
				    			 										</html:select>
				    			 									</c:if>
                            				<c:if test="${crs == null}">
	                                    <html:select property="crsType">
				    														<html:optionsCollection name="crsTypeCyber" property="beanCollection" />
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
                            <td>
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td class="s3" width="250">
																		<c:if test="${eduObjectives eq '' || eduObjectives eq null}">
				                            	<html:textarea property="eduObjectives" style="width:98%;" rows="4" value="○
○"></html:textarea>
																		</c:if>
																		<c:if test="${eduObjectives ne '' && eduObjectives ne null}">
				                            	<html:textarea property="eduObjectives" style="width:96%;" rows="4"></html:textarea>
				                            </c:if>
                                  </td>
                                  <td class="t1up2" width="109">교육방법</td>
                                  <td class="s3">
																		<c:if test="${eduWay eq '' || eduWay eq null}">
                                    	<html:textarea property="eduWay" style="width:96%;" rows="4" value="충청북도자치연수원 사이버교육센터 인터넷을 통한 학습
http://cb21.coti.go.kr/"></html:textarea>
                                  	</c:if>
																		<c:if test="${eduWay ne '' && eduWay ne null}">
                                    	<html:textarea property="eduWay" style="width:96%;" rows="4"></html:textarea>
                                  	</c:if>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">교육일수</td>
                            <td>
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td class="s3" width="250">
                                    <html:text property="dayCount" style="width:92%; IME-MODE:disabled" maxlength="3" onkeydown="key_num();"></html:text>
                                  </td>
                                  <td class="t1up2" width="109">인정시간</td>
                                  <td class="s3">
                                    <html:text property="apvHour" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/>시간
                                    <html:text property="chptCount" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/>차시 
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">교육대상</td>
                            <td class="s3"><html:text property="eduTarget" style="width:92%;" maxlength="50"/></td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up"><span class="red">*</span>교육기간<br>및<br>교육인원</td>
                            <td class="s3none">
                              <!--교육기간 및 교육인원 테이블 시작-->
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="28" class="s1up">회수</td>
                                  <td class="sBar"></td>
                                  <td class="s1up">수강신청기간</td>
                                  <td class="sBar"></td>
                                  <td width="205" class="s1up">학습기간</td>
                                  <td class="sBar"></td>
                                  <td width="80" class="s1up">기준년월</td>
                                  <td class="sBar"></td>
                                  <td width="52" class="s1up">교육인원</td>
                                  <td class="sBar"></td>
                                  <td width="50" class="s1up">비고</td>
                                </tr>

                                <tr>
                                  <td colspan="11" class="lbg3"></td>
                                </tr>

                                <tbody id="course_list">
                                <c:forEach var="crsList" items="${crsList}" varStatus="i" >
								<tr id="course${i.count - 1}">
                                  <td width="28" class="s2Center" id="course" style="border-bottom:1px solid #D6D6D6">${i.count}<input type="hidden" name="turnNo" id="turnNo" value="${crsList.num}"></td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="reqFrom" style="width:68px" readonly="true" value="${crsList.reqFrom}"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                                    ~
                                    <input type="text" name="reqTo" style="width:68px" readonly="true" value="${crsList.reqTo}"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd')">
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="205" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                   <input type="text" name="eduFrom" style="width:68px" readonly="true" value="${crsList.eduFrom}"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                                    ~
                                   <input type="text" name="eduTo" style="width:68px" readonly="true" value="${crsList.eduTo}"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd')">
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="80" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                  	<input type="text" name="applyYYMM" style="width:50px" readonly="true" value="${crsList.applyYYMM}"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(this.parentNode.childNodes[0])">
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="52" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="eduCount" style="width:85%;IME-MODE:disabled" onkeydown="key_num();" value="${crsList.eduCount}">
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="55" class="s2Center" id="cBtn${i.count - 1}" style="border-bottom:1px solid #D6D6D6"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick="deleteCourse('course${i.count - 1}');" style="cursor:hand" /></td>
                                </tr>
                                <c:set var="crsCount" value="${i.count}"/>
                                </c:forEach>
                                </tbody>
                                 <tr>
                                  <td width="28" class="s2Center" ></td>
                                  <td class="sBar"></td>
                                  <td class="s2Center" id="reqFromTo">
                                    <input type="text" name="reqFrom" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                                    ~
                                    <input type="text" name="reqTo" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd')">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="205" class="s2Center" id="eduFromTo">
                                   <input type="text" name="eduFrom" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                                    ~
                                   <input type="text" name="eduTo" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd')">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="80" class="s2Center" id="applyYM">
                                    <input type="text" name="applyYYMM" style="width:50px" readonly="true"/ value="${dateYYMM}"><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(this.parentNode.childNodes[0])">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="52" class="s2Center" id="count">
                                    <input type="text" name="eduCount" style="width:85%;IME-MODE:disabled" onkeydown="key_num();">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="55" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="추가" align="absmiddle"  onclick="addCourse();" style="cursor:hand" /></td>
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
                                  <td class="s1up" width="99">차시</td>
                                  <td class="sBar"></td>
                                  <td class="s1up">주요내용</td>
                                  <td class="sBar"></td>
                                  <td width="55" class="s1up">비고</td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="lbg3"></td>
                                </tr>
                                <tbody id="subject_list">
                                <c:forEach var="subList" items="${subList}" varStatus="i" >
								<tr id="subject${i.count - 1}">
                                  <td class="s2Center" width="99" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="subjName" style="width:85%;" value='<c:out value="${subList.subjName}" escapeXml="false"/>'>
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <textarea name="eduContents" style="width:98%;" rows="2">${subList.eduContents}</textarea>
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="55" class="s2Center" id="sBtn${i.count - 1}" style="border-bottom:1px solid #D6D6D6"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" onclick="deleteSubject('subject${i.count - 1}');" style="cursor:hand" />
                                  </td>
                                </tr>
                                <c:set var="subCount" value="${i.count}"/>
                                </c:forEach>
							  								</tbody>
							  								<tr>
                                  <td class="s2Center" width="99" id="subName">
                                    <input type="text" name="subjName" style="width:85%;">
                                  </td>
                                  <td class="sBar"></td>
                                  <td class="s2Center" id="contents">
                                    <textarea name="eduContents" style="width:98%;" rows="2"></textarea>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="55" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="추가" align="absmiddle" onclick="addSubject();" style="cursor:hand" />
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
                            <td width="109" class="t1up">평가내역</td>
                            <td class="s3none">
                              <!--평가내역 테이블 시작-->
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="99" class="s1up">진도</td>
                                  <td class="sBar"></td>
                                  <td width="99" class="s1up">평가</td>
                                  <td class="sBar"></td>
                                  <td class="s1up">이수조건</td>
																</tr>
                                <tr>
                                  <td colspan="5" class="lbg3"></td>
                                </tr>
																<tr height="30" align="center">
                                  <td width="99">
																		<c:if test="${rsPln_EduPlan.cyberPrgsRate eq '' || rsPln_EduPlan.cyberPrgsRate eq null}">
                                  		<html:text property="cyberPrgsRate" value="100"/>%
																		</c:if>
																		<c:if test="${rsPln_EduPlan.cyberPrgsRate ne '' && rsPln_EduPlan.cyberPrgsRate ne null}">
                                  		<html:hidden property="cyberPrgsRate"/>${rsPln_EduPlan.cyberPrgsRate}%
				                            </c:if>
                                 	</td>
																	<td class="sBar"></td>
                                  <td width="99">
																		<c:if test="${rsPln_EduPlan.cyberMinHour eq '' || rsPln_EduPlan.cyberMinHour eq null}">
                                  		<html:text property="cyberMinHour" value="0"/>%
																		</c:if>
																		<c:if test="${rsPln_EduPlan.cyberMinHour ne '' && rsPln_EduPlan.cyberMinHour ne null}">
                                 			<html:hidden property="cyberMinHour"/>${rsPln_EduPlan.cyberMinHour}%
				                            </c:if>
                               		</td>
																	<td class="sBar"></td>
                                  <td align="left">
																		<c:if test="${rsPln_EduPlan.cyberFinBase eq '' || rsPln_EduPlan.cyberFinBase eq null}">
                                  		<html:text property="cyberFinBase" value="진도 100%"/>&nbsp;
                                  	</c:if>
																		<c:if test="${rsPln_EduPlan.cyberFinBase ne '' && rsPln_EduPlan.cyberFinBase ne null}">
                                  		<html:hidden property="cyberFinBase"/>&nbsp;${rsPln_EduPlan.cyberFinBase}
				                            </c:if>
                                 	</td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="lbg3"></td>
                                </tr>
                                <tr>
                                  <td width="99" class="s1up">이수통보</td>
                                  <td class="sBar"></td>
                                  <td colspan="3">
                                  	<c:if test="${key == 'create'}">
                                  		<html:hidden property="cyberFinNotice" value="수료여부는 학습종료 후 10일 이내에 공문으로 통보"/>&nbsp;수료여부는 학습종료 후 10일 이내에 공문으로 통보
                                  	</c:if>
                                  	<c:if test="${key != 'create'}">
                                  		<html:hidden property="cyberFinNotice"/>&nbsp;${rsPln_EduPlan.cyberFinNotice}
                                  	</c:if>
                               		</td>
                                </tr>
                              </table>
                              <!--평가내역 테이블 끝-->
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
                  <!--테이블 헤더 시작-->
                  </html:form>
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
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" align="absmiddle" onclick="insertPlan();" style="CURSOR: hand"/>
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
