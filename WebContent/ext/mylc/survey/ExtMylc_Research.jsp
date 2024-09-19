<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<%@ include file="/include/jsp_common_inc.jspf" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>강의 설문참여</title>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<script type="text/javascript">
<!--
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

	function rePlySurvey(surveyno, stdno, coursecode, chkmod)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/extMylcSurvey.act?task=info&surveyno='+surveyno+'&coursecode='+coursecode+'&stdno='+stdno+'&chkmod='+chkmod+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=668, height=600, status=yes top='+wint+', left='+winl);
	}
	
	function checkJuminNo()
	{
		var frm  = document.forms[0];
		if(frm.juminNo1.value.length >= 6)
		{
			frm.juminNo2.focus();
		}
	}
	
	function doSearch()
	{
		var frm  = document.forms[0];
		frm.juminNo.value = frm.juminNo1.value + frm.juminNo2.value;
		frm.submit();
	}
-->	
</script>
</head>
<body bgcolor="#f9f9f9">
<table width="970" border="0" cellpadding="0" cellspacing="0">
	<tr> 
    <td width="20px" rowspan="2">&nbsp;</td>
    <td width="950px" valign="top" height="148px"><img src='<html:rewrite page="/images/poll/poll_title.gif"/>' width="913" height="148" alt="강의 설문참여 - 공무원 교육원 교육과정의 고객만족도를 높이고자 진행된 교육과정에 대한 설문조사를 진행합니다. (통계법 제 13, 14조 규정에 의거 통계 목적 이외에는 사용되지 않습니다.)"></td>
  </tr>
  <tr>
		<td width="950px" valign="top">
			<table width="950" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="6" height="6"><img src='<html:rewrite page="/images/poll/poll_r_01.gif"/>' width="6" height="6"></td>
          <td background='<html:rewrite page="/images/poll/poll_top_bg.gif"/>' height="6" width="938"></td>
          <td width="6" height="6"><img src='<html:rewrite page="/images/poll/poll_r_02.gif"/>' width="6" height="6"></td>
        </tr>
        <tr> 
          <td background='<html:rewrite page="/images/poll/poll_left_bg.gif"/>' width="6"></td>
          <td width="938" style="padding: 20px 19px 20px 19px;">
						<table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr> 
              	<td> 
                	<html:form action="extMylcResearchList.act">
                  <!--검색 테이블 시작-->
                  <table width="900" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="890" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">대체키</td>
                           	<td class="sBar"></td>
                           	<td class="s2">
                           		<html:hidden property="juminNo"/>
                           		<input type="text" style="width:70px; IME-MODE:disabled" id="juminNo1" maxlength="6" onkeyup="checkJuminNo();" onkeydown="key_num();"/> - 
                           		<input type="text" style="width:80px; IME-MODE:disabled" id="juminNo2" maxlength="7" onkeydown="key_num()"/>
                           		<img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" onclick="doSearch();" style="cursor:hand" align="absmiddle"/></td>
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
                <td height="15"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="900" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
							<tr> 
								<td> 
                  <!--테이블 헤더 시작-->
                 	<table width="900" border="0" cellspacing="0" cellpadding="0">
                   	<tr> 
                     	<td class="lbg"></td>
                     	<td class="cbg"> 
                       	<table width="890" border="0" cellspacing="0" cellpadding="0" height="100%">
                         	<tr> 
                           	<td class="t1" width="69">번호</td>
														<td class="sBg"></td>
														<td class="t1">과정명</td>
														<td class="sBg"></td>
														<td class="t1" width="200">교육기간</td>
														<td class="sBg"></td>
														<td class="t1" width="100">처리</td>
                         	</tr>
                       	</table>
                     	</td>
                     	<td class="lbg"></td>
                   	</tr>
                 	</table>
                 	<!--테이블 헤더 시작-->
               	</td>
             	</tr>
             	<tr> 
               	<td> 
                 	<table width="900" border="0" cellspacing="0" cellpadding="0">
                   	<tr> 
                     	<td class="lbg2"></td>
                     	<td width="890"> 
                       	<table width="890" border="0" cellspacing="0" cellpadding="0">
                         	<tr> 
                           	<td valign="top"> 
                            <!--리스트 시작--> 
                            	<table id="mainTable" width="890" border="0" cellspacing="0" cellpadding="0">
                       					<logic:notEmpty name="extMylcResearchForm" property="researchList">
                    							<logic:iterate id="list" name="extMylcResearchForm" property="researchList">
                    								<bean:define id="seq" name="list" property="seq"></bean:define>
                    								<fmt:parseDate var="disFrom" value="${list.eduFrom}" pattern="yyyymmdd"></fmt:parseDate>
																		<fmt:parseDate var="disTo" value="${list.eduTo}" pattern="yyyymmdd"></fmt:parseDate>
                    							  <c:if test="${seq%2 ==0 }">
				                        			<c:set var="lineBg" scope="request" value="tbg3"/>
				                        		</c:if>
				                          	<c:if test="${seq%2 ==1 }">
				                          		<c:set var="lineBg" scope="request" value=""/>
				                          	</c:if> 
				                          	<tr class="${lineBg}">              								
                    									<td class="t2" width="69" align="center"><bean:write name="list" property="seq"/></td>
                    									<td class="sBg"></td>
                    									<td class="t3" >&nbsp;<bean:write name="list" property="courseName"/>(<bean:write name="list" property="courseCode"/>)</td>
                    									<td class="sBg"></td>
                    									<td class="t2" width="200"><fmt:formatDate value="${disFrom}" pattern="yyyy.mm.dd"/> ~ <fmt:formatDate value="${disTo}" pattern="mm.dd"/></td>
                    									<td class="sBg"></td>
                    									<td class="t2" width="100"><img src='<html:rewrite page="/images/board/btn_poll.gif"/>' width="53" height="18" alt="참여하기" onclick="rePlySurvey('<bean:write name="list" property="surveyNo"/>', '<bean:write name="list" property="stdNo"/>', '<bean:write name="list" property="courseCode"/>','C')" style="cursor:hand"/></td>                    									
                    								</tr>
                    							</logic:iterate>
                    						</logic:notEmpty>
																<logic:empty name="extMylcResearchForm" property="researchList">
																	<tr>
																		<td class="t2" colspan="7" height="25" align="center">참여할 설문이 없습니다.</td>
																	</tr>															
																</logic:empty>                       						
                             	</table>
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
                 	<table width="900" border="0" cellspacing="0" cellpadding="0">
                   	<tr> 
                     	<td class="tbg1"></td>
                   	</tr>
                 	</table>
               	</td>
             	</tr>
						</table>
					</td>
					<td background='<html:rewrite page="/images/poll/poll_right_bg.gif"/>' width="6"></td>
        </tr>
        <tr> 
          <td width="6" height="6"><img src='<html:rewrite page="/images/poll/poll_r_03.gif"/>' width="6" height="6"></td>
          <td background='<html:rewrite page="/images/poll/poll_bottom_bg.gif"/>' height="6" width="938"></td>
          <td width="6" height="6"><img src='<html:rewrite page="/images/poll/poll_r_04.gif"/>' width="6" height="6"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
