<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
<!--
window.onresize = function(){
//   ������ ������ ���� ���� �ڵ�
tresize(140);
}

//���� ��ư(start, stop , run)
function getCtrSubmit(frm, p_nm, p_id, p_ctr) {
	var msg="";
	if (p_ctr=="001") msg="����"; 
  else if (p_ctr=="002") msg="��ý���"; 
	else msg="����";
	
	if (confirm("["+p_nm+"]��(��) ["+msg+"] �Ͻðڽ��ϱ�?")) {
		frm.p_id.value=p_id;
		frm.p_ctr.value=p_ctr;
		frm.action="<html:rewrite page="/sysAgent.act?task=admin"/>";
		frm.submit();
	} else {
		return false;
	} 
}
//-->
</script>
<html:form method="POST" action="/sysAgent.act">
<html:hidden name="sysAgentForm" property="p_id"/>
<html:hidden name="sysAgentForm" property="p_nm"/>
<html:hidden name="sysAgentForm" property="p_ctr"/>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="Agent����" src="/images/resources/title_06-2.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr><td align="left"><a href="<html:rewrite page="/sysAgent.act?task=agent"/>">[���ΰ�ħ]</a></td></tr>
	</table>
	<!--�˻� ��-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" width="29">����</td>
		  <td class="sBg" width="1"></td>
		  <td class="t1" width="145">���α׷���</td>
		  <td class="sBg" width="1"></td>
		  <td class="t1" width="69">�����ֱ�</td>
		  <td class="sBg" width="1"></td>
		  <td class="t1" width="108">�����������Ͻ�</td>
		  <td class="sBg" width="1"></td>
		  <td class="t1" width="219">ó���α�</td>
		  <td class="sBg" width="1"></td>
		  <td class="t1" width="59">����</td>
		  <td class="sBg" width="1"></td>
		  <td class="t1" width="153">����</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <c:set var="no" scope="request" value="1"/>
		  <table id="mainTable" width="746" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="agnetList" items="${rsSysAgent}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2" width="29">${no}</td>
			  <td class="sBg" width="1"></td>
			  <td class="t3" width="145">&nbsp;<c:out value="${agnetList.agentName}"/></td>
			  <td class="sBg" width="1"></td>
			  <td class="t2" width="69">
	       		<logic:equal name="agnetList" property="runtimeTF" value="true">
	       		  <a href="<html:rewrite page="/sysAgent.act"/>?task=list&p_id=${agnetList.tableID}"><img src="<html:rewrite page="/images/board/btn_setting.gif"/>" align="absmiddle" alt="����"></a>
	     		</logic:equal>
	     		<logic:notEqual name="agnetList" property="runtimeTF" value="true">
	       		  <bean:write name="agnetList" property="interval"/>
	     		</logic:notEqual>
     		  </td>
			  <td class="sBg" width="1"></td>
			  <td class="t2" width="109"><c:out value="${agnetList.lastRuntime}"/></td>
			  <td class="sBg" width="1"></td>
			  <td class="t3" width="219">&nbsp;<c:out value="${agnetList.lastRunstat}"/></td>
			  <td class="sBg" width="1"></td>
			  <td class="t2" width="59">
	            <logic:equal name="agnetList" property="runTF" value="true">������</logic:equal>
				<logic:notEqual name="agnetList" property="runTF" value="true">����</logic:notEqual>	
	          </td>			
			  <td class="sBg" width="1"></td>
			  <td class="t2" width="153">
	          <logic:equal name="agnetList" property="runTF" value="true">
				<!-- ��ý��� -->
	            <a href="#" onclick="return getCtrSubmit(document.forms[0], '${agnetList.agentName}', '${agnetList.tableID}', '002');"><font color="blue">[RUN]</font></a>
				<!-- ���� -->
	            <font color="DDDDDD">[START]</font>
	            <font color="red"><a href="#" onclick="return getCtrSubmit(document.forms[0], '${agnetList.agentName}', '${agnetList.tableID}', '000');">[STOP]</a></font>
			  </logic:equal>
			  <logic:notEqual name="agnetList" property="runTF" value="true">
				<!-- �Ͻ�����-->
	            <font color="DDDDDD">[RUN]</font>
	            <font color="red"><a href="#" onclick="return getCtrSubmit(document.forms[0], '${agnetList.agentName}', '${agnetList.tableID}', '001');">[START]</a></font>
	            <font color="DDDDDD">[STOP]</font>
			  </logic:notEqual>
			  </td>
			  <td width="17"></td>
			</tr>
	        <tr><td class="lbg3" colspan="99"></td></tr>
			<c:set var="no" scope="request" value="${no + 1}"/>
		  </c:forEach>
		  <c:if test="${no==1}">
			<tr class="tbg3" height="21"><td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td></tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<!--�ϴܹ�ư ���̺� ����-->
    <!--�ϴܹ�ư ���̺� ��-->
  </td>
</tr>
</table>
</html:form>

<script type="text/javascript">
<!--
	tresize(140);

//-->
</script>
