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
<script language="JavaScript">
<!--
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	
	function goList(coursecode)
  {
  	document.location.href = 'tstSatis.act?task=info&searchCourseCode='+coursecode; 
  }

  function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
	
	function DoExcel(surveyno, coursecode){
		if(surveyno == "")
		{
			alert("해당설문이 존재하지 않습니다.")
			return;
		}
		document.getElementById("actionFrame").src = '<html:rewrite page="/tstSatis.act?task=excel&surveyno='+surveyno+'&coursecode='+coursecode+'"/>'
	}
	
	function rePlySurvey(surveyno, coursecode, stdno, chkmod)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	
	 	if(surveyno == "")
		{
			alert("해당설문이 존재하지 않습니다.")
			return;
		}
		
		if(coursecode == "")
		{
			alert("해당과정이 존재하지 않습니다.")
			return;
		}
		window.open('<html:rewrite page="/extMylcSurvey.act?task=info&surveyno='+surveyno+'&coursecode='+coursecode+'&stdno='+stdno+'&chkmod='+chkmod+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=668, height=600, status=yes top='+wint+', left='+winl);
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="설문답변 등록(오프라인)" src="/images/poll/title_03-3.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                  <html:form action="tstSatis.act?task=offline">
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="119" class="s1">과정</td>
                            <td class="sBar"></td>
                            <td class="s2" width="320"> 
													    <html:text property="searchCourseCode" style="width:80px;" maxlength="12" onkeydown="if(event.keyCode==13)setCrs();"/>&nbsp;
													    <html:text property="searchCourseName" style="width:220px" readonly="true"/>
													  </td>
													  <td class="s2">
													    <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' alt="과정 연결" onClick="setCrs();" style="cursor:hand" align="absbottom">
													  </td>
                            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" onclick="document.forms[0].submit()" style="cursor:hand"/></td>
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
                  <!--테이블 헤더 시작-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg"></td>
                      <td class="cbg"> 
                        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr> 
                            <td class="t1" width="69">순번</td>
                            <td class="sBg"></td>
                            <td class="t1">직렬</td>
                            <td class="sBg"></td>
                            <td class="t1" width="119">직급</td>
                            <td class="sBg"></td>
                            <td class="t1" width="89">성별</td>
                            <td class="sBg"></td> 
                            <td class="t1" width="89">근무년수</td>
                            <td class="sBg"></td>                             
                            <td class="t1" width="89">강의 만족도</td>
                            <td class="sBg"></td>
                            <td class="t1" width="89">강사 만족도</td>
                            <td class="sBg"></td>
                            <td class="t1" width="100">처리</td>
                            <td width="17"></td>
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
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="lbg2"></td>
                      <td width="746"> 
                        <table width="746" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td valign="top"> 
                              <!--리스트 시작-->
                              <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden"> 
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                	<c:forEach var="offlineList" items="${rsTst_SatisOfflineList}" varStatus="i">
                                		<c:if test="${i.count%2 == 0}">
                                			<c:set var="lineBg" scope="request" value="tbg3"/>
                                		</c:if>
                                		<c:if test="${i.count%2 == 1}">
                                			<c:set var="lineBg" scope="request" value=""/>
                                		</c:if>
																			<tr class="${lineBg}"> 
		                                    <td class="t2" width="69">${offlineList.stdno }</td>
		                                    <td class="sBg"></td>
                                    		<td class="t3">
                                    			<c:if test="${fn:substring(offlineList.jobname, 0, 2) == '기타'}">
                                    				&nbsp;${fn:substring(offlineList.jobname, 2, fn:length(offlineList.jobname))}
                                    			</c:if>
                                    			<c:if test="${fn:substring(offlineList.jobname, 0, 2) != '기타'}">
                                    				&nbsp;${offlineList.jobname }
                                    			</c:if>
                                    		</td>
		                                    <td class="sBg"></td>	
                             		        <td class="t2" width="119">${offlineList.rankname }</td>
		                                    <td class="sBg"></td>
                             		        <td class="t2" width="89">${offlineList.gender }</td>
		                                    <td class="sBg"></td>		
		                                    <td class="t2" width="89">${offlineList.workday }</td>
		                                    <td class="sBg"></td>	
                                 				<td class="t2" width="89">${offlineList.totrspt }</td>
                                    		<td class="sBg"></td>
		                                    <td class="t2" width="89">${offlineList.teacherrspt }</td>
		                                    <td class="sBg"></td>
		                                    <td class="t2" width="100">
		                                      <c:if test="${offlineList.chkmod eq 'C' }">
		                                      	<img src='<html:rewrite page="/images/board/btn_poll.gif"/>' width="53" height="18" alt="참여하기" onclick="rePlySurvey('${offlineList.surveyno }','${offlineList.coursecode }','${offlineList.stdno }', 'C')" style="cursor:hand"/>
		                                      </c:if>
		                                      <c:if test="${offlineList.chkmod ne 'C' }">
		                                      	<img src='<html:rewrite page="/images/board/btn_modify5.gif"/>' width="53" height="18" alt="수정하기" onclick="rePlySurvey('${offlineList.surveyno }','${offlineList.coursecode }','${offlineList.stdno }', 'M')" style="cursor:hand"/>
		                                      </c:if>
		                                    </td>
		                                  </tr>
		                                  <tr> 
		                                    <td class="lbg3" colspan="15"></td>
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
              <tr> 
                <td> 
                  <!--하단버튼-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      <td align="right">
                        <img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" alt="목록" align="absmiddle" onclick="goList('${coursecode}')" style="cursor:hand"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>                           
            </table>
          </td>
  </tr>
</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	tresize(185);
	searchList('${key}');
//-->
</script>
