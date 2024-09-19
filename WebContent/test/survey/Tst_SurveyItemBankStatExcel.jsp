<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%
response.setHeader("Content-Disposition", "attachment; filename=전체문항설문조사결과표.xls");
response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<script language="JavaScript">
<!--
  
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td align="center">
	<h2>전체문항설문조사결과표</h2>
  </td>
</tr>
<tr> 
  <td height="15"></td>
</tr>
<tr>
  <td align="center">
  	<div id="resultTable">
            <table width="750" border="1" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <table width="750" border="1" cellspacing="0" cellpadding="0">
                    <c:forEach var="item" items="${rsTst_SurveyItemBankStat.itemlist}" varStatus="idx">  
 						<tr>
                          <td align="left" style="font-weight:bold;">${item.itemno }. ${item.itemcontents }</td>
                          <td colspan="2" align="center">총인원 : ${item.sum }명</td>
                    	</tr>
						<tr> 
		                  <td colspan="3"> 
		                    <!--답변리스트-->
		                    <table width="750" border="1" cellspacing="0" cellpadding="0">   
		                    	<c:forEach var="exam" items="${item.examlist}">      	  
		                          <tr> 
		                            <td align="left">(${exam.examno }) ${exam.examcontents }</td>
		                            <td width="50" align="center">${exam.count }명</td>
		                            <td width="50" align="center">
		                            	<c:if test="${exam.count !=0 }">
		                            		<fmt:formatNumber value="${(exam.count/exam.sum)*100 }" pattern="#.#"></fmt:formatNumber>%
		                            	</c:if>
		                            	<c:if test="${exam.count ==0 }">
		                            		0%
		                            	</c:if>					                            	
		                           	</td>
		                          </tr>
		                    	</c:forEach>
                       	    </table>
                      </td>
                    </tr>
                    <c:set var="icount" value="${idx.count}"/>
                    </c:forEach>
                    <c:if test="${icount == null}">
                    <tr>
                    	<td>조회된 결과가 없습니다.</td>
                    </tr>
                    </c:if>
                  </table>
                </td>
              </tr>
            </table>
       </div>
    </td>
  </tr>

  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>
