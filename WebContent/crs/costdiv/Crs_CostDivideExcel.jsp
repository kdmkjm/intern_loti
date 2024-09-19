<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>

<%
response.setHeader("Content-Disposition", "attachment; filename="+"���������.xls");
response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="38" align="center">�� ������ �����Ʒú� �δ��</td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <!--���̺� ��� ����-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td></td>
                      <td>
                        <table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#DDDDDD">
                          <tr align="center"> 
                            <td>��������</td>
                            <td>����<br>�Ⱓ</td>
                            <td>���ؾ�<br>(1��)</td>
                            <td>����</td>
                            <td>��</td>
                            <c:forEach var="headList" items="${rsCrs_CostDivideHead}">
                            	<td>
                            		<c:if test="${headList.organname == '�뱸������'}">
                            			�뱸<br>������
                            		</c:if>
                            		<c:if test="${headList.organname == '������������'}">
                            			�����<br>�������
                            		</c:if>
                            		<c:if test="${headList.organname != '�뱸������' && headList.organname != '������������'}">
                            			${headList.organname}
                            		</c:if>
                            	</td>
                            </c:forEach>
                          </tr>
                        </table>
                      </td>
                      <td></td>
                    </tr>
                  </table>
                  <!--���̺� ��� ����-->
                </td>
              </tr>
              <tr> 
                <td> 
									<table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td></td>
                      <td width="746"> 
                        <table width="746" border="1" cellspacing="0" cellpadding="0">
                        	<c:forEach var="costDivideList" items="${rsCrs_CostDivideList}" varStatus="i">
                            <c:set var="educost" value="${costDivideList.educost}"/>
                            <c:set var="educnt" value="${costDivideList.educount}"/>
                         		<c:set var="price" value="${educost/educnt }"></c:set>
                         		<c:set var="total_cnt" value="${total_cnt+educnt}"></c:set>
                         		<c:set var="total_cost" value="${total_cost+educost}"></c:set>
													</c:forEach>
                        	<tr> 
														<td colspan="3" rowspan="2" align="center">�հ�</td>
					                  <td>�ο�</td>
					                  <td><fmt:formatNumber value="${total_cnt }" pattern="#,##0"></fmt:formatNumber></td>
													  <c:forEach var="tailList" items="${rsCrs_CostDivideTail}">
													  	<td align="right">
													  		<c:if test="${tailList.orgcnt == '0'}">-</c:if>
                            			<c:if test="${tailList.orgcnt != '0'}"><fmt:formatNumber value="${tailList.orgcnt}" pattern="#,##0"/></c:if>
													  	</td>
													  </c:forEach>
													</tr>
													<tr> 
													  <td>�ݾ�</td>
													  <td><fmt:formatNumber value="${total_cost }" pattern="#,##0"></fmt:formatNumber></td>
													  <c:forEach var="tailList1" items="${rsCrs_CostDivideTail}">
													  	<td align="right">
													  		<c:if test="${tailList1.educost == '0'}">-</c:if>
                            			<c:if test="${tailList1.educost != '0'}"><fmt:formatNumber value="${tailList1.educost}" pattern="#,##0"/></c:if>
													  	</td>
													  </c:forEach>
													</tr>
                         	<c:forEach var="costDivideList" items="${rsCrs_CostDivideList}" varStatus="i">
                         		<fmt:parseDate var="edufrom" value="${costDivideList.edufrom}" pattern="yyyymmdd"></fmt:parseDate>
                         		<fmt:parseDate var="eduto" value="${costDivideList.eduto}" pattern="yyyymmdd"></fmt:parseDate>
                            <c:set var="educost" value="${costDivideList.educost}"/>
                            <c:set var="educnt" value="${costDivideList.educount}"/>
                         		<c:set var="price" value="${educost/educnt }"></c:set>
                         		<c:set var="total_cnt" value="${total_cnt+educnt}"></c:set>
                         		<c:set var="total_cost" value="${total_cost+educost}"></c:set>
                        		<tr> 
                            	<td rowspan="2">${costDivideList.coursename }</td>
                             	<td rowspan="2" align="center"><fmt:formatDate value="${edufrom}" pattern="mm.dd"/><br>~<fmt:formatDate value="${eduto}" pattern="mm.dd"/></td>
                             	<td rowspan="2"><fmt:formatNumber value="${price}" pattern="#,##0"/></td>
                             	<td>�ο�</td>
                             	<td><fmt:formatNumber value="${educnt}" pattern="#,##0"/></td>		                                  
                             	<c:forEach var="subList" items="${costDivideList.chieforganList}">
	                             	<c:if test="${costDivideList.coursecode eq subList.coursecode}">
	                             		<td align="right">
	                             			<c:if test="${subList.orgcnt == '0'}">-</c:if>
	                             			<c:if test="${subList.orgcnt != '0'}">${subList.orgcnt}</c:if>
                             			</td>
	                             	</c:if>		                                  	
                             	</c:forEach>
                      			</tr>
                           	<tr> 
                             	<td>�ݾ�</td>
                             	<td><fmt:formatNumber value="${costDivideList.educost}" pattern="#,##0"></fmt:formatNumber></td>
                             	<c:forEach var="subList1" items="${costDivideList.chieforganList}">
                              	<c:if test="${costDivideList.coursecode eq subList1.coursecode}">
                              		<td align="right">
	                             			<c:if test="${subList1.educost == '0'}">-</c:if>
	                             			<c:if test="${subList1.educost != '0'}"><fmt:formatNumber value="${subList1.educost}" pattern="#,##0"/></c:if>
                              		</td>
                             		</c:if>				                                  	
                             	</c:forEach>
                           	</tr>
                           	<c:set var="count" value="${i.count }"/>
													</c:forEach>
                        </table>
                      </td>
                      <td></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
