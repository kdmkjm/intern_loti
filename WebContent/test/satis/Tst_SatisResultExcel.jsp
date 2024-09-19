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
response.setHeader("Content-Disposition", "attachment; filename="+request.getAttribute("coursename")+"_����������.xls");
response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<body style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; margin-right: 0px">
<table width="750" border="0" cellspacing="0" cellpadding="0" height="286">
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0">
            	<c:forEach var="itemList" items="${rsTst_Survey.itemlist }" varStatus="idx">
            		<tr>
   						<td colspan="3">
   						
   						</td>
   					</tr>
            		<tr>
            			<td>
            				<!-- ����Ÿ��Ʋ -->
            				<table width="750" border="1" cellspacing="0" cellpadding="0">
            					
            					<tr>
            						<td width="85%" style="font-weight:bold;">${itemList.reqseq }.${itemList.itemcontents }</td>
            						<td colspan="2" width="15%" align="center">���ο� : ${itemList.rsptcnt }��</td>
            						<td align="center">���</td>
            					</tr>
            				</table>
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<!-- �亯����Ʈ ���� -->
            				<table width="750" border="1" cellspacing="0" cellpadding="0">
            					<c:forEach var="examList" items="${itemList.examlist }" varStatus="i">
            					<tr>
            						<td width="70%" align="left">${examList.examcontents }</td>
            						<td width="15%" style="text-align:center;">${examList.replycnt }��</td>
            						<td width="15%" style="text-align:center;">
		                            	<c:if test="${examList.replycnt !=0 }">
		                            		<fmt:formatNumber value="${(examList.replycnt/itemList.replycnt)*100 }" pattern="#.#"></fmt:formatNumber>%
		                            	</c:if>
		                            	<c:if test="${examList.replycnt ==0 }">
		                            		0%
		                            	</c:if>					                            	
		                           	</td>
		                           	<td>
		                           		<c:if test="${i.count <= 2}">
			                           		<c:set var="sum" value="${sum + (examList.replycnt/itemList.replycnt)*100 }"></c:set>
			                           		<c:if test="${i.count == 2 }">
			                           			<fmt:formatNumber value="${sum}" pattern="#.#"></fmt:formatNumber>%
			                           			<c:set var="sum" value="0"></c:set>
			                           		</c:if>
		                           		</c:if>
		                           	</td>
            					</tr>
            					</c:forEach>
            				</table>
            				<!-- �亯����Ʈ �� -->
            			</td>
            		</tr>
            		<c:forEach items="${itemList.otherlist}" varStatus="cnt">
               			<c:set var="othercnt" value="${cnt.count }"/>
               		</c:forEach>
            		<c:if test="${othercnt != null && othercnt != 0}">
            		<tr> 
	                     <td class="pSubj" >��Ÿ</td>
	                     <td>${othercnt}��</td>
	                     <td>
	                     	<c:if test="${othercnt !=0}">
	                     		<fmt:formatNumber value="${(othercnt/itemList.replycnt)*100 }" pattern="#.#"></fmt:formatNumber>%
	                     	</c:if>
	                     	<c:if test="${othercnt ==0}">
	                     		0%
	                     	</c:if>				                            	
	                     </td>
                    </tr>
                    <c:forEach var="otherList" items="${itemList.otherlist}">
                		<tr> 
	                    	<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${otherList.other }</td>
	                	</tr>
	                	<tr> 
	                    	<td colspan="4"></td>
	                	</tr>						                    		
             		</c:forEach>
                    </c:if>
            	</c:forEach>	
           	</table>
		</td>
	</tr>
</table>
</body>