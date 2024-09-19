<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>
<script language="JavaScript">
function areaInsert(frm){

	var areaname	 = frm.areaname.value.trim();
	var areacharge	 = frm.areacharge.value.trim();
	var areadistance = frm.areadistance.value.trim();	
	var areause 	 = document.getElementsByName('areause');
	
	for(var i=0; i<areause.length; i++){
		if(areause[i].checked == true){
			areause = areause[i].value;
		}
	}
	
	if(areaname == "" || areaname == null){
		alert("�������� �Է����ּ���.");
		frm.areaname.focus();
		return;
	}
	
	if(areacharge == "" || areacharge == null){
		alert("�ݾ��� �Է����ּ���.");
		frm.areaname.focus();
		return;
	}
	
	if(areause != "Y" && areause != "N"){
		alert("��뿩�θ� �������ּ���.");
		return;
	}
	
	frm.submit();
}

function goList(){
	document.forms[0].action = 'prfPayStandard.act?task=areaList';
	document.forms[0].submit();
}

function areaDelete(num)
{
	var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
	if(del_confirm == true)
	{
		document.all.areano.value = num;

		document.forms[0].action = 'prfPayStandard.act?task=areaDelete';
		document.forms[0].submit();
	}
	else
	{
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
					<img alt="�������� - ��� �� ����" src="/images/teacher/title_03-4.gif" />
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
			<html:form method="POST" action="/prfPayStandard.act?task=areaInsert">
				<html:hidden property="task" value="${task}" />
				<html:hidden property="areano" />
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<table width="746" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="99" class="t1 cbg4">�⺻����</td>
									<td width="1" class="sBar"></td>
									<td class="t5" width="646">
										<!--�⺻���� ���̺� ����-->
										<table width="646" height="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
										        <td class="t1 cbg4" width="107" height="25">������</td>
														<td class="sBg" width="1"></td>
										      	<td class="t3">&nbsp;<html:text property='areaname' /></td>
										    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
										    <tr>
										        <td class="t1 cbg4" width="107" height="25">�ݾ�(��)</td>
														<td class="sBg" width="1"></td>
										      	<td class="t3">&nbsp;<html:text property='areacharge'/></td>
										    </tr>
										    <tr><td colspan="7" class="lbg3"></td></tr>
										    <tr>
										        <td class="t1 cbg4" width="107" height="25">�Ÿ�(km)</td>
														<td class="sBg" width="1"></td>
										      	<td class="t3">&nbsp;<html:text property='areadistance'/></td>
										    </tr>
										    <tr><td colspan="7" class="lbg3"></td></tr>
										    <tr>
										    	<td class="t1 cbg4" width="107" height="25">��뿩��</td>
										    	<td class="sBg" width="1"></td>
										    	<td class="t3">&nbsp;
											    	<html:radio property="areause" value="Y" />
													���
													<html:radio property="areause" value="N" />
													�̻��
												</td>
											</tr>
										</table>
										<!--�⺻���� ���̺� ��-->
									</td>
								</tr>
								<tr>
									<td colspan="3" class="lbg3"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				
				<!--�ϴܹ�ư ���̺� ����-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="bottom">
						<td>
							<c:if test="${areaTask == 'areaModify'}">
								<img src='<html:rewrite page="/images/board/btn_del.gif"/>' align="absmiddle" alt="����" onclick="areaDelete(${rsPrf_Area.areano});"style="cursor: hand" />
							</c:if>
						</td>
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick="goList();" style="cursor: hand" />
							<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="����" onclick="areaInsert(document.forms[0]);" style="cursor: hand" />
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