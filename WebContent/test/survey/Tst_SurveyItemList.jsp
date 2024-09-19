<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script language="JavaScript">
	var jq = $.noConflict(true);
	jq(function(){
		jq('#checkAll').click(function(){
			if(jq('#checkAll:checked').length > 0){
				jq('#itemForm input:checkbox').attr('checked', 'checked');
			}
			else{
				jq('#itemForm input:checkbox').removeAttr('checked');
			}
		});
		
		jq("#bankgrp_select").on("change", function(){
			getBankgrpInfo(jq(this).val());
		});
		jq("#bankgrp_select").trigger("change");
	});
	
	function makeItems(){
		document.forms[0].target = opener.name;
		document.forms[0].submit();
		window.close();
	}
	
	function showSub(seq){
		var div = jq('#mainTable').find('div').eq(seq-1);
		if(jq(div).is(':visible')){
			jq(div).hide();
		}
		else{
			jq(div).show();
			jq('#mainTable').find('div').not(div).hide();
		}
	}
	function getBankgrpInfo(v){
		jq.get("/tstSurvey.act?task=getBankgrpInfos", "bankgrp="+v,
				function(data){
					jq("#itemForm input[name=itemno_array]").each(function(){
							jq(this).attr("checked", false);
					});
					jq.each(data, function(){
						var itemno = this.itemno;
						jq("#itemForm input[name=itemno_array]").each(function(){
							if (jq(this).val() == itemno) {
								jq(this).attr("checked", true);
							} 
						});
					});
				}
		);
	}
	function setProf(i, j)
	{		
		window.open('<html:rewrite page="/tstSurvey.act?task=profList&reqseq=' + i + '&profFlag=' + j + '"/>', 'popup', 'scrollbars=no, menubar=no, toolbar=no, location=no, width=410, height=520, status=yes');
	}
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="설문지 작성" src="/images/poll/title_02.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
		<td align="center">
			<div style="width:750px; text-align:left;">
				<select id="bankgrp_select">
					<option value="1">A형</option>
					<option value="2">B형</option>
					<option value="3">C형</option>
				</select>
			</div>
		</td>
	</tr>
<tr> 
  <td align="center"> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td align="center"> 
    <!--테이블 헤더 시작-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%" align="left">
        <tr> 
          <td class="t1" width="30"><input id="checkAll" type="checkbox"/></td>
          <td class="sBg"></td>
          <td class="t1" width="30">순번</td>
          <td class="sBg"></td>
          <td class="t1">내용</td>
          <td class="sBg"></td>
          <td class="t1" width="119">유형</td>
          <td class="sBg"></td>
          <td class="t1" width="89">구분</td>
          <td width="17"></td>
        </tr>
        </table>
      </td>
      <td class="lbg"></td>
    </tr>
    </table>
    <!--테이블 헤더 끝-->
  </td>
</tr>
<tr> 
  <td align="center"> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg2"></td>
      <td width="746"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"> 
          <!--리스트 시작-->
          <form id="itemForm" action="/tstSurvey.act?task=makeItemFromBank" method="post">
          <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden;"> 
            <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0" align="left">
            <c:forEach var="Item" items="${rsTst_SurveyItemList}" varStatus="i">
              <c:if test="${i.count%2 == 0}">
                <c:set var="lineBg" scope="request" value="tbg3"/>
              </c:if>
              <c:if test="${i.count%2 == 1}">
                <c:set var="lineBg" scope="request" value=""/>
              </c:if>
			  <tr class="${lineBg}"> 
		        <td class="t2" width="30"><input name="itemno_array" type="checkbox" value="${Item.itemno }"/></td>
		        <td class="sBg"></td>
                <td class="t2" width="30">${i.count }</td>
                <td class="sBg"></td>
                <td class="t3" align="left">&nbsp;
                <c:if test="${i.count > 15}">
					<img id="popup_prof" name="popup_prof" onclick="setProf('${i.count }', '1')" src='<html:rewrite page="/images/board/btn_zoom.gif"/>' width="19" height="19" align="absmiddle" alt="찾아보기" style="cursor: pointer;" />
				</c:if>
                <a href="#" onclick="showSub(${i.count})" style="cursor:hand; text-decolation:none;">
                	${Item.itemcontents } <img src="/images/board/dawn.gif" align="absmiddle"/></a> 
                	<c:if test="${i.count > 15}">
                		<input type="hidden" id="profNo${i.count}" name="profNo${i.count}"/>
                		<input type="text" id="profName${i.count}" name="profName${i.count}" readonly="true"/>
                	</c:if> 
               	</td>
		        <td class="sBg"></td>
		        <td class="t2" width="119">${Item.itemgroup }</td>
		        <td class="sBg"></td>
		        <td class="t2" width="89">
		        <c:choose>
		        	<c:when test="${Item.itemgbn =='A'}">객관식</c:when>
		        	<c:when test="${Item.itemgbn =='B'}">주관식</c:when>
		        </c:choose>
		        </td>
		        <td class="sBg"></td>
		      </tr>
		      <tr>
				<td class="lbg3" colspan="10"></td>
			  </tr>
		      <tr>
		      	<td colspan="4"></td>
		      	<td colspan="5" align="center">
		      		<div style="display:none;">
		      			<table width="100%" border="0" cellspacing="0" cellpadding="0">
		      			<c:forEach var="exam" items="${Item.examlist}" varStatus="j">
		      				<tr> 
		      					<td class="sBg"></td>
								<td class="lbg3" colspan="10"></td>
								<td class="sBg"></td>
							</tr>
		      				<tr>
		      					<td class="sBg"></td>
		      					<td align="left">
		      						${exam.examseq } . ${exam.examcontents }
		      					</td>
		      					<td class="sBg"></td>
		      				</tr>
		      			</c:forEach>
		      			</table>
		      		</div>
		      	</td>
		      	<td class="sBg"></td>
		      </tr>
		      <tr> 
		        <td class="lbg3" colspan="10"></td>
		      </tr>                                		
              <c:set value="${i.count}" var="count"/>  
            </c:forEach> 
            <c:if test="${count==null}">
			  <tr class="tbg3">
				<td class="t2" colspan="99">조회된 데이터가 없습니다.</td>
			  </tr>
			</c:if>
            </table>
          </div>
          </form>
          <!--리스트 끝-->
          </td>
        </tr>
        </table>
      </td>
      <td class="lbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td align="center"> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg1"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <!--하단버튼-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td align="right">
      <img src='<html:rewrite page="/images/board/btn_poll_up.gif"/>' width="72" height="25" align="absmiddle" alt="설문등록" onclick="makeItems()" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
