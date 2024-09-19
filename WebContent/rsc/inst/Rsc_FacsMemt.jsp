<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(210);
	}
	function doDelete(num)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			document.forms[0].facsNo.value = num;
			document.forms[0].action = 'rscInst.act?task=delete';
			document.forms[0].submit();
		}
		else
		{
			return;
		}
	}
	function doDetl()
	{
		document.forms[0].action = 'rscInst.act?task=detl';
		document.forms[0].submit();
	}
	function newFacs()
	{
		document.forms[0].action = 'rscInst.act?task=create';
		document.forms[0].submit();
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ����" src="/images/resources/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="POST" action="rscInst.act?task=list">
	  <html:hidden property="facsNo"/>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td width="119" class="s1">��ǰ��</td>
		<td class="sBg"></td>
		<td class="s2">
		  <html:select property="searchFacsType" style="width:150px">
			<html:optionsCollection name="facsTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand" align="absbottom"/>
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--�˻� ��-->
	<table>
	<tr>
	  <td height="15"></td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">��ǰ��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="209">��ġ���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="69">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="109">AS ��ü��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="109">AS ����ó</td>
		  <td class="sBg"></td>
		  <td class="t1" width="60">ó��</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:set var="no" scope="request" value="1"/>
		  <c:forEach var="instList" items="${rsRscInstList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t3">
				&nbsp;<a href='<html:rewrite page="/rscInst.act?task=modify&facsNo=${instList.facsNo}"/>'><u><c:out value="${instList.facsType}"/></u></a>
			  </td>
			  <td class="sBg"></td>
			  <td class="t3" width="209">		
				<div title="${instList.place}">		
				  <c:if test="${fn:length(instList.place) > 20}">&nbsp;<c:out value="${fn:substring(instList.place, 0, 20)} ��"/></c:if>
				  <c:if test="${fn:length(instList.place) < 20}">&nbsp;<c:out value="${instList.place}"/></c:if>
				</div>
			  </td>
			  <td class="sBg"></td>
			  <td class="t4" width="69"><c:out value="${instList.count}"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t3" width="109">&nbsp;<c:out value="${instList.as_Corp}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="109"><c:out value="${instList.as_Phone}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="60">
			    <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" alt="����" onclick="doDelete(${instList.facsNo});" style="cursor:hand"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="13" class="lbg3"></td>
			</tr>
			<c:set var="total" scope="request" value="${total+instList.count}"/>
			<c:set var="no" scope="request" value="${no + 1}"/>
		  </c:forEach>
		  <c:if test="${no==1}">
			<tr class="tbg3" height="21">
			  <td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
		<!--����Ʈ �� ����-->
		<c:if test="${total!=null}">
		  <table width="746" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td class="t2BgRed"	>��</td>
			<td class="sBg"></td>
			<td class="t2BgRedR" width="69"><b>${total}</b>&nbsp;</td>
			<td class="sBg"></td>
			<td class="t2BgRed" width="109"></td>
			<td class="sBg"></td>
			<td class="t2BgRed" width="109"></td>
			<td class="sBg"></td>
			<td class="t2BgRed" width="77"></td>
		  </tr>
		  </table>
		</c:if>
		<!--����Ʈ �� ��-->
	  </td>
	</tr>
	</table>
	<!--�ϴܹ�ư ���̺� ����-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom">
	  <td>
		<img src='<html:rewrite page="/images/board/btn_sum3.gif"/>' alt="�����纰 ���" align="absmiddle" onclick="doDetl();" style="cursor:hand"/>
	  </td> 
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="�űԵ��" align="absmiddle" onclick="newFacs();" style="cursor:hand"/>
	  </td>
	</tr>
	</table>
	<!--�ϴܹ�ư ���̺� ��-->
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(210);
//-->
</script>