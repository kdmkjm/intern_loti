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

  function openInfo(cyberyymm, cybertimes)
  {
  	document.location.href = 'crsCyberCostCalc.act?task=info&cyberyymm='+cyberyymm+'&cybertimes='+cybertimes ; 
  }
  
  function modifyCalc(cyberyymm, cybertimes)
  {
  	document.location.href = "crsCyberCostCalc.act?task=modify&cyberyymm="+cyberyymm+"&cybertimes="+cybertimes;
  }
  
  function deleteCalc(cyberyymm, cybertimes)
  {
    if(confirm('�����Ͻðڽ��ϱ�?'))
  	{
  		document.location.href = "crsCyberCostCalc.act?task=delete&cyberyymm="+cyberyymm+"&cybertimes="+cybertimes;
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
                	<html:form action='crsCyberCostCalc.act?task=list'>
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
                  <!--���̺� ��� ����-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr> 
                            <td class="t1" width="99">ȸ��</td>
                            <td class="sBg"></td>
                            <td class="t1">ó�����</td>
                            <td class="sBg"></td>
                            <td class="t1" width="150" >������</td>
                            <td class="sBg"></td>
                            <td class="t1" width="119">�ѱݾ�</td>
                            <td class="sBg"></td>
                            <td class="t1" width="100">ó��</td>
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
                                  <c:forEach var="costCalcList" items="${rsCrs_CyberCostCalcList}" varStatus="i">
																		<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
																		<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
																		<tr class="${lineBg}">
	                                    <td class="t2" width="99">${costCalcList.cybertimes}</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2"><a href="#" onclick=javascript:openInfo('${costCalcList.cyberyymm }','${costCalcList.cybertimes }')><u>${fn:substring(costCalcList.cyberyymm, 0, 4)}-${fn:substring(costCalcList.cyberyymm, 4, 6)}</u></a></td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="150">${costCalcList.coursecount}</td>
																			<td class="sBg"></td> 
	                                    <td class="t4" width="119"><fmt:formatNumber value="${costCalcList.totalcost}" pattern="#,##0"/>&nbsp;</td>
	                                    <td class="sBg"></td>
	                                    <td class="t2" width="100">
	                                      <c:if test="${costCalcList.chkCost eq 'Y'}">
	                                      	<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' width="34" height="18" alt="����" align="absmiddle" onclick="modifyCalc('${costCalcList.cyberyymm }','${costCalcList.cybertimes }')" style="cursor:hand"/>
	                                    		<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' width="34" height="18" alt="����" align="absmiddle" onclick="deleteCalc('${costCalcList.cyberyymm }','${costCalcList.cybertimes }')" style="cursor:hand"/>
	                                      </c:if>
	                                      <c:if test="${costCalcList.chkCost ne 'Y'}">
	                                    		<img src='<html:rewrite page="/images/board/btn_modify_off.gif"/>' width="34" height="18" alt="����" align="absmiddle" />
	                                    		<img src='<html:rewrite page="/images/board/btn_del2_off.gif"/>' width="34" height="18" alt="����" align="absmiddle" />		                                      
	                                      </c:if>	
	                                    </td>
	                                  </tr>
		                                <tr> 
	                                    <td class="lbg3" colspan="13"></td>
	                                  </tr>
		                              	<c:set value="${i.count}" var="count"></c:set>
		                              	<c:set value="${total_count+costCalcList.coursecount}" var="total_count"></c:set>
		                              	<c:set value="${total_cost+costCalcList.totalcost}" var="total_cost"></c:set>
                                  </c:forEach>
                                  <c:if test="${count==null}">
																		<tr class="tbg3">
																			<td class="t2" colspan="99">��ȸ�� �����Ͱ� �����ϴ�.</td>
																		</tr>
																	</c:if>
                                </table>                             
                              </div>
                              <!--����Ʈ ��-->
                              <c:if test="${count >0}">
                              	<table width="746" border="0" cellspacing="0" cellpadding="0">
                              		<tr>
	                              		<td class="t2BgRed" colspan="2">�հ�</td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRed" width="150"><fmt:formatNumber value="${total_count}" pattern="#,##0"/></td>
	                                  <td class="sBg"></td>		                                    
	                                  <td class="t2BgRedR" width="119"><fmt:formatNumber value="${total_cost}" pattern="#,##0"/>&nbsp;</td>
	                                  <td class="sBg"></td>
	                                  <td class="t2BgRed" width="117"></td>
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
                      <td>
                      	<img src='<html:rewrite page="/images/board/btn_new.gif"/>' width="57" height="25" alt="�ű�" align="absmiddle" onclick="location.href='<html:rewrite page="/crsCyberCostCalc.act?task=create"/>'" style="cursor:hand"/> 
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
	tresize(205);
	searchList('${key}');

//-->
</script>
