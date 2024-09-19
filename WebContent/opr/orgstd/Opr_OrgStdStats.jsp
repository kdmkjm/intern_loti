<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	function goCourse()
	{
		document.location.href = '${pageContext.request.contextPath}/oprOrgStd.act?task=course';
	}
	function goPlan()
	{
		document.location.href = '${pageContext.request.contextPath}/oprOrgStd.act?task=plan';
	}
	function excel()
	{
		var searchFrom = document.all.searchFrom.value;
		var searchTo = document.all.searchTo.value;
		var searchCrsType = document.all.searchCrsType.value;

		document.location.href = '${pageContext.request.contextPath}/oprOrgStd.act?task=excel&searchFrom='+searchFrom+'&searchTo='+searchTo+'&searchCrsType='+searchCrsType;
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��������û�� ��Ȳ" src="/images/operation/title_25.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form method="POST" action="oprOrgStd.act?task=list">
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
		  <td class="t1">������</td>
		  <td class="sBg"></td>
		  <td class="t1" width="39">����<br>�Ⱓ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="44">��û<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="44">����<br>��</td>
		  <td class="sBg"></td>
		  <td width="70">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td class="t1" colspan="3">��</td>
			</tr>
			<tr>
			  <td colspan="3" class="lbg3"></td>
			</tr>
			<tr>
			  <td class="t1" width="34">����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="34">�ο�</td>
			</tr>
			</table>
		  </td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">û<br>��</td>

		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>õ</td>

		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>õ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>õ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>��</td>

		  <td class="sBg"></td>
		  <td class="t1" width="30">��<br>Ÿ</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">(��)<br/>û<br>��</td>
		  <td class="sBg"></td>
		  <td class="t1" width="30">û<br>��</td>
		  <td class="t1" width="17"></td>
		</tr>
		</table>
		<table width="746" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td class="t2BgRed">��</td>
		  <td class="sBg"></td>
		  <td class="t2BgRed" width="44">${rsOpr_OrgStd.rcvRate}%</td>
		  <td class="sBg"></td>
		  <td class="t2BgRed" width="44">${rsOpr_OrgStd.passRate}%</td>
		  <td class="sBg"></td>
		  <td width="552">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td class="t2BgRed" width="34">��ȹ</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="34">${rsOpr_OrgStd.plnStdNumber}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org6430000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org5710000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4390000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4400000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4420000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4430000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4440000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org5570000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4450000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4460000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4470000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4480000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org9999999}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4360000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.org4410000}&nbsp;</td>
			  <td class="t2BgRed" width="17"></td>
			</tr>
			<tr>
			  <td colspan="99" class="lbg3"></td>
			</tr>
			<tr>
			  <td class="t2BgRed" width="34">��û</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="34">${rsOpr_OrgStd.rcvTotal}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv6430000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv5710000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4390000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4400000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4420000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4430000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4440000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv5570000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4450000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4460000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4470000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4480000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv9999999}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4360000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.rcv4410000}&nbsp;</td>
			  <td class="t2BgRed" width="17"></td>
			</tr>
			<tr>
			  <td colspan="99" class="lbg3"></td>
			</tr>
			<tr>
			  <td class="t2BgRed" width="34">����</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="34">${rsOpr_OrgStd.passTotal}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass6430000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass5710000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4390000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4400000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4420000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4430000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4440000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass5570000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4450000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4460000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4470000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4480000}&nbsp;</td>

			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass9999999}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4360000}&nbsp;</td>
			  <td class="sBg"></td>
			  <td class="t2BgRedR" width="30">${rsOpr_OrgStd.pass4410000}&nbsp;</td>
			  <td class="t2BgRed" width="17"></td>
			</tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td colspan="99" class="lbg3"></td>
		</tr>
		</table>
		<!--����Ʈ ����-->
		<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
		  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
		  <c:forEach var="list" items="${rsOpr_OrgStdList}" varStatus="i" >
			<!-- �� ��� -->
            <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
			<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
			<tr class="${lineBg}">
			  <td class="t3">&nbsp;${list.courseName}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="39">${list.eduDate}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="44">${list.rcvRate}</td>
			  <td class="sBg"></td>
			  <td class="t2" width="44">${list.passRate}</td>
			  <td class="sBg"></td>
			  <td width="535">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td class="t2" width="39">��ȹ</td>
				  <td class="sBg"></td>
				  <td class="t4" width="40">${list.eduCount}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org6430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org5710000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4390000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4400000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4420000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4440000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org5570000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4450000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4460000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4470000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4480000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org9999999}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4360000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.org4410000}&nbsp;</td>
				</tr>
				<tr>
				  <td colspan="99" class="lbg3"></td>
				</tr>
				<tr>
				  <td class="t2" width="39">��û</td>
				  <td class="sBg"></td>
				  <td class="t4" width="40">${list.rcvTotal}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv6430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv5710000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4390000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4400000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4420000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4440000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv5570000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4450000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4460000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4470000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4480000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv9999999}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4360000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.rcv4410000}&nbsp;</td>
				</tr>
				<tr>
			  <td colspan="99" class="lbg3"></td>
			</tr>
				<tr>
				  <td class="t2" width="39">����</td>
				  <td class="sBg"></td>
				  <td class="t4" width="40">${list.passTotal}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass6430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass5710000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4390000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4400000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4420000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4430000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4440000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass5570000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4450000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4460000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4470000}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4480000}&nbsp;</td>

				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass9999999}&nbsp;</td>
				  <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4360000}&nbsp;</td>
				   <td class="sBg"></td>
				  <td class="t4" width="35">${list.pass4410000}&nbsp;</td>
				</tr>
				</table>
			  </td>
			</tr>
			<tr>
			  <td colspan="99" class="lbg3"></td>
			</tr>
			<c:set var="no" scope="request" value="${i.count}"/>
		  </c:forEach>
		  <c:if test="${no eq null}">
			<tr class="tbg3" height="21">
			  <td class="t2">��ȸ�� �����Ͱ� �����ϴ�.</td>
			</tr>
			<tr>
			  <td colspan="99" class="lbg3"></td>
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
		<img src='<html:rewrite page="/images/board/btn_plan_std.gif"/>' alt="������ ����ġ �Է�" align="absmiddle" onclick="goPlan();" style="cursor:hand"/>
		<img src='<html:rewrite page="/images/board/btn_course_std.gif"/>' alt="������ ������ ��ȹ" align="absmiddle" onclick="goCourse();" style="cursor:hand"/>
		<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="���� �ٿ�ε�" align="absmiddle" onclick="excel();" style="cursor:hand"/>
	  </td>
	</tr>
	</table>
	<!--�ϴܹ�ư ���̺� ��-->
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(271);
//-->
</script>
