<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script language="JavaScript">
	<!--
	window.onload = function(){
		document.btnSave.onclick = function(){
            		alert("���� ���ε��� ������ �����ؾ� �մϴ�.");
            	};
	}

	function checkTxtFile() 
	{
		//���� ���ε� Ȯ��
        var imgurl = document.forms[0].satisfile.value;
        var extension = imgurl.substring(imgurl.lastIndexOf(".") +1 , imgurl.length).toLowerCase();
        if (extension!="txt") {
            alert("txt ������ ���ϸ� �����մϴ�.\t");
            document.forms[0].satisfile.select();
            document.selection.clear();
            document.btnSave.onclick = function(){
            		alert("���� ���ε��� ������ �����ؾ� �մϴ�.");
            	};
            return;
        }
        else
        {
        	document.btnSave.onclick = function(){
            		closeWin();
            	};
        	return;
        }
    }
    
	function closeWin()
	{
		//�Ϲ�,���� ���� ���� Ȯ��
		/* count=0;
		for(var i=0; i<document.forms[0].islectsurvey.length;i++)
		{
			if(document.forms[0].islectsurvey[i].checked == true)
			{
				count++;
			}
		}
		if(count<=0)
		{
			alert("OMR �ؽ�Ʈ���� ������ �����ؾ� �մϴ�");
			return;
		} */
		document.forms[0].target = opener.name;
		document.forms[0].submit();
		window.close();
	}

//-->
</script>
   <!--���̺� ����-->
<table width="500" border="0" cellspacing="20" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��������" src="/images/poll/title_05-1.gif" /></h1>
	</div>
  </td>
</tr>
  <tr> 
    <td> 
      <table width="450" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>
          	<!-- �Ӹ��� ���� -->
		    <table width="95%" cellpadding="5" cellspacing="0" border="0" align="center">
		        <tr>
		            <td bgcolor="#F3F3F3">
		               
		            </td>
		        </tr>
		    </table>
		    <!-- �Ӹ��� �� -->
          </td>
        </tr>
        <tr> 
          <td> 
            <table width="440" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td> 
                  <!--���̺� ��� ����-->
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="436" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr> 
                            <td class="t1" width="34">�� '<font color=red>���� OMR</font>' ��������� ÷���Ͽ� �ֽʽÿ�</td>
                          </tr>
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--���̺� ��� ��-->
                </td>
              </tr>
              <tr> 
                <td> 
	               	<form action="/tstSatis.act?task=uploadOMR" enctype="multipart/form-data" method="post">
	               		<input type="hidden" name="searchCourseCode" value="${rsTst_Survey.coursecode}"/>
	               		<input type="hidden" name="coursecode" value="${rsTst_Survey.coursecode }"/>
	               		<input type="hidden" name="surveyno" value="${rsTst_Survey.surveyno }"/>
	                  <table width="440" border="0" cellspacing="0" cellpadding="0">
	                    <tr> 
	                      <td class="lbg2"></td>
	                      <td width="436"> 
	                        <table width="436" border="0" cellspacing="0" cellpadding="0">
	                          <tr> 
	                            <td valign="top"> 
	                            	<table id="mainTable" width="429" border="0" cellspacing="0" cellpadding="0">
	                                	<tr>
		                                	<td class="s1" colspan="2" style="text-align:left;">
		                                		&nbsp;&nbsp;
		                                		<input type="radio" name="islectsurvey" value="0">�Ϲݼ���OMR&nbsp;&nbsp;
<!-- 		                                		<input type="radio" name="islectsurvey" value="1">���Ǽ���OMR -->
		                                	</td>
	                                	</tr>
	                                	<tr>
		                                	<td class="s1" width="30%">
		                                		OMR �������
		                                	</td>
		                                	<td class=s2" width="70%">
		                                        <input type="file" name="satisfile" style="height:25;" onchange="checkTxtFile();"/>
		                                	</td>
	                                	</tr>
	                                </table>
	                            </td>
	                          </tr>
	                        </table>
	                      </td>
	                      <td class="lbg2"></td>
	                    </tr>
	                  </table>
                  	</form>
                 </td>
              </tr>
              <tr> 
                <td> 
                  <table width="440" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg1"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td> 
                  <!--�ϴܹ�ư-->
                  <table width="440" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      	<td align="right"><img src='<html:rewrite page="/images/board/btn_cancle2.gif"/>' width="57" height="25" alt="���" align="absmiddle" onclick="javascript:window.close();opener.focus();" style="cursor:hand"/> 
                        <img name="btnSave" src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" align="absmiddle" alt="����" style="cursor:hand" onclick="javascript:closeWin();"/></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    
  </tr>
</table>
