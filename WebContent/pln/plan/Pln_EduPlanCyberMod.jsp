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

	// ���� �Ⱓ �߰�
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


		//Ƚ��
		ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.width="28";
        ref_cell.id = "course";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";


		//������û �Ⱓ
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('reqFromTo').innerHTML;
		//����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //�н� �Ⱓ
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('eduFromTo').innerHTML;
        ref_cell.width="204";

		//����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//���س��
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('applyYM').innerHTML;
        ref_cell.width="74";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//�����ο�
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('count').innerHTML;
        ref_cell.width="52";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //��ư
        var id = "course" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "cBtn" + String(nSeqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick=deleteCourse("'+id+'"); style="cursor:hand" />';
        ref_cell.width="55";

        resetCourse(nMaxRow);

		checkCourseNo();


	}

	// ���� ����
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
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "subject";
        ref_cell.innerHTML = $('subName').innerHTML;
        ref_cell.width="99";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

		//�ֿ䳻��
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="s2Center";
        ref_cell.innerHTML = $('contents').innerHTML;


        //����
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.className="sBar";

        //��ư
        var id = "subject" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "sBtn" + String(nSeqRow);
        ref_cell.className="s2Center";
        ref_cell.innerHTML = '<img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick=deleteSubject("'+id+'"); style="cursor:hand" />';
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



	// ��� �ʱ�ȭ
	function resetCourse(row)
	{
		document.all.eduFrom[row].value = "";
		document.all.eduTo[row].value = "";
		document.all.reqFrom[row].value = "";
		document.all.reqTo[row].value = "";
		document.all.eduCount[row].value = "";
		document.all.applyYYMM[row].value = "";


	}

	// �������� �ʱ�ȭ
	function resetSubject(row)
	{
		document.all.subjName[row].value = "";
		document.all.eduContents[row].value = "";

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
		
		
		// ������û�Ⱓ/�н��Ⱓ 
		// From ���� To ������ ū�� üũ
		// ����⵵�ȿ��� �Է��� ������ üũ
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
			if(applyYYMM.substr(0,4) != eduYear)
			{
					alert('���س���� �߸� �Է��ϼ̽��ϴ�.');
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
						alert('������û�Ⱓ�� �߸� �Է��ϼ̽��ϴ�.');
						frm.reqFrom[i].focus();
						return false;
				}
				if(eduFrom>eduTo || eduFrom.substr(0,4) != eduYear || eduTo.substr(0,4) != eduYear)
				{
						alert('�н��Ⱓ�� �߸� �Է��ϼ̽��ϴ�.');
						frm.eduFrom[i].focus();
						return false;
				}
				if(applyYYMM.substr(0,4) != eduYear)
				{
						alert('���س���� �߸� �Է��ϼ̽��ϴ�.');
						frm.applyYYMM[i].focus();
						return false;
				}
			}
		}
		
		// �����Ⱓ �� �����ο��� �Է������� �߰���ư�� ������ �ʾ��� ���
		if(courseNum == 0)
		{
			if(frm.reqFrom.value != "" || frm.reqTo.value != "" || frm.eduFrom.value != "" || frm.eduTo.value != "" || frm.eduCount.value != "" || frm.applyYYMM.value != "")
			{
				alert('�Է��� �����Ⱓ �� �����ο� ������ �߰��ϼ���.');
				frm.reqFrom.focus();
				return false;
			}
		}
		else 
		{
			if(frm.reqFrom[courseNum].value != "" || frm.reqTo[courseNum].value != "" || frm.eduFrom[courseNum].value != "" || frm.eduTo[courseNum].value != "" || frm.eduCount[courseNum].value != ""|| frm.applyYYMM[courseNum].value != "")
			{
				alert('�Է��� �����Ⱓ �� �����ο� ������ �߰��ϼ���.');
				frm.reqFrom[courseNum].focus();
				return false;
			}
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

	//��� ���� üũ
	function checkCourse(idx, cMax)
	{
		var frm = document.forms[0];

		if(cMax>0)
		{

			if(frm.reqFrom[idx].value == '')
			{
				alert("������û�Ⱓ�� �Է��ϼ���");
				frm.reqFrom[idx].focus();
				return false;
			}

			if(frm.reqTo[idx].value == '')
			{
				alert("������û�Ⱓ�� �Է��ϼ���");
				frm.reqTo[idx].focus();
				return false;
			}

			if(frm.eduFrom[idx].value == '')
			{
				alert("�н��Ⱓ�� �Է��ϼ���");
				frm.eduFrom[idx].focus();
				return false;
			}

			if(frm.eduTo[idx].value == '')
			{
				alert("�н��Ⱓ�� �Է��ϼ���");
				frm.eduTo[idx].focus();
				return false;
			}

			if(frm.applyYYMM[idx].value == '')
			{
				alert("���س���� �Է��ϼ���");
				frm.applyYYMM[idx].focus();
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

			if(frm.applyYYMM.value == '')
			{
				alert("���س���� �Է��ϼ���");
				frm.applyYYMM.focus();
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
			document.all.applyYear.selectedIndex = 6;
			document.all.subjectMax.value = 0;
			document.all.courseMax.value = 0;
			document.all.subjectSeq.value = 0;
			document.all.courseSeq.value = 0;
		}
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

-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<c:if test="${key eq 'create'}">
	  <h1><img alt="��ȹ�� �űԵ��-���̹�" src="/images/edu/title_03-3.gif" /></h1>
	</c:if>
	<c:if test="${key ne 'create'}">
	  <h1><img alt="��ȹ�� ����-���̹�" src="/images/edu/title_03-6.gif" /></h1>
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
                  <!--���̺� ��� ����-->
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
                                  <td width="74" class="s1up">��з�</td>
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
                            <td>
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td class="s3" width="250">
																		<c:if test="${eduObjectives eq '' || eduObjectives eq null}">
				                            	<html:textarea property="eduObjectives" style="width:98%;" rows="4" value="��
��"></html:textarea>
																		</c:if>
																		<c:if test="${eduObjectives ne '' && eduObjectives ne null}">
				                            	<html:textarea property="eduObjectives" style="width:96%;" rows="4"></html:textarea>
				                            </c:if>
                                  </td>
                                  <td class="t1up2" width="109">�������</td>
                                  <td class="s3">
																		<c:if test="${eduWay eq '' || eduWay eq null}">
                                    	<html:textarea property="eduWay" style="width:96%;" rows="4" value="��û�ϵ���ġ������ ���̹��������� ���ͳ��� ���� �н�
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
                            <td width="109" class="t1up">�����ϼ�</td>
                            <td>
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td class="s3" width="250">
                                    <html:text property="dayCount" style="width:92%; IME-MODE:disabled" maxlength="3" onkeydown="key_num();"></html:text>
                                  </td>
                                  <td class="t1up2" width="109">�����ð�</td>
                                  <td class="s3">
                                    <html:text property="apvHour" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/>�ð�
                                    <html:text property="chptCount" style="width:50px;IME-MODE:disabled" onkeydown="key_num();"/>���� 
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up">�������</td>
                            <td class="s3"><html:text property="eduTarget" style="width:92%;" maxlength="50"/></td>
                          </tr>
                          <tr>
                            <td width="109" class="t1up"><span class="red">*</span>�����Ⱓ<br>��<br>�����ο�</td>
                            <td class="s3none">
                              <!--�����Ⱓ �� �����ο� ���̺� ����-->
                              <table width="636" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="28" class="s1up">ȸ��</td>
                                  <td class="sBar"></td>
                                  <td class="s1up">������û�Ⱓ</td>
                                  <td class="sBar"></td>
                                  <td width="205" class="s1up">�н��Ⱓ</td>
                                  <td class="sBar"></td>
                                  <td width="80" class="s1up">���س��</td>
                                  <td class="sBar"></td>
                                  <td width="52" class="s1up">�����ο�</td>
                                  <td class="sBar"></td>
                                  <td width="50" class="s1up">���</td>
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
                                  <td width="55" class="s2Center" id="cBtn${i.count - 1}" style="border-bottom:1px solid #D6D6D6"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick="deleteCourse('course${i.count - 1}');" style="cursor:hand" /></td>
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
                                  <td width="55" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="�߰�" align="absmiddle"  onclick="addCourse();" style="cursor:hand" /></td>
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
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td class="s2Center" style="border-bottom:1px solid #D6D6D6">
                                    <textarea name="eduContents" style="width:98%;" rows="2">${subList.eduContents}</textarea>
                                  </td>
                                  <td class="sBar" style="border-bottom:1px solid #D6D6D6"></td>
                                  <td width="55" class="s2Center" id="sBtn${i.count - 1}" style="border-bottom:1px solid #D6D6D6"><img src=<html:rewrite page="/images/board/btn_del2.gif"/> width="34" height="18" alt="����" align="absmiddle" onclick="deleteSubject('subject${i.count - 1}');" style="cursor:hand" />
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
                                  <td width="55" class="s2Center" ><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' width="34" height="18" alt="�߰�" align="absmiddle" onclick="addSubject();" style="cursor:hand" />
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
                                  		<html:text property="cyberFinBase" value="���� 100%"/>&nbsp;
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
                                  <td width="99" class="s1up">�̼��뺸</td>
                                  <td class="sBar"></td>
                                  <td colspan="3">
                                  	<c:if test="${key == 'create'}">
                                  		<html:hidden property="cyberFinNotice" value="���Ῡ�δ� �н����� �� 10�� �̳��� �������� �뺸"/>&nbsp;���Ῡ�δ� �н����� �� 10�� �̳��� �������� �뺸
                                  	</c:if>
                                  	<c:if test="${key != 'create'}">
                                  		<html:hidden property="cyberFinNotice"/>&nbsp;${rsPln_EduPlan.cyberFinNotice}
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
                  <!--���̺� ��� ����-->
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
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="����" align="absmiddle" onclick="insertPlan();" style="CURSOR: hand"/>
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
