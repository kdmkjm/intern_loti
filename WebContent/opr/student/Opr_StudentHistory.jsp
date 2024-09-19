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
	window.onresize = function(){
	//   윈도우 사이즈 변경 셋팅 코드
	tresize(255);
	}

	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}
	
	function setOrgan()
	{
		document.forms[0].action = "oprStudent.act?task=info";
		document.forms[0].submit();
	}
	
	function setInfo()
	{
		document.forms[0].action = "oprStudent.act?task=info&mode=find";
		document.forms[0].submit();
	}
	
	function saveInfo()
	{
		document.forms[0].action = "oprStudent.act?task=updateinfo";
		document.forms[0].submit();
	}	
	
	function setRank()
	{
		var rankname = document.forms[0].rankname.value;
		window.open('<html:rewrite page="/cmnRankJob.act?task=poprank&searchKeyword='+rankname+'"/>', 'popup', 'scrollbars=no, menubar=no, width=400, height=361, status=yes top=150, left=150');
	}
	
	function setJob()
	{
		var jobname = document.forms[0].jobname.value;
		window.open('<html:rewrite page="/cmnRankJob.act?task=popjob&searchKeyword='+jobname+'"/>', 'popup', 'scrollbars=no, menubar=no, width=400, height=361, status=yes top=150, left=150');
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
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/operation/title_08-2.gif"/>' alt="교육생 관리-개인이력" width="186" height="18" /></td>
        </tr>
        <tr> 
          <td height="15"></td>
        </tr>
        <tr> 
          <td> 
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td> 
                	<html:form action="oprStudent.act?task=updateinfo">
                  <!--검색 테이블 시작-->
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="59" class="s1">이름</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
                              <input type="text" name="stdname" style="width:120px;" value="${rsOpr_Student.stdname }">
                            </td>
                            <td class="sBar"></td>
                            <td width="59" class="s1">대체키</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
                              <input type="text" name="juminno" style="width:120px;" maxlength="13" value="${rsOpr_Student.juminno }">
                            </td>
                            <td class="sBar"></td>
                            <td width="59" class="s1">전화번호</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
                              <input type="text" name="cellphone" style="width:140px;" value="${rsOpr_Student.cellphone }">
                            </td>
                          </tr>
                          <tr> 
                            <td colspan="15" class="lbg3"></td>
                          </tr>
                          <tr> 
                            <td width="59" class="s1">직급</td>
                            <td class="sBar"></td>
                            <td class="s2">
                            	<html:hidden property="rankcode" value="${rsOpr_Student.rankcode}"/>
															<html:text property="rankname" style="width:120px;" value="${rsOpr_Student.rankname}"/> <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle" alt="직급" onClick="setRank()" style="cursor:hand">
                            </td>
                            <td class="sBar"></td>
                            <td width="59" class="s1">직렬</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
                            	<html:hidden property="jobcode" value="${rsOpr_Student.jobkind}"/>
															<html:text property="jobname" style="width:120px;" value="${rsOpr_Student.jobname}"/> <img src='<html:rewrite page="/images/board/btn_zoom.gif"/>' align="absmiddle" alt="직렬" onClick="setJob();" style="cursor:hand">
                            </td>
                            <td class="sBar"></td>
                            <td width="59" class="s1">E-mail</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
                              <input type="text" name="email" style="width:140px;" value="${rsOpr_Student.email }">
                            </td>
                          </tr>
                          <tr> 
                            <td colspan="15" class="lbg3"></td>
                          </tr>
                          <tr>
                            <td width="59" class="s1">소속</td>
                            <td class="sBar"></td>
                            <td class="s2">
                             	<html:select property="chieforgan" value="${rsOpr_Student.chieforgan}" style="width:125px">
			    											<html:optionsCollection name="orgTypeCode" property="beanCollection"/>
			    			 							</html:select>
                            </td>
                            <td class="sBar"></td>
                            <td width="59" class="s1">부서</td>                           
                            <td class="sBar"></td>
                            <td class="s2" colspan="5"> 
															<html:text property="assignname" value="${rsOpr_Student.assignname}" style="width:300px"/>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  <html:hidden property="gradecode" value="${rsOpr_Student.gradecode}"/>
                  <html:hidden property="jobkind" value="${rsOpr_Student.jobkind}"/>
                  <html:hidden property="courseCode" value="${ rsOpr_Student.courseCode}"/>
                  <html:hidden property="seq" value="${ rsOpr_Student.seq}"/>
                  <!--검색 테이블 끝-->
                  </html:form>
                </td>
              </tr>
              <tr> 
                <td> 
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr> 
                      <td align="right"><img src='<html:rewrite page="/images/board/btn_save.gif"/>' width="57" height="25" alt="저장" onclick="saveInfo()" style="cursor:hand"/></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="25" class="stitle"><img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />교육이력</td>
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
                            <td class="t1" width="100">기간</td>
                            <td class="sBg"></td>
                            <td class="t1">과정명</td>
                            <td class="sBg"></td>
                            <td class="t1" width="150">소속</td>
                            <td class="sBg"></td>
                            <td class="t1" width="110">직급</td>
                            <td class="sBg"></td>
                            <td class="t1" width="80">비고</td>
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
                              <div id="mainList" style="width:746px; z-index:0; overflow-y:scroll ;overflow-x:hidden">
                                <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
                                  <c:forEach var="attendList" items="${rsOpr_Student.attendList}" varStatus="i">
                                  	<fmt:parseDate var="edufdate" value="${attendList.edufrom}" pattern="yyyymmdd"/>
                                  	<fmt:parseDate var="edutdate" value="${attendList.eduto}" pattern="yyyymmdd"/>
                                  	<c:if test="${i.count%2==0 }">
		                                  <tr class="tbg3"> 
		                                    <td class="t2" width="100"><fmt:formatDate value="${edufdate}" pattern="yy.mm.dd"/>~<fmt:formatDate value="${edutdate}" pattern="mm.dd"/></td>
		                                    <td class="sBg"></td>
		                                    <td class="t3">&nbsp;${attendList.courseName}</td>
		                                    <td class="sBg"></td>
		                                    <td class="t3" width="150">&nbsp;${attendList.assignname }</td>
		                                    <td class="sBg"></td>
		                                    <td class="t2" width="110">${attendList.rankname }</td>
		                                    <td class="sBg"></td>
		                                    <td class="t2" width="80">&nbsp;</td>
		                                  </tr>
		                                  <tr> 
		                                    <td class="lbg3" colspan="9"></td>
		                                  </tr>                                  	
                                  	</c:if>
                                  	<c:if test="${i.count%2==1 }">
		                                  <tr> 
		                                    <td class="t2" width="100"><fmt:formatDate value="${edufdate}" pattern="yy.mm.dd"/>~<fmt:formatDate value="${edutdate}" pattern="mm.dd"/></td>
		                                    <td class="sBg"></td>
		                                    <td class="t3">&nbsp;${attendList.courseName}</td>
		                                    <td class="sBg"></td>
		                                    <td class="t3" width="150">&nbsp;${attendList.assignname }</td>
		                                    <td class="sBg"></td>
		                                    <td class="t2" width="110">${attendList.rankname }</td>
		                                    <td class="sBg"></td>
		                                    <td class="t2" width="80">&nbsp;</td>
		                                  </tr>
		                                  <tr> 
		                                    <td class="lbg3" colspan="9"></td>
		                                  </tr>                                  	
                                  	</c:if>                                  
                                  </c:forEach>
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
                  <!--하단버튼 : 비활성화시 기존버튼명_off 로 작성해둠-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
                    <tr valign="bottom"> 
                      <td align="right"><a href='<html:rewrite page="/oprStudent.act?task=list&searchCourseCode=${courseCode}"/>'><img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록"/></a></td>
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
	tresize(255);
	searchList('${key}');

//-->
</script>
