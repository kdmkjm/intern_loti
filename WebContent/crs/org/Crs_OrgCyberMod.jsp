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

	// 과정 추가
	function addCourse()
	{
		var frm = document.forms[0];

		frm.isNew.value="Y";
		$('course').innerHTML = "신규";
		frm.eduFrom.value="";
		frm.eduTo.value="";
		frm.reqFrom.value="";
		frm.reqTo.value="";
		frm.eduCount.value="";
		frm.baseYYMM.value="";

		var html = '<img src="<html:rewrite page="/images/board/btn_save.gif"/>" width="57" height="25" alt="저장" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>';
		   html += '<img src="<html:rewrite page="/images/board/btn_list.gif"/>" width="57" height="25" alt="목록" align="absmiddle" onclick="document.location.href=document.referrer;" style="CURSOR: hand"/>';
		
		$('BTN_LINE').innerHTML = html;
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
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.id = "subject";
    ref_cell.innerHTML = $('subName').innerHTML;
    ref_cell.width="99";

    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

		//주요내용
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('contents').innerHTML;


    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

    //버튼
    var id = "subject" + seqRow;
    ref_cell = ref_row.insertCell();
    ref_cell.id = "sBtn" + String(nSeqRow);
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" style="cursor:hand" onclick=deleteSubject("'+id+'"); />';
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



	// 교육내용 초기화
	function resetSubject(row)
	{
		document.all.subjName[row].value = "";
		document.all.eduContents[row].value = "";

	}

	//기수 정보 체크
	function checkCourse(idx, cMax)
	{
		var frm = document.forms[0];


		if(frm.crsType.value=='')
		{
			alert('분류를 선택하세요');
			frm.crsType.focus();
			return false;
		}

		if(frm.courseName.value=='')
		{
			alert('과정명을 입력하세요');
			frm.courseName.focus();
			return false;
		}
		
		var courseNameLength = byteCheck(frm.courseName.value)
		if(courseNameLength > 70)
		{
			alert('과정명은 70자를 초과하여 입력할 수 없습니다.\n계산:한글(2)+영어(1)+특수문자(1)\n현재 입력된 길이 : ' + courseNameLength);
			frm.courseName.focus();
			return;
		}

		if(frm.year.value=='')
		{
			alert('적용년도를 입력하세요');
			frm.year.focus();
			return false;
		}

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

		if(frm.baseYYMM.value == '')
		{
			alert("기준년월을 입력하세요");
			frm.baseYYMM.focus();
			return false;
		}

		if(frm.eduCount.value == '')
		{
			alert("교육인원을 입력하세요");
			frm.eduCount.focus();
			return false;
		}
		
		// 수강신청기간/학습기간 
		// From 값이 To 값보다 큰지 체크
		// 적용년도안에서 입력한 값인지 체크
		var reqFrom = frm.reqFrom.value;
		var reqTo   = frm.reqTo.value;
		var eduFrom = frm.eduFrom.value;
		var eduTo   = frm.eduTo.value;
		var eduYear = frm.year.value;
		var baseYYMM = frm.baseYYMM.value;
		
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
		if(baseYYMM.substr(0,4) != eduYear)
		{
				alert('기준년월을 잘못 입력하셨습니다.');
				frm.baseYYMM.focus();
				return false;
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
			//document.all.year.selectedIndex = 6;
			document.all.subjectMax.value = 0;
			document.all.subjectSeq.value = 0;

		}
	}


	//교육과정 저장
	function insertCourse()
	{
		if(!checkCourse()) return;

		var sMax = $('subjectMax').value;
		var sMaxRow = Number(sMax);

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

	//교육과정 삭제
	function deleteCourse()
	{
		if(confirm('삭제하시겠습니까?'))
		{
			document.forms[0].action = 'crsOrg.act?task=delete';
			document.forms[0].submit();
		}
	}
	
	//교육과정편성 목록으로
	function goList()
	{
		var selPlanYear 	= document.all.selPlanYear.value;
		var selCrsType 		= document.all.selCrsType.value;
		var searchKeyword = document.all.searchKeyword.value;
		document.forms[0].action = 'crsOrg.act?task=list&selPlanYear='+selPlanYear+'&selCrsType='+selCrsType+'&searchKeyword='+searchKeyword;
		document.forms[0].submit();
	}
-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<c:if test="${key eq 'create' }">
	  <h1><img alt="교육과정편성 - 신규등록 (사이버)" src="/images/edu/title_05-3.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create' }">
	  <h1><img alt="교육과정편성 - 수정(사이버)" src="/images/edu/title_05-7.gif" /></h1>
	</c:if>
	</div>
  </td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
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
            <html:form  action="/crsOrg.act" method="POST">
              <input type="hidden" name="task" value="insert_cyber">
              <input type="hidden" name="isNew" id="isNew" value="N">
              <html:hidden property="selPlanYear"/>
              <html:hidden property="selCrsType"/>
              <html:hidden property="searchKeyword"/>
              <html:hidden property="courseCode"/>
              <html:hidden property="modifyFlag"/>
              <!--테이블 헤더 시작-->
              <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="lbg"></td>
                <td class="cbg4" >
                  <table width="746" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="109" class="t1up"><span class="red">*</span>기본정보</td>
                    <td class="s3none">
                      <!--기본정보 테이블 시작-->
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="74" class="s1up">분류</td>
                        <td class="sBar"></td>
                        <td class="s2" width="129">
                          <html:select property="crsType">
							<html:optionsCollection name="crsTypeCyber" property="beanCollection" />
						  </html:select>
						</td>
                      </tr>
                      <tr>
                        <td colspan="11" class="lbg3"></td>
                      </tr>
                      <tr>
                        <td width="74" class="s1up">과정명</td>
                        <td class="sBar"></td>
                        <td class="s2" colspan="9">
                          <html:text property="courseName" style="width:250px;"></html:text>
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
                          <c:if test="${key!=null}">
				            <html:textarea property="eduObjectives" style="width:98%;" rows="4" value="○○"></html:textarea>
						  </c:if>
						  <c:if test="${key==null}">
				            <html:textarea property="eduObjectives" style="width:96%;" rows="4"></html:textarea>
				          </c:if>
                        </td>
                        <td class="t1up2" width="109">교육방법</td>
                        <td class="s3">
                          <html:textarea property="eduWay" style="width:96%;" rows="4"></html:textarea>
                        </td>
                      </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td width="109" class="t1up">교육대상</td>
                    <td>
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="s3" width="250">
                          <html:text property="eduTarget" style="width:92%;"/>
                        </td>
                        <td class="t1up2" width="109">인정시간</td>
                        <td class="s3">
                          <html:text property="apvHour" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/>시간
                          <html:text property="chptCount" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/> 차시 
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
                        <td class="s3" width="140">
                          <html:text property="dayCount" style="width:120px; IME-MODE:disabled" maxlength="3" onkeydown="key_num();"></html:text>
                        </td>
                        <td class="t1up2" width="109">기간설명</td>
                        <td class="s3">
                          <html:text property="termDesc" style="width:350px" maxlength="25"></html:text>
                        </td>
                      </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td width="109" class="t1up"><span class="red">*</span>교육기간<br>및 <br>교육인원</td>
                    <td class="s3none">
                      <!--교육기간 및 교육인원 테이블 시작-->
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="28" class="s1up">횟수</td>
                        <td class="sBar"></td>
                        <td class="s1up">수강신청기간</td>
                        <td class="sBar"></td>
                        <td width="204" class="s1up">학습기간</td>
                        <td class="sBar"></td>
                        <td width="74" class="s1up">기준년월</td>
                        <td class="sBar"></td>
                        <td width="52" class="s1up">교육인원</td>
                        <td class="sBar"></td>
                        <td width="50" class="s1up">비고</td>
                      </tr>
                      <tr>
                        <td colspan="11" class="lbg3"></td>
                      </tr>
					  <tr>
                        <td width="28" class="s2Center" id="course">${rsCrs_Org.turnNo}</td>
                        <td class="sBar"></td>
                        <td class="s2Center">
                          <html:text property="reqFrom" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                           ~
                          <html:text property="reqTo" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd')">
                        </td>
                        <td class="sBar"></td>
                        <td width="204" class="s2Center" >
                          <html:text property="eduFrom" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd')">
                           ~
                          <html:text property="eduTo" style="width:70px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd')">
                        </td>
                        <td class="sBar"></td>
                        <td width="74" class="s2Center" >
                          <html:text property="baseYYMM" style="width:50px" readonly="true"/><img name="1" src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(this.parentNode.childNodes[0])">
                        </td>
                        <td class="sBar"></td>
                        <td width="52" class="s2Center" >
                          <html:text property="eduCount" style="width:85%;IME-MODE:disabled" onkeydown="key_num();"/>
                        </td>
                        <td class="sBar"></td>
                        <td width="55" class="s2Center" ></td>
                      </tr>
                      </table>
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
	                        <td class="sBar"></td>
	                        <td class="s2Center" style="border-bottom:1px solid #D6D6D6">
	                          <textarea name="eduContents" style="width:98%;" rows="2">${subList.eduContents}</textarea>
	                        </td>
	                        <td class="sBar"></td>
	                        <td width="55" class="s2Center" style="border-bottom:1px solid #D6D6D6" id="sBtn${i.count - 1}"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" style="cursor:hand" onclick="deleteSubject('subject${i.count - 1}');" />
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
                        <td width="55" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' style="cursor:hand" width="34" height="18" alt="추가" align="absmiddle" onclick="addSubject();" />
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
                          <c:if test="${key == 'create'}">
                            <html:hidden property="cyberPrgsRate" value="80"/>80%
                          </c:if>
                          <c:if test="${key != 'create'}">
                            <html:hidden property="cyberPrgsRate"/>${rsCrs_Org.cyberPrgsRate}%
                          </c:if>
                        </td>
						<td class="sBar"></td>
                        <td width="99">
                          <c:if test="${key == 'create'}">
                            <html:hidden property="cyberMinHour" value="20"/>20%
                          </c:if>
                          <c:if test="${key != 'create'}">
                            <html:hidden property="cyberMinHour"/>${rsCrs_Org.cyberMinHour}%
                          </c:if>
                        </td>
						<td class="sBar"></td>
                        <td align="left">
                          <c:if test="${key == 'create'}">
                            <html:hidden property="cyberFinBase" value="총점 80점 이상시 이수(단, 반드시 학습진도율은 90%이상 학습, 평가 40점이상)"/>&nbsp;총점 80점 이상시 이수(단, 반드시 학습진도율은 90%이상 학습, 평가 40점이상)
                          </c:if>
                          <c:if test="${key != 'create'}">
                            <html:hidden property="cyberFinBase"/>&nbsp;${rsCrs_Org.cyberFinBase}
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
                            <html:hidden property="cyberFinNotice" value="학습종료 후 10일 이내에 교육훈련부서로 공문 통보"/>&nbsp;학습종료 후 10일 이내에 교육훈련부서로 공문 통보
                          </c:if>
                          <c:if test="${key != 'create'}">
                            <html:hidden property="cyberFinNotice"/>&nbsp;${rsCrs_Org.cyberFinNotice}
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
                      <c:if test="${year != null}">
                        <html:hidden property="year" value="${year}"/><font color="#000000">${year}</font>
                      </c:if>
                      <c:if test="${year == null}"> 
                        <html:hidden property="year"/><font color="#000000">${rsCrs_Org.year}</font>     
                      </c:if>
                    </td>
                  </tr>
                  </table>
                </td>
                <td class="lbg"></td>
              </tr>
              </table>
              <!--테이블 헤더 끝-->
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
            <td align="right" id="BTN_LINE">
	          <c:if test="${rsCrs_Org.courseCode ne null}">
	            <img src='<html:rewrite page="/images/board/btn_add3.gif"/>' width="72" height="25" alt="기수추가" align="absmiddle" onclick="addCourse();" style="CURSOR: hand" />
	          </c:if>
	          <c:if test="${rsCrs_Org.finishFlag eq 'N'}">
		        <img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>
		        <c:if test="${key==null}">
		          <img src='<html:rewrite page="/images/board/btn_del.gif"/>' width="57" height="25" alt="삭제" align="absmiddle" onclick="deleteCourse();" style="CURSOR: hand"/>
		        </c:if>
	          </c:if>
	          <c:if test="${rsCrs_Org.finishFlag eq 'Y'}">
		        <img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="저장" align="absmiddle" />
		        <c:if test="${key==null}">
		          <img src='<html:rewrite page="/images/board/btn_del_off.gif"/>' width="57" height="25" alt="삭제" align="absmiddle" />
		        </c:if>
	          </c:if>
			  <c:if test="${key eq 'create'}">
		        <img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>
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
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	setDefault('${key}');
//-->
</script>
