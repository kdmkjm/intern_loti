<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
	function doSubmit(frm)
	{
		if(frm.reqName.value == "")
		{
			alert('�뿩�ڸ� �Է��ϼ���.');
			frm.reqName.focus();
			return;
		}
		if(frm.lendFrom.value == "")
		{
			alert('�뿩���� ��¥�� �Է��ϼ���.');
			frm.lendFrom.focus();
			return;
		}
		if(frm.lendTo.value == "")
		{
			alert('�뿩���� ��¥�� �Է��ϼ���.');
			frm.lendTo.focus();
			return;
		}
		if(replace(frm.lendFrom.value, "-", "") > replace(frm.lendTo.value, "-", ""))
		{
			alert('�뿩���� ��¥�� �뿩���� ��¥���� ������ �� �����ϴ�.');
			return;
		}
		if(frm.reqPhone.value == "")
		{
			alert('����ó�� �Է��ϼ���.');
			frm.reqPhone.focus();
			return;
		}
		if(frm.lendWhy.value == "")
		{
			alert('�뿩������  �Է��ϼ���.');
			frm.lendWhy.focus();
			return;
		}
		var do_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(do_confirm == true)
			frm.submit();
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
</tr>
<tr>
	<td>
		<html:form method="POST" action="/extMylcRoom.act?task=insert" >
		<html:hidden property="lendSeq"/>
		<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="200"><img src='<html:rewrite page="/images/resources/title_09-3.gif"/>' alt="������ �뿩��û"/></td>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="550" valign="bottom">
				<table width="308" border="0" cellspacing="0" cellpadding="0" align="right">
				<tr> 
					<td width="103">
						<img name="Image10" border="0" src='<html:rewrite page="/images/resources/tab_01.gif"/>' alt="������ �뿩�ȳ�" 
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=lentInfo"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image10','','<html:rewrite page="/images/resources/tab_01_over.gif"/>',1)" style="cursor:hand"/>
					</td>
					<td width="103">
						<img name="Image11" border="0" src='<html:rewrite page="/images/resources/tab_02.gif"/>' alt="�뿩��Ȳ"
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=month"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image11','','<html:rewrite page="/images/resources/tab_02_over.gif"/>',1)" style="cursor:hand"/>
					</td>
					<td width="102">
						<img name="Image12" border="0" src='<html:rewrite page="/images/resources/tab_03_over.gif"/>' alt="�뿩��û" 
							onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=list"/>'"  
							onMouseOut="MM_swapImgRestore()" 
							onMouseOver="MM_swapImage('Image12','','<html:rewrite page="/images/resources/tab_03_over.gif"/>',1)" style="cursor:hand"/>
					</td>
				</tr>
	            </table>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="15"></td>
		</tr>
		<tr> 
			<td class="stitle" colspan="2"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" />������뿩��û - ���� �� ���</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
				<tr>
					<td>
						<!--���̺� ��� ����-->
						<table width="746" border="0" cellspacing="0" cellpadding="0">
						<tr> 
							<td class="t1 cbg4" width="109" height="25"><span class="red">*</span>���ǽ�</td>
							<td class="sBg"></td>
							<td class="t3" width="230">&nbsp;<html:select property="roomNo" style="width:105px"><html:optionsCollection name="roomNoCode" property="beanCollection" /></html:select></td>
							<td class="sBg"></td>
							<td class="t1 cbg4" width="109"><span class="red">*</span>�뿩��</td>
							<td class="sBg"></td>
							<td class="t3" width="295">
								&nbsp;<c:out value="${userName}(${organName})"/>
								<html:hidden property="reqName" value="${userName}"/>
								<html:hidden property="reqOrgan" value="${organName}"/>
							</td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" height="25"><span class="red">*</span>�뿩����</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="lendFrom" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, lendFrom, 'yyyy-mm-dd');"></td>
							<td class="sBg"></td>
							<td class="t1 cbg4"><span class="red">*</span>�뿩����</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="lendTo" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, lendTo, 'yyyy-mm-dd');"></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" height="25"><span class="red">*</span>����ó</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="reqPhone" style="width:100px; IME-MODE:disabled" maxlength="13" onkeydown="key_num_minus()"></html:text></td>
							<td class="sBg"></td>
							<td class="t1 cbg4"><span class="red">*</span>����ο�</td>
							<td class="sBg"></td>
							<td class="t3">&nbsp;<html:text property="lendPeople" style="width:100px; direction:rtl; IME-MODE:disabled" maxlength="3" onkeydown="key_num()"/></td>
						</tr>
						<tr>
							<td colspan="7" class="lbg3"></td>
						</tr>
						<tr> 
							<td class="t1 cbg4" height="25"><span class="red">*</span>�뿩����</td>
							<td class="sBg"></td>
							<td class="t3" colspan="5">&nbsp;<html:textarea property="lendWhy" style="width:98%;" rows="5" /></td>
						</tr>
						</table>
						<!--���̺� ��� ��-->
					</td>
				</tr>
				</table>
				<!--	�Խù� �Ʒ� ��ư ����	-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="bottom"> 
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick="document.location.href=document.referrer;" style="cursor:hand"/>
						  <img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="����" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
						</td>
					</tr>
				</table>
				<!--�Խù� �Ʒ� ��ư ��-->
			</td>
		</tr>
		</table>
		</html:form>
	</td>
</tr>
</table>