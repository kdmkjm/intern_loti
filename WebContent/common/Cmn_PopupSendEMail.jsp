<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
   response.setHeader("Pragma", "No-cache");
   response.setDateHeader("Expires", 0);
   response.setHeader("Cache-Control", "no-cache");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>E-MAIL �߼�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<script type="text/javascript">
<!--
//���۹�ư
function getSubmit()
{
	var frm = document.forms[0];
	
	if(frm.subject.value == ""){
		alert("������ �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
		frm.subject.focus();
		return false;
		
	}else if(frm.content.value == ""){
		alert("������ �Է��Ͽ� �ֽñ� �ٶ��ϴ�.");
		frm.content.focus();
		return false;
	}
	frm.task.value = "insert";
	frm.submit();
}
//-->
</script>
<body>
<html:form method="POST" enctype="multipart/form-data" action="/cmnPopupSendEMail.act">
<input type="hidden" name="task">
<table width="650" border="0" cellspacing="5" cellpadding="0" height="490" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="640" border="0" cellspacing="1" cellpadding="0" height="480" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/teacher/title_01-3.gif"/>' width="109" height="42" alt="E-MAIL�߼�" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="617" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td> 
                        <!--���Ϲ߼� ���̺� ����-->
                        <table width="617" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8" align="center">
                          <tr> 
                            <td class="pt4" width="98">�޴»��</td>
                            <td class="pt2Left">&nbsp;<html:text property="to_01" style="width:430px;"></html:text></td>
                          </tr>
                          <tr> 
                            <td class="pt4" width="98">����</td>
                            <td class="pt2Left">&nbsp;<html:text property="to_02" style="width:430px;"></html:text></td>
                          </tr>
                          <tr> 
                            <td class="pt4" width="98">����</td>
                            <td class="pt2Left">&nbsp;<html:text property="subject" style="width:430px;"></html:text></td>
                          </tr>
                          <tr> 
                            <td class="pt4" width="98">÷������</td>
                            <td class="pt2Left">&nbsp;<html:file property="allFname" style="width:430px;"></html:file>
                            <!-- 
                            <input type="text" name="textFile" style="width:430px;" />
                            <span style="overflow:hidden; width:53px; height:18px; background-image:url(<html:rewrite page="/images/board/btn_file.gif"/>);">  
														<html:file property="allFname" style="width:0; height:18; filter:alpha(opacity=0);" onchange='getChange();'></html:file>
														</span>
														 -->
														<!--  <html:file property="allFname"></html:file>
														  <input type="text" name="allFname" style="width:430px;">
                              <img src='<html:rewrite page="/images/board/btn_file.gif"/>' width="53" height="18" align="absmiddle" alt="����ã��" style="cursor:hand" onclick='getExcelUpload()' />
                              <html:file property="fname" style="display:none"></html:file>
                             --> 
                            </td>
                          </tr>
                          <tr><td class="pt2Left" colspan="2">&nbsp;<html:textarea property="content" style="width:98%" rows="16"></html:textarea></td></tr>
                        </table>
                        <!--���Ϲ߼� ���̺� ��-->
                      </td>
                    </tr>
                    <tr> 
                      <td height="10px;"></td>
                    </tr>
                    <tr> 
                      <td> 
                        <!--�ϴ� ��ư ����-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
                          <tr> 
                            <td align="right"><img src='<html:rewrite page="/images/board/btn_send4.gif"/>' width="57" height="25" align="absmiddle" alt="����" style="cursor:hand" onclick='getSubmit()'/></td>
                          </tr>
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
    </td>
  </tr>
</table>
</html:form>
</body>
</html>
