<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script language="JavaScript">
function newArea(){
	document.forms[0].areano.value = "";
	document.forms[0].action = 'prfPayStandard.act?task=areaCreate';
	document.forms[0].submit();
}

function areaModify(num)
{
	document.all.areano.value = num;

	document.forms[0].action = 'prfPayStandard.act?task=areaModify';
	document.forms[0].submit();
}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">����������</h2>
				<h1>
					<img alt="��������" src="/images/teacher/title_03-4.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<!--�˻� -->
			<html:form method="POST" action="prfPayStandard.act?task=list">
				<html:hidden property="areano" />
				<%-- <table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #D6D6D6">
					<colgroup>
						<col width="100px"/>
						<col width="2px"/>
						<col width="260px"/>
						<col width="2px"/>
						<col width="100px"/>
						<col width="2px"/>
						<col width="180px"/>
						<col width="2px"/>
						<col width="100px"/>
						<col width="2px"/>
						<col />
					</colgroup>
					<tr valign="middle">
						<td width="90" class="s1">�Ⱓ</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:text property="searchFromDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="false" />
							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[0].searchFromDate);" />
							~&nbsp;
							<html:text property="searchToDate" style="width:55px; IME-MODE:disabled" maxlength="7" onkeydown="key_num_minus()" readonly="false" />
							<img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor: hand" onclick="Calendar_M(document.forms[0].searchToDate);" />
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">������</td>
						<td class="sBar"></td>
						<td class="s2">
							<select id="searchYear"></select>
							<select id="searchCourseName" >
								<option value="">���� ����</option>
							</select>
							<select id="searchKeyword">
								<option value="">������� ����</option>
							</select>
							<html:hidden property="searchColumn"/>
							<html:hidden property="searchCourseCode"/>
							<html:text property="searchCourseName" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">�����</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:text property="searchSubjName" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
					</tr>
					<tr>
						<td colspan="12" class="lbg3"></td>
					</tr>
					<tr valign="middle">
						<td width="90" class="s1">���Ǻо�</td>
						<td class="sBar"></td>
						<td class="s2" width="185">
							<html:select property="searchLecType" style="width:120px">
								<html:optionsCollection name="prfLecCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">������</td>
						<td class="sBar"></td>
						<td class="s2" width="140">
							<html:select property="searchProfLevel" style="width:120px">
								<html:optionsCollection name="prfProLevelCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td width="90" class="s1">������</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:select property="searchGradeCode" style="width:130px">
								<html:optionsCollection name="prfGradeCode" property="beanCollection" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td colspan="12" class="lbg3"></td>
					</tr>
					<tr>
						<td width="90" class="s1">����</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:select property="searchAreaCode" style="width:50px">
								<html:optionsCollection name="prfAreaCode" property="beanCollection" />
							</html:select>
						</td>
						<td class="sBar"></td>
						<td class="s1">����</td>
						<td class="sBar"></td>
						<td class="s2">
							<html:text property="searchName" style="width:114px;" onkeydown="javascript:if (event.keyCode == 13) { doSearch(document.forms[0]); }" />
						</td>
						<td class="sBar"></td>
						<td class="s2" colspan="7"></td>
						<td width="60" align="center">
							<img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="�˻�" onclick="doSearch(document.forms[0]);" style="cursor: hand" align="absbottom" />
						</td>
					</tr>
				</table> --%>
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border: 2px solid #50a1f0">
					<tr>
						<td>
							<!--���̺� ��� ����-->
							<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
								<tr>
									<td class="t1Line" width="60">��ȣ</td>
									<td class="t1Line">����</td>
									<td class="t1Line" width="200">�ݾ�(��)</td>
									<td class="t1Line" width="200">�Ÿ�(km)</td>
								</tr>
							</table>
							<!--���̺� ��� ��-->
							<!--����Ʈ ����-->
							<div id="mainList" style="width: 746px; z-index: 0; overflow-y: scroll; overflow-x: hidden">
								<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
								<c:forEach var="list" items="${rsPrf_AreaList}" varStatus="i">
								<tr class="${lineBg}">
									<td class="t2Line" width="60">
										<c:out value="${list.areaRownum}" />
									</td>
									<td class="t2Line" >
										<a href="#" onclick="areaModify('${list.areano}','');"><u><c:out value="${list.areaname}" /></u></a>
									</td>
									<td class="t2Line" width="200">
										<c:out value="${list.areacharge}" />
									</td>
									<td class="t2Line" width="183">
										<c:out value="${list.areadistance}" />
									</td>
								</tr>
								</c:forEach>
								</table>
							</div>
							<!--����Ʈ ��-->
						</td>
					</tr>
				</table>
				<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
					<tr valign="middle">
						<td align="right">
							<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' alt="�űԵ��" align="absmiddle" onclick="newArea();" style="cursor: hand" />
						</td>
					</tr>
				</table>
			</html:form>
		</td>
	</tr>
</table>