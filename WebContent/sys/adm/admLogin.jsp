<%@page contentType="text/html;charset=euc-kr" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>

<html:html lang="true">
<head>
<title>������ �����¶��� �ý���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script type="text/javascript">
<!--
	//������ �α��� Ȯ��
	function adm_submit()
	{
		if(document.forms[0].adminId.value.trim() == "")
		{
			alert('���̵� �Է��ϼ���.');
			document.forms[0].adminId.value = "";
			document.forms[0].adminId.focus();
			return;
		}
		
		if(document.forms[0].password.value.trim() == "")
		{
			alert('��й�ȣ�� �Է��ϼ���.');
			document.forms[0].password.value = "";
			document.forms[0].password.focus();
			return;
		}
		
		document.forms[0].submit();
	}
	
	//�α��� ����
	function admloginerror()
	{	
		alert('������ �����Ͽ����ϴ�. \n���̵�/��й�ȣ�� Ȯ���ϼ���');			
		
		document.forms[0].password.value = '';
		document.forms[0].password.focus();
	}

	// �յڷ� ������� ���ش�.
	String.prototype.trim = function()
	{
		return this.replace(/(^\s*)|(\s*$)/gi, "");
	}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="document.forms[0].adminId.focus();">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="212">
        <tr> 
          <td bgcolor="#E5E5E5"> 
            <table width="570" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td width="233"><img src='<html:rewrite page="/images/sulogin/login_img.gif"/>' width="233" height="212"></td>
                <td width="337" bgcolor="#FFFFFF"> 
                  <table width="320" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td height="80" valign="bottom" style="padding:0 0 0 16;"><img src='<html:rewrite page="/images/sulogin/login_title.gif"/>' width="207" height="57" alt="�������� �α���"></td>
                    </tr>
                    <tr> 
                      <td height="13"></td>
                    </tr>
                    <tr> 
                      <td background='<html:rewrite page="/images/sulogin/dot_line.gif"/>' height="1"></td>
                    </tr>
                    <tr> 
                      <td height="110"> 
                        <!--�α��� ���̺�-->
                        <table width="260" border="0" cellspacing="0" cellpadding="0" align="center">
                        <html:form method="POST" action="/su_loginOk">
                          <tr> 
                            <td width="60" height="25"><img src='<html:rewrite page="/images/sulogin/id.gif"/>' width="47" height="11"></td>
                            <td width="120"> 
                            	<input type="text" name="adminId" style="width:110;"/>                              
                            </td>
                            <td rowspan="2" width="80">
                            	<img src='<html:rewrite page="/images/sulogin/login_btn.gif"/>' width="78" height="49" alt="�α���" onclick="adm_submit();" style="cursor:hand">
                           	</td>
                          </tr>
                          <tr> 
                            <td width="60" height="25"><img src='<html:rewrite page="/images/sulogin/pw.gif"/>' width="47" height="11"></td>
                            <td height="25" width="120"> 
                              <input type="password" name="password" style="width:110;" onkeydown="javascript:if (event.keyCode == 13) {adm_submit();}"/>
                            </td>
                          </tr>
                        </html:form>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<html:messages id="msg" message="true">
  <script language="javascript"><bean:write name="msg"/></script>
</html:messages>
</body>
</html:html>