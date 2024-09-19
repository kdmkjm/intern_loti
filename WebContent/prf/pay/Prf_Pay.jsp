<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(198);
	}
	
	function checkAll()
	{
		var max = Number(document.all.max.value);
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.checkbox.checked == false)
				document.all.checkbox.checked = true;
			else
				document.all.checkbox.checked = false;
		}
		else
		{
			if(document.all.checkbox[0].checked == false)
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = true;
			else
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = false;
		}
	}
	
	function doDelete(frm)
	{
		var do_confirm = confirm('���� �Ͻðڽ��ϱ�?');
		if(do_confirm != true)
		{
			return;
		}
		frm.action = 'prfPay.act?task=delete';
		
		frm.submit();
	}
	
// 	function doSearch(frm)
// 	{
// 		document.all.searchCourseCode.value = document.getElementById('searchCourseName').value + '%' + document.getElementById('searchKeyword').value + '%';
// 		if(document.all.searchCourseCode.value == "%%")
// 		{
// 			alert("������ �����ϼ���");
// 			return;
// 		}
			
// 		frm.submit();
// 	}
	
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type ���� �Ѱ��ش�. (onlyCrs)
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	function doSubmit(frm)
	{
		document.all.courseCode.value = document.all.searchCourseCode.value;
		document.all.courseName.value = document.all.searchCourseName.value;
		var max = document.forms[1].max.value;
		var flag = false;
	
		var do_confirm = confirm('���� �Ͻðڽ��ϱ�?');
		if(do_confirm != true)
		{
			return;
		}
		
		if(max == 1)
		{
			if(document.forms[1].checkbox.checked == true)
			{
				document.forms[1].arraySelect.value = "Y";
				flag = true;
			}
			else
				document.forms[1].arraySelect.value = "N";
		}
		else
		{
			for(var i=0; i<max; i++)
			{
				if(document.forms[1].checkbox[i].checked == true)
				{
					document.forms[1].arraySelect[i].value = "Y";
					flag = true;
				}
				else
					document.forms[1].arraySelect[i].value = "N";
			}
		}
		if(flag == true)
		{
			frm.submit();
		}
		else
		{
			alert("���õ� �����Ͱ� �����ϴ�.");
		}
	}
	function resetSearchCourse()
	{
		document.all.searchCourseCode.value = "";
		document.all.searchCourseName.value = "";
	}
	
	function inTravel(num)
	{
		var max = Number(document.forms[1].max.value);
		if(max == 1)
		{
			var travel 					= Number(removeComma(document.forms[1].travel.value));
			var arrayLectPay 		= Number(document.forms[1].arrayLectPay.value);
			var arrayInCometax 	= Number(document.forms[1].arrayInCometax.value);
			var arrayInHabtax 	= Number(document.forms[1].arrayInHabtax.value);
			var arrayMsctFee 		= Number(document.forms[1].arrayMsctFee.value);
			var total = 0;
			
			document.forms[1].arrayTravel.value = travel;
			document.forms[1].travel.value = setComma(travel);
			total = arrayLectPay - arrayInCometax - arrayInHabtax + travel + arrayMsctFee;
			
			document.forms[1].arrayNetPay.value = total;
			document.all.cellTotal.innerHTML = setComma(total) + "&nbsp;";
		}
		else
		{
			var travel 					= Number(removeComma(document.forms[1].travel[num].value));
			var arrayLectPay 		= Number(document.forms[1].arrayLectPay[num].value);
			var arrayInCometax 	= Number(document.forms[1].arrayInCometax[num].value);
			var arrayInHabtax 	= Number(document.forms[1].arrayInHabtax[num].value);
			var arrayMsctFee 		= Number(document.forms[1].arrayMsctFee[num].value);
			var total = 0;
			
			document.forms[1].arrayTravel[num].value = travel;
			document.forms[1].travel[num].value = setComma(travel);
			total = arrayLectPay - arrayInCometax - arrayInHabtax + travel + arrayMsctFee;
			
			document.forms[1].arrayNetPay[num].value = total;
			document.all.cellTotal[num].innerHTML = setComma(total) + "&nbsp;";
		}
	}
	
	function inMsctFee(num)
	{
		var max = Number(document.all.max.value);
		if(max == 1)
		{
			var msctFee					= Number(removeComma(document.forms[1].msctFee.value));
			var arrayLectPay 		= Number(document.forms[1].arrayLectPay.value);
			var arrayInCometax 	= Number(document.forms[1].arrayInCometax.value);
			var arrayInHabtax 	= Number(document.forms[1].arrayInHabtax.value);
			var arrayTravel 		= Number(document.forms[1].arrayTravel.value);
			var total = 0;
			
			document.forms[1].arrayMsctFee.value = msctFee;
			document.forms[1].msctFee.value = setComma(msctFee);
			total = arrayLectPay - arrayInCometax - arrayInHabtax + msctFee + arrayTravel;
			
			document.forms[1].arrayNetPay.value = total;
			document.all.cellTotal.innerHTML = setComma(total) + "&nbsp;";
		}
		else
		{
			var msctFee					= Number(removeComma(document.forms[1].msctFee[num].value));
			var arrayLectPay 		= Number(document.forms[1].arrayLectPay[num].value);
			var arrayInCometax 	= Number(document.forms[1].arrayInCometax[num].value);
			var arrayInHabtax 	= Number(document.forms[1].arrayInHabtax[num].value);
			var arrayTravel 		= Number(document.forms[1].arrayTravel[num].value);
			var total = 0;
			
			document.forms[1].arrayMsctFee[num].value = msctFee;
			document.forms[1].msctFee[num].value = setComma(msctFee);
			total = arrayLectPay - arrayInCometax - arrayInHabtax + msctFee + arrayTravel;
			
			document.forms[1].arrayNetPay[num].value = total;
			document.all.cellTotal[num].innerHTML = setComma(total) + "&nbsp;";
		}
	}
	
	function openDetailTravel(daypay,foodpay,staypay,trafficpay) {
		var divTop = event.x - 390; //��� ��ǥ
    	var divLeft = event.y + 390; //���� ��ǥ
    	
    	document.getElementById("divDetailTravel").style.top= divTop;
    	document.getElementById("divDetailTravel").style.left= divLeft;
    	document.getElementById("divDetailTravel").style.position= "absolute";
    	document.getElementById("divDetailTravel").style.display= "block";
    	
    	var text = "";
    	text += "�Ϻ� : " + numberFormat(daypay) + "<br /><br />";
    	text += "�ĺ� : " + numberFormat(foodpay) + "<br /><br />";
    	text += "����� : " + numberFormat(trafficpay) + "<br /><br />";
    	text += "���ں� : " + numberFormat(staypay) + "<br /><br />";
    	document.getElementById("divDetailTravelText").innerHTML = text;
	}
	
	function numberFormat(num) {
		var pattern = /(-?[0-9]+)([0-9]{3})/;
		while(pattern.test(num)) {
		num = num.replace(pattern,"$1,$2");
		}
		return num;
	}
