<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	<!--	
	function fileInfo(transType, messageID, fileName, courseName, organName)
	{
		window.open('<html:rewrite page="/oprTransResult.act?task=fileInfo&searchType='+ transType +'&messageID=' + messageID + '&fileName=' + fileName +'&courseName=' + courseName + '&organName=' + organName + '"/>', 'fileInfo', 'scrollbars=no, menubar=no, width=700, height=361, status=yes top=150, left=150');
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�λ�� ��/���� ��� ��ȸ" src="/images/operation/title_31.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action="oprTransResult.act?task=list">
	  <html:hidden property="messageID"/>
	  <html:hidden property="fileName"/>
      <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">                         	
          <tr> 
            <td class="s1" width="100">��/���� ���</td>
            <td class="sBar"></td>
            <td class="s2" width="100"> 
              <html:text property="searchYYYYMM" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchYYYYMM);">
			</td>	
            <td class="sBar"></td>
            <td width="100" class="s1">���豸��</td>
			<td class="sBar"></td>
			<td class="s2" width="320"> 
			  <html:select property="searchType">
			  	<html:option value="OR">�����̼����</html:option>
			  	<html:option value="OD">����Ȯ�����</html:option>
				<html:option value="OC">��������</html:option>
				<html:option value="OL">���������</html:option>
			  </html:select>
			</td>
			<td width="60">
			  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand" align="absbottom"/>
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
          <td class="t1" width="30">����</td>
          <td class="sBg"></td>
          <c:if test="${transType eq 'OL'}">
	        <td class="t1" width="150">������</td>
	        <td class="sBg"></td>
	      </c:if>
          <td class="t1" width="85">���豸��</td>
          <td class="sBg"></td>
          <c:if test="${transType eq 'OL'}">
	        <td class="t1" width="75">�����Ī</td>
	        <td class="sBg"></td>
	      </c:if>
          <td class="t1">���ϸ�</td>
          <td class="sBg"></td>                      
	      <c:if test="${transType ne 'OL'}">
	        <td class="t1" width="70">����ũ��</td>
	        <td class="sBg"></td>     
	      </c:if>                       
          <td class="t1" width="190">��������</td>
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
			  <c:forEach var="rcvResultList" items="${rsOpr_TransResult}" varStatus="i" >
				<c:set value="${i.count}" var="count"/> 
				<c:if test="${i.count%2 == 1}"><c:set var="clsname" value="tbg3"/></c:if>
				<c:if test="${i.count%2 == 0}"><c:set var="clsname" value=""/></c:if>				                                  
                <tr class="${clsname}"> 
                  <td class="t2" width="30">${i.count}</td>
	              <td class="sBg"></td>
	              <c:if test="${transType eq 'OL'}">
		            <td class="t3" width="150">&nbsp;${rcvResultList.courseName}</td>
		            <td class="sBg"></td>
		          </c:if>
	              <td class="t2" width="85">
	                <c:if test="${transType eq 'OC'}">��������</c:if>
	                <c:if test="${transType eq 'OL'}">���������</c:if>
	                <c:if test="${transType eq 'OD'}">����Ȯ�����</c:if>
	                <c:if test="${transType eq 'OR'}">�����̼����</c:if>
	              </td>
	              <td class="sBg"></td>
                  <c:if test="${transType eq 'OL'}">
		            <td class="t2" width="75">${rcvResultList.organName}</td>
		            <td class="sBg"></td>
		          </c:if>
	              <td class="t2"><a href="#" onclick="fileInfo('${transType}','${rcvResultList.messageID}','${rcvResultList.fileName}','${rcvResultList.courseName}','${rcvResultList.organName}');"><u>${rcvResultList.fileName}</u></a></td>
	              <td class="sBg"></td>		                                    
	              <c:if test="${transType ne 'OL'}">
		            <td class="t4" width="70"><fmt:formatNumber value="${rcvResultList.fileSize}" pattern="#,##0"/>&nbsp;</td>
		            <td class="sBg"></td>		                                    
		          </c:if>
	              <td class="t2" width="190">${rcvResultList.sendDate}</td>
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
