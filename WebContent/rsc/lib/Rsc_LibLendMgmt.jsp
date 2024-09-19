<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript" src='<html:rewrite page="/script/Rsc_LibLendMgmt.js"/>'></script>
<script type="text/javascript">
	// ������ ��ȸ
	function popUser()
	{
		var userName = document.all.lendUser.value;
		var searchTrue = false;

		if(userName == "")
			searchTrue = false;
		else
			searchTrue = "popup";

		window.open('<html:rewrite page="/cmnUser.act?task=list&getType=parent&type=lend&searchTrue=' + searchTrue + '&searchKeywordUserName=' + userName + '"/>', 'lendUser', 'scrollbars=no, menubar=no, width=400, height=361, status=yes');
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�������� - ����/�ݳ�" src="/images/resources/title_03.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="POST" action="/rscLib.act?task=list&type=true">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td class="s1" width="74">�����з�</td>
		<td class="sBg"></td>
		<td class="s2" width="149">
		  <html:select property="searchKeywordBookType1" style="width:132px">
			<html:optionsCollection name="libTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td class="sBg"></td>
		<td class="s1" width="74">û����ȣ</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordReqNo" style="width:130" /></td>
		<td class="sBg"></td>
		<td class="s1" width="74">������</td>
		<td class="sBg"></td>
		<td class="s2" colspan="7"><html:text property="searchKeywordBookName" style="width:180px"/></td>
	  </tr>
	  <tr>
		<td colspan="13" class="lbg3"></td>
	  </tr>
	  <tr> 
		<td class="s1" width="74">���ǻ�</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordPublisher" style="width:130" /></td>
		<td class="sBg"></td>
		<td class="s1" width="74">����</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordAuthor" style="width:130" /></td>
		<td class="sBg"></td>
		<td class="s1" width="74">������</td>
		<td class="sBg"></td>
		<td class="s2" width="149"><html:text property="searchKeywordUserName" style="width:130" /></td>
		<td align="right">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSubmit(document.forms[0]);" style="cursor:hand" align="absmiddle"/>
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
	<html:form method="POST" action="/rscLib.act?task=lend">
	  <html:hidden property="searchBookType"/>
	  <html:hidden property="searchReqNo"/>
	  <html:hidden property="searchBookName"/>
	  <html:hidden property="searchPublisher"/>
	  <html:hidden property="searchAuthor"/>
	  <html:hidden property="searchUserName"/>
	  <html:hidden property="bookCode"/>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--���̺� ��� ����-->
		  <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		  <tr> 
			<td class="t1Line" width="35">����</td>
			<td class="t1Line" width="65">û����ȣ</td>
			<td class="t1Line">������</td>
			<td class="t1Line" width="90">���ǻ�</td>
			<td class="t1Line" width="80">����</td>
			<td class="t1Line" width="70">������</td>
			<td class="t1Line" width="80">�ݳ�������</td>
			<td class="t1Line" width="81">���ⱸ��</td>
		  </tr>
		  </table>
		  <!--���̺� ��� ��-->
          <!--����Ʈ ����-->
          <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:set var="no" scope="request" value="1"/>
	        <c:forEach var="libList" items="${rsRscLibList}" varStatus="i" > 
			  <!-- �� ��� -->
			  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			  <tr class="${lineBg}">
				<html:hidden property="arrayBookCode" value="${libList.bookCode}"/>
				<html:hidden property="arrayLendDate" value="${libList.lendDate}"/>
				<html:hidden property="arrayLendType" value="${libList.isLent}"/>
				<html:hidden property="arraySelectLend" value="false"/>
	            <td class="t2Line" width="35"><html:checkbox property="arrayLend"/></td>
				<td class="t2Line" width="65">&nbsp;<c:out value="${libList.reqNo}"/></td> 
				<td class="t3Line">&nbsp;<a href='#' onclick="modifyLib(${libList.bookCode})"><u><c:out value="${libList.bookName}"/></u></a></td> 
				<td class="t2Line" width="90">&nbsp;<c:out value="${libList.publisher}"/></td> 
				<td class="t2Line" width="80">&nbsp;<c:out value="${libList.author}"/></td> 
				<td class="t2Line" width="70">&nbsp;<c:if test="${libList.isLent == '������'}"><c:out value="${libList.lendUserName}"/></c:if></td> 
				<td class="t2Line" width="80">&nbsp;<c:if test="${libList.isLent == '������'}"><c:out value="${libList.retnPlanDate}"/></c:if></td> 
				<td class="t2Line" width="64">&nbsp;<c:out value="${libList.isLent}"/></td> 
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
          <!--�߰� �κ� ����-->                
          <table width="746" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
			<td width="75" class="t2BgRedLine">������</td>
			<td width="120" class="t2BgRedLine"> 
			  <input type="text" name="lendUser" title="������" style="width:80px;">
			  <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle" alt="������ �˻�" onClick="popUser();" style="cursor:hand"/> 
			</td>
			<td width="75" class="t2BgRedLine">�Ҽ�</td>
			<td width="145" class="t2BgRedLine"><input type="text" name="lendPosition" title="�Ҽ�" style="width:130px" />	</td>
			<td width="75" class="t2BgRedLine">����ó</td>
			<td class="t2BgRedLine" width="165"><input type="text" name="lendPhone" title="����ó" style="width:150px" /></td>
			<td class="t2BgRedLine">
			  <html:hidden property="arrayBookCode" value="${libList.bookCode}"/>
			  <html:hidden property="lendType"/>
			  <img src='<html:rewrite page="/images/board/btn_borrow.gif"/>' align="absmiddle" alt="����" onclick="doLend(document.forms[1], 'startLend');" style="cursor:hand"/> 
			  <img src='<html:rewrite page="/images/board/btn_return.gif"/>' align="absmiddle" alt="�ݳ�" onclick="doLend(document.forms[1], 'endLend');" style="cursor:hand"/>
			</td>
          </tr>
		  </table>
          <!--�߰� �κ� ��-->
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--�ϴܹ�ư ���̺� ����-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom"> 
	  <td>
		<img src='<html:rewrite page="/images/board/btn_book_search.gif"/>' align="absmiddle" alt="������Ȳ��ȸ" onclick="lendLib();" style="cursor:hand"/>
		<img src='<html:rewrite page="/images/board/btn_book_sum.gif"/>' align="absmiddle" alt="�����з��� ���" onclick="cateLib();" style="cursor:hand"/> 
		<img src='<html:rewrite page="/images/board/btn_book_up2.gif"/>' align="absmiddle" alt="�������"  onclick="newLib();" style="cursor:hand"/> 
	  </td>
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_reset.gif"/>' align="absmiddle" alt="�ʱ�ȭ" onclick="clearText();" style="cursor:hand">
	  </td>
	</tr>
	</table>
	<!--�ϴܹ�ư ���̺� ��-->
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(245);
	document.forms[0].searchKeywordBookName.focus();
//-->
</script>

