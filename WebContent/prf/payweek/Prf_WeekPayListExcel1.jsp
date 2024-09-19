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

String titleName = "강사수당";

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
		<h1>${title}</h1>
		<table width="750" border="1" cellspacing="1" cellpadding="0">
			<tr align="center" style="background-color:#D4F4FA; height:40px;">
				<td rowspan="2">연번</td>
				<td rowspan="2">강사명</td>
				<td rowspan="2">소속</td>
				<td rowspan="2">직위</td>
				<td rowspan="2">구분</td>
				<td rowspan="2">교육일시</td>
				<td rowspan="2">시간</td>
				<td rowspan="2">총액<br>(수+여+세)</td>
				<td>송금계좌</td>
				<td></td>
				<td>수당</td>
				<td></td>
				<td>수당세액</td>
				<td></td>
				<td></td>
				<td>총지급액</td>
				<td colspan="7">여비</td>
				<td rowspan="2">과정명</td>
				<td rowspan="2">과목명</td>
			</tr>
			<tr style="background-color:#D4F4FA; height:40px;">
				<td>은행</td>
				<td>계좌번호</td>
				<td>수당내용</td>
				<td>수당금액</td>
				<td>세금계</td>
				<td>소득세</td>
				<td>지방소득세</td>
				<td>(수-세+여)</td>
				<td>출발지</td>
				<td>기준</td>
				<td>계</td>
				<td>일비</td>
				<td>숙박비</td>
				<td>식비</td>
				<td>교통비</td>
			</tr>
			<tr style="background-color: #FAF4C0; height:30px;">
				<td></td>
				<td>계</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>=SUM(G6:G1000)</td>
				<td>=SUM(H6:H1000)</td>
				<td></td>
				<td></td>
				<td></td>
				<td>=SUM(L6:L1000)</td>
				<td>=SUM(M6:M1000)</td>
				<td>=SUM(N6:N1000)</td>
				<td>=SUM(O6:O1000)</td>
				<td>=SUM(P6:P1000)</td>
				<td></td>
				<td></td>
				<td>=SUM(S6:S1000)</td>
				<td>=SUM(T6:T1000)</td>
				<td>=SUM(U6:U1000)</td>
				<td>=SUM(V6:V1000)</td>
				<td>=SUM(W6:W1000)</td>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="list" items="${rsPrf_PayExcelList1}" varStatus="i">
				<tr>
					<td>${list.rnum}</td>
					<td>${list.profname}</td>
					<td>${list.workplace}</td>
					<td>${list.workpos}</td>
					<td>${list.proflevel}</td>
					<td>${list.lectdate}</td>
					<td>${list.lecthour}</td>
					<td><fmt:formatNumber value="${list.netpay2}" pattern="#,###"/></td>
					<td>${list.bankcode}</td>
					<td>${list.accountno}</td>
					<td>
						<fmt:formatNumber value="${list.basepay}" pattern="#,###"/>
						<c:if test="${list.exceedpay2 != 0}">
							<br>초과 <fmt:formatNumber value="${list.exceedpay2}" pattern="#,###"/>
						</c:if>
					</td>
					<td><fmt:formatNumber value="${list.lectpay}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.sumTax}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.incometax}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.inhabtax}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.netpay}" pattern="#,###"/></td>
					<td>${list.areaname}</td>
					<td></td>
					<td><fmt:formatNumber value="${list.travel}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.daypay}" pattern="#,###"/></td>
					<td></td>
					<td><fmt:formatNumber value="${list.foodpay}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${list.trafficpay}" pattern="#,###"/></td>
					<td>${list.coursename}</td>
					<td>${list.subjectname}</td>
				</tr>
			</c:forEach>
		</table>
	</tr>
</table>