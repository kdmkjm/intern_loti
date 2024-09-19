<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script language="JavaScript">
<!--
window.onresize = function(){
//   윈도우 사이즈 변경 셋팅 코드
tresize(150);
}

window.name = "mgr"; 

//Agent Runtime 추가
function getAddSubmit(p_id, p_nm){
  window.open('<html:rewrite page="/sysAgent.act"/>?task=create&p_id='+p_id+'&p_nm='+p_nm,'popup_sar','menubars=no, scrollbars=no, width=500,height=220');
}

//Agent Runtime 수정
function getModifySubmit(p_id, p_seq, p_nm){
 	window.open('<html:rewrite page="/sysAgent.act"/>?task=info&p_id='+p_id+'&p_seq='+p_seq+'&p_nm='+p_nm,'popup_sar','menubars=no, scrollbars=no, width=500,height=220');
}

//Agent Runtime 삭제
function getDeleteSubmit(frm, p_id, p_seq){
	if (confirm("삭제하시겠습니까?")) {
		frm.p_id.value=p_id;
		frm.p_seq.value=p_seq;
		
		frm.action="<html:rewrite page="/sysAgent.act?task=delete"/>";
		frm.submit();
	} else return false;
}

//-->
</script>
<html:form method="POST" action="/sysAgent.act">
<html:hidden name="sysAgentForm" property="p_id"/>
<html:hidden name="sysAgentForm" property="p_seq"/>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
</tr>
<tr>
	<td>
		<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/resources/title_06-2.gif"/>' alt="Agent관리"/></td>
		</tr>
		<tr>
			<td height="15"></td>
		</tr>
		<tr>
			<td>
				<!--검색 -->
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td height="26"><img src="<html:rewrite page="/images/board/dot.gif"/>" width="20" height="12" align="absmiddle"><b><c:out value="${txAgentName}"/></b></td>
						<td align="right"><a href="<html:rewrite page="/sysAgent.act?task=agent"/>"><img src="<html:rewrite page="/images/board/btn_agent.gif"/>" width="83" height="25" style="cursor:pointer;" border="0" alt="Agent목록"></a></td>
						<td align="right" width="60"><img src="<html:rewrite page="/images/board/btn_up3.gif"/>" width="57" height="25" align="absmiddle" style="cursor:pointer;" onclick="getAddSubmit('${txPId}', '${txAgentName}')"  alt="등록"></td>
					</tr>
				</table>
				<!--검색 끝-->
				<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #91B475">
				<tr>
					<td>
						<!--테이블 헤더 시작-->
						<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
							<tr>
								<td class="t1" width="59">순번</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="185">스케줄타입</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="299">RUN 시간</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="129">상태</td>
								<td class="sBg" width="1"></td>
								<td class="t1" width="103">관리</td>
								<td width="17"></td>
							</tr>
						</table>
						<!--테이블 헤더 끝-->
						<!--리스트 시작-->
						<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
						<c:set var="no" scope="request" value="1"/>
						<table id="mainTable" width="746" border="0" cellspacing="0" cellpadding="0">
						<c:forEach var="agnetList" items="${rsSysAgentList}" varStatus="i" >
							<tr>
								<td class="t2" width="60">${no}</td>
								<td class="sBg" width="1"></td>
								<td class="t2" width="185"><c:out value="${agnetList.p_typenm}"/></td>
								<td class="sBg" width="1"></td>
								<td class="t2" width="299">
									<logic:equal name="agnetList" property="p_type" value="00001">
										${loti:dateFormatForRuntime("00001",agnetList.p_t1)}
									</logic:equal>
									<logic:equal name="agnetList" property="p_type" value="00002">
										${loti:dateFormatForRuntime("00002",agnetList.p_t2)}
									</logic:equal>
									<logic:equal name="agnetList" property="p_type" value="00003">
										${loti:dateFormatForRuntime("00003",agnetList.p_t3)}
									</logic:equal>
									<logic:equal name="agnetList" property="p_type" value="00004">
										${loti:dateFormatForRuntime("00004",agnetList.p_t4)}
									</logic:equal>
								</td>
								<td class="sBg" width="1"></td>
								<td class="t2" width="129"><c:out value="${agnetList.p_use}"/></td>
								<td class="sBg" width="1"></td>
								<td class="t2" width="102">
									<img src="<html:rewrite page="/images/board/btn_modify.gif"/>" align="absmiddle" style="cursor:pointer;" onclick="getModifySubmit('${agnetList.p_id}','${agnetList.p_seq}','${txAgentName}')">
									<img src="<html:rewrite page="/images/board/btn_del2.gif"/>" align="absmiddle" style="cursor:pointer" onclick="return getDeleteSubmit(document.forms[0], '${agnetList.p_id}','${agnetList.p_seq}');">
								</td>
								<td width="17"></td>
							</tr>
	            <tr><td class="lbg3" colspan="99"></td></tr>
							<c:set var="no" scope="request" value="${no + 1}"/>
						</c:forEach>
						<c:if test="${no==1}">
							<tr class="tbg3"><td class="t2" colspan="99">조회된 데이터가 없습니다.</td></tr>
						</c:if>
						</table>
						</div>
						<!--리스트 끝-->
					</td>
				</tr>
				</table>
				<!--하단버튼 테이블 시작-->
    			<!--하단버튼 테이블 끝-->
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
</html:form>

<script type="text/javascript">
<!--
	tresize(150);

//-->
</script>
