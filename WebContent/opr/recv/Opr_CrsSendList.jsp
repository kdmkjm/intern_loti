<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(182);
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�������� Ȯ������" src="/images/operation/title_18.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� ���̺� ����-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <html:form method="POST" action="oprCrsSendList.act?task=list">
	  <tr> 
		<td width="129" class="s1">����</td>
        <td class="sBar"></td>
        <td class="s2">
          <html:select property="syear" value="${thisYear}" style="width:100px">
			<html:optionsCollection name="crsYear" property="beanCollection" />
		  </html:select>
		</td>										  
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand" align="absmiddle"/>
		</td>
	  </tr>
	  </html:form>
	</table>
    <!--�˻� ���̺� ��-->
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
          <td class="t1" width="120">���</td>
          <td class="sBg"></td>
          <td class="t1" width="125">�����Ǽ�</td>
          <td class="sBg"></td>    
          <td class="t1" width="125">���۰Ǽ�</td>
          <td class="sBg"></td>                          
          <td class="t1" width="125">������</td>
          <td class="sBg"></td>
          <td class="t1" width="125">��������</td>
          <td class="sBg"></td>
          <td class="t1">����ó��</td>
          <td class="sBg"></td>                                                  
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
      <td class="lbg2"></td>
      <td width="746"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td> 
            <!--����Ʈ ����-->
            <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="crsSendList" items="${rsOpr_CrsSend}" varStatus="i" >
				<html:form method="POST" action="oprCrsSendList.act?task=send">
				<html:hidden property="yyyymm" value="${crsSendList.yyyymm}"/>
				<html:hidden property="sendcnt" value="${crsSendList.crscnt}"/>
				<c:if test="${i.count%2 == 0}">                                    
		          <c:set value="tbg3" var="clsname"/>    
		        </c:if>
		        <c:if test="${i.count%2 == 1}">   
		          <c:set value="" var="clsname"/>  
		        </c:if>
	            <tr class="${clsname}">
	              <td class="t2" width="120">${crsSendList.yyyymm}</td>
	              <td class="sBg"></td>
		          <td class="t2" width="125">${crsSendList.crscnt}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="125">${crsSendList.sendcnt}</td>
		          <td class="sBg"></td>		                                    
		          <td class="t2" width="125">${crsSendList.sendusernm}</td>
		          <td class="sBg"></td>
		          <td class="t2" width="125">${crsSendList.senddate}</td>
		          <td class="sBg"></td>
		          <td class="t2">
		            <c:if test="${crsSendList.senddate == null && crsSendList.crscnt > 0}">
	                  <img src='<html:rewrite page="/images/board/btn_s_send.gif"/>' width="34" height="18" align="absmiddle" alt="����" onclick="submit();" style="CURSOR: hand" />
	                </c:if>
	                <c:if test="${crsSendList.senddate != null || crsSendList.crscnt == 0}">
	                  <img src='<html:rewrite page="/images/board/btn_s_send_off.gif"/>' width="34" height="18" align="absmiddle" alt="���� ��Ȱ��" />
	                </c:if>
	              </td>
		          <td class="sBg"></td>
		        </tr>
		        <tr> 
		          <td class="lbg3" colspan="12"></td>
		        </tr>  
			    <c:set value="${i.count}" var="count"/>     
		        </html:form>                  
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
</table>
<script language="javascript">	
<!--
	tresize(182);
//-->
</script>