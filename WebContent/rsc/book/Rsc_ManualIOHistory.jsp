<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
	<!--
	window.onresize = function(){
		//   ������ ������ ���� ���� �ڵ�
		tresize(190);
	}
	function doDelete(num)
	{
		var del_confirm = confirm('�����Ͻðڽ��ϱ�?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/rscBook.act?task=delete&txBookSeq='+num;
			document.location.href = url;
		}
		else
		{
			return;
		}
	}
	function inBook(num, num2)
	{
		var txBookSeq = num;
		var seqNo 		= num2;
		window.open('<html:rewrite page="/rscBook.act?task=inBook&ioType=1&txBookSeq=' + txBookSeq + '&seqNo='+ seqNo +'"/>', 'popup', 'scrollbars=no, menubar=no, width=650, height=301, status=yes top=150, left=150');
	}
	
	function outBook(num, num2)
	{
		var txBookSeq = num;
		var seqNo 		= num2;
		window.open('<html:rewrite page="/rscBook.act?task=outBook&ioType=1&txBookSeq=' + txBookSeq + '&seqNo='+ seqNo +'"/>', 'popup', 'scrollbars=no, menubar=no, width=650, height=301, status=yes top=150, left=150');
	}
	
	//���� �ٿ�ε�
	function excelDown(num)
	{
		var txBookSeq = num;
		var url = '${pageContext.request.contextPath}/rscBook.act?task=excel&txBookSeq=' + txBookSeq;
		document.location.href = url;
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
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_02-3.gif"/>' alt="���� ����-����� �̷�"/></td>
				</tr>
				<tr>
					<td height="15"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>												
			        	<td height="25">
			        		<img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" />
			        		<b>����� : <c:out value="${txBookName}"/></b>
			        		<html:hidden property="txBookName" value="${txBookName}"/>
		        		</td>
							</tr>
						</table>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
							<tr>
								<td>
									<!--���̺� ��� ����-->
									<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
										<tr>
											<td class="t1" width="79">����</td>
                      <td class="sBg"></td>
                      <td class="t1" width="99">����</td>
                      <td class="sBg"></td>
                      <td class="t1" width="89">�԰�</td>
                      <td class="sBg"></td>
                      <td class="t1" width="89">���</td>
                      <td class="sBg"></td>
                      <td class="t1" width="299">����(����)</td>
                      <td class="sBg"></td>
                      <td class="t1" width="69">ó��</td>
                      <td width="17"></td>
										</tr>
									</table>
									<!--���̺� ��� ��-->
									<!--����Ʈ ����-->
									<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
									<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
										<c:set var="no" scope="request" value="1"/>
										<c:forEach var="list" items="${rsRscBookHistoryList}" varStatus="i" >
											<!-- �� ��� -->
											<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											
											<html:hidden property="txBookSeq" value="${list.txBookSeq}"/>
											<html:hidden property="seqNo" value="${list.seqNo}"/>
											<tr class="${lineBg}">
												<td class="t2" width="79"><c:out value="${list.ioType}"/></td>
												<td class="sBg" width="1"></td>
												<td class="t2" width="99"><c:out value="${list.ioDate}"/></td>
												<td class="sBg" width="1"></td>
												<td class="t4" width="89"><c:out value="${list.stockIn}"/>&nbsp;</td>
												<td class="sBg" width="1"></td>
												<td class="t4" width="89"><c:out value="${list.stockOut}"/>&nbsp;</td>
												<td class="sBg" width="1"></td>
												<td class="t3" width="299">&nbsp;<c:out value="${list.remarks}"/></td>
												<td class="sBg" width="1"></td>
												<td class="t2" width="69">
													<c:set var="stockType" scope="request" value="out"/>
													<c:if test="${list.ioType == '�԰�'}"><c:set var="stockType" scope="request" value="in"/></c:if>
														<img src='<html:rewrite page="/images/board/btn_modify.gif"/>'  align="absmiddle" alt="����" onClick="${stockType}Book(${list.txBookSeq},${list.seqNo});" style="cursor:hand"/>
												</td>
											</tr>
											<tr>
												<td colspan="11" class="lbg3"></td>
											</tr>
											<c:set var="stockInTotal" scope="request" value="${stockInTotal+list.stockIn}"/>
											<c:set var="stockOutTotal" scope="request" value="${stockOutTotal+list.stockOut}"/>
											<c:set var="no" scope="request" value="${no + 1}"/>
										</c:forEach>
									</table>	
									</div>
									<!--����Ʈ ��-->
									<!--����Ʈ �� ����-->
									<c:if test="${no != 1}">
									<table width="746" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="t2BgRed" width="179">��</td>
											<td class="sBg" width="1"></td>
											<td class="t2BgRedR" width="89">${stockInTotal}&nbsp;</td>
											<td class="sBg" width="1"></td>
											<td class="t2BgRedR" width="89">${stockOutTotal}&nbsp;</td>
											<td class="sBg" width="1"></td>
											<td class="t2BgRed" width="386">&nbsp;<b>������ : ${stockInTotal - stockOutTotal}</b></td>
										</tr>
									</table>
									</c:if>
									<!--����Ʈ �� ��-->
								</td>
							</tr>
						</table>
						<!--�ϴܹ�ư ���̺� ����-->
						<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						  <tr valign="bottom"> 
						    <td align="right">
						    	<img src='<html:rewrite page="/images/board/btn_excel.gif"/>' alt="�����ٿ�ε�"  align="absmiddle" onclick="excelDown(${txBookSeq});" style="cursor:hand"/>
						    	<img src='<html:rewrite page="/images/board/btn_list.gif"/>' alt="���"  align="absmiddle" onclick="document.location.href=document.referrer;" style="cursor:hand"/>
						    </td>
						  </tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
  </tr>
</table>
<script type="text/javascript">
<!--
	tresize(190);
//-->
</script>