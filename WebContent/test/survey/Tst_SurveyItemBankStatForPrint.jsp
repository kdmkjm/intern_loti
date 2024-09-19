<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script language="JavaScript">
<!--
  
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="설문결과" src="/images/poll/title_03-2.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td align="center">
  	<div id="resultTable">
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="15"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <c:forEach var="item" items="${rsTst_SurveyItemBankStat.itemlist}" varStatus="idx">  
 						<tr> 
	                      <td> 
	                        <!--설문타이틀-->
	                        <table width="750" border="0" cellspacing="0" cellpadding="0">
	                          <tr> 
                            	<td colspan="5"><img src='<html:rewrite page="/images/poll/poll_top.gif"/>' width="750" height="5"></td>
                          	  </tr>
						  	  <tr> 
						  	  	<td width="15px" background='<html:rewrite page="/images/poll/poll_left.gif"/>'>&nbsp;</td>
                            	<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' class="po1" width="570" align="left">${item.itemno }.${item.itemcontents }</td>
                            	<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' width="100px"  class="pJoin">총인원 : ${item.sum }명</td>
                            	<td width="15px" background='<html:rewrite page="/images/poll/poll_right.gif"/>'>&nbsp;</td>
                          	  </tr>
                          	  <tr> 
                            	<td colspan="5"><img src='<html:rewrite page="/images/poll/poll_bottom.gif"/>' width="750" height="5"></td>
                          	  </tr>                        
	                        </table>
	                      </td>
                    	</tr>
						<tr> 
		                  <td class="poNone"> 
		                    <!--답변리스트-->
		                    <table width="750" border="0" cellspacing="0" cellpadding="0">   
		                    	<c:forEach var="exam" items="${item.examlist}">      	  
		                          <tr> 
		                            <td class="pSubj" align="left">${exam.examcontents }</td>
		                            <td width="300" align="left">
		                            	<!-- 그래프 -->
		                            	<c:if test="${exam.count !=0 }">
		                            		<img src="/images/board/bar.gif" style="width:${(exam.count/exam.sum)*100}%;" height="10"/>
		                            	</c:if>
		                            </td>
		                            <td width="50"></td>
		                            <td width="50" class="JoinP">${exam.count }명</td>
		                            <td width="50" class="JoinP2">
		                            	<c:if test="${exam.count !=0 }">
		                            		<fmt:formatNumber value="${(exam.count/exam.sum)*100 }" pattern="#.#"></fmt:formatNumber>%
		                            	</c:if>
		                            	<c:if test="${exam.count ==0 }">
		                            		0%
		                            	</c:if>					                            	
		                           	</td>
		                           	<td width="30" class="JoinP3"></td>
		                          </tr>
		                          <tr> 
		                            <td class="poL" colspan="5"></td>
		                          </tr>
		                    	</c:forEach>
                       	</table>
                      </td>
                    </tr>
                    <c:set var="icount" value="${idx.count}"/>
                    </c:forEach>
                    <c:if test="${icount == null}">
                    <tr>
                    	<td class="pSubj">조회된 결과가 없습니다.</td>
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
