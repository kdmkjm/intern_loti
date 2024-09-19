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
response.setHeader("Content-Disposition", "attachment; filename="+"교육신청자 현황.xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr align="center">
          <td height="45"><font size="6" style="font-style: italic"><b>${month}월 교육신청자 현황</b></font></td>
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
                        <table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#DDDDDD">
                          <tr align="center">
                            <td rowspan="2"><font size="2"><b>과정명</b></font></td>
														<td rowspan="2"><font size="2"><b>교육기간</b></font></td>
														<td rowspan="2"><font size="2"><b>신청<br>율</b></font></td>
														<td rowspan="2"><font size="2"><b>수료<br>율</b></font></td>
														<td colspan="2"><font size="2"><b>계</b></font></td>
														<td rowspan="2"><font size="2"><b>충북</b></font></td>
														<td rowspan="2"><font size="2"><b>청주</b></font></td>

														<td rowspan="2"><font size="2"><b>충주</b></font></td>
														<td rowspan="2"><font size="2"><b>제천</b></font></td>

														<td rowspan="2"><font size="2"><b>보은</b></font></td>
														<td rowspan="2"><font size="2"><b>옥천</b></font></td>
														<td rowspan="2"><font size="2"><b>영동</b></font></td>
														<td rowspan="2"><font size="2"><b>증평</b></font></td>
														<td rowspan="2"><font size="2"><b>진천</b></font></td>
														<td rowspan="2"><font size="2"><b>괴산</b></font></td>
														<td rowspan="2"><font size="2"><b>음성</b></font></td>
														<td rowspan="2"><font size="2"><b>단양</b></font></td>
														<td rowspan="2"><font size="2"><b>기타</b></font></td>
                          								<td rowspan="2"><font size="2"><b>(구)청주</b></font></td>
                          								<td rowspan="2"><font size="2"><b>청원</b></font></td>
                          </tr>
                         	<tr>
														<td><font size="2"><b>구분</b></font></td>
														<td><font size="2"><b>인원</b></font></td>
													</tr>
                        </table>
                        <table width="746" border="1" cellspacing="1" cellpadding="0" height="100%" bgcolor="#00EEEE">
                          <tr align="right">
														<td align="center" rowspan="3" colspan="2"><font size="2"><b>계</b></font></td>
														<td rowspan="3"><font size="2"><b>${rsOpr_OrgStd.rcvRate}%</b></font></td>
														<td rowspan="3"><font size="2"><b>${rsOpr_OrgStd.passRate}%</b></font></td>
														<td align="center"><font size="2"><b>계획</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.plnStdNumber}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org6430000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org5710000}</b></font></td>

														<td><font size="2"><b>${rsOpr_OrgStd.org4390000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4400000}</b></font></td>

														<td><font size="2"><b>${rsOpr_OrgStd.org4420000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4430000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4440000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org5570000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4450000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4460000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4470000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4480000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org9999999}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4360000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.org4410000}</b></font></td>
													</tr>
													<tr align="right">
														<td align="center"><font size="2"><b>신청</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcvTotal}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv6430000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv5710000}</b></font></td>

														<td><font size="2"><b>${rsOpr_OrgStd.rcv4390000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4400000}</b></font></td>

														<td><font size="2"><b>${rsOpr_OrgStd.rcv4420000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4430000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4440000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv5570000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4450000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4460000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4470000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4480000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv9999999}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4360000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.rcv4410000}</b></font></td>
													</tr>
													<tr align="right">
														<td align="center"><font size="2"><b>수료</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.passTotal}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass6430000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass5710000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4390000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4400000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4420000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4430000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4440000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass5570000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4450000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4460000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4470000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4480000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass9999999}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4360000}</b></font></td>
														<td><font size="2"><b>${rsOpr_OrgStd.pass4410000}</b></font></td>
													</tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                        <table width="746" border="1" cellspacing="0" cellpadding="0">
                        	<c:forEach var="list" items="${rsOpr_OrgStdExcelList}" varStatus="i" >
				                    <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="#eeffee"/></c:if>
														<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
														<tr bgcolor="${lineBg}">
															<td rowspan="3">&nbsp;<font size="2">${list.courseName}</font></td>
															<td rowspan="3" align="center"><font size="2">${list.eduDate}</font></td>
															<td rowspan="3"><font size="2">${list.rcvRate}</font></td>
															<td rowspan="3"><font size="2">${list.passRate}</font></td>
															<td align="center"><font size="2">계획</font></td>
															<td><font size="2">${list.eduCount}</font></td>
															<td><font size="2">${list.org6430000}</font></td>
															<td><font size="2">${list.org5710000}</font></td>
															<td><font size="2">${list.org4390000}</font></td>
															<td><font size="2">${list.org4400000}</font></td>
															<td><font size="2">${list.org4420000}</font></td>
															<td><font size="2">${list.org4430000}</font></td>
															<td><font size="2">${list.org4440000}</font></td>
															<td><font size="2">${list.org5570000}</font></td>
															<td><font size="2">${list.org4450000}</font></td>
															<td><font size="2">${list.org4460000}</font></td>
															<td><font size="2">${list.org4470000}</font></td>
															<td><font size="2">${list.org4480000}</font></td>
															<td><font size="2">${list.org9999999}</font></td>
															<td><font size="2">${list.org4360000}</font></td>
															<td><font size="2">${list.org4410000}</font></td>
														</tr>
														<tr bgcolor="${lineBg}">
															<td align="center"><font size="2">신청</font></td>
															<td><font size="2">${list.rcvTotal}</font></td>
															<td><font size="2">${list.rcv6430000}</font></td>
															<td><font size="2">${list.rcv5710000}</font></td>
															<td><font size="2">${list.rcv4390000}</font></td>
															<td><font size="2">${list.rcv4400000}</font></td>
															<td><font size="2">${list.rcv4420000}</font></td>
															<td><font size="2">${list.rcv4430000}</font></td>
															<td><font size="2">${list.rcv4440000}</font></td>
															<td><font size="2">${list.rcv5570000}</font></td>
															<td><font size="2">${list.rcv4450000}</font></td>
															<td><font size="2">${list.rcv4460000}</font></td>
															<td><font size="2">${list.rcv4470000}</font></td>
															<td><font size="2">${list.rcv4480000}</font></td>
															<td><font size="2">${list.rcv9999999}</font></td>
															<td><font size="2">${list.rcv4360000}</font></td>
															<td><font size="2">${list.rcv4410000}</font></td>
														</tr>
														<tr bgcolor="${lineBg}">
															<td align="center"><font size="2">수료</font></td>
															<td><font size="2">${list.passTotal}</font></td>
															<td><font size="2">${list.pass6430000}</font></td>
															<td><font size="2">${list.pass5710000}</font></td>
															<td><font size="2">${list.pass4390000}</font></td>
															<td><font size="2">${list.pass4400000}</font></td>
															<td><font size="2">${list.pass4420000}</font></td>
															<td><font size="2">${list.pass4430000}</font></td>
															<td><font size="2">${list.pass4440000}</font></td>
															<td><font size="2">${list.pass5570000}</font></td>
															<td><font size="2">${list.pass4450000}</font></td>
															<td><font size="2">${list.pass4460000}</font></td>
															<td><font size="2">${list.pass4470000}</font></td>
															<td><font size="2">${list.pass4480000}</font></td>
															<td><font size="2">${list.pass9999999}</font></td>
															<td><font size="2">${list.pass4360000}</font></td>
															<td><font size="2">${list.pass4410000}</font></td>
														</tr>
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
    </td>
  </tr>
</table>