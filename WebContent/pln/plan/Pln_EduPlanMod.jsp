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

		//���
		ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.width="49";
        ref_cell.id = "course";


        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";


		//�����Ⱓ
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('eduFromTo').innerHTML;


		//����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//�����ο�
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('count').innerHTML;
        ref_cell.width="119";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //���ǽ�
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('room').innerHTML;
        ref_cell.width="119";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //��ư
         var id = "course" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "cBtn" + String(seqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick=deleteCourse("'+id+'"); style="cursor:hand" />';
        ref_cell.width="60";

        resetCourse(nMaxRow);

		checkCourseNo();


	}

	// ���� ����
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

	// �����ȣ ����
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


		// �����߰�
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


		//������
		ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.id = "subject";
        ref_cell.innerHTML = $('name').innerHTML;

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//�о�
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('type').innerHTML;
        ref_cell.width="100";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //�����ð�(���ǽ�)
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('lectd').innerHTML;
        ref_cell.width="62";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";
        
        //�����ð�(�����н�)
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('pattd').innerHTML;
        ref_cell.width="62";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";  
        
        //�����ð�(��Ÿ)
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('etctd').innerHTML;
        ref_cell.width="62";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

       	//����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('order').innerHTML;
        ref_cell.width="60";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //��ư
        var id = "subject" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "sBtn" + String(seqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick=deleteSubject("'+id+'"); style="cursor:hand" />';
        ref_cell.width="60";

        resetSubject(nMaxRow);


	}

	// ���� ����
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
	// ��� �ʱ�ȭ
	function resetCourse(row)
	{
		document.all.eduFrom[row].value = "";
		document.all.eduTo[row].value = "";
		document.all.eduCount[row].value = "";
		document.all.lecRoomNo[row].selectedIndex = 0;


	}


		// ���� �ʱ�ȭ
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

	//������ ��ȸ�� ��� �� ����� ����
	function checkList()
	{

	}

	//������ȹ�� ����
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
			alert("���������� �Է��ϼ���.");
			document.all.subjName.focus();
			return;
		}
		
		var frm = document.forms[0];

		frm.submit();
	}

		//������ȹ�� ����
	function deletePlan()
	{
		if(confirm('�����Ͻðڽ��ϱ�?'))
		{
			var code = document.all.crsClumpCode.value;
			document.location.href = "eduPlan.act?task=delete&crsClumpCode="+code;
		}
	}

	//�ű�ȭ��� �ʱⰪ ����
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

	//��ȹ��  ���� üũ
	function checkPlan()
	{
		var frm = document.forms[0];

		if(frm.crsType.value=='')
		{
			alert('�з��� �����ϼ���');
			frm.crsType.focus();
			return false;
		}

		if(frm.crsClumpName.value=='')
		{
			alert('�������� �Է��ϼ���');
			frm.crsClumpName.focus();
			return false;
		}

		var courseNameLength = byteCheck(frm.crsClumpName.value)
		if(courseNameLength > 70)
		{
			alert('�������� 70�ڸ� �ʰ��Ͽ� �Է��� �� �����ϴ�.\n���:�ѱ�(2)+����(1)+Ư������(1)\n���� �Էµ� ���� : ' + courseNameLength);
			frm.crsClumpName.focus();
			return;
		}

		if(frm.applyYear.value=='')
		{
			alert('����⵵�� �Է��ϼ���');
			frm.applyYear.focus();
			return false;
		}
		
		// �����Ⱓ From ���� To ������ ū�� üũ
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
				alert('�����Ⱓ�� �߸� �Է��ϼ̽��ϴ�.');
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
					alert('�����Ⱓ�� �߸� �Է��ϼ̽��ϴ�.');
					frm.eduFrom[i].focus();
					return false;
				}
			}
		}
		
		
		// �����Ⱓ �� �����ο��� �Է������� �߰���ư�� ������ �ʾ��� ���
		
		if(courseNum == 0)
		{
			if(frm.eduFrom.value != "" || frm.eduTo.value != "" || frm.eduCount.value != "")
			{
				alert('�Է��� �����Ⱓ �� �����ο� ������ �߰��ϼ���.');
				frm.eduFrom.focus();
				return false;
			}
		}
		else 
		{
			if(frm.eduFrom[courseNum].value != "" || frm.eduTo[courseNum].value != "" || frm.eduCount[courseNum].value != "")
			{
				alert('�Է��� �����Ⱓ �� �����ο� ������ �߰��ϼ���.');
				frm.eduFrom[courseNum].focus();
				return false;
			}
		}
		
		// ���������� �Է������� �߰���ư�� ������ �ʾ��� ���
		var subjectNum = frm.subjectSeq.value;				
		if(subjectNum == 0)
		{
			if(frm.subjName.value != "")
			{
				alert('�Է��� �������� ������ �߰��ϼ���.');
				frm.subjName.focus();
				return false;
			}
		}
		else 
		{
			if(frm.subjName[subjectNum].value != "")
			{
				alert('�Է��� �������� ������ �߰��ϼ���.');
				frm.subjName[subjectNum].focus();
				return false;
			}
		}
		
		return true;
	}


	//��� ���� üũ
	function checkCourse(idx, cMax)
	{
		var frm = document.forms[0];

		if(cMax>0)
		{

			if(frm.eduFrom[idx].value == '')
			{
				alert("�����Ⱓ�� �Է��ϼ���");
				frm.eduFrom[idx].focus();
				return false;
			}

			if(frm.eduTo[idx].value == '')
			{
				alert("�����Ⱓ�� �Է��ϼ���");
				frm.eduTo[idx].focus();
				return false;
			}

			if(frm.eduCount[idx].value == '')
			{
				alert("�����ο��� �Է��ϼ���");
				frm.eduCount[idx].focus();
				return false;
			}
		}

		else
		{

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
			var subjNameLength = byteCheck(frm.subjName[idx].value);
			if(subjNameLength > 50)
			{
				alert('������� 50�ڸ� �ʰ��Ͽ� �Է��� �� �����ϴ�.\n���:�ѱ�(2)+����(1)+Ư������(1)\n���� �Էµ� ���� : ' + subjNameLength);
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
			var subjNameLength = byteCheck(frm.subjName.value);
			if(frm.subjName.value == '')
			{
				alert('������� 50�ڸ� �ʰ��Ͽ� �Է��� �� �����ϴ�.\n���:�ѱ�(2)+����(1)+Ư������(1)\n���� �Էµ� ���� : ' + subjNameLength);
				frm.subjName.focus();
				return false;
			}
		}

		return true;

	}

	//������ȹ�� ����
	function deletePlan()
	{
		if(confirm('�����Ͻðڽ��ϱ�?'))
		{
			var frm = document.forms[0];
			var code = frm.crsClumpCode.value;
			var selPlanYear = frm.selPlanYear.value;
			var selCrsType 	= frm.selCrsType.value;
			document.location.href = "eduPlan.act?task=delete&crsClumpCode="+code+"&selPlanYear="+selPlanYear+"&selCrsType="+selCrsType;
		}
	}
	
	//������ȹ �������
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
				alert('������� 50�ڸ� �ʰ��Ͽ� �Է��� �� �����ϴ�.\n���:�ѱ�(2)+����(1)+Ư������(1)\n���� �Էµ� ���� : ' + subjNameLength);
				frm.subjName[idx].focus();
				return false;
			}
		}
		else
		{
			var subjNameLength = byteCheck(frm.subjName.value);
			if(subjNameLength > 50)
			{
				alert('������� 50�ڸ� �ʰ��Ͽ� �Է��� �� �����ϴ�.\n���:�ѱ�(2)+����(1)+Ư������(1)\n���� �Էµ� ���� : ' + subjNameLength);
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
	<h2 class="hide">����������</h2>
	<c:if test="${key eq 'create'}">
	  <h1><img alt="��ȹ��-�űԵ��" src="/images/edu/title_03-2.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create'}">
	  <h1><img alt="��ȹ��-����" src="/images/edu/title_03-5.gif" /></h1>
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

                  <!--���̺� ��� ����-->
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
                                  <td width="74" class="s1up">������</td>
                                  <td class="sBar"></td>
                                  <td class="s2" colspan="9">
                                    <html:text property="crsClumpName" style="width:250px;"></html:text>
                                  </td>
                                </tr>
                              </table>
                              <!--�⺻���� ���̺� ��-->
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">������ǥ</td>
                            <td class="s3">
															<c:if test="${eduObjectives eq '' || eduObjectives eq null}">
                            		<html:textarea property="eduObjectives" style="width:98%;" rows="3" value="��
��"></html:textarea>
															</c:if>
															<c:if test="${eduObjectives ne '' && eduObjectives ne null}">
	                            	<html:textarea property="eduObjectives" style="width:98%;" rows="3"></html:textarea>
	                            </c:if>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">�������<br>�� <br> �ϼ�</td>
                            <td class="s3none">
                            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                            		<tr>
                            			<td class="s1up">�������</td>
                                  <td class="sBar"></td>
                            			<td class="s1up">�����ϼ�</td>
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
                            <td width="109" class="t1up"><span class="red">*</span>�����Ⱓ<br>�� <br> �����ο�</td>
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
                                  <td width="60" class="s1up">ó��</td>
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
                                  <td width="60" class="s2Center" id="cBtn${i.count - 1}" style="border-bottom:1px solid #D6D6D6"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick="deleteCourse('course${i.count - 1}');" style="cursor:hand" /></td>
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
                                  <td width="60" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="�߰�" align="absmiddle"  onclick="addCourse();" style="cursor:hand"/></td>
                                </tr>
                              </table>
															<input type="hidden" id="courseSeq" name="courseSeq" value="${crsCount}" >
                              <input type="hidden" id="courseMax" name="courseMax" value="${crsCount}" >
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
                                  <td class="s1up" width="188" colspan="5">
                                  	<table width="100%"> 
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
			                            <td class="sBar"></td>
                                  <td width="60" class="s1up">����</td>
                                  <td class="sBar"></td>
                                  <td width="60" class="s1up">ó��</td>
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
                                  	<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick="deleteSubject('subject${i.count - 1}');" style="cursor:hand"/>
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
                                  <td width="60" class="s2Center"> <img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="�߰�" align="absmiddle" onclick="addSubject();" style="cursor:hand"/>
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
                      <td align="right">
                      	<img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertPlan();" style="CURSOR: hand" />
												<c:if test="${key==null}">
                        	<img src='<html:rewrite page="/images/board/btn_del.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="deletePlan();" style="CURSOR: hand"/>
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
<script type="text/javascript">
<!--
	setDefault('${key}');
//-->
</script>
