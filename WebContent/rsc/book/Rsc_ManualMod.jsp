<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>���� ���� - ��� �� ����</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
<!--
	function doDelete(frm)
	{
		var seq = frm.listSeq.value;
		if(seq != 0)
		{
			alert("����� �����־ ������ �� �����ϴ�.");
			return;
		}
	
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			txBookSeq = frm.txBookSeq.value;
			frm.action = '${pageContext.request.contextPath}/rscBook.act?task=list';
			
			var url = '${pageContext.request.contextPath}/rscBook.act?task=delete&txBookSeq='+ txBookSeq;
	
			document.location.href = url;
		}
		else
		{
			return;
		}
	}
	
	function doSubmit(frm)
	{
		if(frm.txBookName.value == "")
		{
			alert('������� �Է��ϼ���.');
			frm.txBookName.focus();
			return;
		}
		if(frm.txBookSeq.value == "")
		{
			if(frm.stockIn.value == "")
			{
				alert('�԰������ �Է��ϼ���.');
				frm.stockIn.focus();
				return;
			}
			if(frm.ioDate.value == "")
			{
				alert('�԰��ϸ� �Է��ϼ���.');
				frm.ioDate.focus();
				return;
			}
		}
		if(frm.bookPrice.value == "")
		{
			alert('���������� �Է��ϼ���.');
			frm.bookPrice.focus();
			return;
		}
		
		var num = frm.listSeq.value;
		if(num == 0)
		{
			if(frm.courseName.value != "")
			{
				alert('�Է��� ������ �߰��ϼ���.');
				return;
			}
		}
		else 
		{
			if(frm.courseName[num].value != "")
			{
				alert('�Է��� ������ �߰��ϼ���.');
				return;
			}
		}
		var stockIn = document.all.stockIn.value;
		document.all.stockIn.value = removeComma(stockIn);
		
		if(document.all.stockIn.value.length > 5)
		{
			document.all.stockIn.value = stockIn;
			alert('�԰������ 5�ڸ� �̻� �Է��� �� �����ϴ�.');
			frm.stockIn.focus();
			return;
		}
		var bookPrice = document.all.bookPrice.value;
		document.all.bookPrice.value = removeComma(bookPrice);
		
		if(document.all.bookPrice.value.length > 10)
		{
			document.all.bookPrice.value = bookPrice;
			alert('���������� 10�ڸ� �̻� �Է��� �� �����ϴ�.');
			frm.bookPrice.focus();
			return;
		}
		
		
		var do_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(do_confirm == true)
			frm.submit();
	}
  
	function setCrs(num)
	{
		var row = num;
		var searchCode;
		if(row == 0)
		{
			searchCode = document.all.courseName.value;
		}
		else
		{
		  searchCode = document.all.courseName[row].value;
		}
		
		// ��� ����
		var nameLength = searchCode.lastIndexOf("(");
		if(searchCode.lastIndexOf("(") != 0)
			searchCode = searchCode.substr(0, nameLength);
			
		window.open('<html:rewrite page="/cmnCourse.act?task=list&searchCode=' + searchCode + '&rowNumber=' + row + '"/>', 'popup', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	
	function addCrs(frm, year)
	{
		
		var dataList = $('subject_list');
 
		var seq = frm.listSeq.value;
		var seqRow = Number(seq);
		var nSeqRow = seqRow + 1;
		
		// ������ �� �Է½�
		if(seqRow == 0)
		{ 
			if(frm.courseName.value == "")
			{
				alert('�������� �Է��ϼ���.');
				return;
			}
		}
		else
		{
			if(frm.courseName[seq].value == "")
			{
				alert('�������� �Է��ϼ���.');
				return;
			}
		}	
 		
		var ref_row = dataList.insertRow(seqRow);
 
				ref_row.id = "subject" + seqRow;
				
				//�⵵
				ref_cell = ref_row.insertCell();
        ref_cell.className = "t2";
        ref_cell.id = "insYear";
        ref_cell.innerHTML = document.all.cellYear.innerHTML;
        ref_cell.width="99";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";
 
        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";
 
				//�����
        ref_cell = ref_row.insertCell();
        ref_cell.className="t2";
        ref_cell.id = "insCourseName";
        ref_cell.innerHTML = document.all.cellCourseName.innerHTML;
        ref_cell.width="302";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";
 
				//���� �˻�
        ref_cell = ref_row.insertCell();
        ref_cell.className="t2";
        ref_cell.id = "insSearchCrs";
        ref_cell.innerHTML = document.all.cellSearchCrs.innerHTML;
        ref_cell.width="25";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";
 
        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";
 
        //�����
        ref_cell = ref_row.insertCell();
        ref_cell.className="t2";
        ref_cell.id = "insCrsUser";
        ref_cell.innerHTML = document.all.cellCrsUser.innerHTML;
        ref_cell.width="119";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";
 
        //����
        ref_cell = ref_row.insertCell();
        ref_cell.className="sBg";
        ref_cell.width="1";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";
 
        //��ư
        var id = "subject" + seqRow;
        ref_cell = ref_row.insertCell();
        ref_cell.id = "sBtn" + String(seqRow);
        ref_cell.className="t2";
				var html1 = "<img src='<html:rewrite page='/images/board/btn_del2.gif'/>' alt='����' onclick='delCrs(document.forms[0], " + id + ");' style='cursor:hand' />";
        ref_cell.innerHTML = html1;
        ref_cell.width="100";
    		ref_cell.style.borderBottom = "1px solid #D6D6D6";

        var html = "<img src=<html:rewrite page='/images/board/btn_zoom.gif'/> alt='���� ����' onClick='setCrs(" + nSeqRow + ");' style='cursor:hand'>";
        document.all.cellSearchCrs.innerHTML = html;
 
        resetSubject(nSeqRow, year);
        
        frm.listSeq.value = nSeqRow;
	}
	
	// ���� �ʱ�ȭ
	function resetSubject(row, year)
	{
		var seq = Number(row);
		
		if(seq == 0)
		{
			document.all.courseCode.value = "";
			document.all.courseYear.value = year;
			document.all.courseName.value = "";
			document.all.crsUser.value = "";
		}
		else
		{
			document.all.courseCode[seq].value = "";
			document.all.courseYear[seq].value = year;
			document.all.courseName[seq].value = "";
			document.all.crsUser[seq].value = "";
		}
	}

	// ���� ����
	function delCrs(frm, obj)
	{
		frm.listSeq.value = frm.listSeq.value-1;
		var seq = frm.listSeq.value;
		
		var html = "<img src=<html:rewrite page='/images/board/btn_zoom.gif'/> alt='���� ����' onClick='setCrs(" + seq + ");' style='cursor:hand'>";
    document.all.cellSearchCrs.innerHTML = html;
        
		var dataList = $('subject_list');
		var node = $(obj);

		node.parentNode.removeChild(node);
	}
//-->
</script>
</head>

<body>
<html:form method="POST" action="/rscBook.act?task=insert" >
<html:hidden property="txBookSeq" value="${rsRscBook.txBookSeq}"/>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_02-2.gif"/>' alt="���� ����-�űԵ��"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="t1 cbg4" width="97" height="25"><span class="red">*</span>�����</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="274">&nbsp;<html:text property='txBookName' style="width:250px;" maxlength="25"></html:text></td>
											<td class="sBg" width="1"></td>
											<td class="t1 cbg4" width="97" height="25">����</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="275">&nbsp;<html:text property='writer' style="width:250px;" maxlength="15"></html:text></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr>
											<td class="t1 cbg4" width="97" height="25">���ǻ�</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="274">&nbsp;<html:text property='publisher' style="width:250px;" maxlength="15"></html:text></td>
											<td class="sBg" width="1"></td>
											<td class="t1 cbg4" width="97" height="25">���ǳ⵵</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="275">&nbsp;<html:text property='pubYear' style="width:100px; IME-MODE:disabled" maxlength="4" onkeydown="key_num()"></html:text></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<c:if test="${rsRscBook.txBookSeq == null}">
										<tr>
											<td class="t1 cbg4" width="97" height="25">�԰����</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="274">&nbsp;<html:text property='stockIn' style="width:100px; direction:rtl; IME-MODE:disabled" maxlength="6" onkeydown="key_num()" onkeyup="this.value=setComma(this.value)"></html:text></td>
											<td class="sBg" width="1"></td>
											<td class="t1 cbg4" width="97" height="25"><span class="red">*</span>�԰���</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="275"> 
												&nbsp;<html:text property="ioDate" style="width:100px" maxlength="10" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, ioDate, 'yyyy-mm-dd');">
											</td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										</c:if>
										<c:if test="${rsRscBook.txBookSeq != null}">
											<html:hidden property="stockIn"/>
											<html:hidden property="ioDate"/>
										</c:if>
										<tr>
											<td class="t1 cbg4" width="97" height="25">��������</td>
											<td class="sBg" width="1"></td>
											<td class="t3" width="648" colspan="5">&nbsp;<html:text property='bookPrice' style="width:100px; direction:rtl; IME-MODE:disabled" maxlength="13" onkeydown="key_num()" onkeyup="this.value=setComma(this.value)"></html:text></td>
										</tr>
										<tr>
											<td colspan="7" class="lbg3"></td>
										</tr>
										<tr>
											<td class="t1 cbg4">��������</td>
											<td class="sBg" width="1"></td>
											<td width="648" colspan="5" valign="top">
												<table width="648" cellspacing="0" cellpadding="0">
												<tr>
													<td class="t1 cbg4" width="99">�⵵</td>
													<td class="sBg" width="1"></td>
													<td class="t1 cbg4" width="327">������</td>
													<td class="sBg" width="1"></td>
													<td class="t1 cbg4" width="119">�����</td>
													<td class="sBg" width="1"></td>
													<td class="t1 cbg4" width="100">ó��</td>
												</tr>
												<tr>
													<td colspan="8" class="lbg3"></td>
												</tr>
												</table>
												<table width="648" cellspacing="0" cellpadding="0">
													<c:set var="no" scope="request" value="0"/>
													<tbody id="subject_list">
														<c:forEach var="list" items="${rsRscBookGetCrsList}" varStatus="i" >
															<tr id="subject${no}">
																<td class="t2" width="99" style="border-bottom:1px solid #D6D6D6">
																	<html:hidden property="courseCode" value="${list.courseCode}"/>
																	<html:text property="courseYear" value="${list.courseYear}" style="width:80px" readonly="true" />
																</td>
																<td class="sBg" width="1" style="border-bottom:1px solid #D6D6D6"></td>
																<td class="t2" width="302" style="border-bottom:1px solid #D6D6D6"><html:text property='courseName' value="${list.courseName}" style="width:285px" onkeydown="if(event.keyCode==13)setCrs(${no});"></html:text></td>
																<td class="t2" width="25" style="border-bottom:1px solid #D6D6D6"><img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' alt="���� ����" onClick="setCrs(${no});" style="cursor:hand" align="absbottom"></td>
																<td class="sBg" width="1" style="border-bottom:1px solid #D6D6D6"></td>
																<td class="t2" width="119" style="border-bottom:1px solid #D6D6D6">
																	<html:select property="crsUser" value="${juminNo}" style="width:100px">
																		<html:optionsCollection name="crsUserCode" property="beanCollection" />
																	</html:select>
																</td>
																<td class="sBg" width="1" style="border-bottom:1px solid #D6D6D6"></td>
																<td class="t2" width="100" id="sBtn${no}" style="border-bottom:1px solid #D6D6D6"><img src='<html:rewrite page="/images/board/btn_del2.gif"/>' alt="����" onClick="delCrs(document.forms[0], 'subject${no}');" style="cursor:hand"></td>
															</tr>
														<c:set var="no" scope="request" value="${no + 1}"/>
														</c:forEach>
													</tbody>
												</table>
												<table width="648" cellspacing="0" cellpadding="0">
												<tr>
													<td class="t2" width="99" id="cellYear">
														<html:hidden property="courseCode" value="${list.courseCode}"/>
														<html:text property="courseYear" style="width:80px" readonly="true"/>
													</td>
													<td class="sBg" width="1"></td>
													<td class="t2" width="302" id="cellCourseName"><html:text property="courseName"  style="width:285px" onkeydown="if(event.keyCode==13)setCrs(${no});"></html:text></td>
													<td class="t2" width="25" id="cellSearchCrs"><img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' alt="���� ����" onClick="setCrs(${no});" style="cursor:hand"></td>
													<td class="sBg" width="1"></td>
													<td class="t2" width="119" id="cellCrsUser">
														<html:select property="crsUser" style="width:100px">
															<html:optionsCollection name="crsUserCode" property="beanCollection" />
														</html:select>
													</td>
													<td class="sBg" width="1"></td>
													<td class="t2" width="100"><img src='<html:rewrite page="/images/board/btn_add2.gif"/>' alt="�߰�" onClick="addCrs(document.forms[0], ${thisYear});" style="cursor:hand"></td>
												</tr>
												</table>
												<html:hidden property="listSeq" value="${no}"/>
											</td>
										</tr>
									</table>
                  <!--������̺� ��--> 
								</td>
							</tr>
							</table>
              <!--�ϴܹ�ư ���̺� ����-->
              <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                <tr valign="bottom"> 
                	<td>
                		<c:if test="${task == 'modify'}">                		
                    	<img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle" alt="����" onclick="doDelete(document.forms[0]);" style="cursor:hand"/>
                    </c:if>
                	</td>
                  <td align="right">
                  	<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick="document.location.href=document.referrer;" style="cursor:hand"/> 
                    <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="����" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/></td>
                </tr>
              </table>
              <!--�ϴܹ�ư ���̺� ��-->
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html:form>
<script type="text/javascript">
<!--
	var num1 = document.all.stockIn.value;
	document.all.stockIn.value = setComma(num1);
	
	var num2 = document.all.bookPrice.value;
	document.all.bookPrice.value = setComma(num2);
	
	resetSubject(${no},${thisYear});
//-->
</script>