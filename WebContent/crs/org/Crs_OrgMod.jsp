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
		var frm = document.forms[0];

    frm.crsType.disabled = true;
    frm.courseName.readOnly = true;
		frm.isNew.value="Y";
		$('course').innerHTML = "신규";
		frm.eduFrom.value="";
		frm.eduTo.value="";
		frm.eduCount.value="";
		frm.lecRoomNo.value="";
		
		var html = '<img src="<html:rewrite page="/images/board/btn_save.gif"/>" width="57" height="25" alt="저장" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>';
		   html += '<img src="<html:rewrite page="/images/board/btn_list.gif"/>" width="57" height="25" alt="목록" align="absmiddle" onclick="document.location.href=document.referrer;" style="CURSOR: hand"/>';
		
		$('BTN_LINE').innerHTML = html;
	}

	// 과목추가
	function addSubject()
	{
		var dataList = $('subject_list');

		var seq = $('subjectSeq').value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;

		var max = $('subjectMax').value
		var maxRow = Number(max);
		var nMaxRow = maxRow+1 ;
		if(!checkSubject(maxRow,maxRow)) return;
		
		var ref_row = dataList.insertRow(maxRow);

		ref_row.id = "subject" + seqRow;


    $('subjectMax').value = nMaxRow;
		$('subjectSeq').value = nSeqRow;


		//교과목
		ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.id = "subject";
    ref_cell.innerHTML = $('name').innerHTML;

    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

		//분야
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('type').innerHTML;
    ref_cell.width="100";

    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

    //교육시간(강의식)
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('lectd').innerHTML;
    ref_cell.width="62";
        
    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";        

    //교육시간(참여학습)
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('pattd').innerHTML;
    ref_cell.width="62";
    
    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";        
        
    //교육시간(기타)
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('etctd').innerHTML;
    ref_cell.width="62";

    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

   	//순서
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('order').innerHTML;
    ref_cell.width="60";

    //라인
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

    //버튼
    var id = "subject" + seqRow;
    ref_cell = ref_row.insertCell();
    ref_cell.id = "sBtn" + String(seqRow);
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" style="cursor:hand" onclick=deleteSubject("'+id+'"); />';
    ref_cell.width="60";

    resetSubject(nMaxRow);


	}

	// 과목 삭제
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

		// 과목 초기화
	function resetSubject(row)
	{
		document.all.subjName[row].value = "";
		document.all.subjType[row].value = "";
		document.all.lecHour[row].value = "";
		document.all.patHour[row].value = "";
		document.all.etcHour[row].value = "";
		document.all.ord[row].value = "";
	}



	//과정 저장
	function insertCourse()
	{	
		if(!checkCourse()) return;
			
		var sMax = $('subjectMax').value;
		var sMaxRow = Number(sMax);
		
		for(var i = 0; i<sMax; i++)
		{

			if(!checkSubject(i, sMax)) return;
		}

		var frm = document.forms[0];
		
		var check = frm.crsType.disabled;
    if(check == true)
    {
    	frm.crsType.disabled = false;
    }
    
    if(document.all.subjName[0] == null)
		{
			alert("교육내용을 입력하세요.");
			document.all.subjName.focus();
			return;
		}

		frm.submit();
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

	//과정 정보 체크
	function checkCourse()
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

		if(frm.year.value=='')
		{
			alert('적용년도를 입력하세요');
			frm.year.focus();
			return false;
		}
		
		var eduFrom = frm.eduFrom.value;
		var eduTo   = frm.eduTo.value;
		var eduYear = frm.year.value;
		
		if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
		{
			alert('교육기간을 잘못 입력하셨습니다.');
			frm.eduFrom.focus();
			return false;
		}		
		
		// 교육내용을 입력했으나 추가버튼을 누르지 않았을 경우
		var subjectNum = frm.subjectSeq.value;				
		if(subjectNum == 0)
		{
			if(frm.subjName.value != "")
			{
				alert('입력한 교육내용 정보를 추가하세요.');
				frm.eduFrom.focus();
				return false;
			}
		}
		else 
		{
			if(frm.subjName[subjectNum].value != "")
			{
				alert('입력한 교육내용 정보를 추가하세요.');
				frm.eduFrom[subjectNum].focus();
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

		}

		else
		{

			if(frm.subjName.value == '')
			{
				alert("과목명을 입력하세요");
				frm.subjName.focus();
				return false;
			}

		}

		return true;

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
	
	

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<c:if test="${key eq 'create' }">
	  <h1><img alt="교육과정편성-신규등록" src="/images/edu/title_05-2.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create' }">
	  <h1><img alt="교육과정편성-수정" src="/images/edu/title_05-6.gif" /></h1>
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

                  <!--테이블 헤더 시작-->
                  <html:form  action="/crsOrg.act" method="POST">
                  <input type="hidden" name="task" value="insert">
                  <input type="hidden" name="isNew" id="isNew" value="N">
	                <html:hidden property="selPlanYear"/>
	                <html:hidden property="selCrsType"/>
	                <html:hidden property="searchKeyword"/>
                  <html:hidden property="courseCode"/>
                  <html:hidden property="modifyFlag"/>
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
                            <td class="s3">
                            	<c:if test="${key!=null}">
                            		<html:textarea property="eduObjectives" style="width:98%;" rows="3" value="○
○"></html:textarea>
															</c:if>
															<c:if test="${key==null}">
	                            	<html:textarea property="eduObjectives" style="width:98%;" rows="3"></html:textarea>
	                            </c:if>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">교육대상</td>
                            <td class="s3">
                              <html:text property="eduTarget" style="width:250px;"></html:text>
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
                            <td width="109" class="t1up"><span class="red">*</span>교육기간<br> 및 <br>교육인원</td>
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
                                  <td width="60" class="s1up">비고</td>
                                </tr>
                                <tr>
                                  <td colspan="9" class="lbg3"></td>
                                </tr>
                                <tr>
                                  <td width="49" class="s2Center" id="course">${rsCrs_Org.turnNo}</td>
                                  <td class="sBar"></td>
                                  <td class="s2Center">
                                    <html:text property="eduFrom" style="width:90px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[0], 'yyyy-mm-dd');">
                                    ~
                                    <html:text property="eduTo" style="width:90px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, this.parentNode.childNodes[3], 'yyyy-mm-dd');">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s2Center">
                                    <html:text property="eduCount" style="width:60%;IME-MODE:disabled" onkeydown="key_num();"/>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s2Center">
                                    <html:select property="lecRoomNo" >
											    						<html:optionsCollection name="roomInfo" property="beanCollection" />
											    			 		</html:select>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center" ></td>
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
                                  <td class="s1up">교과목</td>
                                  <td class="sBar"></td>
                                  <td width="100" class="s1up">분야</td>
                                  <td class="sBar"></td>
                                  <td width="188" class="s1up" colspan="5">
                                  	<table width="100%" cellspacing="0" cellpadding="0"> 
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
			                            </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">순서</td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">처리</td>
                                </tr>
                                <tr>
                                  <td colspan="99" class="lbg3"></td>
                                </tr>

                                <tbody id="subject_list">
                                <c:forEach var="subList" items="${subList}" varStatus="i" >
																<tr id="subject${i.count - 1}">
                                  <td class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="subjName" style="width:90%;" value='<c:out value="${subList.subjName}" escapeXml="false"/>'>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="100" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <html:select property="subjType" value="${subList.subjType}">
											    						<html:optionsCollection name="subType" property="beanCollection" />
											    			 		</html:select>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="62" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="lecHour" style="width:80%;IME-MODE:disabled" onkeydown="key_num()" value="${subList.lecHour}" >
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="62" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="patHour" style="width:80%;IME-MODE:disabled" onkeydown="key_num()" value="${subList.patHour}" >
                                  </td>
                                  <td class="sBar"></td>
                                 	<td width="62" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="etcHour" style="width:80%;IME-MODE:disabled" onkeydown="key_num()" value="${subList.etcHour}" >
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <input type="text" name="ord" style="width:80%;IME-MODE:disabled" onkeydown="key_num()" value="${subList.ord}" >
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center" style="border-bottom:1px solid #D6D6D6" id="sBtn${i.count - 1}"> <img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="삭제" align="absmiddle" style="cursor:hand" onclick="deleteSubject('subject${i.count - 1}');" />
                                  </td>
                                </tr>
                                <c:set var="subCount" value="${i.count}"/>
                                </c:forEach>
                                </tbody>
                                <tr>
                                  <td class="s2Center" id="name">
                                    <input type="text" name="subjName" style="width:90%;">
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="100" class="s2Center" id="type">
                                    <html:select property="subjType">
											    						<html:optionsCollection name="subType" property="beanCollection" />
											    			 		</html:select>
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="62" class="s2Center" id="lectd">
                                    <input type="text" name="lecHour" style="width:80%;" onkeydown="key_num()" >
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="62" class="s2Center" id="pattd">
                                    <input type="text" name="patHour" style="width:80%;" onkeydown="key_num()" >
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="62" class="s2Center" id="etctd">
                                    <input type="text" name="etcHour" style="width:80%;" onkeydown="key_num()" >
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center" id="order">
                                    <input type="text" name="ord" style="width:80%;" onkeydown="key_num()" >
                                  </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s2Center"> <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' style="cursor:hand" width="34" height="18" alt="추가" align="absmiddle" onclick="addSubject();" />
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
                      <td align="right" id="BTN_LINE">
                      	<c:if test="${rsCrs_Org.courseCode ne null}">
                      		<img src='<html:rewrite page="/images/board/btn_add3.gif"/>' width="72" height="25" alt="기수추가" align="absmiddle" onclick="addCourse();" style="CURSOR: hand" />
                      	</c:if>
<%--                       	<c:if test="${rsCrs_Org.finishFlag eq 'N'}"> --%>
	                      	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand" />
													<c:if test="${key==null}">
	                        	<img src='<html:rewrite page="/images/board/btn_del.gif"/>' width="57" height="25" alt="삭제" align="absmiddle" onclick="deleteCourse();" style="CURSOR: hand"/>
	                        </c:if>
<%--                         </c:if> --%>
                      	<c:if test="${rsCrs_Org.finishFlag eq 'Y'}">
	                      	<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="저장" align="absmiddle"  />
													<c:if test="${key==null}">
	                        	<img src='<html:rewrite page="/images/board/btn_del_off.gif"/>' width="57" height="25" alt="삭제" align="absmiddle" />
	                        </c:if>
                        </c:if>  
                        <c:if test="${key eq 'create'}">
                        	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand" />
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
