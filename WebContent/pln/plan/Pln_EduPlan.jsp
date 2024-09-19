<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript" src='<html:rewrite page="/script/Pln_EduPlan.js"/>'></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��ȹ��" src="/images/edu/title_03.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='eduPlan.act?task=list'>
      <input type="hidden" name="planYear" id="planYear" value="${selPlanYear}"/>
      <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
		  <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="74" class="s1">����</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="89">
			  <html:select property="selPlanYear">
			    <html:optionsCollection name="applyYearCode" property="beanCollection" />
			  </html:select>
			</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td width="74" class="s1">�з�</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2" width="189">
			  <html:select property="selCrsType">
			    <html:optionsCollection name="crsTypeSearch" property="beanCollection" />
			  </html:select>
			</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td width="74" class="s1">������</td>
            <td bgcolor="#E6E6E6" width="1"></td>
            <td class="s2"><html:text property="searchKeyword" style="width:150px;"/></td>
			<td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" /></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--�˻� ���̺� ��-->
	</html:form>
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
          <td class="t1Line" width="40"><a href="#" onclick="checkAll();"><u>����</u></a></td>
          <td class="t1Line" width="35">��ȣ</td>
          <td class="t1Line">������</td>
          <td class="t1Line" width="105">�������</td>
          <td class="t1Line" width="60">�ϼ�</td>
          <td class="t1Line" width="60">ȸ��</td>
          <td class="t1Line" width="50">����<br>�ο�</td>
          <td class="t1Line" width="50">����<br>�ο�</td>
          <td class="t1Line" width="67">ó��</td>
        </tr>
        </table>
      </td>
      <td class="lbg"></td>
    </tr>
    </table>
    <!--���̺� ��� ��-->
  </td>
</tr>
<tr>
  <td>
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr>
	  <td class="lbg"></td>
      <td>
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top">
<!--����Ʈ ����-->
<div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;">
<script type="text/javascript">div_size(215);</script>				
<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
<c:forEach var="survList" items="${rsPln_EduPlanList}" varStatus="i" ><c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if><c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>																	
  <tr class="${lineBg}">
		<td class="t2Line" width="40"><input type="checkbox" name="checkbox"  value="${survList.crsClumpCode}"></td>
		<td class="t2Line" width="35"><c:out value="${i.count}"/></td>
		<td class="t3Line">&nbsp;<c:out value="${survList.crsClumpName}"/></td>
		<td class="t2Line" width="105">&nbsp;<c:out value="${survList.eduTarget}"/></td>
		<td class="t2Line" width="60">&nbsp;<c:out value="${survList.dayCount}"/></td>
		<td class="t2Line" width="60">&nbsp;<c:out value="${survList.courseCount}"/></td>
		<td class="t2Line" width="50">&nbsp;<c:out value="${survList.stdNumber}"/></td>
		<td class="t2Line" width="50">&nbsp;<c:out value="${survList.surveyStdNb}"/></td>
		<td class="t2Line" width="50">
			<c:if test="${isFix == 0}"><img src='<html:rewrite page="/images/board/btn_modify.gif"/>' width="34" height="18" align="absmiddle" alt="����" onclick="modify('${survList.crsClumpCode}','${survList.isCyber}');" style="CURSOR: hand" /></c:if>
			<c:if test="${isFix > 0}"><img src='<html:rewrite page="/images/board/btn_modify.gif"/>' width="34" height="18" align="absmiddle" alt="����" onclick="modify('${survList.crsClumpCode}','${survList.isCyber}');" style="CURSOR: hand" /></c:if>
		</td>
	</tr>
	<input type="hidden" name="crsClumpCd" id="crsClumpCd" value="${survList.crsClumpCode}"><input type="hidden" name="type1" id="type1" value="${survList.crsType1}" ><c:set value="${i.count}" var="count"/><c:set value="${total_day + survList.dayCount}" var="total_day"/><c:set value="${total_crs + survList.courseCount}" var="total_crs"/><c:set value="${total_std + survList.stdNumber}" var="total_std"/>
</c:forEach>
<input type="hidden" name="max" id="max" value="${count}"><input type="hidden" name="searchYear">
</table>
</div>
<!--����Ʈ ��-->
			<c:if test="${count>0}">
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
		        <td class="t2BgRedLine" width="76">��</td>
		        <td class="t2BgRedLine" width=""><fmt:formatNumber value="${count}" pattern="#,##0"/></td>
		        <td class="t2BgRedLine" width="60">&nbsp;<!--<fmt:formatNumber value="${total_day}" pattern="#,##0"/>--></td>
		        <td class="t2BgRedLine" width="60"><fmt:formatNumber value="${total_crs}" pattern="#,##0"/></td>
		        <td class="t2BgRedLine" width="50"><fmt:formatNumber value="${total_std}" pattern="#,##0"/></td>
		        <td class="t2BgRedLine" width="50">&nbsp;</td>
		        <td class="t2BgRedLine" width="67">&nbsp;</td>
	          </tr>
	          </table>
            </c:if>
    		<!--�Խù� ��� ��-->
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
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom">
      <td>
        <c:if test="${isFix == 0}">
          <c:if test="${sysMgr == 'Y'}">
            <img src='<html:rewrite page="/images/board/btn_import2.gif"/>' width="116" height="25" align="absmiddle" alt="�������簡������" onclick="addSurv();" style="CURSOR: hand"/>
          </c:if>
          <img src='<html:rewrite page="/images/board/btn_new_up.gif"/>' alt="���հ��� �űԵ��" align="absmiddle"  onclick="create();" style="CURSOR: hand"/>
          <img src='<html:rewrite page="/images/board/btn_new_cyberup.gif"/>' alt="���̹����� �űԵ��" align="absmiddle"  onclick="addCyber();" style="CURSOR: hand"/>
        </c:if>
        <c:if test="${isFix > 0}">
          <c:if test="${sysMgr == 'Y'}">
            <img src='<html:rewrite page="/images/board/btn_import2_off.gif"/>' width="116" height="25" align="absmiddle" alt="�������簡������" />
          </c:if>
          <img src='<html:rewrite page="/images/board/btn_new_up.gif"/>' alt="���հ��� �űԵ��" align="absmiddle"  onclick="create();" style="CURSOR: hand"/>          <img src='<html:rewrite page="/images/board/btn_new_cyberup.gif"/>' alt="���̹����� �űԵ��" align="absmiddle"  onclick="addCyber();" style="CURSOR: hand"/>
        </c:if>
      </td>
      <td align="right">
        <img src='<html:rewrite page="/images/board/btn_print_process.gif"/>' width="72" height="25" alt="�����μ�" align="absmiddle" style="CURSOR: hand" onclick="ozReport('1');"/>
		<img src='<html:rewrite page="/images/board/btn_print2.gif"/>' width="147" height="25" alt="������ �����Ʒð�ȹ �μ�" align="absmiddle"  style="CURSOR: hand" onclick="ozReport('2')"/>
	  </td>
    </tr>
    </table>
  </td>
</tr>
</table>
<form name="toFrm">
<input type="hidden" name="report">
<input type="hidden" name="selPlanYear1">
<input type="hidden" name="selCrsType1">
<input type="hidden" name="check_array1"><!-- ���հ��� -->
<input type="hidden" name="check_array2"><!-- ���̹����� -->
</form>
<script type="text/javascript">
<!--
	searchList('${key}');
	document.all.searchYear.value = document.all.selPlanYear.value;
	document.forms[0].searchKeyword.focus();
//-->
</script>