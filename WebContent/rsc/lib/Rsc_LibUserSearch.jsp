<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">

	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(200);
	}
	function doSearch(frm)
	{
		var searchBookType = frm.searchBookType.value;
		var searchBookName = frm.searchBookName.value;
		var searchPublisher = frm.searchPublisher.value;
		var searchAuthor = frm.searchAuthor.value;
		
		if(searchBookType == "" && searchBookName == "" && searchPublisher == "" && searchAuthor == "")
		{
			alert("�˻��� �����Ͱ� �ʹ� �����ϴ�. �˻������� �ٲ��ּ���.");
			return;
		}
		frm.submit();
	}
</script>

<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�����˻�" src="/images/resources/title_11.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="POST" action="/rscLibSearch.act?task=userSearch&type=true">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td class="s1" width="99">�����з�</td>
		<td class="sBg"></td>
		<td class="s2" width="274">
		  <html:select property="searchBookType" style="width:132px">
			<html:optionsCollection name="libTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td class="sBg"></td>
		<td class="s1" width="99">������</td>
		<td class="sBg"></td>
		<td class="s2" colspan="7"><html:text property="searchBookName" style="width:180px"/></td>
	  </tr>
	  <tr>
		<td colspan="13" class="lbg3"></td>
	  </tr>
	  <tr> 
		<td class="s1" width="99">���ǻ�</td>
		<td class="sBg"></td>
		<td class="s2" width="274"><html:text property="searchPublisher" style="width:130" /></td>
		<td class="sBg"></td>
		<td class="s1" width="99">����</td>
		<td class="sBg"></td>
		<td class="s2" width="230"><html:text property="searchAuthor" style="width:130" /></td>
		<td align="right"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0]);" style="cursor:hand" align="absbottom"/></td>
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
		  <td class="t1Line" width="45">��ȣ</td>
		  <td class="t1Line">������</td>
		  <td class="t1Line" width="90">���ǻ�</td>
		  <td class="t1Line" width="90">����</td>
		  <td class="t1Line" width="65">���ⱸ��</td>
		  <td class="t1Line" width="97">�ݳ�������</td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
        <!--����Ʈ ����-->
        <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:set var="no" scope="request" value="1"/>
	      <c:forEach var="libList" items="${rsRscLib_UserSearch}" varStatus="i" > 
			<!-- �� ��� -->
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
	          <td class="t2Line" width="45"><c:out value="${no}"/></td>
			  <td class="t3Line">&nbsp;<c:out value="${libList.bookName}"/></td> 
			  <td class="t2Line" width="90"><c:out value="${libList.publisher}"/></td> 
			  <td class="t2Line" width="90"><c:out value="${libList.author}"/></td>
			  <td class="t2Line" width="65"><c:out value="${libList.isLent}"/></td>
			  <td class="t2Line" width="80">
			    <c:if test="${libList.isLent == '������'}"><c:out value="${libList.retnPlanDate}"/></c:if>
			  </td> 
			</tr>
			<c:set var="no" scope="request" value="${no + 1}"/>
		  </c:forEach>
		  <c:if test="${no==1}">
		    <tr class="tbg3">
			  <td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
		    </tr>
		  </c:if>
		  <html:hidden property="max" value="${no - 1}"/>
		  </table>
        </div>
        <!--����Ʈ ��-->    
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(200);
	document.forms[0].searchBookName.focus();
//-->
</script>

