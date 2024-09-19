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
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(185);
	}
	function ozReport()
	{
		var  searchCrsType = document.all.searchCrsType.value; 

		var  searchFromDate = document.all.searchFromDate.value;
		var  searchToDate = document.all.searchToDate.value;
		
		window.open('<html:rewrite page="/ozMenu.act"/>?report=eduplan&searchCrsType='+ searchCrsType +'&searchFromDate=' +  searchFromDate+'&searchToDate=' +  searchToDate,'popup', 'scrollbars = no, resizable=yes,menubar = no, width = 710 height =550, status = yes');
	}
	
	function doSearch(frm)
	{
		if(frm.searchFromDate.value == "" || frm.searchToDate.value == "")
		{
			alert("�Ⱓ�� �Է����ּ���.");
			return;
		}
		frm.submit();
	}
		
	function excel()
	{
		var searchFromDate = document.all.searchFromDate.value;
		var searchToDate = document.all.searchToDate.value;
		var searchCrsType = document.all.searchCrsType.value;
		var searchType = document.all.searchType.value;
		
		document.location.href = '${pageContext.request.contextPath}/oprPassAcom.act?task=excelDown&searchFromDate='+searchFromDate+'&searchToDate='+searchToDate+'&searchCrsType='+searchCrsType+'&searchType='+searchType;
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�Ⱓ���̼���Ȳ" src="/images/operation/title_36.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<!--�˻� -->
	<html:form method="POST" action="oprPassAcom.act?task=list">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr> 
		<td width="69" class="s1">�Ⱓ</td>
		<td class="sBar"></td>
		<td class="s2" width="180">
		  <html:text property="searchFromDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchFromDate);">
		  ~&nbsp;<html:text property="searchToDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchToDate);">
		</td>
		<td class="sBar"></td>
		<td width="69" class="s1">�з�</td>
		<td class="sBar"></td>
		<td class="s2" width="180">
		  <html:select property="searchCrsType">
			<html:optionsCollection name="crsTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td class="sBar"></td>
		<td width="69" class="s1">����</td>
		<td class="sBar"></td>
		<td class="s2">
		  <html:select property="searchType">
			<html:option value="001">��ȹ/�̼�</html:option>
			<html:option value="002">���</html:option>
			<html:option value="003">����</html:option>
		  </html:select>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0]);" style="cursor:hand" align="absmiddle"/>
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
	<html:form method="POST" action="oprPassAcom.act?task=excelDown">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	  <tr>
		<td>
		  <!--���̺� ��� ����-->
		  <c:if test="${searchType eq '001'}">
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="44">��ȣ</td>
			  <td class="sBg"></td>
			  <td class="t1">������</td>
			  <td class="sBg"></td>
			  <td class="t1" width="89">�����Ⱓ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">��ȹ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">��û</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">�̼�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">���̼�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="64">�̼���</td>
			  <td width="17"></td>
			</tr>
			</table>
			<c:if test="${rsOpr_PassAcom ne null}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t2BgRed"><b>��&nbsp;</b></td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.planCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.notComplyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="64"><fmt:formatNumber value="${rsOpr_PassAcom.complyRate}" pattern="#,##0"/>%&nbsp;</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  <tr>
				<td colspan="99" class="lbg3"></td>
			  </tr>
			  </table>
			</c:if>
		  </c:if>
		  <c:if test="${searchType eq '002'}">
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="20">��<br>ȣ</td>
			  <td class="sBg"></td>
			  <td class="t1">������</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">����<br>�Ⱓ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">��û</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">�̼�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">���</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">û��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">��õ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">û��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">��õ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">��õ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">�ܾ�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">Ÿ�õ�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="28">��Ÿ</td>
			  <td width="17"></td>
			</tr>
			</table>
			<c:if test="${rsOpr_PassAcom ne null}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t2BgRed"><b>��&nbsp;</b></td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org6430000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4360000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4390000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4400000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4410000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4420000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4430000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4440000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4450000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4460000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4470000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org4480000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org5570000}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.orgOther}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="28"><fmt:formatNumber value="${rsOpr_PassAcom.org9999999}" pattern="#,##0"/>&nbsp;</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  <tr>
				<td colspan="99" class="lbg3"></td>
			  </tr>
			  </table>
			</c:if>
		  </c:if>
		  <c:if test="${searchType eq '003'}">
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="20">��<br>ȣ</td>
			  <td class="sBg"></td>
			  <td class="t1">������</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">����<br>�Ⱓ</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">��û</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">�̼�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">2��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">3��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">4��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">5��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">6��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">7��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">8��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">9��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">���</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">����<br>����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">���</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">��Ÿ</td>
			  <td width="17"></td>
			</tr>
			</table>
			<c:if test="${rsOpr_PassAcom ne null}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t2BgRed"><b>��&nbsp;</b></td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="39"><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank2}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank3}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank4}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank5}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank6}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank7}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank8}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rank9}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankGN}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankYGJD}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankBJ}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankGY}" pattern="#,##0"/>&nbsp;</td>
				<td class="sBg"></td>
				<td class="t2BgRedR" width="34"><fmt:formatNumber value="${rsOpr_PassAcom.rankETC}" pattern="#,##0"/>&nbsp;</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  <tr>
				<td colspan="99" class="lbg3"></td>
			  </tr>
			  </table>
			</c:if>
		  </c:if>
		  <!--���̺� ��� ��-->
		  <!--����Ʈ ����-->
		  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
			<c:if test="${searchType eq '001'}">
			  <c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
				<!-- �� ��� -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="44">${i.count}</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;${list.courseName}</td>
				  <td class="sBg"></td>
				  <td class="t2" width="89">${list.eduDate}</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.planCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.applyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.complyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.notComplyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="64"><fmt:formatNumber value="${list.complyRate}" pattern="#,##0"/>%&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="31" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			</c:if>
			<c:if test="${searchType eq '002'}">
			  <c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
				<!-- �� ��� -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="20">${i.count}</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;${list.courseName}</td>
				  <td class="sBg"></td>
				  <td class="t2" width="39">${list.eduDate}</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39">${list.applyCount}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39">${list.complyCount}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org6430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4360000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4390000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4400000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4410000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4420000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4440000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4450000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4460000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4470000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org4480000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org5570000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.orgOther}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="28">${list.org9999999}&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="99" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			</c:if>
			<c:if test="${searchType eq '003'}">
			  <c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
				<!-- �� ��� -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
				  <td class="t2" width="20">${i.count}</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;${list.courseName}</td>
				  <td class="sBg"></td>
				  <td class="t2" width="39">${list.eduDate}</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39"><fmt:formatNumber value="${list.applyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="39"><fmt:formatNumber value="${list.complyCount}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank2}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank3}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank4}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank5}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank6}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank7}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank8}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rank9}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankGN}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankYGJD}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankBJ}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankGY}" pattern="#,##0"/>&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="34"><fmt:formatNumber value="${list.rankETC}" pattern="#,##0"/>&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="99" class="lbg3"></td>
				</tr>
				<c:set var="no" scope="request" value="${i.count}"/>
			  </c:forEach>
			</c:if>
			<html:hidden property="max" value="${no}"/>
			<c:if test="${no eq null}">
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
	  <!--�ϴܹ�ư ���̺� ����-->
	  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	  <tr valign="bottom">
		<td align="right">
		  <c:if test="${searchType eq '001'}">
		    <img src='<html:rewrite page="/images/operation/btn23.gif"/>' align="absmiddle" alt="�оߺ�����" style="cursor:hand" onclick="ozReport();"/>
		  </c:if> 
          <img src='<html:rewrite page="/images/operation/btn24.gif"/>' align="absmiddle" alt="����������" style="cursor:hand" onclick="excel();" />
		</td>
	  </tr>
	  </table>
	</html:form>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(215);
//-->
</script>