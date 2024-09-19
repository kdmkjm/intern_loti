<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(135);
	}
	function goList()
	{		
		document.forms[0].submit();
	}
//-->
</script>
<html:form method="POST" action="/rscInst.act?task=list" >
<html:hidden property="searchFacsType" value="${searchFacsType}"/>
<html:hidden property="searchKeyword" value="${searchKeyword}"/>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_01-4.gif"/>' alt="�����纰 ���"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--���̺� ��� ����-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="149">�������</td>
											<td class="sBg" width="1"></td>
											<td class="t1" width="99">�뵵</td>
											<td class="sBg" width="1"></td>
											<td class="t1" width="69">�������</td>
											<td class="sBg" width="1"></td>
											<td class="t1">��ġ���</td>
											<td width="17"></td>
										</tr>
									</table>
									<!--���̺� ��� ��-->
									<!--����Ʈ ����-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:set var="no" scope="request" value="1"/>
										<c:forEach var="list" items="${rsRscInstDetlList}" varStatus="i" >
											<!-- �� ��� -->
											<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<tr class="${lineBg}">
												<td class="t3" width="149">&nbsp;<c:out value="${list.facsName}"/></td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="99">&nbsp;<c:out value="${list.purpose}"/></td>
												<td class="sBg" width="1"></td>
												<td class="t4" width="69"><c:out value="${list.count}"/>&nbsp;</td>
												<td class="sBg" width="1"></td>
												<td class="t3">&nbsp;<c:out value="${list.place}"/></td>
											</tr>
											<tr>
												<td colspan="13" class="lbg3"></td>
											</tr>
											<c:set var="no" scope="request" value="${no + 1}"/>
										</c:forEach>
										<c:if test="${no==1}">
											<tr class="tbg3" height="21">
												<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
											</tr>
										</c:if>
									</table>
									</div>
									<!--����Ʈ ��-->
								</td>
							</tr>
						</table>
						<!--�ϴܹ�ư ���̺� ����-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom"> 
								<td align="right">
									<img src='<html:rewrite page="/images/board/btn_list.gif"/>' align="absmiddle" alt="���" onclick="goList();" style="cursor:hand"/>
								</td>
							</tr>
						</table>
		    			<!--�ϴܹ�ư ���̺� ��-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</html:form>
<script type="text/javascript">
<!--
	tresize(135);
//-->
</script>