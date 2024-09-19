<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>
<!-- <script type="text/javascript" src="/editor/ckeditor.js"></script> -->
<script language="JavaScript">
	$.noConflict();
	function goList()
	{
// 		var searchKeyword = document.all.searchKeyword.value;
// 		var searchProfLevel = document.all.searchProfLevel.value;
// 		var searchKeywordLecType = document.all.searchKeywordLecType.value;

		document.forms[0].action = 'prfBaseInfo.act?task=list';
		document.forms[0].submit();
	}

	function doDelete(num)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			document.all.delType.value = 'all';
			document.all.professorNo.value = num;

			document.forms[0].action = 'prfBaseInfo.act?task=delete';
			document.forms[0].submit();
		}
		else
		{
			return;
		}
	}
	function doInfoDelete(num)
	{
		var del_confirm = confirm('���������� �����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			document.all.delType.value = 'info';
			document.all.professorNo.value = num;

			document.forms[0].action = 'prfBaseInfo.act?task=delete';
			document.forms[0].submit();
		}
		else
		{
			return;
		}
	}

	function doSubmit(frm)
	{
		if(frm.jobCode.value == "")
		{
			alert('�������� �Է��ϼ���.');
			return;
		}
		if(frm.profName.value == "")
		{
			alert('������ �Է��ϼ���.');
			frm.profName.focus();
			return;
		}
		if(frm.cellPhone.value == "")
		{
			alert('�޴���ȭ�� �Է��ϼ���.');
			frm.cellPhone.focus();
			return;
		}

/*
		// �з������� �Է������� �߰���ư�� ������ �ʾ��� ���
		var schoolNum = frm.schoolSeq.value;
		if(schoolNum == 0)
		{
			if(frm.schoolName.value != "")
			{
				alert('�Է��� �з������� �߰��ϼ���.');
				return;
			}
		}
		else
		{
			if(frm.schoolName[schoolNum].value != "")
  		{
				alert('�Է��� �з������� �߰��ϼ���.');
				return;
			}
		}
*/
		// ��������� �Է������� �߰���ư�� ������ �ʾ��� ���
		/* var careerNum = frm.careerSeq.value;
		if(careerNum == 0)
		{
			if(frm.fromDate.value != "" || frm.organName.value != "" || frm.position.value != "")
			{
				alert('�Է��� ��������� �߰��ϼ���.');
				return;
			}
		}
		else
		{
			if(frm.fromDate[careerNum].value != "" || frm.organName[careerNum].value != "" || frm.position[careerNum].value != "")
  		{
				alert('�Է��� ��������� �߰��ϼ���.');
				return;
			}
		} */
/*
		// �ֿ���������� �Է������� �߰���ư�� ������ �ʾ��� ���
		var thesisNum = frm.thesisSeq.value;
		if(thesisNum == 0)
		{
			if(frm.thesis.value != "")
			{
				alert('�Է��� �ֿ���������� �߰��ϼ���.');
				return;
			}
		}
		else
		{
			if(frm.thesis[thesisNum].value != "" )
			{
				alert('�Է��� �ֿ���������� �߰��ϼ���.');
				return;
			}
		}
*/

		var do_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(do_confirm == true)
		{
			frm.juminNo.value = frm.juminNo1.value;
			//frm.juminNo.value = frm.juminNo1.value + frm.juminNo2.value;
			frm.submit();
		}
	}
