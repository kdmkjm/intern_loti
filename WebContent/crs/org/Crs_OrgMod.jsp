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
	// ���� �߰�
	function addCourse()
	{
		var frm = document.forms[0];

    frm.crsType.disabled = true;
    frm.courseName.readOnly = true;
		frm.isNew.value="Y";
		$('course').innerHTML = "�ű�";
		frm.eduFrom.value="";
		frm.eduTo.value="";
		frm.eduCount.value="";
		frm.lecRoomNo.value="";
		
		var html = '<img src="<html:rewrite page="/images/board/btn_save.gif"/>" width="57" height="25" alt="����" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>';
		   html += '<img src="<html:rewrite page="/images/board/btn_list.gif"/>" width="57" height="25" alt="���" align="absmiddle" onclick="document.location.href=document.referrer;" style="CURSOR: hand"/>';
		
		$('BTN_LINE').innerHTML = html;
	}

	// �����߰�
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


		//������
		ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.id = "subject";
    ref_cell.innerHTML = $('name').innerHTML;

    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

		//�о�
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('type').innerHTML;
    ref_cell.width="100";

    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

    //�����ð�(���ǽ�)
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('lectd').innerHTML;
    ref_cell.width="62";
        
    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";        

    //�����ð�(�����н�)
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('pattd').innerHTML;
    ref_cell.width="62";
    
    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";        
        
    //�����ð�(��Ÿ)
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('etctd').innerHTML;
    ref_cell.width="62";

    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

   	//����
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('order').innerHTML;
    ref_cell.width="60";

    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

    //��ư
    var id = "subject" + seqRow;
    ref_cell = ref_row.insertCell();
    ref_cell.id = "sBtn" + String(seqRow);
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" style="cursor:hand" onclick=deleteSubject("'+id+'"); />';
    ref_cell.width="60";

    resetSubject(nMaxRow);


	}

	// ���� ����
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

		// ���� �ʱ�ȭ
	function resetSubject(row)
	{
		document.all.subjName[row].value = "";
		document.all.subjType[row].value = "";
		document.all.lecHour[row].value = "";
		document.all.patHour[row].value = "";
		document.all.etcHour[row].value = "";
		document.all.ord[row].value = "";
	}



	//���� ����
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
			alert("���������� �Է��ϼ���.");
			document.all.subjName.focus();
			return;
		}

		frm.submit();
	}


	//�ű�ȭ��� �ʱⰪ ����
	function setDefault(key)
	{
		if(key == 'create')
		{
			//document.all.year.selectedIndex = 6;
			document.all.subjectMax.value = 0;
			document.all.subjectSeq.value = 0;

		}
	}

	//���� ���� üũ
	function checkCourse()
	{
		var frm = document.forms[0];

		if(frm.crsType.value=='')
		{
			alert('�з��� �����ϼ���');
			frm.crsType.focus();
			return false;
		}

		if(frm.courseName.value=='')
		{
			alert('�������� �Է��ϼ���');
			frm.courseName.focus();
			return false;
		}
		
		var courseNameLength = byteCheck(frm.courseName.value)
		if(courseNameLength > 70)
		{
			alert('�������� 70�ڸ� �ʰ��Ͽ� �Է��� �� �����ϴ�.\n���:�ѱ�(2)+����(1)+Ư������(1)\n���� �Էµ� ���� : ' + courseNameLength);
			frm.courseName.focus();
			return;
		}

		if(frm.eduFrom.value == '')
		{
			alert("�����Ⱓ�� �Է��ϼ���");
			frm.eduFrom.focus();
			return false;
		}

		if(frm.eduTo.value == '')
		{
			alert("�����Ⱓ�� �Է��ϼ���");
			frm.eduTo.focus();
			return false;
		}

		if(frm.eduCount.value == '')
		{
			alert("�����ο��� �Է��ϼ���");
			frm.eduCount.focus();
			return false;
		}

		if(frm.year.value=='')
		{
			alert('����⵵�� �Է��ϼ���');
			frm.year.focus();
			return false;
		}
		
		var eduFrom = frm.eduFrom.value;
		var eduTo   = frm.eduTo.value;
		var eduYear = frm.year.value;
		
		if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
		{
			alert('�����Ⱓ�� �߸� �Է��ϼ̽��ϴ�.');
			frm.eduFrom.focus();
			return false;
		}		
		
		// ���������� �Է������� �߰���ư�� ������ �ʾ��� ���
		var subjectNum = frm.subjectSeq.value;				
		if(subjectNum == 0)
		{
			if(frm.subjName.value != "")
			{
				alert('�Է��� �������� ������ �߰��ϼ���.');
				frm.eduFrom.focus();
				return false;
			}
		}
		else 
		{
			if(frm.subjName[subjectNum].value != "")
			{
				alert('�Է��� �������� ������ �߰��ϼ���.');
				frm.eduFrom[subjectNum].focus();
				return false;
			}
		}
		

		return true;
	}


	//�������� üũ
	function checkSubject(idx, sMax)
	{
		var frm = document.forms[0];
		if(sMax>0)
		{

			if(frm.subjName[idx].value == '')
			{
				alert("������� �Է��ϼ���");
				frm.subjName[idx].focus();
				return false;
			}

		}

		else
		{

			if(frm.subjName.value == '')
			{
				alert("������� �Է��ϼ���");
				frm.subjName.focus();
				return false;
			}

		}

		return true;

	}

	//�������� ����
	function deleteCourse()
	{
		if(confirm('�����Ͻðڽ��ϱ�?'))
		{
			document.forms[0].action = 'crsOrg.act?task=delete';
			document.forms[0].submit();
		}
	}
	
	
	//���������� �������
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
	<h2 class="hide">����������</h2>
	<c:if test="${key eq 'create' }">
	  <h1><img alt="����������-�űԵ��" src="/images/edu/title_05-2.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create' }">
	  <h1><img alt="����������-����" src="/images/edu/title_05-6.gif" /></h1>
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

                  <!--���̺� ��� ����-->
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
                            <td width="109" class="t1up"><span class="red">*</span>�⺻����</td>
                            <td class="s3none">
                              <!--�⺻���� ���̺� ����-->
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="74" class="s1up">�з�</td>
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
                                  <td width="74" class="s1up">������</td>
                                  <td class="sBar"></td>
                                  <td class="s2" colspan="9">
                                    <html:text property="courseName" style="width:250px;"></html:text>
                                  </td>
                                </tr>
                              </table>
                              <!--�⺻���� ���̺� ��-->
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">������ǥ</td>
                            <td class="s3">
                            	<c:if test="${key!=null}">
                            		<html:textarea property="eduObjectives" style="width:98%;" rows="3" value="��
