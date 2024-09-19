<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<table id="mainTable" width="336" border="0" cellspacing="0" cellpadding="0">
	<c:forEach var="userList" items="${rsSvc_SMSUserList}" varStatus="i" >
		<c:if test="${i.count%2 == 0}">
		  <tr class="tbg3"> 
		  	<input type="hidden" name="username_array" value="${userList.username }">
		  	<input type="hidden" name="cellphone_array" value="${userList.cellphone }">
		  	<input type="hidden" name="email_array" value="${userList.email }">
		    <td class="t2" width="44" style="border-bottom:1px solid #D6D6D6"> 
		      <input type="checkbox" name="chkuser" value="${userList.username}${userList.workname}">
		    </td>
		    <td class="sBg" ></td>
		    <td class="t2" width="89" style="border-bottom:1px solid #D6D6D6">${userList.username }</td>
		    <td class="sBg"></td>
		    <c:if test="${userList.workname != null }">
		    <td class="t3" style="border-bottom:1px solid #D6D6D6">&nbsp;${userList.workname }</td>		    
		    </c:if>
		    <c:if test="${userList.workname == null }">
		    <td class="t3" style="border-bottom:1px solid #D6D6D6">&nbsp;</td>		    
		    </c:if>	
		    <!-- 
		    <td class="sBg"></td>
		    <c:if test="${userList.workpos != null }">
		    <td class="t2" width="100" style="border-bottom:1px solid #D6D6D6">${userList.workpos }</td>
		    </c:if>
		    <c:if test="${userList.workpos == null }">
		    <td class="t2" width="100" style="border-bottom:1px solid #D6D6D6">&nbsp;</td>
		    </c:if>	
		    -->	
		  </tr>
		</c:if>
		<c:if test="${i.count%2 == 1}">
		  <tr> 
		  	<input type="hidden" name="username_array" value="${userList.username }">
		  	<input type="hidden" name="cellphone_array" value="${userList.cellphone }">
		  	<input type="hidden" name="email_array" value="${userList.email }">
		    <td class="t2" width="44" style="border-bottom:1px solid #D6D6D6"> 
		      <input type="checkbox" name="chkuser" value="${userList.username}${userList.workname}">
		    </td>
		    <td class="sBg"></td>
		    <td class="t2" width="89" style="border-bottom:1px solid #D6D6D6">${userList.username }</td>
		    <td class="sBg"></td>
		    <c:if test="${userList.workname != null }">
		    <td class="t3" style="border-bottom:1px solid #D6D6D6">&nbsp;${userList.workname }</td>		    
		    </c:if>
		    <c:if test="${userList.workname == null }">
		    <td class="t3" style="border-bottom:1px solid #D6D6D6">&nbsp;</td>		    
		    </c:if>	
		    <!-- 
		    <td class="sBg"></td>
		    <c:if test="${userList.workpos != null }">
		    <td class="t2" width="100" style="border-bottom:1px solid #D6D6D6">${userList.workpos }</td>
		    </c:if>
		    <c:if test="${userList.workpos == null }">
		    <td class="t2" width="100" style="border-bottom:1px solid #D6D6D6">&nbsp;</td>
		    </c:if>
		     -->    
		  </tr>
		</c:if>
		<c:set value="${i.count}" var="count"></c:set>
	</c:forEach>
	<c:if test="${count==null}">
  	<tr class="tbg3">
   		<td class="t2" colspan="13">조회된 데이터가 없습니다.</td>
   	</tr>
  </c:if> 
  <input type="hidden" name="count" value="${count}"> 
</table>