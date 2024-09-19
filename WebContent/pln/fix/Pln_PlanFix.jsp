<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

	function fixPlan()
	{
		if(confirm('Ȯ�������Ͻðڽ��ϱ�?'))
		{
			var planYear = document.forms[0].selPlanYear.value;
			document.location.href = "fixPlan.act?task=fix_plan&selPlanYear="+planYear;
		}
	}

	function excelDown()
	{
		var planYear = document.all.plnYear.value;
		document.location.href = "fixPlan.act?task=excel&planYear="+planYear;
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��ȹ��Ȯ��" src="/images/edu/title_04.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� ���̺� ����-->
    <html:form action='fixPlan.act?task=list'>
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr>
        <td bgcolor="#FFFFFF">
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="129" class="s1">����</td>
            <td class="sBar"></td>
            <td class="s2">
              <html:select property="selPlanYear">
			    <html:optionsCollection name="applyYearCode" property="beanCollection" />
			  </html:select>
            </td>
            <td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" /></td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
    </html:form>
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
          <td class="t1Line" width="50">��ȣ</td>
          <td class="t1">������</td>
          <td class="t1" width="140">�������</td>
          <td class="t1" width="80">�ϼ�</td>
          <td class="t1" width="80">ȸ��</td>
          <td class="t1" width="97">�����ο�</td>
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
      <td width="746">
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top">
          <!--����Ʈ ����-->
			<div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;">
			  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
				<c:forEach var="survList" items="${rsPln_PlanFixList}" varStatus="i" >
				  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
       		      <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>																
				  <tr class="${lineBg }">
                    <td class="t2Line" width="50"><c:out value="${i.count}"/></td>
                    <td class="t3Line">&nbsp;<c:out value="${survList.crsClumpName}"/></td>
                    <td class="t2Line" width="140"><c:out value="${survList.eduTarget}"/></td>
                    <td class="t2Line" width="80"><c:out value="${survList.dayCount}"/></td>
                    <td class="t2Line" width="80"><c:out value="${survList.courseCount}"/></td>
                    <td class="t2Line" width="80"><c:out value="${survList.stdNumber}"/></td>
                  </tr>
				  <c:set value="${i.count}" var="count"></c:set>
				</c:forEach>
				<input type="hidden" name="plnYear" id="plnYear">
			  </table>
			</div>
   			<!--�Խù� ��� ��-->
            <!--����Ʈ ��-->
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
        <img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="���� �ٿ�ε�" align="absmiddle" onclick="excelDown();" style="CURSOR: hand" />
      </td>
      <td align="right">
        <%-- c:if test="${isFix==0}" --%>
          <img src='<html:rewrite page="/images/board/btn_send2.gif"/>'  alt="�������� Ȯ��" align="absmiddle" onclick="fixPlan();" style="CURSOR: hand"/>
        <%--/c:if --%>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(182);
	searchList('${key}');
	document.all.plnYear.value = document.forms[0].selPlanYear.value;
//-->
</script>
