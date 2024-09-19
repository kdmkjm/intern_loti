<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(185);
	}
	function doDelete(num)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/rscBook.act?task=delete&facsNo='+num;
			document.location.href = url;
		}
		else
		{
			return;
		}
	}
	
	function inBook(num)
	{
		var txBookSeq = num;
		window.open('<html:rewrite page="/rscBook.act?task=inBook&txBookSeq=' + txBookSeq + '"/>', 'popup', 'scrollbars=no, menubar=no, width=650, height=301, status=yes top=150, left=150');
	}
	
	function outBook(num)
	{
		var txBookSeq = num;
		window.open('<html:rewrite page="/rscBook.act?task=outBook&txBookSeq=' + txBookSeq + '"/>', 'popup', 'scrollbars=no, menubar=no, width=650, height=301, status=yes top=150, left=150');
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="���� ����" src="/images/resources/title_02.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<form method="POST"  action='<html:rewrite page="/rscBook.act?task=list"/>'>
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td class="s1" width="75">�����</td>
		<td class="sBg" width="1"></td>
		<td class="s2">									
		  <input type="text" name="searchKeyword" title="�����" class="inputText" value="${searchKeyword}" />
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand" align="absmiddle"/>
		</td>
	  </tr>
	  </table>
	</form>
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
		  <td class="t1">�����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="59">�԰�</td>
		  <td class="sBg"></td>
		  <td class="t1" width="59">���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="59">���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="200">����� ����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="135">ó��</td>
		  <td class="t1" width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:set var="no" scope="request" value="1"/>
		  <c:forEach var="list" items="${rsRscBookList}" varStatus="i" >
		    <!-- �� ��� -->
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t3">
				<a href='<html:rewrite page="/rscBook.act?task=modify&txBookSeq=${list.txBookSeq}"/>'">
				  &nbsp;<u><c:out value="${list.txBookName}"/></u>
				</a>
			  </td>
			  <td class="sBg"></td>
			  <td class="t4" width="59"><fmt:formatNumber value="${list.stockIn}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t4" width="59"><fmt:formatNumber value="${list.stockOut}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t4" width="59"><fmt:formatNumber value="${list.stockTotal}" pattern="#,##0"/>&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t3" width="200">&nbsp;<c:out value="${list.connCrs}"/></td>
			  <td class="sBg"></td>
			  <td class="t2" width="135">
				<img src='<html:rewrite page="/images/board/btn_history.gif"/>' align="absmiddle" alt="�԰�" onclick="location.href='<html:rewrite page="/rscBook.act?task=history&txBookSeq=${list.txBookSeq}"/>'" style="cursor:hand"/>
				<img src='<html:rewrite page="/images/board/btn_in.gif"/>'  align="absmiddle" alt="�԰�" onClick="inBook(${list.txBookSeq});" style="cursor:hand"/>
				<img src='<html:rewrite page="/images/board/btn_out.gif"/>' align="absmiddle" alt="���" onClick="outBook(${list.txBookSeq});" style="cursor:hand"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="15" class="lbg3"></td>
			</tr>
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
	  </td>
	</tr>
	</table>
	<!--�ϴܹ�ư ���̺� ����-->
	<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	<tr valign="bottom"> 
	  <td align="right">
		<img src='<html:rewrite page="/images/board/btn_book_up.gif"/>' alt="������"  align="absmiddle" style="cursor:hand" onclick="location.href='<html:rewrite page="/rscBook.act?task=create"/>'"/>
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(185);
	document.forms[0].searchKeyword.focus();
//-->
</script>