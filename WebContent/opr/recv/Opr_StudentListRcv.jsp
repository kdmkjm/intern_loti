<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(182);
	}
	
	
	function excelUpload()
	{
		var courseCode = document.forms[0].searchCourseCode.value;
		var courseName = document.forms[0].searchCourseName.value;
		
		if( courseCode == "")
		{
			alert("������ �����Ͽ� �ֽʽÿ�.");
			return;
		}
		
		document.location.href = "oprStudentListRcv.act?task=excel_up&courseCode="+courseCode+"&courseName="+courseName;
	
	}
	
	function insarangRcv()
	{
		//openWinSetPo('include/processing_call.jsp','sso_rcv','','386','177');
		win = window.open('include/processing_call.jsp','sso_rcv', "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,,width=386,height=177");
	  	  	
  	setTimeout("frmRcv()", 3000);
	}
	function frmRcv()
	{
		var frm = document.forms[1];
  	
  	frm.target = 'sso_rcv';	  
  	frm.submit();
	  setTimeout("frmClose()", 2000);
	}
	
	function frmClose()
	{
  	win.close();
  	document.location.href = "/oprSendingList.act?task=send";
	}
	
	function insarangRcv1()
	{
		var url = "oprStudentListRcv.act?task=insarangrcv";
	  var pars;
		new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onComplete: saveComp,
                              onFailure: reportError
                              });

		//frm.submit();
	}
	
		// ����Ϸ�
	function saveComp(resXML)
	{
		var xmlDoc = resXML.responseXML;
		var cmd, retCode, msg;
		var resultNode = xmlDoc.getElementsByTagName('result');

		cmd = resultNode[0].childNodes[0].text;
		retCode = resultNode[0].childNodes[1].text;
		msg = resultNode[0].childNodes[2].text;

		if (retCode == "true") 
		{
			if(msg != "") 
			{
				alert(msg);
			}
		}
	}

 	//
	function reportError(e)
	{
		alert(e);
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ��� ����" src="/images/operation/title_06.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action="oprStudentListRcv.act?task=list">
    <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <html:hidden property="courseYear" />
          <html:hidden property="crsUser" />
          <tr> 
            <td width="59" class="s1">����</td>
            <td class="sBar"></td>
			<td class="s2" width="420"> 
			  <select id="searchYear"></select>
			  <select id="searchCourseName" style="width:260px;">
			  	<option value="">���� ����</option>
			  </select>
			  <select id="searchKeyword" style="width:100px;">
			  	<option value="">������� ����</option>
			  </select>
			  <html:hidden property="searchColumn"/>
			  <html:hidden property="searchCourseCode"/>
			</td>
            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch()" style="cursor:hand" align="absbottom"/></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--�˻� ���̺� ��-->
    </html:form>
  </td>
</tr>
<tr> 
  <td height="15"></td>
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
    <!--���̺� ��� ����-->
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr> 
          <td class="t1" width="49">����</td>
          <td class="sBg"></td>
          <td class="t1" width="109">�Ҽ�</td>
          <td class="sBg"></td>
          <td class="t1">�μ�</td>
          <td class="sBg"></td>                            
          <td class="t1" width="169">����</td>
          <td class="sBg"></td>
          <td class="t1" width="150">����</td>
          <td width="17"></td>
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg2"></td>
      <td width="746"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td> 
            <!--����Ʈ ����-->
            <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="studentrcvList" items="${rsOpr_StudentListRcvList}" varStatus="i" >
				<c:if test="${i.count%2 == 0}">                                    
	              <tr class="tbg3"> 
	                <td class="t2" width="49">${i.count}</td>
	                <td class="sBg"></td>
		            <td class="t3" width="109">&nbsp;${studentrcvList.selOrganName}</td>
		            <td class="sBg"></td>
		            <td class="t3">&nbsp;${studentrcvList.assignname}</td>
		            <td class="sBg"></td>		                                    
		            <td class="t3" width="169">&nbsp;${studentrcvList.rankname}</td>
		            <td class="sBg"></td>
		            <td class="t2" width="150">${studentrcvList.stdname}</td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="9"></td>
		          </tr>
		        </c:if>
				<c:if test="${i.count%2 == 1}">                                    
	              <tr> 
	                <td class="t2" width="49">${i.count}</td>
	                <td class="sBg"></td>
		            <td class="t3" width="109">&nbsp;${studentrcvList.selOrganName}</td>
		            <td class="sBg"></td>
		            <td class="t3">&nbsp;${studentrcvList.assignname}</td>
		            <td class="sBg"></td>		                                    
		            <td class="t3" width="169">&nbsp;${studentrcvList.rankname}</td>
		            <td class="sBg"></td>
		            <td class="t2" width="150">${studentrcvList.stdname}</td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="9"></td>
		          </tr>
		        </c:if>		         
		        <c:set value="${i.count}" var="count"/>                       
              </c:forEach>
              <c:if test="${count==null}">
				<tr class="tbg3">
				  <td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
				</tr>
			  </c:if>
              </table>
            </div>
            <!--����Ʈ ��-->
          </td>
        </tr>
        </table>
      </td>
      <td class="lbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg1"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td align="right">
      <!-- chkMod�� ������� �׻� Ȱ��ȭ ��Ŵ -->
          <img src='<html:rewrite page="/images/board/btn_excelup.gif"/>' width="82" height="25" alt="�������ε�" align="absmiddle" onclick="excelUpload()" style="cursor:hand"/>
	      <img src='<html:rewrite page="/images/board/btn_name.gif"/>' width="72" height="25" align="absmiddle" alt="��ܼ���" onclick="insarangRcv()" style="cursor:hand"/>     
      <!-- 
        <c:if test="${chkMod eq 'Y'}">
	      <img src='<html:rewrite page="/images/board/btn_excelup.gif"/>' width="82" height="25" alt="�������ε�" align="absmiddle" onclick="excelUpload()" style="cursor:hand"/>
	      <img src='<html:rewrite page="/images/board/btn_name.gif"/>' width="72" height="25" align="absmiddle" alt="��ܼ���" onclick="insarangRcv()" style="cursor:hand"/>                      	
        </c:if>
        <c:if test="${chkMod ne 'Y'}">
	      <img src='<html:rewrite page="/images/board/btn_excelup_off.gif"/>' width="82" height="25" alt="�������ε�" align="absmiddle" />
	      <img src='<html:rewrite page="/images/board/btn_name_off.gif"/>' width="72" height="25" align="absmiddle" alt="��ܼ���" />                      	
        </c:if>
      -->
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
<html:form action="oprStudentListRcv.act?task=insarangrcv"></html:form>
<script type="text/javascript">
<!--
	tresize(182);
//-->
</script>
