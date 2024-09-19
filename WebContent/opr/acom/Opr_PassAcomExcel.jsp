<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%
response.setHeader("Content-Disposition", "attachment; filename="+request.getAttribute("filename"));
response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr align="center">
          <td height="45">
          	<font size="6" style="font-style: italic"><b>
	          	<c:if test="${searchType eq '002'}">기관별 </c:if><c:if test="${searchType eq '003'}">직급별 </c:if>이수실적조회
          	</b></font>
         	</td>
        </tr>
        <tr>
          <td height="25"></td>
        </tr>
        <tr>
          <td>
          	<table width="750" border="2" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <!--테이블 헤더 시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                      	<c:if test="${searchType eq '001'}">
                        	<table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#DDDDDD">
														<tr align="center">
														  <td><font size="2"><b>번호</b></font></td>
															<td><font size="2"><b>과정명</b></font></td>
															<td><font size="2"><b>교육기간</b></font></td>
															<td><font size="2"><b>계획</b></font></td>
															<td><font size="2"><b>신청</b></font></td>
															<td><font size="2"><b>이수</b></font></td>
															<td><font size="2"><b>미이수</b></font></td>
															<td><font size="2"><b>이수율</b></font></td>
														</tr>
													</table>
													<c:if test="${rsOpr_PassAcom ne null}">
														<table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#00EEEE">
															<tr align="right">
																<td align="center" colspan="3"><font size="2"><b>계</b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.planCount}" pattern="#,##0"/>&nbsp;</b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/>&nbsp;</b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/>&nbsp;</b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.notComplyCount}" pattern="#,##0"/>&nbsp;</b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.complyRate}" pattern="#,##0"/>%&nbsp;</b></font></td>
															</tr>
														</table>
													</c:if>
												</c:if>
                      	<c:if test="${searchType eq '002'}">
                        	<table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#DDDDDD">
														<tr align="center">
														  <td><font size="2"><b>번호</b></font></td>
															<td><font size="2"><b>과정명</b></font></td>
															<td><font size="2"><b>교육<br>기간</b></font></td>
															<td><font size="2"><b>신청</b></font></td>
															<td><font size="2"><b>이수</b></font></td>
															<td><font size="2"><b>충북</b></font></td>
															<td><font size="2"><b>청주</b></font></td>
															<td><font size="2"><b>충주</b></font></td>
															<td><font size="2"><b>제천</b></font></td>
															<td><font size="2"><b>청원</b></font></td>
															<td><font size="2"><b>보은</b></font></td>
															<td><font size="2"><b>옥천</b></font></td>
															<td><font size="2"><b>영동</b></font></td>
															<td><font size="2"><b>진천</b></font></td>
															<td><font size="2"><b>괴산</b></font></td>
															<td><font size="2"><b>음성</b></font></td>
															<td><font size="2"><b>단양</b></font></td>
															<td><font size="2"><b>증평</b></font></td>
															<td><font size="2"><b>타시<br>도</b></font></td>
															<td><font size="2"><b>기타</b></font></td>
														</tr>
													</table>
													<c:if test="${rsOpr_PassAcom ne null}">
														<table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#00EEEE">
															<tr align="right">
																<td align="center" colspan="3"><font size="2"><b>계</b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org6430000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4360000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4390000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4400000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4410000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4420000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4430000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4440000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4450000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4460000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4470000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org4480000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org5570000}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.orgOther}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.org9999999}" pattern="#,##0"/></b></font></td>
															</tr>
														</table>
													</c:if>
												</c:if>
                      	<c:if test="${searchType eq '003'}">
                        	<table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#DDDDDD">
														<tr align="center">
														  <td><font size="2"><b>번호</b></font></td>
															<td><font size="2"><b>과정명</b></font></td>
															<td><font size="2"><b>교육<br>기간</b></font></td>
															<td><font size="2"><b>신청</b></font></td>
															<td><font size="2"><b>이수</b></font></td>
															<td><font size="2"><b>2급</b></font></td>
															<td><font size="2"><b>3급</b></font></td>
															<td><font size="2"><b>4급</b></font></td>
															<td><font size="2"><b>5급</b></font></td>
															<td><font size="2"><b>6급</b></font></td>
															<td><font size="2"><b>7급</b></font></td>
															<td><font size="2"><b>8급</b></font></td>
															<td><font size="2"><b>9급</b></font></td>
															<td><font size="2"><b>기능</b></font></td>
															<td><font size="2"><b>연구<br>지도</b></font></td>
															<td><font size="2"><b>별정</b></font></td>
															<td><font size="2"><b>계약</b></font></td>
															<td><font size="2"><b>기타</b></font></td>
														</tr>
													</table>
													<c:if test="${rsOpr_PassAcom ne null}">
														<table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#00EEEE">
															<tr align="right">
																<td align="center" colspan="3"><font size="2"><b>계</b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.applyCount}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.complyCount}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank2}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank3}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank4}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank5}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank6}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank7}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank8}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rank9}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rankGN}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rankYGJD}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rankBJ}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rankGY}" pattern="#,##0"/></b></font></td>
																<td><font size="2"><b><fmt:formatNumber value="${rsOpr_PassAcom.rankETC}" pattern="#,##0"/></b></font></td>
															</tr>
														</table>
													</c:if>
												</c:if>
                      </td>
                    </tr>
                  </table>
                  <c:if test="${rsOpr_PassAcom ne null}">
	                  <table width="750" border="0" cellspacing="0" cellpadding="0">
	                    <tr>
	                      <td>
	                      	<c:if test="${searchType eq '001'}">
		                        <table width="746" border="1" cellspacing="0" cellpadding="0">
		                        	<c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
						                    <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="#eeffee"/></c:if>
																<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>      
																<tr bgcolor="${lineBg}">
																	<td align="center"><font size="2">${i.count}</font></td>
																	<td><font size="2">${list.courseName}</font></td>
																	<td align="center"><font size="2">${list.eduDate}</font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.planCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.applyCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.complyCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.notComplyCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.complyRate}" pattern="#,##0"/>%</font></td>
																</tr>
		                       		</c:forEach>
														</table>
													</c:if>
	                      	<c:if test="${searchType eq '002'}">
		                        <table width="746" border="1" cellspacing="0" cellpadding="0">
		                        	<c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
						                    <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="#eeffee"/></c:if>
																<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>      
																<tr bgcolor="${lineBg}">
																	<td align="center"><font size="2">${i.count}</font></td>
																	<td><font size="2">${list.courseName}</font></td>
																	<td align="center"><font size="2">${list.eduDate}</font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.applyCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.complyCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org6430000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4360000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4390000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4400000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4410000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4420000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4430000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4440000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4450000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4460000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4470000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org4480000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org5570000}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.orgOther}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.org9999999}" pattern="#,##0"/></font></td>
																</tr>
		                       		</c:forEach>
														</table>
													</c:if>
	                      	<c:if test="${searchType eq '003'}">
		                        <table width="746" border="1" cellspacing="0" cellpadding="0">
		                        	<c:forEach var="list" items="${rsOpr_PassAcomList}" varStatus="i" >
						                    <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="#eeffee"/></c:if>
																<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>      
																<tr bgcolor="${lineBg}">
																	<td align="center"><font size="2">${i.count}</font></td>
																	<td><font size="2">${list.courseName}</font></td>
																	<td align="center"><font size="2">${list.eduDate}</font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.applyCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.complyCount}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank2}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank3}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank4}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank5}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank6}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank7}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank8}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rank9}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rankGN}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rankYGJD}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rankBJ}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rankGY}" pattern="#,##0"/></font></td>
																	<td><font size="2"><fmt:formatNumber value="${list.rankETC}" pattern="#,##0"/></font></td>
																</tr>
		                       		</c:forEach>
														</table>
													</c:if>
	                      </td>
	                    </tr>
	                  </table>
	                </c:if>
	                <c:if test="${rsOpr_PassAcom eq null}"><center>조회된 데이터가 없습니다.</center></c:if>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>