/*
	// �з� ������ �߰�
	function addSchool()
	{
		var dataList = $('school_list');

		var seq = document.all.schoolSeq.value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;

		// ������ �� �Է½�
		if(seqRow == 0)
		{
			if(document.all.schoolName.value == "")
			{
				alert('�б����� �߰��ϼ���.');
				document.all.schoolName.focus();
				return;
			}
		}
		else
		{
			if(document.all.schoolName[seq].value == "")
			{
				alert('�б����� �߰��ϼ���.');
				document.all.schoolName[seq].focus();
				return;
			}
		}

		var ref_row = dataList.insertRow(seqRow);

				ref_row.id = "school" + seqRow;

				document.all.schoolSeq.value = nSeqRow;

				//�⵵
				ref_cell = ref_row.insertCell();
        ref_cell.className = "s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insSchoolYear";
        ref_cell.innerHTML = document.all.cellSchoolYear.innerHTML;
        ref_cell.width="79";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

				//�б���
        ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insSchoolName";
        ref_cell.innerHTML = document.all.cellSchoolName.innerHTML;

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

				//����
        ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insSchoolSpec";
        ref_cell.innerHTML = document.all.cellSchoolSpec.innerHTML;
        ref_cell.width="129";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insSchoolDegree";
        ref_cell.innerHTML = document.all.cellSchoolDegree.innerHTML;
        ref_cell.width="99";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

        //��ư
        var id = "school" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.id = "school_sBtn" + String(seqRow);
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
				var html1 = "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' alt='����' onclick='delSchool(" + id + ");' style='cursor:hand' />";
        ref_cell.innerHTML = html1;
        ref_cell.width="60";

        resetSchool(nSeqRow);
	}

	// �з� ������ �ʱ�ȭ
	function resetSchool(row)
	{
		var seq = Number(row);

		if(seq == 0)
		{
			document.all.year.value = "";
			document.all.schoolName.value = "";
			document.all.specialty.value = "";
			document.all.degree.value = "";
		}
		else
		{
			document.all.year[seq].value = "";
			document.all.schoolName[seq].value = "";
			document.all.specialty[seq].value = "";
			document.all.degree[seq].value = "";
		}
	}

	// �з� ������  ����
	function delSchool(obj)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			document.all.schoolSeq.value = document.all.schoolSeq.value-1;
			var seq = document.all.schoolSeq.value;

			var dataList = $('school_list');
			var node = $(obj);

			node.parentNode.removeChild(node);
		}
	}
*/
	// ��� ������ �߰�
	/* function addCareer()
	{
		var dataList = $('career_list');

		var seq = document.all.careerSeq.value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;

		// �� �Է½�
		if(seqRow == 0)
		{
			if(document.all.fromDate.value == "")
			{
				alert('�Ⱓ�� �Է��ϼ���.');
				document.all.fromDate.focus();
				return;
			}
			if(document.all.organName.value == "")
			{
				alert('������� �Է��ϼ���.');
				document.all.organName.focus();
				return;
			}
			if(document.all.position.value == "")
			{
				alert('������ �Է��ϼ���.');
				document.all.position.focus();
				return;
			}
		}
		else
		{
			if(document.all.fromDate[seq].value == "")
			{
				alert('�Ⱓ�� �Է��ϼ���.');
				document.all.fromDate[seq].focus();
				return;
			}
			if(document.all.organName[seq].value == "")
			{
				alert('������� �Է��ϼ���.');
				document.all.organName[seq].focus();
				return;
			}
			if(document.all.position[seq].value == "")
			{
				alert('������ �����ϼ���.');
				document.all.position[seq].focus();
				return;
			}
		}

		var ref_row = dataList.insertRow(seqRow);

				ref_row.id = "career" + seqRow;

				//�Ⱓ
				ref_cell = ref_row.insertCell();
        ref_cell.className = "s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insFromToDate";
        ref_cell.innerHTML = document.all.cellFromToDate.innerHTML;
        ref_cell.width="240";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

				//�����
        ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insOrganName";
        ref_cell.innerHTML = document.all.cellOrganName.innerHTML;

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insPosition";
        ref_cell.innerHTML = document.all.cellPosition.innerHTML;
        ref_cell.width="129";

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

        //��ư
        var id = "career" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.id = "career_sBtn" + String(seqRow);
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
				var html1 = "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' alt='����' onclick='delCareer(" + id + ");' style='cursor:hand' />";
        ref_cell.innerHTML = html1;
        ref_cell.width="60";

				var html = "<input type='text' id='fromDate' name='fromDate' style='width:220px;' maxlength='30'/>";
        document.all.cellFromToDate.innerHTML = html;

        resetCareer(nSeqRow);

        document.all.careerSeq.value = nSeqRow;
	}

	// ��� ������ �ʱ�ȭ
	function resetCareer(row)
	{
		var seq = Number(row);

		if(seq == 0)
		{
			document.all.fromDate.value = "";
			document.all.organName.value = "";
			document.all.position.value = "";
		}
		else
		{
			document.all.fromDate[seq].value = "";
			document.all.organName[seq].value = "";
			document.all.position[seq].value = "";
		}
	}

	// ��� ������  ����
	function delCareer(obj)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			document.all.careerSeq.value = document.all.careerSeq.value-1;
			var seq = document.all.careerSeq.value;

			var dataList = $('career_list');
			var node = $(obj);

			node.parentNode.removeChild(node);
		}
	} */
