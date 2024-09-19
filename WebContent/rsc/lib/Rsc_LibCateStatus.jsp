<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(160);
	}
	function goList()
	{		
		document.forms[0].action = 'rscLib.act?task=list';
		document.forms[0].submit();
	}
//-->
</script>
<html:form method="POST" action="rscLib.act?task=list">
<html:hidden property="searchKeywordBookType1" 	value="${searchBookType}"/>
<html:hidden property="searchKeywordReqNo" 			value="${searchReqNo}"/>
<html:hidden property="searchKeywordBookName" 	value="${searchBookName}"/>
<html:hidden property="searchKeywordPublisher" 	value="${searchPublisher}"/>
<html:hidden property="searchKeywordAuthor" 		value="${searchAuthor}"/>
<html:hidden property="searchKeywordUserName" 	value="${searchUserName}"/>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
	</tr>
	<tr>
		<td>
			<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_03-2.gif"/>' alt="����������Ȳ"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<!--�Խù� ��� ����-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
			            <!--���̺� ��� ����-->
			            <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr> 
									    <td class="t1" width="99">����</td>
											<td class="sBg"></td>
									    <td class="t1">�����з�</td>
											<td class="sBg"></td>
									    <td class="t1" width="200">��������</td>
									    <td width="17"></td>
										</tr>
									</table>
									<!--���̺� ��� ��-->
                  <!--����Ʈ ����-->
                  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:set var="no" scope="request" value="1"/>
										<c:set var="total" scope="request" value="0"/>
										<c:forEach var="list" items="${rsRscLibCateStatus}" varStatus="i" >
								    	<!-- �� ��� -->
											<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<tr class="${lineBg}">
												<td class="t2" width="99"><c:out value="${no}"/></td>
												<td class="sBg"></td> 
												<td class="t3">&nbsp;<c:out value="${list.bookType1}"/></td>
												<td class="sBg"></td> 
												<td class="t4" width="200"><fmt:formatNumber value="${list.cnt}" pattern="#,##0"/>&nbsp;</td>
								    	</tr>
											<tr> 
                        <td class="lbg3" colspan="19"></td>
                      </tr>
											<c:set var="no" scope="request" value="${no + 1}"/>
											<c:set var="total" scope="request" value="${total+list.cnt}"/>
										</c:forEach>
										<c:if test="${no==1}">
											<tr class="tbg3" height="21">
												<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
											</tr>
										</c:if>
									</table>
									</div>
  								<!--�Խù� ��� ��-->
									<!--�߰� �κ� ����-->                
                  <table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr> 
											<td width="478" class="t2BgRed"></td>
											<td width="50" class="t2BgRed">�հ� </td>
											<td width="1" class="sBg"></td>
											<td width="200" class="t2BgRedR"><fmt:formatNumber value="${total}" pattern="#,##0"/>&nbsp;</td>
											<td width="17" class="t2BgRed"></td>
                    </tr>
									</table>
                  <!--�߰� �κ� ��-->
  							</td>
  						</tr>
  					</table>
  					<!--�Խù� �Ʒ� ��ư ����-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
							<tr valign="bottom">
								<td align="right">
									<input type="image" src='<html:rewrite page="/images/board/btn_list.gif" />' align="absmiddle" alt="���" onclick="goList();"/>
								</td> 
							</tr>
						</table>
						<!--�Խù� �Ʒ� ��ư ��-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</html:form>
<script type="text/javascript">
<!--
	tresize(160);
//-->
</script>