</script>

<style type="text/css">

#divDetailTravel {
 position:absolute;
 display:none;
 background-color:#ffffff;
 border:solid 2px #d0d0d0;
 width:100px;
 height:120px;
 padding:25px;
}
</style>

<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="���� ����" src="/images/teacher/title_02.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--�˻� -->
			<html:form method="post" action="/prfPay.act?task=list">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
					<tr valign="middle">
						<td width="80" class="s1">����</td>
						<td class="sBar"></td>
						<td class="s2" width="420">
							<select id="searchYear"></select>
							<select id="searchCourseName" style="width: 240px;">
								<option value="">���� ����</option>
							</select>
							<select id="searchKeyword" style="width: 100px;">
								<option value="">������� ����</option>
							</select>
							<html:hidden property="searchColumn" />
							<html:hidden property="searchCourseCode" />
						</td>
						<td width="60" align="center">
							<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0]);" style="cursor: hand" align="absbottom" />
						</td>
					</tr>
				</table>
			</html:form>
			<!--�˻� ��-->
			<table>
				<tr>
					<td height="15"></td>
				</tr>
			</table>
			<html:form method="POST" action="/prfPay.act?task=insert">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--���̺� ��� ����-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<td class="t1" rowspan="3" width="39">
										<a href="#" onclick="checkAll();">
											<u>����</u>
										</a>
									</td>
									<td class="sBg"></td>
									<td class="t1" rowspan="3" width="79">�Ⱝ��</td>
									<td class="sBg"></td>
									<td class="t1" rowspan="3" width="84">���籸��</td>
									<td class="sBg"></td>
									<td class="t1" rowspan="3">����</td>
									<td class="sBg"></td>
									<td class="t1" colspan="11">���޴��</td>
									<td class="sBg"></td>
									<td class="t1" rowspan="3" width="50">���</td>
									<td rowspan="3" width="17"></td>
								</tr>
								<tr>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<td class="lbg3" colspan="12"></td>
								</tr>
								<tr>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<td class="sBg"></td>
									<td class="t1" width="64">�����</td>
									<td class="sBg"></td>
									<td class="t1" width="64">�ҵ漼</td>
									<td class="sBg"></td>
									<td class="t1" width="64">�ֹμ�</td>
									<td class="sBg"></td>
									<td class="t1" width="64">����</td>
									<td class="sBg"></td>
									<td class="t1" width="64">�����</td>
									<td class="sBg"></td>
									<td class="t1" width="64">�հ�</td>
									<td class="sBg"></td>
								</tr>
							</table>
							<!--���̺� ��� ��-->
							<!--����Ʈ ����-->
							<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
									<c:set var="no" scope="request" value="0" />
									<c:forEach var="list" items="${rsPrf_PayList}" varStatus="i">
										<!-- �� ��� -->
										<c:if test="${no%2 == 0}">
											<c:set var="lineBg" scope="request" value="tbg3" />
										</c:if>
										<c:if test="${no%2 == 1}">
											<c:set var="lineBg" scope="request" value="" />
										</c:if>
										<html:hidden property="arraySelect" value="N" />
										<html:hidden property="arrayCourseCode" value="${list.courseCode}" />
										<html:hidden property="arrayLectDate" value="${list.lectDate}" />
										<html:hidden property="arrayProfNo" value="${list.profNo}" />
										<html:hidden property="arrayYear" value="${list.year}" />
										<html:hidden property="arrayInCometax" value="${list.inCometax}" />
										<html:hidden property="arrayInHabtax" value="${list.inHabtax}" />
										<html:hidden property="arrayLectPay" value="${list.lectPay}" />
										<html:hidden property="arrayTravel" value="${list.travel}" />
										<html:hidden property="arrayMsctFee" value="${list.msctFee}" />
										<html:hidden property="arrayNetPay" value="${list.netPay}" />
										<html:hidden property="travel" value="${list.travel}" />
										<html:hidden property="inCHTax" value="0" />
										<tr class="${lineBg}">
											<td class="t2" width="39">
												<input type="checkbox" name="checkbox" value="${list.courseCode}${list.lectDate}${list.profNo}" />
											</td>
											<td class="sBg"></td>
											<td class="t2" width="79">
												<c:out value="${list.lectDate}" />
											</td>
											<td class="sBg"></td>
											<td class="t2" width="84">
												<c:out value="${list.profLevel}" />
											</td>
											<td class="sBg"></td>
											<td class="t2">
												<c:out value="${list.profName}" />
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<fmt:formatNumber value="${list.lectPay}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<fmt:formatNumber value="${list.inCometax}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<fmt:formatNumber value="${list.inHabtax}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<a href="#none" class="imgSelect" onclick="openDetailTravel('${list.daypay}','${list.foodpay}','${list.staypay}','${list.trafficpay}');">
													<fmt:formatNumber value="${list.travel}" pattern="#,##0" />
												</a>
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64">
												<html:text property="msctFee" value="${list.msctFee}" style="width:50px; IME-MODE:disabled; direction:rtl;" maxlength="9" onkeydown="key_num();" onkeyup="this.value=setComma(this.value); inMsctFee(${no});" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t4" width="64" id="cellTotal">
												<fmt:formatNumber value="${list.netPay}" pattern="#,##0" />
												&nbsp;
											</td>
											<td class="sBg"></td>
											<td class="t2" width="50">
												<c:if test="${list.calcDate != null}">
													�Ϸ�<html:hidden property="calcDate" value="Y" />
												</c:if>
												<c:if test="${list.calcDate == null}">
													<html:hidden property="calcDate" value="N" />
												</c:if>
											</td>
										</tr>
										<tr>
											<td colspan="21" class="lbg3"></td>
										</tr>
										<c:set var="no" scope="request" value="${no + 1}" />
										<html:hidden property="profName" value="${list.profName}" />
									</c:forEach>
									<html:hidden property="max" value="${no}" />
									<html:hidden property="courseCode" />
									<html:hidden property="courseName" />
									<c:if test="${no==0}">
										<tr class="tbg3">
											<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
										</tr>
										<tr>
											<td colspan="21" class="lbg3"></td>
										</tr>
									</c:if>
								</table>
							</div>
							<!--����Ʈ ��-->
						</td>
					</tr>
				</table>
				<c:if test="${no!=0}">
					<!--�ϴܹ�ư ���̺� ����-->
					<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						<tr valign="middle" class="stitle">
							<td width="180">
								<img src='<html:rewrite page="/images/board/dot.gif"/>' align="middle" />
								�����
								<html:text property="printDate" style="width:75px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()" />
								<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="middle" style="cursor: hand" onclick="Calendar_D(this, printDate, 'yyyy-mm-dd');">
							</td>
							<td width="220">
								<img src='<html:rewrite page="/images/board/dot.gif"/>' align="middle" />
								Ȯ����
								<html:text property="printUser" style="width:150px;" />
							</td>
							<td align="right">
								<c:if test="${costCalc == '0'}">
									<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="middle" alt="����" style="cursor: hand" onclick="doSubmit(document.forms[1]);" />
								</c:if>
								<c:if test="${costCalc != '0'}">
									<img src='<html:rewrite page="/images/board/btn_save_off.gif"/>' align="middle" alt="����" />
								</c:if>
								<img src='<html:rewrite page="/images/board/btn_print.gif"/>' alt="�μ�" align="middle" style="cursor: hand" onclick="ozReport();" />
							</td>
						</tr>
					</table>
				</c:if>
			</html:form>
		</td>
	</tr>