/*
	// �ֿ���� ������ �߰�
	function addThesis()
	{
		var dataList = $('thesis_list');

		var seq = document.all.thesisSeq.value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;

		// �� �Է½�
		if(seqRow == 0)
		{
			if(document.all.thesis.value == "")
			{
				alert('�ֿ������ �Է��ϼ���.');
				document.all.thesis.focus();
				return;
			}
		}
		else
		{
			if(document.all.thesis[seq].value == "")
			{
				alert('�ֿ������ �Է��ϼ���.');
				document.all.thesis[seq].focus();
				return;
			}
		}

		var ref_row = dataList.insertRow(seqRow);

				ref_row.id = "thesis" + seqRow;

				//�ֿ����
				ref_cell = ref_row.insertCell();
        ref_cell.className = "s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
        ref_cell.id = "insThesis";
        ref_cell.innerHTML = document.all.cellThesis.innerHTML;

        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";

        //��ư
        var id = "thesis" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.id = "thesis_sBtn" + String(seqRow);
        ref_cell.className="s2Center";
        ref_cell.style.borderBottom ="1px solid #D6D6D6";
				var html1 = "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' alt='����' onclick='delThesis(" + id + ");' style='cursor:hand' />";
        ref_cell.innerHTML = html1;
        ref_cell.width="60";

        resetThesis(nSeqRow);

        document.all.thesisSeq.value = nSeqRow;
	}

	// �ֿ���� ������ �ʱ�ȭ
	function resetThesis(row)
	{
		var seq = Number(row);

		if(seq == 0)
			document.all.thesis.value = "";
		else
			document.all.thesis[seq].value = "";
	}

	// �ֿ���� ������  ����
	function delThesis(obj)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			document.all.thesisSeq.value = document.all.thesisSeq.value-1;
			var seq = document.all.thesisSeq.value;

			var dataList = $('thesis_list');
			var node = $(obj);

			node.parentNode.removeChild(node);
		}
	}
*/
	function doRenew(num)
	{
		var renew = num;

		var do_confirm = confirm('���� ���� �Ⱓ�� �簻���Ͻðڽ��ϱ�?');
		if(do_confirm == true)
			document.all.renewDate.value = renew;
		else
			return;
	}

	function checkJuminNo()
	{
		var frm  = document.forms[0];
		if(frm.juminNo1.value.length >= 6)
		{
			frm.juminNo2.focus();
		}
	}

	jQuery(function(){
		// ������ ����
// 		CKEDITOR.replace('career',{
// 			customConfig: '/editor/config_editor.js'
// 		});
	});
	
	function fileUpload(){
		var file = document.forms[0].file.value;

		if(file == "") {
			alert("���ε� ������ �����Ͽ� �ֽʽÿ�.");
			document.forms[0].file.focus();
			return;
		}
		
		document.forms[0].action = 'prfBaseInfo.act?task=fileUpload';
		document.forms[0].submit();
	}
	
	function fileDown(seq){

		var fileNo 	 = jQuery('#fileNo'+seq).val();
		var fileName = jQuery('#fileName'+seq).val();
		var filePath = jQuery('#filePath'+seq).val();
			
		document.forms[0].action = 'prfBaseInfo.act?task=fileDown&fileNo=' + fileNo + "&fileName=" + fileName + "&filePath=" + filePath;
		document.forms[0].submit();
	}
	
	function deleteFile(seq){
		var fileNo = jQuery('#fileNo'+seq).val(); 
		
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{		
			document.forms[0].action = 'prfBaseInfo.act?task=deleteFile&fileNo=' + fileNo;
			document.forms[0].submit();
		} else {
			return;
		}
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="�������� - ��� �� ����" src="/images/teacher/title_01-4.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" class="stitle">
						<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />
						�⺻����
					</td>
				</tr>
			</table>
			<html:form method="POST" action="/prfBaseInfo.act?task=insert" enctype="multipart/form-data">
				<html:hidden property="professorNo" />
				<html:hidden property="delType" />
				<html:hidden property="professorNo" />
				<html:hidden property="searchProfLevel" value="${searchProfLevel}" />
				<html:hidden property="searchCourseName" value="${searchCourseName }" />
				<html:hidden property="searchSubjName" value="${searchSubjName }" />
				<html:hidden property="searchFromDate" value="${searchFromDate }" />
				<html:hidden property="searchToDate" value="${searchToDate }" />
				<html:hidden property="searchName" value="${searchName }" />
				<html:hidden property="searchGradeCode" value="${searchGradeCode }" />
				<html:hidden property="searchLecType" value="${searchLecType }" />
				<html:hidden property="task" value="${task}" />
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<table width="746" border="0" cellspacing="0" cellpadding="0">
<%--
								���Ǻоߴ� �����(���ǳ���)�� ���Եǵ��� ����. (2015.08.24 ������)
								<tr>
									<td width="99" class="t1 cbg4">���Ǻо�</td>
									<td width="1" class="sBar"></td>
									<td class="t5" width="646">
										<table width="646" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="115" class="s1up">
													<span class="red">*</span>���Ǻо�
												</td>
												<td class="sBar"></td>
												<td class="s2" width="210" colspan="5">
													<html:select property="lectureType" style="width:150px;">
														<html:optionsCollection name="prfLecCode" property="beanCollection" />
													</html:select>
												</td>
											</tr>

											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
										</table>
									</td>
								</tr>
 --%>
								<tr>
									<td width="99" class="t1 cbg4">�⺻����</td>
									<td width="1" class="sBar"></td>
									<td class="t5" width="646">
										<!--�⺻���� ���̺� ����-->
										<table width="646" height="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="115" class="s1up">
													<span class="red">*</span>��������
												</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<html:select property="isInnerProf" style="width:150px;">
														<html:optionsCollection name="prfLecInnerCode" property="beanCollection" />
													</html:select>
												</td>
												<td class="sBar"></td>
												<td width="85" class="s1up">
													<span class="red">*</span>������
												</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:select property="jobCode" style="width:150px;">
														<html:optionsCollection name="prfGradeCode" property="beanCollection" />
													</html:select>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
											<tr>
												<td width="120" class="s1up">
													<span class="red">*</span>����
												</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<c:if test="${task == 'modify'}">
														<html:text property='profName' style="width:150px; background-color:#E1E1E1;" />
													</c:if>
													<c:if test="${task != 'modify'}">
														<html:text property='profName' style="width:150px;" maxlength="15" />
													</c:if>
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">
													<span class="red">*</span>���
												</td>
												<td class="sBar"></td>
												<td class="s2">
													<c:if test="${rsPrf_ProfInfo.profLevel == null}">
														<html:select property="profLevel" style="width:90px;" value="03">
															<html:optionsCollection name="prfProLevelCode" property="beanCollection" />
														</html:select>
													</c:if>
													<c:if test="${rsPrf_ProfInfo.profLevel != null}">
														<html:select property="profLevel" style="width:90px;">
															<html:optionsCollection name="prfProLevelCode" property="beanCollection" />
														</html:select>
													</c:if><br>
													<html:radio property="profho" value="1" />
													1ȣ
													<html:radio property="profho" value="2" />
													2ȣ
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<td width="150" class="s1up">�������</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<html:hidden property="juminNo" />
													<input type="text" id='juminNo1' value="${fn:substring(rsPrf_ProfInfo.juminNo, 0, 6)}" style="width: 75px; IME-MODE: disabled;" maxlength="6" onkeydown="key_num();" />
													<%-- <input type="text" id='juminNo1' value="${fn:substring(rsPrf_ProfInfo.juminNo, 0, 6)}" style="width:75px; IME-MODE:disabled" maxlength="6" onkeyup="checkJuminNo();" onkeydown="key_num();"/>&nbsp;-&nbsp;
												    	<input type="text" id='juminNo2' value="${fn:substring(rsPrf_ProfInfo.juminNo, 6, 13)}" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num()"/> --%>
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">E-mail</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property='email' style="width:150px; IME-MODE:disabled" maxlength="30" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<%-- <td width="99" class="s1up">��ȭ��ȣ</td>
												    <td class="sBar"></td>
												    <td class="s2" width="220"><html:text property='home_Phone' style="width:150px; IME-MODE:disabled" maxlength="30" onkeydown="key_num_minus()"/></td> --%>
												<td width="99" class="s1up">����</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<html:radio property="gender" value="1" />
													��
													<html:radio property="gender" value="0" />
													��
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">
													<span class="red">*</span>�޴���ȭ
												</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property='cellPhone' style="width:150px; IME-MODE:disabled" maxlength="30" onkeydown="key_num_minus()" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											
											<tr>
												<td width="99" class="s1up">
													<span class="red">*</span>����
												</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<html:select property="areaCode">
														<html:optionsCollection name="prfAreaCode" property="beanCollection" />
													</html:select>
												</td>
												<td class="sBar"></td>
												<td width="85" class="s1up">
													<span class="red">*</span>����о�
												</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:select property="profType" style="width:150px;">
														<html:optionsCollection name="prfProfTypeCode" property="beanCollection" />
													</html:select>
												</td>
											</tr>
											
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
											
												<td width="99" class="s1up">�ּ�</td>
												<td class="sBar"></td>
												<td class="s2" colspan="5">
													<html:text property='home_Address' style="width:480px;" maxlength="200" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<td width="99" class="s1up">�ŷ�����</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<html:select property="bankCode">
														<html:optionsCollection name="prfBankCode" property="beanCollection" />
													</html:select>
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">���¹�ȣ</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property='accountNo' style="width:150px;" maxlength="30" onkeydown="key_num_minus()" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<td width="99" class="s1up">�ҵ汸��</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<html:select property="incomeType" style="width:150px;">
														<html:optionsCollection name="prfProfIncomeCode" property="beanCollection" />
													</html:select>
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">�����<br>��Ϲ�ȣ</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property='corporateNumber' style="width:150px;" maxlength="30" onkeydown="key_num_minus()" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<td width="99" class="s1up">�����б�</td>
												<td class="sBar"></td>
												<td class="s2" colspan="5">
													<html:text property='schoolname' style="width:480px;" maxlength="200" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<td width="99" class="s1up">����</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property='speciality' style="width:150px;" maxlength="30" />
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">����</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property='degreee' style="width:150px;" maxlength="30" />
												</td>
											</tr>
										</table>
										<!--�⺻���� ���̺� ��-->
									</td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td width="99" class="t1 cbg4">�Ҽ�</td>
									<td width="1" class="sBar"></td>
									<td class="t5" width="646">
										<!--�Ҽ� ���̺� ����-->
										<table width="646" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="150" class="s1up">�����</td>
												<td class="sBar"></td>
												<td class="s2" width="210">
													<html:text property="workPlace" style="width:150px;" maxlength="50" />
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">����</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property="workPos" style="width:150px;" maxlength="25" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<td width="99" class="s1up">��ȭ��ȣ</td>
												<td class="sBar"></td>
												<td class="s2" width="2">
													<html:text property="work_Phone" style="width:150px; IME-MODE:disabled" maxlength="20" onkeydown="key_num_minus()" />
												</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">FAX</td>
												<td class="sBar"></td>
												<td class="s2">
													<html:text property="work_Fax" style="width:150px; IME-MODE:disabled" maxlength="20" onkeydown="key_num_minus()" />
												</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<tr>
												<td width="99" class="s1up">�ּ�</td>
												<td class="sBar"></td>
												<td class="s2" colspan="5">
													<html:text property="work_Address" style="width:480px;" maxlength="200" />
												</td>
											</tr>
										</table>
										<!--�Ҽ� ���̺� ��-->
									</td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<%-- <tr>
									<td width="99" class="t1 cbg4">���</td>
									<td width="1" class="sBar"></td>
									<td class="t5" width="646">
										<table width="646" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="115" class="s1up">��»���</td>
												<td class="sBar"></td>
												<td class="s2">
													<textarea id="career" name="career" rows="8" style="margin : 5px;">
														${rsPrf_ProfInfo.career }
													</textarea>
												</td>
											</tr>
										</table>
									</td>
								</tr> --%>
							</table>
						</td>
					</tr>
				</table>
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td height="25" class="stitle">
							<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />
							���
						</td>
					</tr>
				</table>
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
							<tr>
								<td>
							<table width="746" border="0" cellspacing="0" cellpadding="0">
								<%-- <tr>
									<td width="99" class="t1 cbg4">�з�</td>
									<td width="1" class="sBar"></td>
									<td width="646">
										<!--�з� ���̺� ����-->
										<table width="646" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="79" class="s1up">����</td>
												<td class="sBar"></td>
												<td class="s1up">�б���</td>
												<td class="sBar"></td>
												<td width="129" class="s1up">����</td>
												<td class="sBar"></td>
												<td width="99" class="s1up">����</td>
												<td class="sBar"></td>
												<td width="60" class="s1up">ó��</td>
											</tr>
											<tr>
												<td colspan="9" class="lbg3"></td>
											</tr>
											<tbody id="school_list">
												<c:forEach var="schoolList" items="${rsPrf_ProfSchoolList}" varStatus="i">
													<tr id="school${i.count - 1}">
														<td width="79" class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:text property='year' value="${schoolList.year}" style="width:85%; IME-MODE:disabled" maxlength="4" onkeydown="key_num()" />
														</td>
														<td class="sBar"></td>
														<td class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:text property='schoolName' value="${schoolList.schoolName}" style="width:95%;" maxlength="20" />
														</td>
														<td class="sBar"></td>
														<td width="129" class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:text property='specialty' value="${schoolList.specialty}" style="width:90%;" maxlength="15" />
														</td>
														<td class="sBar"></td>
														<td width="99" class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:select property="degree" value="${schoolList.degree}">
																<html:optionsCollection name="prfDegreeCode" property="beanCollection" />
															</html:select>
														</td>
														<td class="sBar"></td>
														<td width="60" class="s2Center" style="border-bottom: 1px solid #D6D6D6" id="school_sBtn${i.count - 1}">
															<img src="<html:rewrite page='/images/board/btn_del2.gif'/>" alt="����" onclick="delSchool('school${i.count - 1}');" style="cursor: hand" />
														</td>
													</tr>
													<c:set var="schoolNo" scope="request" value="${i.count}" />
												</c:forEach>
											</tbody>
											<tr>
												<td width="79" class="s2Center" id="cellSchoolYear">
													<input type="text" id='year' name='year' style="width: 85%; IME-MODE: disabled" maxlength="4" onkeydown="key_num()" />
												</td>
												<td class="sBar"></td>
												<td class="s2Center" id="cellSchoolName">
													<input type="text" id='schoolName' name='schoolName' style="width: 95%;" maxlength="20" />
												</td>
												<td class="sBar"></td>
												<td width="129" class="s2Center" id="cellSchoolSpec">
													<input type="text" id='specialty' name='specialty' style="width: 90%;" maxlength="15" />
												</td>
												<td class="sBar"></td>
												<td width="99" class="s2Center" id="cellSchoolDegree">
													<html:select property="degree">
														<html:optionsCollection name="prfDegreeCode" property="beanCollection" />
													</html:select>
												</td>
												<td class="sBar"></td>
												<td width="60" class="s2Center">
													<img src='<html:rewrite page="/images/board/btn_add2.gif"/>' alt="�߰�" onClick="addSchool();" style="cursor: hand">
												</td>
											</tr>
											<html:hidden property="schoolSeq" value="${schoolNo}" />
										</table>
										<!--�з� ���̺� ��-->
									</td>
								</tr> --%>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td width="99" class="t1 cbg4">���</td>
									<td width="1" class="sBar"></td>
									<td class="s2" width="646" height="55">
										<html:textarea property='career' style="width:98%;" rows="3" />
									</td>
									<%-- <td width="99" class="t1 cbg4">���</td>
									<td width="1" class="sBar"></td>
									<td width="646">
										<!--��� ���̺� ����-->
										<table width="646" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="240" class="s1up">�Ⱓ</td>
												<td class="sBar"></td>
												<td class="s1up">�����</td>
												<td class="sBar"></td>
												<td width="129" class="s1up">����</td>
												<td class="sBar"></td>
												<td width="60" class="s1up">ó��</td>
											</tr>
											<tr>
												<td colspan="7" class="lbg3"></td>
											</tr>
											<c:set var="careerNo" scope="request" value="0" />
											<tbody id="career_list">
												<c:forEach var="careerList" items="${rsPrf_ProfCareerList}" varStatus="i">
													<tr id="career${careerNo}">
														<td width="240" class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:text property="fromDate" value="${careerList.fromDate}" style="width:220px;" maxlength="30" />
														</td>
														<td class="sBar"></td>
														<td class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:text property='organName' value="${careerList.organName}" style="width:90%;" maxlength="20" />
														</td>
														<td class="sBar"></td>
														<td width="129" class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:text property='position' value="${careerList.position}" style="width:90%;" maxlength="15" />
														</td>
														<td class="sBar"></td>
														<td width="60" class="s2Center" style="border-bottom: 1px solid #D6D6D6" id="career_sBtn${careerNo}">
															<img src="<html:rewrite page='/images/board/btn_del2.gif'/>" alt="����" onclick="delCareer('career${careerNo}');" style="cursor: hand" />
														</td>
													</tr>
													<c:set var="careerNo" scope="request" value="${careerNo + 1}" />
												</c:forEach>
											</tbody>
											<tr>
												<td width="240" class="s2Center" id="cellFromToDate">
													<input type="text" id='fromDate' name='fromDate' style="width: 220px;" maxlength="30" />
												</td>
												<td class="sBar"></td>
												<td class="s2Center" id="cellOrganName">
													<input type="text" id='organName' name='organName' style="width: 90%;" maxlength="20" />
												</td>
												<td class="sBar"></td>
												<td width="129" class="s2Center" id="cellPosition">
													<input type="text" id='position' name='position' style="width: 90%;" maxlength="15" />
												</td>
												<td class="sBar"></td>
												<td width="60" class="s2Center">
													<img src='<html:rewrite page="/images/board/btn_add2.gif"/>' alt="�߰�" onClick="addCareer();" style="cursor: hand">
												</td>
											</tr>
											<html:hidden property="careerSeq" value="${careerNo}" />
										</table>
										<!--��� ���̺� ��-->
									</td> --%>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<%-- <tr>
									<td width="99" class="t1 cbg4">�ֿ����</td>
									<td width="1" class="sBar"></td>
									<td class="t5" width="646">
										<!--�ֿ���� ���̺� ����-->
										<table width="646" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="s1up">�ֿ����</td>
												<td class="sBar"></td>
												<td width="60" class="s1up">ó��</td>
											</tr>
											<tr>
												<td colspan="3" class="lbg3"></td>
											</tr>
											<c:set var="thesisNo" scope="request" value="0" />
											<tbody id="thesis_list">
												<c:forEach var="thesisList" items="${rsPrf_ProfThesisList}" varStatus="i">
													<tr id="thesis${thesisNo}">
														<td class="s2Center" style="border-bottom: 1px solid #D6D6D6">
															<html:text property='thesis' value="${thesisList.thesis}" style="width:98%;" maxlength="50" />
														</td>
														<td class="sBar"></td>
														<td width="60" class="s2Center" style="border-bottom: 1px solid #D6D6D6" id="career_sBtn${thesisNo}">
															<img src="<html:rewrite page='/images/board/btn_del2.gif'/>" alt="����" onclick="delThesis('thesis${thesisNo}');" style="cursor: hand" />
														</td>
													</tr>
													<c:set var="thesisNo" scope="request" value="${thesisNo + 1}" />
												</c:forEach>
											</tbody>
											<tr>
												<td class="s2Center" id="cellThesis">
													<input type="text" name='thesis' id='thesis' style="width: 98%;" maxlength="50" />
												</td>
												<td class="sBar"></td>
												<td width="60" class="s2Center">
													<img src='<html:rewrite page="/images/board/btn_add2.gif"/>' alt="�߰�" onClick="addThesis();" style="cursor: hand">
												</td>
											</tr>
											<html:hidden property="thesisSeq" value="${thesisNo}" />
										</table>
										<!--�ֿ���� ���̺� ��-->
									</td>
								</tr> --%>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<%-- <tr>
									<td width="99" class="t1 cbg4">����Ұ���</td>
									<td width="1" class="sBar"></td>
									<td class="s2" width="646" height="26">
										<html:file property="file" style="width:400px;"></html:file>
										<c:if test="${rsPrf_ProfInfo.profIntroFile != null}">
											<c:set var="filetype" scope="request" value="N" />
											<c:if
												test="${rsPrf_ProfInfo.realFileType == 'hwp' || rsPrf_ProfInfo.realFileType == 'ppt' ||
																				rsPrf_ProfInfo.realFileType == 'xls' || rsPrf_ProfInfo.realFileType == 'doc' ||
																				rsPrf_ProfInfo.realFileType == 'txt' || rsPrf_ProfInfo.realFileType == 'pdf' ||
																				rsPrf_ProfInfo.realFileType == 'bmp' || rsPrf_ProfInfo.realFileType == 'gif' ||
																				rsPrf_ProfInfo.realFileType == 'jpg'}">
												<c:set var="filetype" scope="request" value="Y" />
											</c:if>
											<c:if test="${filetype == 'Y'}">
												<img src='<html:rewrite page="/images/board/${rsPrf_ProfInfo.realFileType}.gif"/>' align="absmiddle"
													alt="{${rsPrf_ProfInfo.profName}}_�Ұ���.${rsPrf_ProfInfo.realFileType}" onclick=location.href=
													'<html:rewrite page="/downLoad.act?downType=prof_info&downName=${rsPrf_ProfInfo.profName}&fileName=${rsPrf_ProfInfo.profIntroFile}"/>' style="cursor: hand" />
											</c:if>
											<c:if test="${filetype == 'N'}">
												<img src='<html:rewrite page="/images/board/etc.gif"/>' align="absmiddle" alt="etc" onclick=location.href=
													"<html:rewrite page="/downLoad.act?downType=prof_info&downName=${rsPrf_ProfInfo.profName}&fileName=${rsPrf_ProfInfo.profIntroFile}"/>" style="cursor: hand" />
											</c:if>
											<a href="/downLoad.act?downType=prof_info&downName=${rsPrf_ProfInfo.profName}&fileName=${rsPrf_ProfInfo.profIntroFile}" />
											<c:out value="${rsPrf_ProfInfo.profName}_�Ұ���.${rsPrf_ProfInfo.realFileType}" />
											</a>
											<html:checkbox property="isDel" />����
												</c:if>
									</td>
								</tr> --%>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr valign="middle">
									<td width="99" class="t1 cbg4">���</td>
									<td width="1" class="sBar"></td>
									<td class="s2" width="646" height="55">
										<html:textarea property='remarks' style="width:98%;" rows="3" />
									</td>
								</tr>
								<!-- <tr>
									<td colspan="3" class="lbg3"></td>
								</tr> -->
								<%-- <tr>
									<td width="99" class="t1 cbg4">�����</td>
									<td width="1" class="sBar"></td>
									<td width="646" height="26">
										<table width="646" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="s2" width="249">
													<c:if test="${today == null}">
														<html:text property="insDate" style="width:100px; color:#666666; IME-MODE:disabled" maxlength="10" readonly="true" />
													</c:if>
													<c:if test="${today != null}">
														<html:text property="insDate" value="${today}" style="width:100px; color:#666666; IME-MODE:disabled" maxlength="10" readonly="true" />
													</c:if>
												</td>
												<td width="1" class="sBar"></td>
												<td class="t1 cbg4" width="109">����/������</td>
												<td width="1" class="sBar"></td>
												<td class="s2" width="286">
													<html:text property="renewDate" style="width:100px; color:#666666; IME-MODE:disabled" maxlength="10" readonly="true" />
												</td>
											</tr>
										</table>
									</td>
								</tr> --%>
							</table>
						</td>
							</tr>
						</table>
				<!--�з� �� ��� ��ü ���̺� ��-->
				
				<!-- �Ⱝ��Ȳ ���̺� -->
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td height="25" class="stitle">
							<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />
							�Ⱝ��Ȳ
						</td>
					</tr>
				</table>
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
					<tr>
						<td>
							<table width="746" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
								<tr>
									<td width="99" class="t1 cbg4">�Ⱝ��Ȳ</td>
									<td width="1" class="sBar"></td>
									<td class="s2" width="646" height="55">
										<html:textarea property='teach' style="width:98%;" rows="3"  />
									</td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<!-- �Ⱝ��Ȳ ���̺� �� -->
				
				<c:if test="${rsPrf_ProfInfo.professorNo != null}">
					<table width="750" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="25" class="stitle">
								<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />
								÷������
							</td>
						</tr>
					</table>
					<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
						<tr>
							<td>
								<table width="746" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td colspan="3" class="lbg3"></td>
									</tr>
									<tr>
										<td width="99" class="t1 cbg4">÷������</td>
										<td width="1" class="sBar"></td>
										<td width="646">
											<table width="646" border="0" cellspacing="0" cellpadding="0">
												<c:set var="seq" value="1"/>		
												<c:forEach var="fileList" items="${rsPrf_ProfFileList}" varStatus="i">
													<tr>
														<td class="s1up">
															<span onclick="fileDown(${seq})" style="cursor: pointer;">${fileList.fileName}</span>
															<input type="hidden" id="fileNo${seq}" value="${fileList.fileNo}"/>
															<input type="hidden" id="fileName${seq}" value="${fileList.fileName}"/>
															<input type="hidden" id="filePath${seq}" value="${fileList.filePath}"/>
														</td>
														<td width="60" class="s2Center">
															<img src="<html:rewrite page='/images/board/btn_del2.gif'/>" alt="����" onclick="deleteFile(${seq});" style="cursor: hand" />
														</td>
													</tr>
													<c:set var="seq" value="${seq+1}"/>
												</c:forEach>
											<tr>
												<td align="center">
													<html:file property="file" style="width:450px;"></html:file>
													<img src='<html:rewrite page="/images/board/btn_file_up.gif"/>' alt="���Ͼ��ε�" align="absmiddle" onclick="fileUpload()" style="cursor:hand"/>
												</td>
											</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>	
				</c:if>
				
				<!--�ϴܹ�ư ���̺� ����-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="bottom">
						<td>
							<c:if test="${task == 'modify'}">
								<img src='<html:rewrite page="/images/board/btn_renewal.gif"/>' align="absmiddle" alt="�Ⱓ �簻��" onclick="doRenew('${renewday}');" style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_info_del.gif"/>' align="absmiddle" alt="�������� ����" onclick="doInfoDelete(${rsPrf_ProfInfo.professorNo});"
									style="cursor: hand" />
								<img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle" alt="����" onclick="doDelete(${rsPrf_ProfInfo.professorNo});"
									style="cursor: hand" />
							</c:if>
						</td>
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick="goList();" style="cursor: hand" />
							<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="����" onclick="doSubmit(document.forms[0]);" style="cursor: hand" />
						</td>
					</tr>
				</table>
				<!--�ϴܹ�ư ���̺� ��-->
			</html:form>
			<table width="750" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="5"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>