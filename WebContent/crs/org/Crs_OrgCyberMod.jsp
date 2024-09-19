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

	// ���� �߰�
	function addCourse()
	{
		var frm = document.forms[0];

		frm.isNew.value="Y";
		$('course').innerHTML = "�ű�";
		frm.eduFrom.value="";
		frm.eduTo.value="";
		frm.reqFrom.value="";
		frm.reqTo.value="";
		frm.eduCount.value="";
		frm.baseYYMM.value="";

		var html = '<img src="<html:rewrite page="/images/board/btn_save.gif"/>" width="57" height="25" alt="����" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>';
		   html += '<img src="<html:rewrite page="/images/board/btn_list.gif"/>" width="57" height="25" alt="���" align="absmiddle" onclick="document.location.href=document.referrer;" style="CURSOR: hand"/>';
		
		$('BTN_LINE').innerHTML = html;
	}

	// �������� �߰�
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


		//����
		ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.id = "subject";
    ref_cell.innerHTML = $('subName').innerHTML;
    ref_cell.width="99";

    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

		//�ֿ䳻��
    ref_cell = ref_row.insertCell();
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = $('contents').innerHTML;


    //����
    ref_cell = ref_row.insertCell();
    ref_cell.className="sBar";

    //��ư
    var id = "subject" + seqRow;
    ref_cell = ref_row.insertCell();
    ref_cell.id = "sBtn" + String(nSeqRow);
    ref_cell.className="s2Center";
    ref_cell.style.borderBottom = "1px solid #D6D6D6";
    ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" style="cursor:hand" onclick=deleteSubject("'+id+'"); />';
    ref_cell.width="55";

    resetSubject(nMaxRow);


	}

	// �������� ����
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



	// �������� �ʱ�ȭ
	function resetSubject(row)
	{
		document.all.subjName[row].value = "";
		document.all.eduContents[row].value = "";

	}

	//��� ���� üũ
	function checkCourse(idx, cMax)
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

		if(frm.year.value=='')
		{
			alert('����⵵�� �Է��ϼ���');
			frm.year.focus();
			return false;
		}

		if(frm.reqFrom.value == '')
		{
			alert("������û�Ⱓ�� �Է��ϼ���");
			frm.reqFrom.focus();
			return false;
		}

		if(frm.reqTo.value == '')
		{
			alert("������û�Ⱓ�� �Է��ϼ���");
			frm.reqTo.focus();
			return false;
		}

		if(frm.eduFrom.value == '')
		{
			alert("�н��Ⱓ�� �Է��ϼ���");
			frm.eduFrom.focus();
			return false;
		}

		if(frm.eduTo.value == '')
		{
			alert("�н��Ⱓ�� �Է��ϼ���");
			frm.eduTo.focus();
			return false;
		}

		if(frm.baseYYMM.value == '')
		{
			alert("���س���� �Է��ϼ���");
			frm.baseYYMM.focus();
			return false;
		}

		if(frm.eduCount.value == '')
		{
			alert("�����ο��� �Է��ϼ���");
			frm.eduCount.focus();
			return false;
		}
		
		// ������û�Ⱓ/�н��Ⱓ 
		// From ���� To ������ ū�� üũ
		// ����⵵�ȿ��� �Է��� ������ üũ
		var reqFrom = frm.reqFrom.value;
		var reqTo   = frm.reqTo.value;
		var eduFrom = frm.eduFrom.value;
		var eduTo   = frm.eduTo.value;
		var eduYear = frm.year.value;
		var baseYYMM = frm.baseYYMM.value;
		
		if(reqFrom>reqTo || reqFrom.substr(0,4) != eduYear || reqTo.substr(0,4) != eduYear)
		{
				alert('������û�Ⱓ�� �߸� �Է��ϼ̽��ϴ�.');
				frm.reqFrom.focus();
				return false;
		}
		if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
		{
				alert('�н��Ⱓ�� �߸� �Է��ϼ̽��ϴ�.');
				frm.eduFrom.focus();
				return false;
		}
		if(baseYYMM.substr(0,4) != eduYear)
		{
				alert('���س���� �߸� �Է��ϼ̽��ϴ�.');
				frm.baseYYMM.focus();
				return false;
		}
		
		// ���������� �Է������� �߰���ư�� ������ �ʾ��� ���
		var subjectNum = frm.subjectSeq.value;	
		if(subjectNum == 0)
		{
			if(frm.subjName.value != "" || frm.eduContents.value != "")
			{
				alert('�Է��� �������� ������ �߰��ϼ���.');
				frm.subjName.focus();
				return false;
			}
		}
		else 
		{
			if(frm.subjName[subjectNum].value != "" || frm.eduContents[subjectNum].value != "")
			{
				alert('�Է��� �������� ������ �߰��ϼ���.');
				frm.subjName[subjectNum].focus();
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
				alert("���ø� �Է��ϼ���");
				frm.subjName[idx].focus();
				return false;
			}
			if(frm.eduContents[idx].value == '')
			{
				alert("���������� �Է��ϼ���");
				frm.eduContents[idx].focus();
				return false;
			}

		}

		else
		{

			if(frm.subjName.value == '')
			{
				alert("���ø� �Է��ϼ���");
				frm.subjName.focus();
				return false;
			}
			if(frm.eduContents.value == '')
			{
				alert("���������� �Է��ϼ���");
				frm.eduContents.focus();
				return false;
			}

		}

		return true;

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


	//�������� ����
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
			alert("���������� �Է��ϼ���.");
			document.all.subjName.focus();
			return;
		}

		var frm = document.forms[0];


		frm.submit();
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
-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<c:if test="${key eq 'create' }">
	  <h1><img alt="���������� - �űԵ�� (���̹�)" src="/images/edu/title_05-3.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create' }">
	  <h1><img alt="���������� - ����(���̹�)" src="/images/edu/title_05-7.gif" /></h1>
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
              <!--���̺� ��� ����-->
              <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="lbg"></td>
                <td class="cbg4" >
                  <table width="746" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="109" class="t1up"><span class="red">*</span>�⺻����</td>
                    <td class="s3none">
                      <!--�⺻���� ���̺� ����-->
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="74" class="s1up">�з�</td>
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
                    <td>
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="s3" width="250">
                          <c:if test="${key!=null}">
				            <html:textarea property="eduObjectives" style="width:98%;" rows="4" value="�ۡ�"></html:textarea>
						  </c:if>
						  <c:if test="${key==null}">
				            <html:textarea property="eduObjectives" style="width:96%;" rows="4"></html:textarea>
				          </c:if>
                        </td>
                        <td class="t1up2" width="109">�������</td>
                        <td class="s3">
                          <html:textarea property="eduWay" style="width:96%;" rows="4"></html:textarea>
                        </td>
                      </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td width="109" class="t1up">�������</td>
                    <td>
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="s3" width="250">
                          <html:text property="eduTarget" style="width:92%;"/>
                        </td>
                        <td class="t1up2" width="109">�����ð�</td>
                        <td class="s3">
                          <html:text property="apvHour" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/>�ð�
                          <html:text property="chptCount" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/> ���� 
                        </td>
                      </tr>
                      </table>
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
                    <td width="109" class="t1up"><span class="red">*</span>�����Ⱓ<br>�� <br>�����ο�</td>
                    <td class="s3none">
                      <!--�����Ⱓ �� �����ο� ���̺� ����-->
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="28" class="s1up">Ƚ��</td>
                        <td class="sBar"></td>
                        <td class="s1up">������û�Ⱓ</td>
                        <td class="sBar"></td>
                        <td width="204" class="s1up">�н��Ⱓ</td>
                        <td class="sBar"></td>
                        <td width="74" class="s1up">���س��</td>
                        <td class="sBar"></td>
                        <td width="52" class="s1up">�����ο�</td>
                        <td class="sBar"></td>
                        <td width="50" class="s1up">���</td>
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
                      <!--�����Ⱓ �� �����ο� ���̺� ��-->
                    </td>
                  </tr>
                  <tr>
                    <td width="109" class="t1up"><span class="red">*</span>��������</td>
                    <td class="s3none">
                      <!--�������� ���̺� ����-->
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="s1up" width="99">����</td>
                        <td class="sBar"></td>
                        <td class="s1up">�ֿ䳻��</td>
                        <td class="sBar"></td>
                        <td width="55" class="s1up">���</td>
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
	                        <td width="55" class="s2Center" style="border-bottom:1px solid #D6D6D6" id="sBtn${i.count - 1}"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" style="cursor:hand" onclick="deleteSubject('subject${i.count - 1}');" />
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
                        <td width="55" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' style="cursor:hand" width="34" height="18" alt="�߰�" align="absmiddle" onclick="addSubject();" />
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
                    <td width="109" class="t1up">�򰡳���</td>
                    <td class="s3none">
                      <!--�򰡳��� ���̺� ����-->
                      <table width="636" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="99" class="s1up">����</td>
                        <td class="sBar"></td>
                        <td width="99" class="s1up">��</td>
                        <td class="sBar"></td>
                        <td class="s1up">�̼�����</td>
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
                            <html:hidden property="cyberFinBase" value="���� 80�� �̻�� �̼�(��, �ݵ�� �н��������� 90%�̻� �н�, �� 40���̻�)"/>&nbsp;���� 80�� �̻�� �̼�(��, �ݵ�� �н��������� 90%�̻� �н�, �� 40���̻�)
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
                        <td width="99" class="s1up">�̼��뺸</td>
                        <td class="sBar"></td>
                        <td colspan="3">
                          <c:if test="${key == 'create'}">
                            <html:hidden property="cyberFinNotice" value="�н����� �� 10�� �̳��� �����Ʒúμ��� ���� �뺸"/>&nbsp;�н����� �� 10�� �̳��� �����Ʒúμ��� ���� �뺸
                          </c:if>
                          <c:if test="${key != 'create'}">
                            <html:hidden property="cyberFinNotice"/>&nbsp;${rsCrs_Org.cyberFinNotice}
                          </c:if>
                        </td>
                      </tr>
                      </table>
                      <!--�򰡳��� ���̺� ��-->
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
              <!--���̺� ��� ��-->
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
	            <img src='<html:rewrite page="/images/board/btn_add3.gif"/>' width="72" height="25" alt="����߰�" align="absmiddle" onclick="addCourse();" style="CURSOR: hand" />
	          </c:if>
	          <c:if test="${rsCrs_Org.finishFlag eq 'N'}">
		        <img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>
		        <c:if test="${key==null}">
		          <img src='<html:rewrite page="/images/board/btn_del.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="deleteCourse();" style="CURSOR: hand"/>
		        </c:if>
	          </c:if>
	          <c:if test="${rsCrs_Org.finishFlag eq 'Y'}">
		        <img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' width="57" height="25" alt="����" align="absmiddle" />
		        <c:if test="${key==null}">
		          <img src='<html:rewrite page="/images/board/btn_del_off.gif"/>' width="57" height="25" alt="����" align="absmiddle" />
		        </c:if>
	          </c:if>
			  <c:if test="${key eq 'create'}">
		        <img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertCourse();" style="CURSOR: hand"/>
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
