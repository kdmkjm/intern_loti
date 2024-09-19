<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
<!--
	function stats()
	{
		var frm = document.forms[0];
		frm.action = "oprStats.act?task=category";
		frm.submit();
	}
	function ExcelDownload()
	{
		size_w = 100;
  		size_h = 100;

  		var url = '<html:rewrite page="/oprStats.act';
  		url += '?task=categoryExcel';
  		url += '&searchCrsType=' + document.forms[0].searchCrsType.value;
  		url += '&searchFrom=' + document.forms[0].searchFrom.value;
  		url += '&searchTo=' + document.forms[0].searchTo.value;
  		url += '"/>';
  		target = '_blank';
		openWinSetPo(url, target, '', size_w, size_h);
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ��Ȳ ���" src="/images/operation/title_20.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� -->
	<html:form method="POST" action="oprStats.act?task=category">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
	  <tr>
		<td width="89" class="s1">�Ⱓ</td>
		<td class="sBar"></td>
		<td class="s2" width="250">
		  <html:text property="searchFrom" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchFrom);">
		  <html:text property="searchTo" style="width:75px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchTo);">
		</td>
		<td class="sBar"></td>
		<td width="89" class="s1">�з�</td>
		<td class="sBar"></td>
		<td class="s2">
		  <html:select property="searchCrsType">
			<html:optionsCollection name="crsTypeCode" property="beanCollection" />
		  </html:select>
		</td>
		<td width="60">
		  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand" align="absmiddle"/>
		</td>
	  </tr>
	  </table>
	</html:form>
	<!--�˻� ��-->
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />�ҼӺ�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" width="42">����</td>
		  <td class="sBg"></td>
		  <td class="t1">��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">û��</td>

		  <td class="sBg"></td>
		  <td class="t1" width="40">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">��õ</td>

		  <td class="sBg"></td>
		  <td class="t1" width="40">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">��õ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">��õ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">�ܾ�</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">��Ÿ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="56">(��)û��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="40">û��</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_AssignList}" varStatus="i" >
			<c:if test="${fn:substring(list.gubun,0,1) == '1'}">
				<c:set var="gubun" value="��ü"/>
			</c:if>
			<c:if test="${fn:substring(list.gubun,0,1) == '2'}">
				<c:set var="gubun" value="����"/>
			</c:if>
			<c:if test="${fn:substring(list.gubun,0,1) == '3'}">
				<c:set var="gubun" value="����"/>
			</c:if>
			<tr class="">
			  <td class="t2" width="42">${gubun }</td>
			  <td class="sBg"></td>
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignChungBuk}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignCheongju}</td>

			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignChungJu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignJaeChon}</td>

			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignBoUn}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignOkChon}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignYoungDong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignJungPyong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignJinChon}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignGoeSan}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignUmSung}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignDanYang}</td>
			  <td class="sBg"></td>

			  <td class="t2" width="40">${list.assignEtc}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="56">${list.assignChongJu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="40">${list.assignChongWon}</td>
			</tr>
			<tr>
			  <td colspan="33" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />���޺�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">4���̻�</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">5��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">6��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">7��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">8��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">9��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">10��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">��������</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="67">��Ÿ</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_RankList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank4Geubup}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank5Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank6Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank7Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank8Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank9Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rank10Geub}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rankYeonGuJiDo}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rankByeolJeong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="67">${list.rankEtc}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
		  <tr class="tbg3">
			<td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
		  </tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />���ĺ�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">�������</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">��ȸ����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">�ü�</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">ȯ��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">�����</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">�����ǹ�</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="65">��Ÿ</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_JobList}" varStatus="i" >
		    <!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobHaengJeong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobSeMu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobJeongBoTongSin}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobSaHoiBokJi}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobSiSeol}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobHwanKyeong}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobNongSuSan}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobBoGeonEuiMu}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobGiNeung}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="65">${list.jobEtc}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
		    <tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />���ɺ�</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="70">���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">20������</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">21~30��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">31~40��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">41~50��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">51~60��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="99">61���̻�</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_AgeList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="70">${list.ageavg}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age20down}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age21to30}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age31to40}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age41to50}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age51to60}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="99">${list.age61up}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="count" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${count==null}">
			<tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		</div>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
	<table>
	<tr>
	  <td height="5"></td>
	</tr>
	<tr>
	  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />�ٹ������</td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--���̺� ��� ����-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1">��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">���</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">5������</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">6~10��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">11~15��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">16~20��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">21~25��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">26~30��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">31���̻�</td>
		  <td class="sBg"></td>
		  <td class="t1" width="75">��Ÿ</td>
		  <td width="17"></td>
		</tr>
		</table>
		<!--���̺� ��� ��-->
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsStats_InidateList}" varStatus="i" >
			<!-- �� ��� -->
			<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t2">${list.total}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidateavg}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate5down}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate6to10}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate11to15}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate16to20}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate21to25}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate26to30}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidate31up}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="75">${list.inidateunknown}</td>
			</tr>
			<tr>
			  <td colspan="31" class="lbg3"></td>
			</tr>
			<c:set var="countini" scope="request" value="${i.count + 1}"/>
		  </c:forEach>
		  <c:if test="${countini==null}">
			<tr class="tbg3">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
		  </c:if>
		  </table>
		<!--����Ʈ ��-->
	  </td>
	</tr>
	</table>
  </td>
</tr>
<tr>
  <td height="5"></td>
</tr>
<tr>
	<td>
		<c:if test="${count != null }">
		<img src="/images/board/btn_excel.gif" style="cursor:hand" alt="������ ��Ȳ ��� ���� �ٿ�ε�" onclick="ExcelDownload()"/>
		</c:if>
		<c:if test="${count == null }">
		<img src="/images/board/btn_excel_off.gif" alt="������ ��Ȳ ��� ���� �ٿ�ε�"/>
		</c:if>
	</td>
</tr>
</table>