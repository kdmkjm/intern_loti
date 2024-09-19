<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script language="JavaScript">
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(115);
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="����� ���� ����" src="/images/teacher/title_03-3.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
				<tr>
					<td>
						<!--���̺� ��� ����-->
						<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
							<tr>
								<td class="t1" width="119">����</td>
								<td class="sBg"></td>
								<td class="t1">�������޴��</td>
								<td class="sBg"></td>
								<td class="t1" width="49">
									����<br>�ð�
								</td>
								<td class="sBg"></td>
								<td class="t1" width="69">�⺻</td>
								<td class="sBg"></td>
								<td class="t1" width="69">�ʰ�</td>
								<td class="sBg"></td>
								<td class="t1" width="50">����</td>
								<td width="17"></td>
							</tr>
						</table>
						<!--���̺� ��� ��-->
						<!--����Ʈ ����-->
						<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
							<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
								<c:set var="no" scope="request" value="0" />
								<c:forEach var="list" items="${rsPrf_PayStandardList}" varStatus="i">
									<!-- �� ��� -->
									<c:if test="${no%2 == 0}">
										<c:set var="lineBg" scope="request" value="tbg3" />
									</c:if>
									<c:if test="${no%2 == 1}">
										<c:set var="lineBg" scope="request" value="" />
									</c:if>
									<tr class="${lineBg}">
										<td class="t2" width="119">
											<c:out value="${list.levelName}" />
										</td>
										<td class="sBg"></td>
										<td class="t3" style="padding: 5px 5px 5px 5px;">
											<bean:write name="list" property="payTarget" filter="false" />
										</td>
										<td class="sBg"></td>
										<td class="t2" width="49">
											<c:out value="${list.stdHour}" />
										</td>
										<td class="sBg"></td>
										<td class="t4" width="69">
											<fmt:formatNumber value="${list.basePay}" pattern="#,##0" />
											&nbsp;
										</td>
										<td class="sBg"></td>
										<td class="t4" width="69">
											<fmt:formatNumber value="${list.exceedPay}" pattern="#,##0" />
											&nbsp;
										</td>
										<td class="sBg"></td>
										<td class="t2" width="50">
											<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="����"
												onclick='location.href="<html:rewrite page="/prfPayStandard.act?task=modify&profLevel=${list.profLevel}"/>"' style="cursor: hand" />
										</td>
									</tr>
									<tr>
										<td colspan="11" class="lbg3"></td>
									</tr>
									<c:set var="no" scope="request" value="${no + 1}" />
								</c:forEach>
							</table>
						</div>
						<!--����Ʈ ��-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
<!--
	tresize(115);
//-->
</script>