��"></html:textarea>
															</c:if>
															<c:if test="${key==null}">
	                            	<html:textarea property="eduObjectives" style="width:98%;" rows="3"></html:textarea>
	                            </c:if>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">�������</td>
                            <td class="s3">
                              <html:text property="eduTarget" style="width:250px;"></html:text>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">�����ϼ�</td>
                            <td>
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td class="s3" width="140">
                                    <html:text property="dayCount" style="width:120px; IME-MODE:disabled" maxlength="3" onkeydown="key_num();"></html:text>
                                  </td>
                                  <td class="t1up2" width="109">�Ⱓ����</td>
                                  <td class="s3">
                                  	<html:text property="termDesc" style="width:350px" maxlength="25"></html:text>
                                 	</td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up"><span class="red">*</span>�����Ⱓ<br> �� <br>�����ο�</td>
                            <td class="s3none">
                              <!--�����Ⱓ �� �����ο� ���̺� ����-->
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="49" class="s1up">���</td>
                                  <td class="sBar"></td>
                                  <td class="s1up">�����Ⱓ</td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s1up">�����ο�</td>
                                  <td class="sBar"></td>
                                  <td width="119" class="s1up">���ǽ�</td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">���</td>
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
                              <!--�����Ⱓ �� �����ο� ���̺� ��-->
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up"><span class="red">*</span>��������</td>
                            <td class="s3none">
                              <!--�������� ���̺� ����-->

                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td class="s1up">������</td>
                                  <td class="sBar"></td>
                                  <td width="100" class="s1up">�о�</td>
                                  <td class="sBar"></td>
                                  <td width="188" class="s1up" colspan="5">
                                  	<table width="100%" cellspacing="0" cellpadding="0"> 
                                  		<tr>
			                                  <td class="s1up" colspan="5">�����ð�</td>
			                                </tr>
			                                <tr>
			                                	<td class="sBar" colspan="5"></td>
			                                </tr>
			                                <tr>
			                                  <td width="62" class="s1up">���ǽ�</td>
			                                  <td class="sBar"></td>
			                                  <td width="62" class="s1up">�����н�</td>	
			                                  <td class="sBar"></td>
			                                  <td width="62" class="s1up">��Ÿ</td>	
			                                </tr>
			                            	</table>
			                            </td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">����</td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">ó��</td>
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
                                  <td width="60" class="s2Center" style="border-bottom:1px solid #D6D6D6" id="sBtn${i.count - 1}"> <img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" style="cursor:hand" onclick="deleteSubject('subject${i.count - 1}');" />
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
                                  <td width="60" class="s2Center"> <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' style="cursor:hand" width="34" height="18" alt="�߰�" align="absmiddle" onclick="addSubject();" />
                                  </td>
                                </tr>
                              </table>
															<input type="hidden" id="subjectSeq" name="subjectSeq" value="${subCount}" >
                              <input type="hidden" id="subjectMax" name="subjectMax" value="${subCount}" >
                              <!--�������� ���̺� ��-->
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">�����</td>
                            <td class="s3">
                             	<html:select property="charger">
                              	<html:option value=""></html:option>
								    						<html:optionsCollection name="crsUser" property="beanCollection" />
									    			 	</html:select>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">����⵵</td>
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
                  <!--���̺� ��� ����-->
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
                      		<img src='<html:rewrite page="/images/board/btn_add3.gif"/>' width="72" height="25" alt="����߰�" align="absmiddle" onclick="addCourse();" style="CURSOR: hand" />
                      	</c:if>
<%--                       	<c:if test="${rsCrs_Org.finishFlag eq 'N'}"> --%>
	                      	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand" />
													<c:if test="${key==null}">
	                        	<img src='<html:rewrite page="/images/board/btn_del.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="deleteCourse();" style="CURSOR: hand"/>
	                        </c:if>
<%--                         </c:if> --%>
                      	<c:if test="${rsCrs_Org.finishFlag eq 'Y'}">
	                      	<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="����" align="absmiddle"  />
													<c:if test="${key==null}">
	                        	<img src='<html:rewrite page="/images/board/btn_del_off.gif"/>' width="57" height="25" alt="����" align="absmiddle" />
	                        </c:if>
                        </c:if>  
                        <c:if test="${key eq 'create'}">
                        	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand" />
                        </c:if>                           
                        <img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="���" onclick="goList();" style="CURSOR: hand"/>
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
