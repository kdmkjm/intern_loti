<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>������ �������</title>
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
<!--
	function doSubmit(frm)
	{
		if(frm.canReason.value == "")
		{
			alert("������� ������ �Է��ϼ���.");
			frm.canReason.focus();
			return;
		}
		var del_confirm = confirm('�ش� �������� ������Ҹ� �Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			frm.submit();
		}
	}
-->
</script>
</head>
<body>
<table width="600" border="0" cellspacing="5" cellpadding="0" height="360" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="590" border="0" cellspacing="1" cellpadding="0" height="350" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
		      	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          		<tr>
          			<td>
			            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			              <tr> 
			                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/operation/title_21.gif"/>' alt="������ �������"/></td>
			              </tr>
			              <tr> 
			                <td height="10"></td>
			              </tr>
			              <tr valign="top" align="center"> 
			                <td>
												<html:form method="POST" action="oprStudent.act?task=delStudent">
												<html:hidden property="searchCourseCode" value="${rsOpr_StuCancle.courseCode}"/>
												<html:hidden property="seq" value="${rsOpr_StuCancle.seq}"/>
												<table width="560" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
													<tr>
														<td width="89" class="s1">������</td>
														<td class="sBar"></td>
													  <td width="189" class="s2">${rsOpr_StuCancle.courseName}</td>
													  <td class="sBar"></td>
														<td width="89" class="s1">�����Ⱓ</td>
														<td class="sBar"></td>
													  <td width="190" class="s2">${rsOpr_StuCancle.eduDate}</td>
													</tr>
													<tr> 
                            <td colspan="7" class="lbg3"></td>
                          </tr>
													<tr>
														<td width="89" class="s1">����</td>
														<td class="sBar"></td>
													  <td width="189" class="s2">${rsOpr_StuCancle.stdname}</td>
														<td class="sBar"></td>
														<td width="89" class="s1">��üŰ</td>
														<td class="sBar"></td>
													  <td width="190" class="s2">${rsOpr_StuCancle.juminNumber}</td>
													</tr>
													<tr> 
                            <td colspan="7" class="lbg3"></td>
                          </tr>
													<tr>
														<td width="89" class="s1">�����</td>
														<td class="sBar"></td>
													  <td width="189" class="s2">${rsOpr_StuCancle.organname}</td>
														<td class="sBar"></td>
														<td width="89" class="s1">�Ҽ�</td>
														<td class="sBar"></td>
													  <td width="190" class="s2">${rsOpr_StuCancle.assignname}</td>
													</tr>
													<tr> 
                            <td colspan="7" class="lbg3"></td>
                          </tr>
													<tr>
														<td width="89" class="s1">�̸���</td>
														<td class="sBar"></td>
													  <td width="189" class="s2">${rsOpr_StuCancle.email}</td>
														<td class="sBar"></td>
														<td width="89" class="s1">�޴���</td>
														<td class="sBar"></td>
													  <td width="190" class="s2">${rsOpr_StuCancle.cellphone}</td>
													</tr>
													<tr> 
                            <td colspan="7" class="lbg3"></td>
                          </tr>
													<tr>
														<td width="89" class="s1">��һ���</td>
														<td class="sBar"></td>
													  <td height="80" class="s2" colspan="5"><html:textarea property="canReason" style="width:97%; height:65px"/></td>
													</tr>
												</table>
												</html:form>  
			                </td>
										</tr>
									</table>
									<!--�ϴ� ��ư ����-->
								  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
									  <tr valign="bottom">
									    <td align="right">
									    	<img src='<html:rewrite page="/images/board/btn_cancle4.gif"/>' align="absmiddle" alt="�������" onclick="doSubmit(document.forms[0]);" style="cursor:hand"/>
									    </td>
									    <td align="right" width="13"></td>
									  </tr>
									  <tr><td colspan="2" height="2"></td></tr>
									</table>
									<!--�ϴ� ��ư ��-->
								</td>
							</tr>
						</table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
