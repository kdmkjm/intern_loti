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
	response.setHeader("Content-Disposition", "attachment; filename="+((loti.prf.baseinfo.model.Prf_ProfSatis)request.getAttribute("rsPrf_ProfSatis")).getProfname()+"_만족도.xls");
	response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td> 
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="25" class="stitle">강사기본정보</td>
        </tr>
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="89" >성명</td>
                            <td> ${rsPrf_ProfSatis.profname } </td>
                            <td width="89" >연락처</td>
                            <td> ${rsPrf_ProfSatis.cellphone }</td>
                            <td width="60" align="center">&nbsp;</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  <!--검색 테이블 끝-->
                </td>
              </tr>
              <tr> 
                <td height="8"></td>
              </tr>
              <tr> 
                <td> 
                  <!--테이블 헤더 시작-->
                  <table width="750" border="1" cellspacing="0" cellpadding="0">
                    <tr> 
                    	<td width="119">만족도 유형</td>
                      <td >구분</td>
                      <td width="119">만족도 점수</td>
                    </tr>
                  </table>
                  <!--테이블 헤더 시작-->
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="1" cellspacing="0" cellpadding="0"> 
										<c:forEach var="satisList" items="${rsPrf_ProfSatisList}">
										  <tr>
										  	<c:if test="${precole == satisList.col_E}">
										  		<td width="119"></td>
										  	</c:if> 
										  	<c:if test="${precole != satisList.col_E}">
										  		<td width="119">${satisList.col_E }</td>
										  	</c:if>										  	
										    <td >${satisList.col_A }</td>
										    <td width="119">${satisList.col_B }</td>
										  </tr>
										  <c:set var="precole" value="${satisList.col_E }"/>
										</c:forEach>
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