</table>
<form name="toFrm">
	<input type="hidden" name="report">
	<input type="hidden" name="check_array" size="50">
	<input type="hidden" name="profNo" size="50">
	<input type="hidden" name="printDate">
	<input type="hidden" name="printUser">
</form>
<script type="text/javascript">
<!--
	tresize(198);
	//document.forms[0].searchCourseCode.focus();
	
	var max = document.forms[1].max.value;
	if(max == 1)
	{
		var travel = document.forms[1].travel.value;
		var msctFee = document.forms[1].msctFee.value;
		document.forms[1].travel.value = setComma(travel);
		document.forms[1].msctFee.value = setComma(msctFee);
	}
	else
	{
		for(var i=0; i<max; i++)
		{
			var travel = document.forms[1].travel[i].value;
			var msctFee = document.forms[1].msctFee[i].value;
			document.forms[1].travel[i].value = setComma(travel);
			document.forms[1].msctFee[i].value = setComma(msctFee);
		}
	}
	
	function ozReport()
	{
	    var ch="";
		var max = Number(document.forms[1].max.value);
		var count = 0;
		var check ="";
		var ProfNo="";
		var profName="";
		document.forms[2].printDate.value =  document.forms[1].printDate.value;
		document.forms[2].printUser.value =  document.forms[1].printUser.value;
		
		
		//�˻������ ������� - �����Ʈâ�� ��������
		if(max == 0)
		{
			alert("��ȸ�� �����Ͱ� �����ϴ�.");
			return;
		}
		//�˻������ �ϳ��ϰ��
		if(max == 1)
		{
			if(document.forms[1].checkbox.checked == true)
			{
				if(document.all.calcDate.value == 'Y')
				{
					ch = ch + document.forms[1].checkbox.value + ",";
					check = true;
					
				}
				else
				{
					profName = document.forms[1].profName.value;
					alert("���������� ����� �ֽ��ϴ�.[�����̸�:" + profName + "]");
					return;
				}
			}
			count++;
		}
		//�˻������ �������� ���
		else
		{
			for(var i=0; i<max; i++)
			{
				if(document.all.checkbox[i].checked == true)
				{
					if(document.all.calcDate[i].value == 'Y')
					{
						ch = ch+ document.all.checkbox[i].value+ ",";
						check = true;
						
					}
					else
					{
						profName = document.forms[1].profName[i].value;
						alert("���������� ����� �ֽ��ϴ�.[�����̸�:" + profName + "]");
						return;
					}
				}
				else
				{
					check = false;
				}
				count++;
			}
		}
		 document.all.check_array.value = ch.substring(0, ch.length - 1);
		//üũ�ڽ� ������ ���� �ʾ�����
		if(ch == 0)
		{
			alert("�� �� �̻� �����Ͽ� �ּ���.");
			return;
		}
		
		document.forms[2].report.value = "prf";
		
		var str
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "toolbar=no,location=no,directories=no,'scrollbars = no,resizable=yes, menubar = no,status = yes, width = 710 height =550',top="+wint+",left="+winl;
		window.open('','pay', str);
		document.forms[2].action = "ozMenu.act"
		document.forms[2].target = "pay";
		document.forms[2].submit();
		document.forms[2].target = "";
	}
//-->
</script>


<div id="divDetailTravel">
<div style="position:absolute;top:5px;right:5px">
<span onClick="javascript:document.getElementById('divDetailTravel').style.display='none'" style="cursor:pointer;font-size:1.5em" title="�ݱ�">X</span>
</div>
<div id="divDetailTravelText">
</div>
</div>