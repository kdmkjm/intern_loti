<%@page import="loti.sys.org.model.SysOrg"%>
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%

String titleName = "명세(기본급)";

titleName = new String(titleName.getBytes("KSC5601"), "8859_1");

response.setHeader("Content-Transfer-Encoding", "binary;");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");

response.setHeader("Content-Disposition","attachment;filename="+titleName+".xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>

<style type="text/css">
	table td{text-align:center;}
</style>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center" colspan="11" style="font-weight: 700; font-size: 18pt;">${title}</td>
		<table border="1" cellspacing="1" cellpadding="0">
			<tr align="center" style="background-color:#D4F4FA; height:40px;">
				<td rowspan="2">번호</td>
				<td rowspan="2">성명</td>
				<td colspan="2">송 금 계 좌</td>
				<td rowspan="2">실수령액<br>(A-B+C)</td>
				<td rowspan="2">총계<br>(A+C)</td>
				<td rowspan="2">수당<br>(A)</td>
				<td colspan="3">공      제      액</td>
				<td rowspan="2">여비<br>(C)</td>
			</tr>
			<tr align="center" style="background-color:#D4F4FA; height:40px;">
				<td>은행</td>
				<td>계좌번호</td>
				<td>소득세</td>
				<td>지방소득세</td>
				<td>계(B)</td>
			</tr>
			<c:forEach var="list" items="${rsPrf_PayExcelList2}" varStatus="i">
				<tr>
					<td align="center">${list.rnum}</td>
					<td align="center">${list.profname}</td>
					<td align="center">${list.bankcode}</td>
					<td align="center">${list.accountno}</td>
					<td><fmt:formatNumber value="${list.netpay}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.netpay2}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.lectpay}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.incometax}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.inhabtax}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.sumTax}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.travel}" pattern="#,###"/></td>
				</tr>
			</c:forEach>
			<c:forEach var="total" items="${rsPrf_PayExcelList2Total}" varStatus="i">
				<tr>
					<td></td>
					<td align="center" style="font-weight: 600;">${total.totalCount}명</td>
					<td></td>
					<td></td>
					<td align="center" style="font-weight: 600; background-color:#FFFF24;"><fmt:formatNumber value="${total.totalNetpay}" pattern="#,###"/></td>
					<td align="center" style="font-weight: 600; background-color:#FFFF24;"><fmt:formatNumber value="${total.totalNetpay2}" pattern="#,###"/></td>
					<td align="center" style="font-weight: 600; background-color:#FFFF24;"><fmt:formatNumber value="${total.totalLectpay}" pattern="#,###"/></td>
					<td align="center" style="font-weight: 600; background-color:#FFFF24;"><fmt:formatNumber value="${total.totalIncometax}" pattern="#,###"/></td>
					<td align="center" style="font-weight: 600; background-color:#FFFF24;"><fmt:formatNumber value="${total.totalInhabtax}" pattern="#,###"/></td>
					<td align="center" style="font-weight: 600; background-color:#FFFF24;"><fmt:formatNumber value="${total.totalSumtax}" pattern="#,###"/></td>
					<td align="center" style="font-weight: 600; background-color:#FFFF24;"><fmt:formatNumber value="${total.totalTravel}" pattern="#,###"/></td>
				</tr>	
			</c:forEach>
		</table>
	</tr>
</table>