<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>
<script language="JavaScript">
<!--
window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(200);
}

//�˻���ư 
function getSreach(frm){
	searchFromDate = frm.searchFromDate.value;
	searchToDate   = frm.searchToDate.value;
	if(searchFromDate.substring(0,7) == searchToDate.substring(0,7)){
		frm.submit();
	}else{
		alert("���� �⡤�� ���� ��ȸ�� �����մϴ�. ");
	}
}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="SMS �߼���Ȳ" src="/images/resources/title_08.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <!--�˻� ���̺� ����-->
	<html:form method="post" action="/rscSMSStatusList.act?task=list">
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="99" class="s1">�� ��</td>
            <td class="sBar"></td>
            <td class="s2" width="199"> 
			  <html:select property="searchType" >
			  <html:optionsCollection name="p_sms_gbn" property="beanCollection" />
			  </html:select>
            </td>
            <td class="sBar"></td>
            <td width="99" class="s1">�� ¥</td>
            <td class="sBar"></td>
            <td class="s2"> 
			  <html:text property="searchFromDate" style="width:65px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchFromDate, 'yyyy-mm-dd');">
				~ <html:text property="searchToDate" style="width:65px; IME-MODE:disabled" maxlength="10" onkeydown="key_num_minus()"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchToDate, 'yyyy-mm-dd');">
			</td>
            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" style="cursor:hand" onclick="getSreach(document.forms[0]);"/></td>
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
  <td height="15">&nbsp; </td>
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
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
        <tr> 
          <td class="t1" width="69">����</td>
          <td class="sBg"></td>
          <td class="t1" width="109">��û�Ͻ�</td>
          <td class="sBg"></td>
          <td class="t1" width="49">�߽���</td>
          <td class="sBg"></td>
          <td class="t1" width="79">�߽Ź�ȣ</td>
          <td class="sBg"></td>
          <td class="t1">�߼۹���</td>
          <td class="sBg"></td>
          <td class="t1" width="55">�߼۰Ǽ�</td>
		  <td class="sBg"></td>
          <td class="t1" width="55">�����Ǽ�</td>
		  <td class="sBg"></td>
          <td class="t1" width="55">���аǼ�</td>
          <td width="17"></td>
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
      <td class="lbg2"></td>
      <td width="746"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"> 
            <!--����Ʈ ����-->
			<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			  <c:set var="no" scope="request" value="1"/>
			  <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0"> 
			  <c:forEach var="rscSMSStatusList" items="${rsRscSMSStatusList}" varStatus="i" >
				<!-- �� ��� -->
				<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr class="${lineBg}">
                  <td class="t2" width="69"><c:out value="${rscSMSStatusList.code_name}"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="109">${loti:dateFormatSend(rscSMSStatusList.send_dttm)}</td>
                  <td class="sBg"></td>
                  <td class="t2" width="49"><c:out value="${rscSMSStatusList.from_name}"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="79">${loti:phoneFormat(rscSMSStatusList.from_tel)}</td>
                  <td class="sBg"></td>
                  <td class="t3">&nbsp;<a href="<html:rewrite page="/rscSMSStatusList.act"/>?task=info&send_no=${rscSMSStatusList.send_no}&mssqlTableNm=${rscSMSStatusList.mssqlTableNm}" title="${rscSMSStatusList.courseName}"><u><c:out value="${rscSMSStatusList.msg}"/></u></a></td>
                  <td class="sBg"></td>
                  <td class="t2" width="55"><c:out value="${rscSMSStatusList.chk_cnt}"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="55"><c:out value="${rscSMSStatusList.ok_cnt}"/></td>
                  <td class="sBg"></td>
                  <td class="t2" width="55"><c:out value="${rscSMSStatusList.fal_cnt}"/></td>
                </tr>
                <tr><td class="lbg3" colspan="15"></td></tr>
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
      </td>
      <td class="lbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg1"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td>&nbsp;</td>
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(200);
//-->
</script>