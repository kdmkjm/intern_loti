<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table id="mainTable" width="746" border="0" cellspacing="0" cellpadding="0">
	<c:forEach var="satisList" items="${rsPrf_ProfSatisList}" varStatus="i" >
	  <tr> 
	    <td class="t2" width="119">
	    	<c:if test="${fn:substring(satisList.col_A, 0, 2) == '기타'}">
   				${fn:substring(satisList.col_A, 2, fn:length(satisList.col_A))}
   			</c:if>
   			<c:if test="${fn:substring(satisList.col_A, 0, 2) != '기타'}">
   				&nbsp;${satisList.col_A}
   			</c:if>
	    </td>
	    <td class="sBg"></td>
	    <td class="t2Red" width="119">${satisList.col_B }</td>
	    <td class="sBg"></td>
	    <td class="t2P"> 
	      <!--점수분포그래프-->
	      <table width="${satisList.col_C}%" border="0" cellspacing="1" cellpadding="0" bgcolor="#737F99" height="15px">
	        <tr> 
	          <td background='<html:rewrite page="/images/board/process_bar.gif"/>'></td>
	        </tr>
	      </table>
	    </td>
	  </tr>
	  <tr> 
	    <td class="lbg3" colspan="5"></td>
	  </tr>
		<c:set value="${i.count}" var="count"></c:set>
	</c:forEach>
	<c:if test="${count==null}">
  	<tr class="tbg3">
   		<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
   	</tr>
  </c:if>   
</table>