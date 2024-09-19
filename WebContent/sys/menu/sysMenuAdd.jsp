<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>�ý��� ���� - �޴�����</title>

<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
	function doSubmit(frm)
	{
		var do_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(do_confirm == true)
			frm.submit();
	}
//-->
</script>
</head>
<body>
<html:form method="POST" action="/sysMenu.act?task=insert" >
<html:hidden property="oldMenuNo"/>
<html:hidden property='menuNo'/>
<html:hidden property='menuType' value="${menuType}" />
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/system/title_02.gif"/>' alt="�޴� ����"/></td>
				</tr>
				<tr><td height="15"></td></tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<table width="746" border="0" cellspacing="0" cellpadding="0">
											<tr>
													<td class="t1 cbg4" width="97" height="25">�޴�����</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}">���α׷�</c:if>
									      	<c:if test="${menuType == 'F'}">����</c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="97" height="25">�޴�ǥ�ø�</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='menuName' /></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">�θ�����</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='parent' /></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">������</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;
									      	<%-- <c:if test="${menuType == 'M'}"><html:text property='execPath' size="70"/></c:if>--%>
									      	<html:text property='execPath' size="70"/>
									      	</td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">��������</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}"><html:text property='progId' /></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">Parameter</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}"><html:text property='parms' /></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">���α׷���</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'M'}"><html:text property='progName' /></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">ICON���</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='iconPath' size="70"/></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">ICON��� Over</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='iconPathOn' size="70"/></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">SUB ICON���</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<c:if test="${menuType == 'F'}"><html:text property='iconPathSub' size="70"/></c:if></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
											<tr>
									        <td class="t1 cbg4" width="107" height="25">ȭ��ǥ�ü���</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:text property='dispOrder' /></td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">���౸��</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:radio property="execType" value="T">����â</html:radio>
									      		<html:radio property="execType" value="N">��â</html:radio>
											</td>
									    </tr>
											<tr><td colspan="7" class="lbg3"></td></tr>
									    <tr>
									        <td class="t1 cbg4" width="107" height="25">��뱸��</td>
													<td class="sBg" width="1"></td>
									      	<td class="t3">&nbsp;<html:radio property="use" value="Y">���</html:radio>
										      	<html:radio property="use" value="N">�̻��</html:radio>
										      	<html:radio property="use" value="T">�׽�Ʈ</html:radio>
						
											</td>
									    </tr>
									</table>
								</td>
							</tr>
							</table>
							<!--�ϴܹ�ư ���̺� ����-->
							<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
								<tr valign="bottom"> 
									<td align="right">
										<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick="document.location.href=document.referrer;" style="cursor:hand"/>
					  				<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="����" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
									</td>
								</tr>
							</table>
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>
</html:form>
</body>
</html>