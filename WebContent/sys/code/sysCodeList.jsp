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
		//   윈도우 사이즈 변경 셋팅 코드
		double_tresize(160);
	}
	function setPriNewCode()
	{
		var intCode = Number(document.all.priMaxCode.value) + 1;
		var stringCode = intCode.toString();
		
		var code = "";
		for(var i=0; i<5-stringCode.length; i++)
			code += '0';
		code += stringCode;
		
		document.all.inPriCodeDiv.value = code;		
	}
	function setSlvNewCode()
	{
		var intCode = Number(document.all.slvMaxCode.value) + 1;
		var stringCode = intCode.toString();
		
		var code = "";
		for(var i=0; i<5-stringCode.length; i++)
			code += '0';
		code += stringCode;
		
		document.all.inSlvCode.value = code;		
	}
	function priCodeModify(num)
	{
		var seq 			= Number(num);
		var codeDiv	= document.all.priCodeDive[seq].value;
		var name 			= document.all.priName[seq].value;
		
		document.all.inPriCodeDiv.value = codeDiv;
		document.all.inPriName.value = name;
	}
	function doPriReset()
	{
		setPriNewCode();
		document.all.inPriName.value = "";
	}
	
	//주코드 등록
	function doPriSubmit(frm)
	{
		if(frm.inPriName.value == ""){
			alert("주코드 : 코드분류를 입력하여 주시기 바랍니다.");
			frm.inPriName.focus();
			return false;
		}
			
		var insert_confirm = confirm('등록하시겠습니까?');
		if(insert_confirm == true)
		{
			frm.submit();
		}
	}	
	
	function slvCodeModify(num)
	{
		var seq = Number(num);
		var max = Number(document.all.max.value);
		
		// 리스트가 1개일때
		if(max == 1)
		{
			var slvCode				= document.all.slvCode.value;
			var slvName 			= document.all.slvName.value;
			var slvProperty		= document.all.slvProperty.value;
			var slvDispOrder 	= document.all.slvDispOrder.value;
			var slvCodeDiv		= document.all.slvCodeDiv.value;
		}
		// 리스트가 여러개일때
		else
		{
			var slvCode				= document.all.slvCode[seq].value;
			var slvName 			= document.all.slvName[seq].value;
			var slvProperty		= document.all.slvProperty[seq].value;
			var slvDispOrder 	= document.all.slvDispOrder[seq].value;
			var slvCodeDiv		= document.all.slvCodeDiv[seq].value;
		}
		
		
		
		document.all.inSlvCode.value 			= slvCode;
		document.all.inSlvName.value 			= slvName;
		document.all.inSlvProperty.value 	= slvProperty;
		document.all.inSlvDispOrder.value = slvDispOrder;
		document.all.inSlvCodeDiv.value 	= slvCodeDiv;
	}
	function doSlvReset()
	{
		setSlvNewCode();
		document.all.inSlvName.value 			= "";
		document.all.inSlvProperty.value 	= "";
		document.all.inSlvDispOrder.value = "";
		document.all.inSlvCodeDiv.value 	= "";
	}
	
	//부코드 등록
	function doSlvSubmit(frm)
	{
		if(frm.inSlvName.value == ""){
			alert("부코드 : 코드명을 입력하여 주시기 바랍니다.");
			frm.inSlvName.focus();
			return false;
		}
		
		var insert_confirm = confirm('등록하시겠습니까?');
		if(insert_confirm == true)
		{
			frm.submit();
		}
	}	
	
	//삭제
	function doDelete(type, codeDiv, code)
	{
		var del_confirm = confirm('삭제하시겠습니까?');
		if(del_confirm == true)
		{
			var url = '${pageContext.request.contextPath}/sysCode.act?task=delete&type=' + type + '&codeDiv=' + codeDiv + '&code=' + code;
	
			document.location.href = url;
		}
		else
		{
			return;
		}
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="내부코드관리" src="/images/system/title_04.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr valign="top">
	  <td>				
		<table width="317" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--테이블 헤더 시작-->
			<table width="317" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr>
			  <td class="t1" colspan="6">주코드</td>
			</tr>
			<tr>
			  <td colspan="6" class="lbg3"></td>
			</tr>
			<tr>
			  <td class="t1" width="49">코드</td>
			  <td class="sBg"></td>
			  <td class="t1">코드 분류</td>
			  <td class="sBg"></td>
			  <td class="t1" width="90">관리</td>
			  <td width="17"></td>
			</tr>
			</table>
			<!--테이블 헤더 끝-->
			<!--리스트 시작-->
			<div id="mainList1" style="width:317px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			  <table id="mainTable1" width="300" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="list" items="${rsSysCodeList}" varStatus="i" >
				<!-- 열 배경 -->
				<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<html:hidden property="priCodeDive" value="${list.codeDiv}"/>
				<html:hidden property="priName" 		value="${list.name}"/>
				<tr class="${lineBg}">
				  <td class="t2" width="49"><c:out value="${list.codeDiv}"/></td>
				  <td class="sBg"></td>
				  <td class="t3">&nbsp;<a href="<html:rewrite page='/sysCode.act?task=info&codeDiv=${list.codeDiv}'/>"><u><c:out value="${list.name}"/></u></a></td>
				  <td class="sBg"></td>
				  <td class="t2" width="90">
					<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="수정" onclick="priCodeModify(${i.count-1});" style="cursor:hand"/>
					<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" alt="삭제" onclick="doDelete('pri', '${list.codeDiv}', '${list.code}');" style="cursor:hand">
				  </td>
				</tr>
				<tr>
				  <td colspan="5" class="lbg3"></td>
				</tr>
				<c:set var="codeDiv" scope="request" value="${list.codeDiv}"/>
			  </c:forEach>
			  <input type="hidden" name="priMaxCode" value="${codeDiv}"/>
			  </table>
			</div>
			<!--리스트 끝-->
			<!--리스트 아래 추가부분 시작-->
			<html:form method="POST" action="/sysCode.act?task=insert&type=pri">									
			  <table width="317" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td colspan="5" class="lbg3"></td>
			  </tr>
			  <tr>
				<input type="hidden" name="inPriCode" value="00000"/>
				<td class="t2BgRed" width="49"><input type="text" name="inPriCodeDiv" value="${rsSysCodeMaxDiv }" style="width:75%;" readonly="readonly"/></td>
				<td class="sBg"></td>
				<td class="t2BgRed"><input type="text" name="inPriName" style="width:92%;"/></td>
				<td class="sBg"></td>
				<td class="t2BgRed" width="90" id="cPriBtn">
				  <img src='<html:rewrite page="/images/board/btn_save3.gif"/>' align="absmiddle" alt="저장" onclick="doPriSubmit(document.forms[0]);" style="cursor:hand">
				  <img src='<html:rewrite page="/images/board/btn_cancle3.gif"/>' align="absmiddle" alt="취소" onclick="doPriReset();" style="cursor:hand"/>
				</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  </table>
			</html:form>
			<!--리스트 아래 추가부분 끝-->
		  </td>
		</tr>
		</table>
	  </td>
	  <td>
		<table width="408" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--테이블 헤더 시작-->
			<table width="408" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr>
			  <td class="t1" colspan="10"><c:out value="${rsSysCodeInfo.name}"/> 부코드</td>
			</tr>
			<tr>
			  <td colspan="10" class="lbg3"></td>
			</tr>
			<tr>
			  <td class="t1" width="49">코드</td>
			  <td class="sBg"></td>
			  <td class="t1" width="160">코드명</td>
			  <td class="sBg"></td>
			  <td class="t1" width="49">속성</td>
			  <td class="sBg"></td>
			  <td class="t1" width="39">표시</td>
			  <td class="sBg"></td>
			  <td class="t1" width="90">관리</td>
			  <td width="17"></td>
			</tr>
			</table>
			<!--테이블 헤더 끝-->
			<!--리스트 시작-->
			<div id="mainList2" style="width:408px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
			  <table id="mainTable2" width="391" border="0" cellspacing="0" cellpadding="0">
			  <c:forEach var="list" items="${rsSysCode}" varStatus="i" >
				<!-- 열 배경 -->
				<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<input type="hidden" name="slvCode" 			value="${list.code}"/>
				<input type="hidden" name="slvName" 			value="${list.name}"/>
				<input type="hidden" name="slvProperty" 	value="${list.property}"/>
				<input type="hidden" name="slvDispOrder"	value="${list.dispOrder}"/>
				<input type="hidden" name="slvCodeDiv" 		value="${list.codeDiv}"/>
				<tr class="${lineBg}">
				  <td class="t2" width="49"><c:out value="${list.code}"/></td>
				  <td class="sBg"></td>
				  <td class="t3" width="160">&nbsp;<c:out value="${list.name}"/></td>
				  <td class="sBg"></td>
				  <td class="t2" width="49"><c:out value="${list.property}"/> </td>
				  <td class="sBg"></td>
				  <td class="t2" width="39"><c:out value="${list.dispOrder}"/></td>
				  <td class="sBg"></td>
				  <td class="t2" width="90">
					<img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle" alt="수정" onclick="slvCodeModify(${i.count-1});" style="cursor:hand"/>
					<img src='<html:rewrite page="/images/board/btn_del2.gif"/>' align="absmiddle" alt="삭제" onclick="doDelete('slv', '${list.codeDiv}', '${list.code}');" style="cursor:hand">
				  </td>
				</tr>
				<tr>
				  <td colspan="10" class="lbg3"></td>
				</tr>
				<c:set var="max" scope="request" value="${i.count}"/>
				<c:set var="code" scope="request" value="${list.code}"/>
				<c:set var="slvCode" scope="request" value="true"/>
			  </c:forEach>
			  <input type="hidden" name="max" value="${max}"/>
			  <input type="hidden" name="slvMaxCode" value="${code}"/>
			  </table>
			</div>
			<!--리스트 끝-->
			<!--리스트 아래 추가부분 시작-->
			<html:form method="POST" action="/sysCode.act?task=insert&type=slv">
			  <table width="408" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td colspan="10" class="lbg3"></td>
			  </tr>
			  <tr>
				<input type="hidden" name="inSlvCodeDiv" value="${rsSysCodeInfo.codeDiv}"/>
				<td class="t2BgRed" width="49"><input type="text" name="inSlvCode" value="${rsSysCodeMaxCode }" style="width:75%;" readonly="readonly"/></td>
				<td class="sBg"></td>
				<td class="t2BgRed" width="160"><input type="text" name="inSlvName" style="width:90%;"/></td>
				<td class="sBg"></td>
				<td class="t2BgRed" width="49"><input type="text" name="inSlvProperty" style="width:75%;"/></td>
				<td class="sBg"></td>
				<td class="t2BgRed" width="39"><input type="text" name="inSlvDispOrder" style="width:75%;"/></td>
				<td class="sBg"></td>
				<td class="t2BgRed" width="90" id="cSlvBtn">
				  <img src='<html:rewrite page="/images/board/btn_save3.gif"/>' align="absmiddle" alt="저장" onclick="doSlvSubmit(document.forms[1]);" style="cursor:hand">	
				  <img src='<html:rewrite page="/images/board/btn_cancle3.gif"/>' align="absmiddle" alt="취소" onclick="doSlvReset();" style="cursor:hand"/>
				</td>
				<td class="t2BgRed" width="17"></td>
			  </tr>
			  </table>
			</html:form>
			<!--리스트 아래 추가부분 끝-->
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
	double_tresize(160);
	//setPriNewCode();
	//if('${slvCode}' == 'true')
	//setSlvNewCode();
//-->
</script>