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

String titleName = "�������";

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
				<td rowspan="2">����</td>
				<td rowspan="2">�����</td>
				<td rowspan="2">�Ҽ�</td>
				<td rowspan="2">����</td>
				<td rowspan="2">����</td>
				<td rowspan="2">�����Ͻ�</td>
				<td rowspan="2">�ð�</td>
				<td rowspan="2">�Ѿ�<br>(��+��+��)</td>
				<td>�۱ݰ���</td>
				<td></td>
				<td>����</td>
				<td></td>
				<td>���缼��</td>
				<td></td>
				<td></td>
				<td>�����޾�</td>
				<td colspan="7">����</td>
				<td rowspan="2">������</td>
				<td rowspan="2">�����</td>
			</tr>
			<tr style="background-color:#D4F4FA; height:40px;">
				<td>����</td>
				<td>���¹�ȣ</td>
				<td>���系��</td>
				<td>����ݾ�</td>
				<td>���ݰ�</td>
				<td>�ҵ漼</td>
				<td>����ҵ漼</td>
				<td>(��-��+��)</td>
				<td>�����</td>
				<td>����</td>
				<td>��</td>
				<td>�Ϻ�</td>
				<td>���ں�</td>
				<td>�ĺ�</td>
				<td>�����</td>
			</tr>
			<tr style="background-color: #FAF4C0; height:30px;">
				<td></td>
				<td>��</td>
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
							<br>�ʰ� <fmt:formatNumber value="${list.exceedpay2}" pattern="#,###"/>
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