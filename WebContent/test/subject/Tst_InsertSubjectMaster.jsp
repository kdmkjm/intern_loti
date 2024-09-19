<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script type="text/javascript" src='<html:rewrite page="/common/js/jquery-1.7.1.min.js"/>'></script>
<script language="JavaScript">
	<!--

  $.noConflict();
  function checkComplete()
  {
  		var frm = document.forms[0];
  		if(frm.subjectcode.value == '')
  		{
  			alert('�����ڵ带 �Է����ּ���');
			frm.subjectcode.focus();
			return;
  		}
  		if(frm.checkdup.value == 'none')
		{
			alert('�ߺ�üũ�� �������ּ���');
			frm.btncheckdup.focus();
			return;
		}
		else if(frm.checkdup.value == 'dup')
		{
			alert('�̹� �����ϴ� �����ڵ��Դϴ�');
			frm.sbidf.focus();
			return;
		}
		if(frm.subjectname.value == '')
		{
			alert('������� �Է����ּ���');
			frm.subjectname.focus();
			return;
		}

		frm.subjectcode.value = 'SUB' + frm.subjectcode.value;
		frm.submit();
  }

  function toList()
  {
  	document.location.href = '/tstSubject.act?task=masterlist';
  }
  
  function CheckDup()
  {
  	var frm = document.forms[0];

  	if(document.tstSubjectForm.subjectcode.value == '')
  	{
  		alert('�����ڵ带 �Է����ּ���.');
  		return;
  	}
  	jQuery.ajax({
		url: "tstSubject.act",
		type: "GET",
		data: "task=checkdup&code=SUB"+jQuery('input[name=subjectcode]').val(),
		cache: false,
		dataType: "xml",
		success: function(msg){
			var checkdup = jQuery('checkdup', msg).text();
			if(checkdup=='Y'){
				alert("��밡����  �����ڵ��Դϴ�.");
				jQuery('#checkdup').val('pass');
			}
			else{
				alert("������ �����ڵ尡 �����մϴ�.");
				jQuery('#checkdup').val('dup');
				jQuery('input[name=subjectname]').focus();
			}
		}
	});
  	
  }
  
//-->
</script>
<html:form action="/tstSubject.act?task=insertsubjectmaster" method="post"> 
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��������" src="/images/poll/title_01.gif" /></h1>
	</div>
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
    <!--�򰡰��� �⺻���� ����-->
      <table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr> 
	      <td class="lbg"></td>
	      <td class="cbg"> 
	          <table width="746" border="0" cellspacing="0" cellpadding="0">
	          <tr> 
	            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;������ �⺻����</td>
	          </tr>
	          </table>
	      </td>
	      <td class="lbg"></td>
      </tr>
      <tr>
      	  <td class="lbg"></td>
	      <td>
	      	<table width="746" border="0" cellspacing="0" cellpadding="0">
	      	  
	          <tr>
	          	<td class="s1" width="20%">�������ڵ�<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td colspan="5">&nbsp;
	          		<input type="text" value="SUB" size="5" disabled/>
	          		<html:text name="tstSubjectForm" property="subjectcode"/>
	          		<input type="button" name="btncheckdup" value="�ߺ�üũ" onclick="CheckDup()">
	          		<input type="hidden" id="checkdup" value="none"/>
	          	</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
		        <td class="s1" width="20%">�������<font color=red>*</font></td>
		        <td class="sBg"></td>
		        <td colspan="5">&nbsp;
		        	<html:text name="tstSubjectForm" property="subjectname" style="width:80%"/>
		        </td>
		      </tr>
		      <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
		      <tr>
	          	<td class="s1" width="20%">������з�<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td colspan="5">&nbsp;
	          		<html:select name="tstSubjectForm" property="subjecttype">
	          			<html:option value="">����</html:option>
	          			<html:option value="">---------</html:option>
	          			<html:option value="4501">�Ҿ����</html:option>
	          			<html:option value="4502">��������</html:option>
	          			<html:option value="4503">��������</html:option>
	          			<html:option value="4509">�ش����</html:option>
	          		</html:select>
          		</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
	          	<td class="s1" width="20%">��������<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td width="30%">&nbsp;
	          		<html:select name="tstSubjectForm" property="edugbn">
	          			<html:option value="">����</html:option>
	          			<html:option value="">----------</html:option>
	          			<html:option value="Y">�¶��α���</html:option>
	          			<html:option value="N">�������α���</html:option>
	          		</html:select>
	          	</td>
	          	<td class="sBg"></td>
	          	<td class="s1" width="20%">�򰡱���<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td>&nbsp;
	          		<html:select name="tstSubjectForm" property="testgbn">
	          			<html:option value="">����</html:option>
	          			<html:option value="">----------</html:option>
	          			<html:option value="Y">�¶�����</html:option>
	          			<html:option value="N">����������</html:option>
	          		</html:select>
	          	</td>
	          </tr>
	          
	        </table>
		  </td>
		  <td class="lbg"></td>
      </tr>
     </table>
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td style="height:5px;"></td>
    </tr>
    </table>
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
    <!--�򰡰��� �⺻���� ����-->
      <table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr>
      	 <td class="lbg"></td>
		 <td class="cbg"> 
          <table width="746" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;������ ��������</td>
          </tr>
          </table>
         </td>
         <td class="lbg"></td>
      </tr>
      </table>
      <table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr>
      	 <td class="lbg"></td>
		 <td> 
          <table width="746" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td class="s1" width="20%">��뿩�� <font color=red>*</font></td>
          	<td class="sBg"></td>
            <td colspan="5">&nbsp;
              <html:select name="tstSubjectForm" property="inuse">
               <html:option value="">����</html:option>
               <html:option value="">- - - - - - -</html:option>
               <html:option value="Y">���</html:option>
               <html:option value="N">������</html:option>
              </html:select>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
          </tr>
          <tr>
          	<td class="s1" width="20%">����� </td>
          	<td class="sBg"></td>
            <td width="30%">&nbsp;
            	<html:hidden name="tstSubjectForm" property="insdate"/>
              <bean:write name="tstSubjectForm" property="insdate"/>
       		</td>
       		<td class="sBg"></td>
       		<td class="s1" width="20%">������ </td>
       		<td class="sBg"></td>
            <td>&nbsp;
              <bean:write name="tstSubjectForm" property="upddate"/>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
          </tr>
          <tr>
          	<td class="s1" width="20%">����� </td>
          	<td class="sBg"></td>
            <td width="30%">&nbsp;
            	<html:hidden name="tstSubjectForm" property="insuser"/>
              <bean:write name="tstSubjectForm" property="insuser"/>
       		</td>
       		<td class="sBg"></td>
       		<td class="s1" width="20%">������ </td>
       		<td class="sBg"></td>
            <td>&nbsp;
              <bean:write name="tstSubjectForm" property="upduser"/>
       		</td>
          </tr>
          </table>
      	</td>
      	<td class="lbg"></td>
      </tr>
      </table>
      <!--�򰡰��� �⺻���� ��-->
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td style="height:5px;"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td>
	      <img src="/images/board/btn_save.gif" onclick="checkComplete()" alt="����" style="cursor:hand"/>
	      <img src="/images/board/btn_cancle2.gif" onclick="toList()" alt="���" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
</html:form>

<script type="text/javascript">
<!--
	//������ �ε� �Ϸ� �� �򰡹�� ����

//-->
</script>
