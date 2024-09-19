<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������������" src="/images/resources/title_05.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<html:form method="POST" action="extMainPrsn.act?task=modify">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	  <tr>
		<td>
		  <table>
		  <tr>
			<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />��������</td>
		  </tr>
		  </table>
		  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		  <tr>
			<td>
			  <!--�������� ����-->
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr> 
				<td class="t1 cbg4" width="149">����(�ѱ�)</td>
				<td class="sBg"></td>
				<td class="t3" width="222">&nbsp;<c:out value="${rsExtMain_MyInfoAuth.userName}"/></td>
				<td class="sBg"></td>
				<td class="t1 cbg4" width="149">�������</td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;<c:out value="${rsExtMain_MyInfoAuth.userBirth}"/></td>
			  </tr>
			  <tr>
				<td colspan="7" class="lbg3"></td>
			  </tr>
			  <tr> 
				<td class="t1 cbg4" width="149">�Ҽ�</td>
				<td class="sBg"></td>
				<td class="t3" width="222">&nbsp;<c:out value="${rsExtMain_MyInfoAuth.position}"/></td>
				<td class="sBg"></td>
				<td class="t1 cbg4" width="149">����</td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;<c:out value="${rsExtMain_MyInfoAuth.grade}"/></td>
			  </tr>
			  <tr>
				<td colspan="7" class="lbg3"></td>
			  </tr>
			  <tr> 
				<td class="t1 cbg4" width="149">�޴���</td>
				<td class="sBg"></td>
				<td class="t3" width="222">&nbsp;<html:text property="cellPhone" style="width:94%; IME-MODE:disabled" maxlength="20" onkeydown="key_num_minus()" value="${rsExtMain_MyInfoAuth.cellPhone}"/></td>
				<td class="sBg"></td>
				<td class="t1 cbg4" width="149">�繫�ǿ���ó</td>
				<td class="sBg"></td>
				<td class="t3">&nbsp;<html:text property="telPhone" style="width:94%; IME-MODE:disabled" maxlength="20" onkeydown="key_num_minus()" value="${rsExtMain_MyInfoAuth.telPhone}"/></td>
			  </tr>
			  <c:if test="${inUser == 'Y'}">
			    <tr>
				  <td colspan="7" class="lbg3"></td>
			    </tr>
			    <tr> 
				  <td class="t1 cbg4" width="149">�̸���</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;<html:text property="email" style="width:94%;" maxlength="30" value="${rsExtMain_MyInfoAuth.email}"/></td>
				  <td class="sBg"></td>
				  <td class="t1 cbg4" width="149">�³��� ��й�ȣ</td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;<html:password property="onnaraPass" style="width:50%;" maxlength="20" value="${rsExtMain_MyInfoAuth.onnaraPass}"/></td>
			    </tr>
			  </c:if>
			  <c:if test="${inUser != 'Y'}">
				<tr>
				  <td colspan="7" class="lbg3"></td>
				</tr>
				<tr> 
				  <td class="t1 cbg4" width="149">�̸���</td>
				  <td class="sBg"></td>
				  <td class="t3" colspan="5">&nbsp;<html:text property="email" style="width:94%;" maxlength="30" value="${rsExtMain_MyInfoAuth.email}"/></td>
				</tr>
			  </c:if>
			</table>
			<!--�������� ��-->
		  </td>
		</tr>
		</table>
		<!--�ϴܹ�ư ���̺� ����-->
		<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
		<tr valign="bottom"> 
		  <td align="right">
			<img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="����" onclick="document.forms[0].submit();" style="cursor:hand"/>
		  </td>
		</tr>
		</table>
		<!--�ϴܹ�ư ���̺� ��-->
	  </td>
	</tr>
	</table>
	<c:if test="${rsExtMain_MyInfoAuth.isAdmin == 'Y' || rsExtMain_MyInfoAuth.isEduCharger == 'Y'}">
	  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">	
	  <tr valign="top">
		<td>
		  <table width="750" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' align="absmiddle" alt="" />�ʱ�޴�����</td>
		  </tr>
		  </table>
		  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
		  <tr>
			<td width="99" class="s1">���� �ʱ�޴�</td>
			<td class="sBg" width="1"></td>
			<td class="s2">&nbsp;<c:out value="${rsExtMain_MyInfoAuth.menuName}"/></td>
		  </tr>
		  </table>
		  <table width="750" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td height="10"></td>
		  </tr>
		  <tr valign="top">
			<td width="250">
			  <table width="240" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
			  <tr>
				<td>		
				  <!--���̺� ��� ����-->
				  <table width="240" border="0" cellspacing="0" cellpadding="0" class="cbg">
				  <tr>
					<td class="t1" colspan="6">�ָ޴�</td>
				  </tr>
				  <tr>
					<td colspan="6" class="lbg3"></td>
				  </tr>
				  <tr>
					<td class="t1" width="44">��ȣ</td>
					<td class="sBg"></td>
					<td class="t1">������</td>
					<td width="17"></td>
				  </tr>
				  </table>
				  <!--���̺� ��� ��-->
				  <!--����Ʈ ����-->
				  <div id="mainList1" style="width:240px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
					<table id="mainTable1" width="223" border="0" cellspacing="0" cellpadding="0">
					<c:forEach var="list" items="${rsExtMain_MyInfoList}" varStatus="i" >
					  <!-- �� ��� -->
					  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
					  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
					  <c:if test="${rsExtMain_MyInfoAuth.initMenu == list.menuNo}"><c:set var="lineBg" scope="request" value="sBg2"/></c:if>
					  <c:if test="${rsExtMain_MyInfo.menuName == list.menuName}"><c:set var="lineBg" scope="request" value="sBg2"/></c:if>
					  <c:if test="${firstMenu == list.menuName}"><c:set var="lineBg" scope="request" value="sBg2"/></c:if>
					  <html:hidden property="firstMenuNo" value="${list.menuNo}"/>
					  <html:hidden property="firstParent" value="${list.parent}"/>
					  <tr class="${lineBg}">
						<td class="t2" width="44"><c:out value="${i.count}"/></td>
						<td class="sBg"></td>
						<td class="t3">
							&nbsp;<a href="<html:rewrite page='/extMainPrsn.act?task=detail&parent=${list.menuNo}&menuNo=${list.menuNo}'/>"><u><c:out value="${list.menuName}"/></u></a>
						</td>
					  </tr>
					  <tr>
						<td colspan="5" class="lbg3"></td>
					  </tr>
					</c:forEach>
				  </table>
				</div>
				<!--����Ʈ ��-->
			  </td>
			</tr>
			</table>
		  </td>
		  <c:if test="${type != 'first'}">
			<td width="250">
			  <table width="240" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0" align="center">
			  <tr>
				<td>
				  <!--���̺� ��� ����-->
				  <table width="240" border="0" cellspacing="0" cellpadding="0" class="cbg">
				  <tr>
					<td class="t1" colspan="10">
					  <c:if test="${type == 'second'}">
					    <c:out value="${rsExtMain_MyInfo.menuName}"/> �޴�
					    <c:set var="preMenuName" scope="request" value="${rsExtMain_MyInfo.menuName}"/>
					  </c:if>
					  <c:if test="${type != 'second'}">
					    <c:out value="${secondMenuName}"/> �޴�
					    <c:set var="preMenuName" scope="request" value="${secondMenuName}"/>
					  </c:if>
					</td>
				  </tr>
				  <tr>
					<td colspan="10" class="lbg3"></td>
				  </tr>
				  <tr>
					<td class="t1" width="44">��ȣ</td>
					<td class="sBg"></td>
					<td class="t1">������</td>
					<td class="sBg"></td>
					<td class="t1" width="50">����</td>
					<td width="17"></td>
				  </tr>
				  </table>
				  <!--���̺� ��� ��-->
				  <!--����Ʈ ����-->
				  <div id="mainList2" style="width:240px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
					<table id="mainTable2" width="223" border="0" cellspacing="0" cellpadding="0">
					<c:forEach var="list" items="${rsExtMain_MyInfoDetailList}" varStatus="i" >
					  <!-- �� ��� -->
					  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
					  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
					  <c:if test="${rsExtMain_MyInfoAuth.initMenu == list.menuNo}"><c:set var="lineBg" scope="request" value="sBg2"/></c:if>
					  <c:if test="${secondMenu == list.menuName}"><c:set var="lineBg" scope="request" value="sBg2"/></c:if>
					  <html:hidden property="secondMenuNo" value="${list.menuNo}"/>
					  <html:hidden property="secondParent" value="${list.parent}"/>
					  <tr class="${lineBg}">
						<td class="t2" width="44"><c:out value="${i.count}"/></td>
						<td class="sBg"></td>
						<td class="t3">
						  <c:if test="${list.child == 'N'}">
							&nbsp;<c:out value="${list.menuName}"/>
						  </c:if>
						  <c:if test="${list.child == 'Y'}">
							&nbsp;<a href="<html:rewrite page='/extMainPrsn.act?task=third&parent=${list.parent}&menuNo=${list.menuNo}&secondMenuName=${preMenuName}'/>"><u><c:out value="${list.menuName}"/></u></a>
						  </c:if>
						</td>
						<td class="sBg"></td>
						<td class="t2" width="50">
						  <c:if test="${list.child == 'N'}">
							<img src='<html:rewrite page="/images/board/btn_s_select.gif"/>' align="absmiddle" alt="����" onclick="location.href='<html:rewrite page="/extMainPrsn.act?task=insert&menuNo=${list.menuNo}"/>'" style="cursor:hand"/>
						  </c:if>
						</td>
					  </tr>
					  <tr>
						<td colspan="10" class="lbg3"></td>
					  </tr>
					</c:forEach>
					</table>
				  </div>
				  <!--����Ʈ ��-->
				</td>
			  </tr>
			  </table>
			</td>
		  </c:if>
		  <c:if test="${type == 'first'}">
			<td width="250">
			  <table width="240" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0" align="right">
			  <tr>
				<td>
				  <!--���̺� ��� ����-->
				  <table width="240" border="0" cellspacing="0" cellpadding="0" class="cbg">
				  <tr>
					<td class="t1" colspan="10">�޴�</td>
				  </tr>
				  <tr>
					<td colspan="10" class="lbg3"></td>
				  </tr>
				  <tr>
					<td class="t1" width="44">��ȣ</td>
					<td class="sBg"></td>
					<td class="t1">������</td>
					<td class="sBg"></td>
					<td class="t1" width="50">����</td>
					<td width="17"></td>
				  </tr>
				  </table>
				  <!--���̺� ��� ��-->
				  <div id="mainList2" style="width:240px; z-index:0; overflow-y:scroll ;overflow-x:hidden;"> 
					<table id="mainTable2" width="223" border="0" cellspacing="0" cellpadding="0">
					<tr><td></td></tr>
					</table>
				  </div>
				</td>
			  </tr>
			  </table>
			</td>
		  </c:if>
		  <c:if test="${type == 'second' || type == 'first'}">
			<td width="250">
			  <table width="240" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0" align="right">
			  <tr>
				<td>
				  <!--���̺� ��� ����-->
				  <table width="240" border="0" cellspacing="0" cellpadding="0" class="cbg">
				  <tr>
					<td class="t1" colspan="10">�޴�</td>
				  </tr>
				  <tr>
					<td colspan="10" class="lbg3"></td>
				  </tr>
				  <tr>
					<td class="t1" width="44">��ȣ</td>
					<td class="sBg"></td>
					<td class="t1">������</td>
					<td class="sBg"></td>
					<td class="t1" width="50">����</td>
					<td width="17"></td>
				  </tr>
				  </table>
				  <!--���̺� ��� ��-->
				  <div id="mainList3" style="width:240px; z-index:0; overflow-y:scroll ;overflow-x:hidden;"> 
					<table id="mainTable3" width="223" border="0" cellspacing="0" cellpadding="0">
					<tr><td></td></tr>
					</table>
				  </div>
				</td>
			  </tr>
			  </table>
			</td>
		  </c:if>
		  <c:if test="${type == 'third'}">
			<td width="250">
			  <table width="240" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0" align="right">
			  <tr>
				<td>
				  <!--���̺� ��� ����-->
				  <table width="240" border="0" cellspacing="0" cellpadding="0" class="cbg">
				  <tr>
					<td class="t1" colspan="10"><c:out value="${rsExtMain_MyInfo.menuName}"/> �޴�</td>
				  </tr>
				  <tr>
					<td colspan="10" class="lbg3"></td>
				  </tr>
				  <tr>
					<td class="t1" width="44">��ȣ</td>
					<td class="sBg"></td>
					<td class="t1">������</td>
					<td class="sBg"></td>
					<td class="t1" width="50">����</td>
					<td width="17"></td>
				  </tr>
				  </table>
				  <!--���̺� ��� ��-->
				  <!--����Ʈ ����-->
				  <div id="mainList3" style="width:240px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
					<table id="mainTable3" width="223" border="0" cellspacing="0" cellpadding="0">
					<c:forEach var="list" items="${rsExtMain_MyInfoThirdList}" varStatus="i" >
					  <!-- �� ��� -->
					  <c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
					  <c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
					  <c:if test="${rsExtMain_MyInfoAuth.initMenu == list.menuNo}"><c:set var="lineBg" scope="request" value="sBg2"/></c:if>
					  <html:hidden property="thirdMenuNo" value="${list.menuNo}"/>
					  <html:hidden property="thirdParent" value="${list.parent}"/>
					  <tr class="${lineBg}">
						<td class="t2" width="44"><c:out value="${i.count}"/></td>
						<td class="sBg"></td>
						<td class="t3">&nbsp;<c:out value="${list.menuName}"/></td>
						<td class="sBg"></td>
						<td class="t2" width="50">
						  <img src='<html:rewrite page="/images/board/btn_s_select.gif"/>' align="absmiddle" alt="����" onclick="location.href='<html:rewrite page="/extMainPrsn.act?task=insert&menuNo=${list.menuNo}"/>'" style="cursor:hand"/>
						</td>
					  </tr>
					  <tr>
						<td colspan="5" class="lbg3"></td>
					  </tr>
					</c:forEach>
					</table>
				  </div>
				  <!--����Ʈ ��-->
				</td>
			  <tr>
			  </table>
			</td>		
		  </c:if>
		</tr>
		</table>
	  </td>
	</tr>
	</table>
	<script type="text/javascript">
	<!--
		triple_tresize(50, mainList1, mainList2, mainList3);
	//-->
	</script>		
	</c:if>
	</html:form>
  </td>
</tr>
</table>