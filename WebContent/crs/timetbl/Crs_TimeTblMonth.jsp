<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %> 
<script src='<html:rewrite page="/common/js/Calendar.js"/>'></script>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(175);
	}
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	
	function showDayList()
	{		
		document.forms[0].action = 'crsTimeTblDay.act?task=list';
		document.forms[0].submit();
	}
	
	function ozReport()
	{  
		var frm = document.forms[0];
		var str 
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=YES,copyhistory=no,width=710,height=550,top="+wint+",left="+winl;  
	  window.open('','popup', str);
		frm.action = "ozMenu.act?report=mday"	
		frm.target = "popup";
		frm.submit();	
		frm.action = "crsTimeTblDay.act?task=monthlist";	
		frm.target = "";
	}

//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="교육시간표 조회 - 월별" src="/images/operation/title_02-2.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <html:form action='crsTimeTblDay.act?task=monthlist'>
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="74" class="s1">담당자</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2" width="99">
			                   			<html:select property="searchcharger">
			    											<html:optionsCollection name="crsUser" property="beanCollection" />
			    										</html:select>
			                			</td>
                            <td class="sBar"></td>
                            <td width="119" class="s1">연월</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
	                    				<html:text property="searchdate" style="width:100px" readonly="true"/><img src='<html:rewrite page="/images/icon/calendaricon.gif"/>' align="absbottom" style="cursor:hand" onclick="Calendar_M(document.forms[0].searchdate);">
                            </td>
                            <td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" /></td>
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
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td> 
                  <!--달력 시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg4" > 
                        <table width="746" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
                          <tr> 
                            <td class="t1Sun" width="106">일요일</td>
                            <td class="t1Mon" width="106">월요일</td>
                            <td class="t1Mon" width="106">화요일</td>
                            <td class="t1Mon" width="106">수요일</td>
                            <td class="t1Mon" width="106">목요일</td>
                            <td class="t1Mon" width="106">금요일</td>
                            <td class="t1Mon" width="106">토요일</td>
                          </tr>
                        </table>
												<div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
												<table id="mainTable" width="746" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
													<c:set var="stWeek" scope="request" value="${startWeek}"/>
													<c:set var="dayNumber" scope="request" value="${startDay}"/>
													<c:forEach var="week" begin="${1}" end="${lengthWeek}">
													<tr> 
														<c:forEach var="start" begin="${start+1}" end="${start+7}">
															<td class="t1None" width="106"> 
																<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center"> 
																		<c:if test="${start-startWeek+1 <= lengthDay}">
																			<c:if test="${stWeek == 1}">
																				<tr>
																					<td class="date"><c:out value="${start-startWeek+1}"/></td>
																				</tr>
																		    <tr> 
																		    	<td class="dateText">																			
																		    		<c:forEach var="timeTblMonthList" items="${rsCrs_TimeTblMonthList}" varStatus="i" >
																							<c:if test="${dayNumber eq timeTblMonthList.lectdate}"><br><img src='<html:rewrite page="/images/dot.gif"/>' align="absmiddle"> <c:out value="${timeTblMonthList.coursename}"/></c:if>
																						</c:forEach>
																					</td>
																		    </tr>
																				<c:set var="dayNumber" scope="request" value="${dayNumber + 1}"/>											
																			</c:if>
																			<c:if test="${stWeek != 1}"><c:set var="stWeek" scope="request" value="${stWeek - 1}"/></c:if>
																		</c:if>
															  	</table>
															</td>
														</c:forEach>
														<c:set var="start" scope="request" value="${start + 7}"/>
													</tr>
													</c:forEach>
												</table>
												</div>                          
                      </td>
                      <td class="lbg"></td>
                    </tr>
                  </table>
                  <!--달력 끝-->
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="tbg2"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td> 
                  <!--하단버튼-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom">
                    	<td><img src='<html:rewrite page="/images/board/btn_print.gif"/>' width="57" height="25" align="absmiddle" alt="인쇄" onclick="ozReport();" style="cursor:hand"/></td> 
                      <td align="right">
                      	<img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록" onclick="showDayList();" style="cursor:hand"/>
                     	</td>
                    </tr>
                  </table>
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
	tresize(175);
	searchList('${key}');
//-->
</script>
