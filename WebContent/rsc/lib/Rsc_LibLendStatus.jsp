<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script src='<html:rewrite page="/common/js/popupcalendar.js"/>'></script>

<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(185);
	}
	function goList()
	{		
		document.forms[0].action = 'rscLib.act?task=list';
		document.forms[0].submit();
	}
//-->
</script>
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
						<!--��� �˻� ���̺� ���� -->
						<html:form method="POST" action="/rscLib.act?task=lendStatus" >
						<html:hidden property="searchKeywordBookType1" 	value="${searchBookType}"/>
						<html:hidden property="searchKeywordReqNo" 			value="${searchReqNo}"/>
						<html:hidden property="searchKeywordBookName" 	value="${searchBookName}"/>
						<html:hidden property="searchKeywordPublisher" 	value="${searchPublisher}"/>
						<html:hidden property="searchKeywordAuthor" 		value="${searchAuthor}"/>
						<html:hidden property="searchKeywordUserName" 	value="${searchUserName}"/>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr> 
								<td width="99" class="s1">���ⱸ��</td>
								<td class="sBg"></td>
								<td width="150" class="s2"> 
									<html:select property="searchKeywordIsLent" style="width:100px">
										<html:option value="">��ü</html:option>
										<html:option value="ingLend">������</html:option>
										<html:option value="trueLend">�ݳ��Ϸ�</html:option>
										<html:option value="noRetn">�̹ݳ�</html:option>
									</html:select>
								</td>
								<td class="sBg"></td>
								<td width="99" class="s1">�Ⱓ</td>
								<td class="sBg"></td>
								<td class="s2"> 
									<html:text property="searchKeywordLendFromDate" style="width:80px" /><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' width="16" height="19" align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchKeywordLendFromDate, 'yyyy-mm-dd');"> ~  
									<html:text property="searchKeywordLendToDate" style="width:80px" /><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' width="16" height="19" align="absbottom" style="cursor:hand" onclick="Calendar_D(this, searchKeywordLendToDate, 'yyyy-mm-dd');">
								</td>
								<td width="60"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" /></td>
						  </tr>
						</table>
						</html:form>
						<!--��� �˻� ���̺� ��-->
						<table>
							<tr>
			        	<td height="15"></td>
							</tr>
						</table>
						<!--�Խù� ��� ����-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
			            <!--���̺� ��� ����-->
			            <table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr> 
									    <td class="t1">������</td>
											<td class="sBg"></td>
									    <td class="t1" width="59">�����з�</td>
											<td class="sBg"></td>
									    <td class="t1" width="59">����</td>
											<td class="sBg"></td>
									    <td class="t1" width="79">���ǻ�</td>
											<td class="sBg"></td>
									    <td class="t1" width="69">��������</td>
											<td class="sBg"></td>
									    <td class="t1" width="69">�ݳ�����</td>
											<td class="sBg"></td>
									    <td class="t1" width="64">���ⱸ��</td>
											<td class="sBg"></td>
									    <td class="t1" width="59">������</td>
											<td class="sBg"></td>
									    <td class="t1" width="90">����ó</td>
									    <td width="17"></td>
										</tr>
									</table>
									<!--���̺� ��� ��-->
                  <!--����Ʈ ����-->
                  <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:set var="no" scope="request" value="1"/>
										<c:forEach var="libLendList" items="${rsRscLibLendStatus}" varStatus="i" >
								    	<!-- �� ��� -->
											<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<tr class="${lineBg}">
												<td class="t3">&nbsp;<c:out value="${libLendList.bookName}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="59"><c:out value="${libLendList.bookType1}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="59"><c:out value="${libLendList.author}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="79"><c:out value="${libLendList.publisher}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="69"><c:out value="${libLendList.lendDate}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="69"><c:out value="${libLendList.retnDate}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="64"><c:out value="${libLendList.isLent}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="59"><c:out value="${libLendList.lendUserName}"/></td>
												<td class="sBg"></td> 
												<td class="t2" width="90"><c:out value="${libLendList.lendUserPhone}"/></td> 
								    	</tr>
											<tr> 
                        <td class="lbg3" colspan="19"></td>
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
  								<!--�Խù� ��� ��-->
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
<script type="text/javascript">
<!--
	tresize(185);
//-->
</script>

