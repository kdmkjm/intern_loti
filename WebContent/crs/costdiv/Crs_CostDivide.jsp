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
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
	tresize_xyScroll(150);
	}

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	
	function doExcel()
	{
		var searchdate = document.forms[0].searchdate.value;
		document.getElementById("actionFrame").src = '<html:rewrite page="/crsCostDivide.act?task=excel&searchdate='+searchdate+'"/>'
	}
	
	function formSubmit()
	{
		document.forms[0].action = 'crsCostDivide.act?task=insert';		
		document.forms[0].submit();
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ ���� ����" src="/images/operation/title_05.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>
                	<html:form action="crsCostDivide.act?task=list">
                  <!--�˻� ���̺� ����-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">����</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
															<html:text property="searchdate" value="${searchdate}" style="width:100px" readonly="true"/>
                							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchdate);">
                            </td>
                            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" onclick="document.forms[0].submit();" style="cursor:hand"/></td>
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
                  <!--���̺� ��� ����-->
									<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
								  	<tr> 
								    	<td bgcolor="#FFFFFF"> 
                        <!--����Ʈ ����-->
                        <div id="mainList" style="width:746px; overflow-y:scroll; overflow-x:scroll;"> 
                          <table id="mainTable" width="1330" border="0" cellspacing="0" cellpadding="0">
                         		<tr bgcolor="#E5F1DC"> 
	                            <td class="t1">��������</td>
	                            <td class="sBg"></td>
	                            <td class="t1" width="39">����<br>�Ⱓ</td>
	                            <td class="sBg"></td>
	                            <td class="t1" width="49">���ؾ�<br>(1��)</td>
	                            <td class="sBg"></td>
	                            <td class="t1" width="39">����</td>
	                            <td class="sBg"></td>
	                            <td class="t1" width="80">��</td>
	                            <c:forEach var="headList" items="${rsCrs_CostDivideHead}" varStatus="colcnt">
	                            	<td class="sBg"></td>
	                            	<td class="t1" width="80">
	                            		<c:if test="${headList.organname == '�뱸������'}">�뱸<br>������</c:if>
	                            		<c:if test="${headList.organname == '������������'}">�����<br>�������</c:if>
	                            		<c:if test="${headList.organname != '�뱸������' && headList.organname != '������������'}">${headList.organname}</c:if>
	                            	</td>
	                            	<c:set var="cols1" value="${colcnt.count}"/>
	                            </c:forEach>
	                          </tr>
						                <tr> 
						                  <td class="lbg3" colspan="99"></td>
						                </tr>	
						                <c:forEach var="costDivideList" items="${rsCrs_CostDivideList}" varStatus="i">
                             	<c:set var="educost" value="${costDivideList.educost}"/>
                             	<c:set var="educnt" value="${costDivideList.educount}"/>
                          		<c:set var="price" value="${educost/educnt }"></c:set>
                          		<c:set var="total_cnt" value="${total_cnt+educnt}"></c:set>
                          		<c:set var="total_cost" value="${total_cost+educost}"></c:set>
                          		<c:set var="count" value="${i.count }"/>
														</c:forEach>
														<c:if test="${count != null}">
															<tr> 
	                            	<td class="t2BgRed" colspan="5" rowspan="3">�հ�</td>
	                             	<td class="sBg"></td>
	                             	<td class="t2BgRed" width="39">�ο�</td>
	                             	<td class="sBg"></td>
	                             	<td class="t2BgRedR" width="80"><fmt:formatNumber value="${total_cnt}" pattern="#,##0"/>&nbsp;</td>
	                             	<c:forEach var="tailList" items="${rsCrs_CostDivideTail}">
	                             		<td class="sBg"></td>
	                             		<td class="t2BgRedR" width="80">
	                             			<c:if test="${tailList.orgcnt == '0'}">-&nbsp;</c:if>
		                             		<c:if test="${tailList.orgcnt != '0'}"><fmt:formatNumber value="${tailList.orgcnt}" pattern="#,##0"/>&nbsp;</c:if>
	                             		</td>
	                             	</c:forEach>
	                           	</tr>
	                           	<tr> 
	                             	<td class="lbg3"></td>
	                             	<td class="lbg3" colspan="99"></td>
	                           	</tr>
	                           	<tr> 
	                             	<td class="sBg"></td>
	                             	<td class="t2BgRed" width="39">�ݾ�</td>
	                             	<td class="sBg"></td>
	                             	<td class="t2BgRedR" width="80"><fmt:formatNumber value="${total_cost}" pattern="#,##0"/>&nbsp;</td>
	                             	<c:forEach var="tailList1" items="${rsCrs_CostDivideTail}">
	                             		<td class="sBg"></td>
	                             		<td class="t2BgRedR" width="80">
	                             			<c:if test="${tailList1.educost == '0'}">-&nbsp;</c:if>
		                             		<c:if test="${tailList1.educost != '0'}"><fmt:formatNumber value="${tailList1.educost}" pattern="#,##0"/>&nbsp;</c:if>
	                             		</td>
	                             	</c:forEach>
	                           	</tr>
	                           	<tr> 
	                             	<td class="lbg3" colspan="99"></td>
	                           	</tr>  
	                          </c:if> 	                          
                          	<c:forEach var="costDivideList" items="${rsCrs_CostDivideList}" varStatus="i">
                          		<fmt:parseDate var="edufrom" value="${costDivideList.edufrom}" pattern="yyyymmdd"></fmt:parseDate>
                          		<fmt:parseDate var="eduto" value="${costDivideList.eduto}" pattern="yyyymmdd"></fmt:parseDate>
                             	<c:set var="educost" value="${costDivideList.educost}"/>
                             	<c:set var="educnt" value="${costDivideList.educount}"/>
                          		<c:set var="price" value="${educost/educnt }"></c:set>
                          		<c:set var="total_cnt" value="${total_cnt+educnt}"></c:set>
                          		<c:set var="total_cost" value="${total_cost+educost}"></c:set>
                         			<tr> 
                             		<td class="t3" rowspan="3">&nbsp;${costDivideList.coursename }</td>
	                              <td class="sBg"></td>
	                              <td class="t2" rowspan="3" width="39"><fmt:formatDate value="${edufrom}" pattern="mm.dd"/><br>~<br><fmt:formatDate value="${eduto}" pattern="mm.dd"/></td>
	                              <td class="sBg"></td>
	                              <td class="t4" rowspan="3" width="49"><fmt:formatNumber value="${price}" pattern="#,##0"/>&nbsp;</td>
	                              <td class="sBg"></td>
	                              <td class="t2" width="39">�ο�</td>
	                              <td class="sBg"></td>
	                              <td class="t4" width="80"><fmt:formatNumber value="${educnt}" pattern="#,##0"/>&nbsp;</td>                           
	                              <c:forEach var="subList" items="${costDivideList.chieforganList}">
	                              	<c:if test="${costDivideList.coursecode eq subList.coursecode}">
	                              		<td class="sBg"></td>		
	                               		<td class="t4" width="80">
	                               			<c:if test="${subList.orgcnt == '0'}">-&nbsp;</c:if>
		                             			<c:if test="${subList.orgcnt != '0'}">${subList.orgcnt}&nbsp;</c:if>
	                               		</td>
	                               	</c:if>		                                  	
                              	</c:forEach>
                      				</tr>
                             	<tr> 
                             		<td class="sBg"></td>
                               	<td class="sBg"></td>
                               	<td class="sBg"></td>
                               	<td class="lbg3" colspan="99"></td>
                             	</tr>
                             	<tr> 
                             		<td class="sBg"></td>
                               	<td class="sBg"></td>
                               	<td class="sBg"></td>
                               	<td class="t2" width="39">�ݾ�</td>
                               	<td class="sBg"></td>
                               	<td class="t4" width="80"><fmt:formatNumber value="${costDivideList.educost}" pattern="#,##0"/>&nbsp;</td>
                               	<c:forEach var="subList1" items="${costDivideList.chieforganList}">
                               		<c:if test="${costDivideList.coursecode eq subList1.coursecode}">
                                		<td class="sBg"></td>
                                		<td class="t4" width="80">
                                			<c:if test="${subList1.educost == '0'}">-&nbsp;</c:if>
		                             			<c:if test="${subList1.educost != '0'}"><fmt:formatNumber value="${subList1.educost}" pattern="#,##0"/>&nbsp;</c:if>
                                		</td>
                         					</c:if>				                                  	
                               	</c:forEach>
                             	</tr>
															<tr> 
	                            	<td class="lbg3" colspan="99"></td>
	                            </tr>
                            	<c:set var="count" value="${i.count}"/>
														</c:forEach>
														<c:if test="${count==null}">
															<tr class="tbg3">
																<td class="t3" colspan="99">������������������������������ȸ�� �����Ͱ� �����ϴ�.</td>
															</tr>														
														</c:if>													
                     			</table>
												</div>		                          
								  		</td> 
								  	</tr>
								  </table>												                  
                </td>
              </tr>
              <c:if test="${count != null}">
	              <tr> 
	                <td> 
	                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
	                    <tr valign="bottom"> 
	                      <td align="right">
	                      	<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' width="94" height="25" align="absmiddle" alt="�����ٿ�ε�" onclick="doExcel()" style="cursor:hand"/> 
	                        <img src='<html:rewrite page="/images/board/btn_sum2.gif"/>' width="79" height="25" align="absmiddle" alt="���/Ȯ��" onclick="formSubmit()" style="cursor:hand"> 
	                      </td>
	                    </tr>
	                  </table>
	                </td>
	              </tr>
	            </c:if>
            </table>
          </td>
  </tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize_xyScroll(150);
	searchList('${key}');
//-->
</script>
