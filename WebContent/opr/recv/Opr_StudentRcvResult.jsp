<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	<!--
	function processing(messageID, fileName)
	{
		document.all.messageID.value = messageID;
		document.all.fileName.value  = fileName;
		
		document.forms[0].action = "oprStudentRcvResult.act?task=processing";
		document.forms[0].submit();
	}
	
	function fileInfo(messageID, fileName, courseName, organName)
	{
		window.open('<html:rewrite page="/oprStudentRcvResult.act?task=fileInfo&messageID=' + messageID + '&fileName=' + fileName +'&courseName=' + courseName + '&organName=' + organName + '"/>', 'fileInfo', 'scrollbars=no, menubar=no, width=700, height=361, status=yes top=150, left=150');
	}
	
	function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type ���� �Ѱ��ش�. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	// �˻� OnSubmit CallBack
	var formOnSubmit = function(){
		if(jQuery('#searchCourseName').val() != ''){
			jQuery('input[name="searchCourseCode"]').val(jQuery('#searchCourseName').val()+'0'+jQuery('#searchKeyword').val()+'000');
			jQuery('input[name="searchColumn"]').val(jQuery('#searchYear').val());
		}
		return true;
	}
	jQuery(function(){
		jQuery(document.forms[0]).submit(formOnSubmit);
	})
	function doSearch(){
		jQuery(document.forms[0]).submit();
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ��ܼ��� �����ȸ" src="/images/operation/title_19.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action="oprStudentRcvResult.act?task=list">
	  <html:hidden property="messageID"/>
	  <html:hidden property="fileName"/>
      <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">                         	
          <tr> 
            <td width="80" class="s1">���ų��</td>
            <td class="sBar"></td>
            <td class="s2"> 
			  <html:text property="searchYYYYMM" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchYYYYMM);">
			</td>
			<td class="sBar"></td>
			<td width="40" class="s1">����</td>
            <td class="sBar"></td>
            <td class="s2">
            	<html:select property="searchDD">
					<html:optionsCollection property="searchDDList" label="label" value="value"/>
				</html:select>
            </td>
            <td class="sBar"></td>
            <td width="59" class="s1">����</td>
            <td class="sBar"></td>
			<td class="s2" width="360"> 
			  <select id="searchYear"></select>
			  <select id="searchCourseName" style="width:200px;">
			  	<option value="">���� ����</option>
			  </select>
			  <select id="searchKeyword" style="width:100px;">
			  	<option value="">������� ����</option>
			  </select>
			  <html:hidden property="searchColumn"/>
			  <html:hidden property="searchCourseCode"/>
			</td>
			<td width="60">
			  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch()" style="cursor:hand" align="absbottom"/>
			</td>												  
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
          <td class="t1" width="25">��<br>��</td>
          <td class="sBg"></td>
          <td class="t1">������</td>
          <td class="sBg"></td>
          <td class="t1" width="40">������</td>
          <td class="sBg"></td>
          <td class="t1" width="65">�����Ī</td>
          <td class="sBg"></td>
          <td class="t1" width="190">�������ϸ�</td>
          <td class="sBg"></td>                            
          <td class="t1" width="120">��������</td>
          <td class="sBg"></td>
          <td class="t1" width="35">����<br>����</td>
          <td class="sBg"></td>
          <td class="t1" width="35">����<br>����</td>
          <td class="sBg"></td>
          <td class="t1" width="40">ó��</td>
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
			  <c:forEach var="rcvResultList" items="${rsOpr_StudentRcvReturn}" varStatus="i" >
				<c:set value="${i.count}" var="count"/> 
				<c:if test="${i.count%2 == 1}">  
				  <c:set var="clsname" value="tbg3"/>
				</c:if>
				<c:if test="${i.count%2 == 0}"> 
				  <c:set var="clsname" value=""/>	
				</c:if>				                                  
                <tr class="${clsname}"> 
                  <td class="t2" width="25">${i.count}</td>
	              <td class="sBg"></td>
	              <td class="t3">&nbsp;${rcvResultList.courseName}</td>
	              <td class="sBg"></td>
	              <td class="t2" width="40">${rcvResultList.eduDate}</td>
	              <td class="sBg"></td>
	              <td class="t2" width="65">${rcvResultList.organName}</td>
	              <td class="sBg"></td>
	              <td class="t2" width="190"><a href="#" onclick="fileInfo('${rcvResultList.messageID}','${rcvResultList.fileName}','${rcvResultList.courseName}','${rcvResultList.organName}');"><u>${rcvResultList.fileName}</u></a></td>
	              <td class="sBg"></td>		                                    
	              <td class="t3" width="120">&nbsp;${rcvResultList.recDate}</td>
	              <td class="sBg"></td>
	              <td class="t2" width="35">${rcvResultList.applyFl}</td>
	              <td class="sBg"></td>
	              <td class="t2" width="35">${rcvResultList.isFixStd}</td>
	              <td class="sBg"></td>
	              <td class="t2" width="40">
	                <c:if test="${rcvResultList.applyFl eq 'N' && rcvResultList.chkMod eq 'Y'}"><img src='<html:rewrite page="/images/board/btn_apply.gif"/>' align="absmiddle" alt="ó��" onclick="processing('${rcvResultList.messageID}','${rcvResultList.fileName}');" style="cursor:hand"/></c:if>
	                <c:if test="${rcvResultList.applyFl eq 'N' && rcvResultList.chkMod ne 'Y'}"><img src='<html:rewrite page="/images/board/btn_apply_off.gif"/>' align="absmiddle" alt="�Ⱓ����"/></c:if>
				    <c:if test="${rcvResultList.applyFl ne 'N' && rcvResultList.chkMod eq 'Y'}"><img src='<html:rewrite page="/images/board/btn_apply_off.gif"/>' align="absmiddle" alt="ó���Ϸ�"/></c:if>
				    <c:if test="${rcvResultList.applyFl ne 'N' && rcvResultList.chkMod ne 'Y'}"><img src='<html:rewrite page="/images/board/btn_apply_off.gif"/>' align="absmiddle" alt="ó���Ϸ�"/></c:if>
				  </td>
	            </tr>
	            <tr> 
	              <td class="lbg3" colspan="99"></td>
	            </tr>                     
              </c:forEach>
              <c:if test="${count == null}">
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
</table>
<script type="text/javascript">
<!--
	tresize(182);
//-->
</script>
