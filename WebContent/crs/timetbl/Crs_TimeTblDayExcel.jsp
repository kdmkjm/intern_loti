<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>

<%
response.setHeader("Content-Disposition", "attachment; filename="+"교육시간표.xls");
response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
			<table width="750" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td>
			      <!--테이블 헤더 시작-->
			      <table width="750" border="0" cellspacing="0" cellpadding="0">
			     		<tr align="center">
						    <td height="38"><b>교육시간표 (${searchdate})</b></td>
						  </tr>
						  <tr align="right">
						    <td height="20">${rsCrs_TimeTblCrsTotalInfo}</td>
						  </tr>
						  <tr>
						    <td height="15"></td>
							</tr>
			        <tr>
			          <td>
			            <table width="750" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#DDDDDD">
			              <tr align="center">
			                <td>연번</td>
			                <td>과정</td>
			                <td>09:00<br>~<br>09:50</td>
			                <td>10:00<br>~<br>10:50</td>
			                <td>11:00<br>~<br>11:50</td>
			                <td>12:00<br>~<br>12:50</td>
			                <td>13:00<br>~<br>13:50</td>
			                <td>14:00<br>~<br>14:50</td>
			                <td>15:00<br>~<br>15:50</td>
			                <td>16:00<br>~<br>16:50</td>
			                <td>17:00<br>~<br>17:50</td>
			                <td>18:00<br>~<br>18:50</td>
			                <td>19:00<br>~<br>19:50</td>
			                <td>20:00<br>~<br>20:50</td>
			              </tr>
			            </table>
			          </td>
			          <td background-color:#91B475; width:2px;></td>
			        </tr>
			      </table>
			      <!--테이블 헤더 시작-->
			    </td>
			  </tr>
			  <tr>
			    <td>
			      <table width="750" border="0" cellspacing="0" cellpadding="0">
			        <tr>
			          <td>
			            <table width="750" border="1" cellspacing="0" cellpadding="0">
			             	<c:forEach var="timeTblCrsList" items="${rsCrs_TimeTblCrsList}" varStatus="i">
			           			<tr align="center">
			           				<td>${i.count}</td>
			                  <td>${timeTblCrsList.coursename}<br>${timeTblCrsList.stdcnt }명/${timeTblCrsList.lecroom }</td> 
			                 	<c:set var="times" value="${1}"/>                                     		
			             			<c:forEach var="subList" items="${timeTblCrsList.timetbldayList}">
			             				<c:if test="${timeTblCrsList.coursecode eq subList.coursecode}">
			         						  <c:forEach begin="${times}" end="${subList.gubun}">
			         						    <c:if test="${times eq subList.gubun}">
			         						      <c:if test="${subList.colspan > 1}">
			         						      	<td colspan="${subList.colspan}">${subList.subjname}<br>${subList.prof_Assign}&nbsp;${subList.prof_Name}</td>
			         						      </c:if>
			         						      <c:if test="${subList.colspan == 1}">
			         						      	<td>${subList.subjname}<br>${subList.prof_Assign}&nbsp;${subList.prof_Name}</td>
			         						      </c:if>                                						      
			                					<c:set var="times" value="${times+subList.colspan }"/>
			                				</c:if>
			         						    <c:if test="${times < subList.gubun}">
			          						  	<td></td>
			                					<c:set var="times" value="${times+1 }"/>
			                  			</c:if>				                                    				
			           						</c:forEach>                           						
			            				</c:if>
			            			</c:forEach>
			           				<c:if test="${times < 12 }">
			         						<c:forEach begin="${times}" end="12">
			       						  	<td></td>
			             					<c:set var="times" value="${times+1 }"/>
			       						  </c:forEach>    
			       						</c:if> 
			           			</tr>
			             		<c:set var="check" value="${i.count}"/>
			             	</c:forEach>
			             	<c:if test="${check==null}">
					<tr align="center">
						<td class="t2" colspan="14">조회된 데이터가 없습니다.</td>
					</tr>
				</c:if>
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
