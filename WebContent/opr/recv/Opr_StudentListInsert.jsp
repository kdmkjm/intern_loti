<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
		tresize(275);
	}

	function doDelete(code, seq)
	{
		frm = document.forms[0];
		var selOrganCode = frm.selOrganCode.value;
		document.forms[0].action = "oprStudentListRcv.act?task=deleteAddRcv&type=add&selOrganCode="+selOrganCode+"&courseCode="+code+"&seq="+seq;
		document.forms[0].submit();
	}
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			var frm = document.forms[0];
			if(frm.selOrganCode.value == "")
				frm.selOrganCode.value == "6430000";
			doSearch();
		}
	}
	
		function checkInsert()
	{
		var frm = document.forms[0];
		var selorganCode = frm.selOrganCode.value;
		var juminno = frm.juminno.value;

		if(selorganCode == "")
		{
			alert("기관코드를 선택하여 주십시요.");
			frm.selOrganCode.focus();
			return;
		}
		
		if(juminno == "")
		{
			alert("주민번호를  입력해 주십시요.");
			frm.juminno.focus();
			return;
		}
	
		frm.action = "oprStudentListRcv.act?task=check"; 
		frm.submit();
	}
	
	function checkInsert1()
	{
		var frm = document.forms[0];
		var selorganCode = frm.selOrganCode.value;
		var juminno = frm.juminno.value;

		if(selorganCode == "")
		{
			alert("기관코드를 선택하여 주십시요.");
			frm.selOrganCode.focus();
			return;
		}
		
		if(juminno == "")
		{
			alert("주민번호를  입력해 주십시요.");
			frm.juminno.focus();
			return;
		}
	
		var url = "oprStudentListRcv.act?task=check";
		var pars = Form.serialize(frm);
		new Ajax.Updater('',url,{method: 'post', parameters: pars, evalScripts: true, onComplete: saveComp, onFailure: reportError});
		//frm.submit();
	}
	
	function saveComp(resXML)
	{
		var xmlDoc = resXML.responseXML;
		var cmd, retCode, msg;
		var resultNode = xmlDoc.getElementsByTagName('result');

		cmd = resultNode[0].childNodes[0].text;
		retCode = resultNode[0].childNodes[1].text;
		msg = resultNode[0].childNodes[2].text;

		if (retCode == "true") 
		{
			if(msg != "") 
			{
				alert(msg);
				document.forms[0].submit();
			}
		}
		else
		{
			alert(msg);
		}
	}

	function reportError(e)
	{
		alert(e);
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육선발명단 입력" src="/images/operation/title_15.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action='oprStudentListRcv.act?task=insert'>
      <!--검색 테이블 시작-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="119" class="s1"><span class="red">*</span>과정</td>
            <td class="sBar"></td>
		    <td class="s2" width="420"> 
			  <select id="searchYear"></select>
			  <select id="searchCourseName" style="width:220px;">
			  	<option value="">과정 선택</option>
			  </select>
			  <select id="searchKeyword" style="width:100px;">
			  	<option value="">과정기수 선택</option>
			  </select>
			  <html:hidden property="searchColumn"/>
			  <html:hidden property="searchCourseCode"/>
		   </td>
            <td class="sBar"></td>
			<td width="79" class="s1"><span class="red">*</span>기관명</td>
            <td class="sBar"></td>
            <td class="s2" width="89"> 
			  <html:select property="selOrganCode">
				<html:optionsCollection name="orgTypeCode" property="beanCollection" />
			  </html:select>
            </td>
            <td width="60">
			  <img src='<html:rewrite page="/images/board/btn_search.gif"/>' alt="검색" onclick="searchList('move')" style="cursor:hand" align="absmiddle"/>
			</td>
          </tr>
          <tr> 
            <td colspan="8" class="lbg3"></td>
          </tr>
          <tr> 
            <td width="119" class="s1"><span class="red">*</span>교육생주민번호</td>
            <td class="sBar"></td>
            <td class="s2" colspan="6"> 
              <input type="text" name="juminno" style="IME-MODE:disabled" maxlength="13" align="absmiddle">
	          <c:if test="${chkMod eq 'Y'}">
			    <img src='<html:rewrite page="/images/board/btn_add.gif"/>' alt="추가" onclick="checkInsert();" style="CURSOR:hand" align="absmiddle"/>
			  </c:if>
			  <c:if test="${chkMod ne 'Y'}">
				<%--<img src='<html:rewrite page="/images/board/btn_add_off.gif"/>' alt="추가" /> --%>
				<img src='<html:rewrite page="/images/board/btn_add.gif"/>' alt="추가" onclick="checkInsert();" style="CURSOR:hand" align="absmiddle"/>                       	
			  </c:if>
			</td> 
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--검색 테이블 끝-->
    </html:form>
  </td>
</tr>
<tr> 
  <td height="10"></td>
</tr>
<tr> 
  <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />${courseName}과정 ${selOrganCode} 데이터</td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg2" height="10"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <!--테이블 헤더 시작-->
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr> 
          <td class="t1" width="34">번호</td>
          <td class="sBg"></td>
          <td class="t1">과정명</td>
          <td class="sBg"></td>
          <td class="t1" width="49">성명</td>
          <td class="sBg"></td>
          <td class="t1" width="100">부서명</td>
          <td class="sBg"></td>
          <td class="t1" width="70">직급</td>
          <td class="sBg"></td>
          <td class="t1" width="89">휴대폰</td>
          <td class="sBg"></td>
          <td class="t1" width="115">이메일</td>
          <td class="sBg"></td>
          <td class="t1" width="50">처리</td>
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
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg2"></td>
      <td width="746"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td> 
            <!--리스트 시작-->
            <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden"> 
              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
              <c:forEach var="studentrcvList" items="${rsOpr_StudentListRcvList}" varStatus="i">
                <c:if test="${i.count%2 == 0}">
                  <c:set var="lineBg" value="tbg3"/>
                </c:if>
                <c:if test="${i.count%2 == 1}">
                  <c:set var="lineBg" value=""/>
                </c:if>                                	
         		<tr class="${lineBg }"> 
                  <td class="t2" width="34">${studentrcvList.num}</td>
                  <td class="sBg"></td>
                  <td class="t3">&nbsp;${studentrcvList.courseName}</td>
                  <td class="sBg"></td>
                  <td class="t2" width="49">${studentrcvList.stdname}</td>
                  <td class="sBg"></td>
                  <td class="t2" width="100">${studentrcvList.assignname}</td>
                  <td class="sBg"></td>
                  <td class="t2" width="70">${studentrcvList.rankname}</td>
                  <td class="sBg"></td>
                  <td class="t2" width="89">${studentrcvList.cellphone}</td>
                  <td class="sBg"></td>
                  <td class="t2" width="115">${studentrcvList.email}</td>
                  <td class="sBg"></td>
                  <td class="t2" width="50"><img src='<html:rewrite page="/images/board/btn_del2.gif"/>' alt="삭제" onclick="doDelete(${studentrcvList.courseCode}, ${studentrcvList.seq});" style="CURSOR:hand"/></td>
                </tr>
                <tr> 
                  <td class="lbg3" colspan="19"></td>
                </tr>                       	
                <c:set var="count" value="${i.count}"/> 
              </c:forEach>
              <c:if test="${count==null}">
				<tr class="tbg3">
				  <td class="t2" colspan="99">조회된 데이터가 없습니다.</td>
				</tr>
			  </c:if>
              </table>
            </div>
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
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg1"></td>
    </tr>
    </table>
  </td>
</tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(275);

//-->
</script>

