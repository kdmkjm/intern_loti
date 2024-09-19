<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">
<!--
	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

	function rePlySurvey(surveyno, chkmod)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/extMylcSurvey.act?task=info&surveyno='+surveyno+'&chkmod='+chkmod+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=665, height=600, status=yes top='+wint+', left='+winl);
	}
	
	function resultSurvey(surveyno)
	{
		document.location.href ='<html:rewrite page="/tstSatis.act?task=result&surveyno='+surveyno+'"/>';
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��������(���)" src="/images/community/title_04.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='extMylcSurvey.act?task=list'>
      <!--�˻� ���̺� ����-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="119" class="s1">����</td>
            <td class="sBar"></td>
            <td class="s2"> 
	          <html:select property="searchdate">
			    <html:optionsCollection name="applyYear" property="beanCollection" />
			  </html:select>
            </td>
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr> 
          <td class="t1" width="159">�Ⱓ</td>
          <td class="sBg" width="1"></td>
          <td class="t1">������</td>
          <td class="sBg" width="1"></td>
          <td class="t1" width="99">����</td>
          <td class="sBg" width="1"></td>
          <td class="t1" width="200">�ۼ��ϱ�</td>
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
      <td class="lbg2"></td>
      <td width="746" class="cbg2"> 
        <!--�Խ��� ����Ʈ ����-->
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <c:forEach var="surveyList" items="${rsExtMylc_SurveyList}" varStatus="i">
          <fmt:parseDate var="fromdate" value="${surveyList.fromdate}" pattern="yyyymmdd"></fmt:parseDate>
          <fmt:parseDate var="todate" value="${surveyList.todate}" pattern="yyyymmdd"></fmt:parseDate>
          <c:if test="${i.count%2 ==0 }">
            <c:set var="lineBg" scope="request" value="tbg3"/>
          </c:if>
          <c:if test="${i.count%2 ==1 }">
            <c:set var="lineBg" scope="request" value=""/>
          </c:if>
          <tr class="${lineBg}">
            <c:if test="${fromdate == null }">
              <td class="t2" width="159">���</td>
            </c:if>
            <c:if test="${fromdate != null }">                        			
			  <td class="t2" width="159"><fmt:formatDate value="${fromdate}" pattern="yyyy.mm.dd"/> ~ <fmt:formatDate value="${todate}" pattern="yyyy.mm.dd"/></td>
		    </c:if>
	        <td class="sBg" width="1"></td>
	        <td class="t3">${surveyList.title }</td>
	        <td class="sBg" width="1"></td>
	        <c:if test="${surveyList.statflag eq '1'}">
		      <td class="t2" width="99"><span class="lend1">������</span></td>
		      <td class="sBg" width="1"></td>
		      <td class="t2" width="200">
		        <c:if test="${surveyList.chkmod eq 'C'}">
		          <img src='<html:rewrite page="/images/board/btn_poll.gif"/>' width="53" height="18" alt="�����ϱ�" onclick="rePlySurvey('${surveyList.surveyno }', 'C')" style="cursor:hand"/>
		        </c:if>
		        <c:if test="${surveyList.chkmod ne 'C'}">
		          <img src='<html:rewrite page="/images/board/btn_modify5.gif"/>' width="53" height="18" alt="�����ϱ�" onclick="rePlySurvey('${surveyList.surveyno }', 'M')" style="cursor:hand"/>
		        </c:if>		                              
		        &nbsp;<img src='<html:rewrite page="/images/board/btn_poll_view.gif"/>' width="53" height="18" alt="����" onclick="resultSurvey('${surveyList.surveyno }')" style="cursor:hand"/>
		      </td>		                            
	        </c:if>
	        <c:if test="${surveyList.statflag ne '1'}">
		      <td class="t2" width="99">����Ϸ�</td>
		      <td class="sBg" width="1"></td>
		      <td class="t2" width="200"><img src='<html:rewrite page="/images/board/btn_poll_off.gif"/>' width="53" height="18" alt="�����ϱ�" />&nbsp;<img src='<html:rewrite page="/images/board/btn_poll_view.gif"/>' width="53" height="18" alt="����" onclick="resultSurvey('${surveyList.surveyno }')" style="cursor:hand"/></td>		                            
	        </c:if>
	      </tr>
	      <tr> 
	        <td class="lbg3" colspan="7"></td>
	      </tr>  
	      <c:set value="${i.count}" var="count"></c:set>                      			                            	                      	
        </c:forEach>
        <c:if test="${count==null}">
		  <tr class="tbg3" height="21">
			<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
		  </tr>
		</c:if>
        </table>
        <!--�Խ��� ����Ʈ ��-->
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
    <!--����¡ ��ȣ-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="30">
	<tr valign="bottom" align="center">
	  <td>${page}</td>
	</tr>
    </table>
  </td>
</tr>
</table>