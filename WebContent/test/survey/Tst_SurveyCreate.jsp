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
<script language="JavaScript">
<!--
	window.name = "Survey_Create";

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	
	
  
  function newSurvey()
  {
 	// �������� ��� Ȯ��
	var flag = confirm('���������� �������࿡�� �����Ͻðڽ��ϱ�?');
	if(flag){
		var size_w = 790;
  		var size_h = 700;
  		
  		var url = '/tstSurvey.act?task=selectServItemBank';
  		var target = '_blank';
		window.open(url, target, "width="+size_w+", height="+size_h+", scrollbars=yes, toolbar=no, menubar=no, location=no");
	}
	else{
  		document.location.href = 'tstSurvey.act?task=insertForm' ;
  	} 
  }
  
  function delSurvey(surveyno)
  {	
    var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
  	
		if(del_confirm == true)
		{
  		document.location.href = 'tstSurvey.act?task=delete&surveyno='+surveyno ; 
  	}
  	else
		{
			return;
		}
  }
  
  function modSurvey(surveyno)
  {
  	document.location.href = 'tstSurvey.act?task=modify&surveyno='+surveyno ; 
  }
  
  function viewSurvey(surveyno)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/tstSurvey.act?task=preview&popflag=pop&surveyno='+surveyno+'"/>', 'survey', 'scrollbars=yes, menubar=no, width=667, height=600, status=yes top='+wint+', left='+winl);
	}
	
	function resultSurvey(surveyno)
	{
		if(surveyno == "")
		{
			alert("�ش缳���� �������� �ʽ��ϴ�.")
			return;
		}
		document.location.href ='<html:rewrite page="/tstSatis.act?task=result&surveyno='+surveyno+'&coursecode="/>';
	}
	
	function showItemBankMgmt(){
		var size_w = 790;
  		var size_h = 700;
  		
  		var url = '/tstSurvey.act?task=modifyServItemBankForm';
  		var target = '_blank';
		window.open(url, target, "width="+size_w+", height="+size_h+", scrollbars=yes, toolbar=no, menubar=no, location=no");
	}
  
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ �ۼ�" src="/images/poll/title_02.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action="tstSurvey.act?task=list">
    <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="119" class="s1">����</td>
            <td class="sBar"></td>
            <td class="s2" width="80"> 
	          <html:select property="searchdate">
			    <html:optionsCollection name="applyYear" property="beanCollection" />
			  </html:select>
            </td>
            <td class="sBar"></td>
            <td width="89" class="s1">����</td>
            <td class="sBar"></td>
            <td class="s2"> 
              <input type="text" name="searchKeyword" style="width:90%;">
            </td>                           
            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" onclick="document.forms[0].submit()" style="cursor:hand"/></td>
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
          <td class="t1" width="69">��ȣ</td>
          <td class="sBg"></td>
          <td class="t1" width="69">��������</td>
          <td class="sBg"></td>
          <td class="t1">����</td>
          <td class="sBg"></td>
          <td class="t1" width="119">��������Ⱓ</td>
          <td class="sBg"></td>
          <td class="t1" width="89">�̸�����</td>
          <td class="sBg"></td>
          <td class="t1" width="100">ó��</td>
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
          <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden"> 
            <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
            <c:forEach var="surveyList" items="${rsTst_SurveyList}" varStatus="i">
              <fmt:parseDate var="fromdate" value="${surveyList.fromdate}" pattern="yyyymmdd"></fmt:parseDate>
              <fmt:parseDate var="todate" value="${surveyList.todate}" pattern="yyyymmdd"></fmt:parseDate>
              <c:if test="${i.count%2 == 0}">
                <c:set var="lineBg" scope="request" value="tbg3"/>
              </c:if>
              <c:if test="${i.count%2 == 1}">
                <c:set var="lineBg" scope="request" value=""/>
              </c:if>
			  <tr class="${lineBg}"> 
		        <td class="t2" width="69">${surveyList.num }</td>
		        <td class="sBg"></td>
                <c:if test="${surveyList.islectsurvey == 1 }">
                  <td class="t2" width="69">���Ǽ���</td>
	              <td class="sBg"></td>
	              <td class="t3">&nbsp;${surveyList.title }</td>
                </c:if>
                <c:if test="${surveyList.islectsurvey != 1 }">
                  <td class="t2" width="69">�Ϲݼ���</td>
	              <td class="sBg"></td>
	              <td class="t3">&nbsp;${surveyList.title }</td>
                </c:if>
		        <td class="sBg"></td>
		        <td class="t2" width="119">
		          <c:if test="${fromdate == null }">���</c:if>
		          <c:if test="${fromdate != null }">
		            <fmt:formatDate value="${fromdate}" pattern="yyyy.mm.dd"/>~<fmt:formatDate value="${todate}" pattern="mm.dd"/>
		          </c:if>
		        </td>
		        <td class="sBg"></td>
		        <td class="t2" width="89">
		          <img src='<html:rewrite page="/images/board/btn_s_view.gif"/>' width="53" height="18" align="absmiddle" alt="�̸�����" onclick="viewSurvey('${surveyList.surveyno }')" style="cursor:hand"/>
		        </td>
		        <td class="sBg"></td>
		        <td class="t2" width="100">
		          <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' width="34" height="18" align="absmiddle" alt="����" onclick="modSurvey('${surveyList.surveyno}')" style="cursor:hand"/> 
		          <img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" align="absmiddle" alt="����" onclick="delSurvey('${surveyList.surveyno}')" style="cursor:hand"/> 		                                    	                                    	
		        </td>
		      </tr>
		      <tr> 
		        <td class="lbg3" colspan="11"></td>
		      </tr>                                		
              <c:set value="${i.count}" var="count"/>  
            </c:forEach> 
            <c:if test="${count==null}">
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
    <!--�ϴܹ�ư-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td align="right">
      <a href="#" onclick="showItemBankMgmt()">�����������</a>
      <img src='<html:rewrite page="/images/board/btn_poll_up.gif"/>' width="72" height="25" align="absmiddle" alt="�������" onclick="newSurvey()" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(170);
	searchList('${key}');
	document.forms[0].searchKeyword.focus();
//-->
</script>
