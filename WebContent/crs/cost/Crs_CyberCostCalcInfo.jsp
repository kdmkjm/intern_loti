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
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize(205);
	}

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="��������� - ���̹� �ΰ� ������" src="/images/operation/title_04-5.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action='crsCostCalc.act?task=list'>
                  <!--�˻� ���̺� ����-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">ȸ�� : ${cybertimes }</td>
														<td class="s1">ó����� : ${fn:substring(cyberyymm, 0, 4)}-${fn:substring(cyberyymm, 4, 6)}</td>
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
                         		<td class="t1">������</td> 
                          	<td class="sBg"></td>
                          	<td class="t1" width="100">�̼��ο�</td>
                          	<td class="sBg"></td>
                          	<td class="t1" width="100"></td>
                          	<td width="17"></td>
                          </tr>                          
                        </table>
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--���̺� ��� ����-->
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
                              <div id="mainList" style="width:746px;  overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                  <c:forEach var="costCalcList" items="${rsCrs_CyberCostCalcInfoList}" varStatus="i">
	                                	<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
																		<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
																		<tr class="${lineBg}">
	                                    <td class="t3">&nbsp;${costCalcList.coursename}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="100"><fmt:formatNumber value="${costCalcList.fincnt}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t4" width="100"></td>                           	                                    
	                                  </tr>
		                                <tr> 
	                                    <td class="lbg3" colspan="21"></td>
	                                  </tr>		
		                              	<c:set value="${i.count}" var="count"></c:set>
		                              	<c:set value="${total_fincnt+costCalcList.fincnt }" var="total_fincnt"></c:set>
                                  </c:forEach>
                                </table>                               
                              </div>
                              <!--����Ʈ ��-->
                              <c:if test="${count >0}">
                              	<table width="746" border="0" cellspacing="0" cellpadding="0">
   		        										<tr>
	                                  <td class="t2BgRed">�հ�</td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRedR" width="95" style="padding-right:5px">�������ܰ�<br><fmt:formatNumber value="${monprice}" pattern="#,##0"/></td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRedR" width="95" style="padding-right:5px">��Ÿ�ݾ�<br><fmt:formatNumber value="${appcnt}" pattern="#,##0"/></td>
	                                  <td class="sBg"></td>		 
	                                  <td class="t2BgRedR" width="100"><fmt:formatNumber value="${total_fincnt}" pattern="#,##0"/>&nbsp;</td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRedR" width="100"><fmt:formatNumber value="${educost}" pattern="#,##0"/>&nbsp;</td>
	                                  <td class="t2BgRedR" width="17"></td>                           	                                    
	                                </tr>	                              	
                              	</table>	
                              </c:if>
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
                      <td align="right">
                      	<a href='<html:rewrite page="/crsCyberCostCalc.act?task=list&year=${fn:substring(courseyymm,1,4)}"/>'><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="���"/></a>
                     	</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
  </tr>
</table>
<script type="text/javascript">
<!--
	tresize(225);
	searchList('${key}');

//-->
</script>
