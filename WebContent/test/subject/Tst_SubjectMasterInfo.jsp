<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<script type="text/javascript" src='<html:rewrite page="/common/js/common.js"/>'></script>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script language="JavaScript">
	<!--
  function update()
  {
  	document.location.href = '/tstSubject.act?task=modifyM&subjectcode=' + "${tstSubjectForm.subjectcode}";
  }
  

  function toList()
  {
  	document.location.href = '/tstSubject.act?task=masterlist';
  }
//-->
</script>
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
	          	<td class="s1" width="20%">�������ڵ�</td>
	          	<td class="sBg"></td>
	          	<td width="30%" colspan="3">&nbsp;
	          		<bean:write name="tstSubjectForm" property="subjectcode"/>
	          	</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
		        <td class="s1" width="20%">�������</td>
		        <td class="sBg"></td>
		        <td width="30%" colspan="3">&nbsp;
		        	<bean:write name="tstSubjectForm" property="subjectname"/>
		        </td>
		      </tr>
		      <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
		      <tr>
	          	<td class="s1" width="20%">������з�</td>
	          	<td class="sBg"></td>
	          	<td colspan="5">&nbsp;
	          		<c:choose>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4501'}">�Ҿ����</c:when>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4502'}">��������</c:when>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4503'}">��������</c:when>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4509'}">�ش����</c:when>
	            	</c:choose>
          		</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
	          	<td class="s1" width="20%">��������</td>
	          	<td class="sBg"></td>
	          	<td width="30%">&nbsp;
	          		<c:if test="${tstSubjectForm.edugbn == 'Y'}">�¶���</c:if>
	            	<c:if test="${tstSubjectForm.edugbn == 'N'}">��������</c:if>
	          	</td>
	          	<td class="sBg"></td>
	          	<td class="s1" width="20%">�򰡱���</td>
	          	<td class="sBg"></td>
	          	<td>&nbsp;
	          		<c:if test="${tstSubjectForm.testgbn == 'Y'}">�¶���</c:if>
	            	<c:if test="${tstSubjectForm.testgbn == 'N'}">��������</c:if>
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
      <tr>
      	<td class="lbg"></td>
         <td>
          <table width="746" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td class="s1" width="20%">��뿩��</td>
            <td class="sBg"></td>
            <td colspan="5">&nbsp;
              <c:if test="${tstSubjectForm.inuse == 'Y'}">���</c:if>
           	  <c:if test="${tstSubjectForm.inuse == 'N'}">�̻��</c:if>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
          </tr>
          <tr>
          	<td class="s1" width="20%">����� </td>
           <td class="sBg"></td>
            <td width="30%">&nbsp;
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
              <bean:write name="tstSubjectForm" property="insuser"/>
       		</td>
       		<td class="sBg"></td>
       		<td class="s1" width="20%">������ </td>
            <td class="sBg"></td>
            <td>&nbsp;
              <bean:write name="tstSubjectForm" property="upduser"/>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
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
      <img src="/images/board/btn_modify4.gif" onclick="update()" alt="����" style="cursor:hand"/>
      <img src="/images/board/btn_list.gif" onclick="toList()" alt="���" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>


<script type="text/javascript">
<!--
	//������ �ε� �Ϸ� �� �򰡹�� ����

//-->
</script>
