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
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
	<!--

  function modifyScore(cmidf, sbidf, esetp)
  {
  	document.location.href = '/tstScore.act?task=scorelist&cmidf='+cmidf+'&sbidf='+sbidf+'&esetp='+esetp+'&searchSort=${searchSort }';
  }
  
  function setCrs()
	{
		var searchCode = document.all.searchCourseCode.value;
		// type 값을 넘겨준다. (onlyCrs) 
		window.open('<html:rewrite page="/cmnCourse.act?task=list&getType=onlyCrs&searchCode=' + searchCode +'"/>', 'course', 'scrollbars=no, menubar=no, width=500, height=361, status=yes top=150, left=150');
	}
  
  function addSubject()
  {
  	var coursecode = document.forms[0].searchCourseCode.value;
  	var url = '/tstSubject.act?task=insertSubjectForm';
  	if(coursecode != '' && isNaN(coursecode)==false){
  		url += '&cmidf='+coursecode;
  	}
  	document.location.href = url;
  }
  
  function editSubject(cmidf, sbidf)
  {
  	document.location.href='/tstSubject.act?task=updatesubjinfoform&cmidf='+cmidf+'&sbidf='+sbidf+'&searchSort=${searchSort }';
  }
  
  function SubjectMasterMgmt()
  {
  	document.location.href = '/tstSubject.act?task=masterlist';
  }
  
  function QuestionMgmt(cmidf, sbidf, essrl)
  {
  	document.location.href='/tstQuestion.act?task=list&cmidf='+cmidf+'&sbidf='+sbidf+'&essrl='+essrl;
  }
  
  function ExcelDownload()
  {
  		
  		size_w = 100;
  		size_h = 100;
  		
  		var url = '<html:rewrite page="/tstScore.act';
  		url += '?task=exceldownload'
  		url += '&cmidf=' + '${rsCourseInfo.cmidf}';
  		url += '"/>';
  		target = '_blank';
		openWinSetPo(url, target, '', size_w, size_h);
  }
  
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="성적관리" src="/images/poll/title_01.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action="tstSubject.act?task=list"> 
    <!--검색 테이블 시작-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="80" class="s1">과정</td>
            <td class="sBar"></td>
			<td class="s2" width="420"> 
			  <select id="searchYear"></select>
			  <select id="searchCourseName" style="width:240px;">
			  	<option value="">과정 선택</option>
			  </select>
			  <select id="searchKeyword" style="width:100px;">
			  	<option value="">과정기수 선택</option>
			  </select>
			  <html:hidden property="searchColumn"/>
			  <html:hidden property="searchCourseCode"/>
			</td>
            <td class="sBar"></td>
            <td width="89" class="s1">정렬기준</td>
            <td class="sBar"></td>
            <td class="s2"> 
              <html:select property="searchSort" value="${searchSort}" style="width:80px;">
                <html:option value="ESSEQ">과목기수</html:option>
                <html:option value="SBNAM">과목명</html:option>
                <html:option value="ESISU">성적처리여부</html:option>
              </html:select>
            </td>
            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" onclick="doSearch()" style="cursor:hand"/></td>
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
	<td>&nbsp;</td>
</tr>
<logic:present name="rsCourseInfo">
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
   		<tr> 
     		<td>
			<!--과정 기본정보 시작-->
		      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
			      <tr> 
			      	  <td class="lbg2"></td>
				      <td class="cbg"> 
				          <table width="746" border="0" cellspacing="0" cellpadding="0" align="center">
					          <tr> 
					            <td width="119" class="t1" style="text-align:left;">&nbsp;과정기수 기본정보</td>
					          </tr>
				          </table>
				      </td>
				      <td class="lbg2"></td>
			      </tr>
			      <tr>
			      	<td class="lbg2"></td>
			      	  <td>
				      	<table width="746" border="0" cellspacing="0" cellpadding="0" align="center">
				          <tr>
							<td class="s1" width="20%">&nbsp;과정코드</td>
							<td class="sBg"></td>
							<td>&nbsp;${rsCourseInfo.cmidf}</td>
						  </tr>
						  <tr> 
				            <td class="lbg3" colspan="29"></td>
				          </tr>
						  <tr>
						  	<td class="s1" width="20%">&nbsp;과정명</td>
						  	<td class="sBg"></td>
				            <td>&nbsp;${rsCourseInfo.coursename } </td>
						  </tr>
						  <tr> 
				            <td class="lbg3" colspan="29"></td>
				          </tr>
				          <tr>
				          	<td class="s1" width="20%">과정시작일</td>
				          	<td class="sBg"></td>
				          	<td width="30%">&nbsp;${rsCourseInfo.edufrom }</td>
				          	<td class="sBg"></td>
				          	<td class="s1" width="20%">과정종료일</td>
				          	<td class="sBg"></td>
				          	<td>&nbsp;${rsCourseInfo.eduto}</td>
				          </tr>
				         </table>
				      </td>
				      <td class="lbg2"></td>
			      </tr>
		      </table>
		      <!--과정 기본정보 끝-->
			</td>
   		</tr>
   	</table>
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
</logic:present>
<tr>
	<td>&nbsp;</td>
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
		          <td class="t1" width="60">과목기수</td>
		          <td class="sBg"></td>
		          <td class="t1" width="100">과목코드</td>
		          <td class="sBg"></td>
		          <td class="t1" width="200">과목명</td>
		          <td class="sBg"></td>
		          <td class="t1" width="60">평가방법</td>
		          <td class="sBg"></td>
		          <td class="t1" width="60">점수구분</td>
		          <td class="sBg"></td>
		          <td class="t1" width="60">과목총점</td>
		          <td class="sBg"></td>
		          <td class="t1" width="60">처리</td>
		          <td class="sBg"></td>
		          <td class="t1">관리</td>
		        </tr>
	        </table>
	      </td>
	      <td class="lbg"></td>
	    </tr>
    </table>
    <!--테이블 헤더 -->
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
            <div id="mainList" style="width:746px; overflow-y:scroll ;overflow-x:hidden" > 
              <table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
              <c:forEach var="subjectList" items="${rsTst_SubjectList}" varStatus="i">
              	<c:if test="${i.count%2 == 0}"><c:set var="trstyle" value="tbg3"/></c:if>
              	<c:if test="${i.count%2 == 1}"><c:set var="trstyle" value=""/></c:if>
				  <tr class="${trstyle }"> 
		            <td class="t2" width="60">${subjectList.esseq }</td>
		            <td class="sBg"></td>
		            <td class="t2" width="100">&nbsp;${subjectList.sbidf }</td>
		            <td class="sBg"></td>
		            <td class="t3" width="200">&nbsp;<a href="<html:rewrite page="/tstSubject.act?task=subjinfo&cmidf=${subjectList.cmidf }&sbidf=${subjectList.sbidf }&searchSort=${searchSort }"/>" style="cursor:hand" alt="과목정보 보기">${subjectList.sbnam }</a></td>
		            <td class="sBg"></td>
		            <td class="t2" width="60">
		            	<c:if test="${subjectList.esetp == '5110'}">학습평가</c:if>
		            	<c:if test="${subjectList.esetp == '5120'}">실습평가</c:if>
		            	<c:if test="${subjectList.esetp == '5130'}">근태</c:if>
		            </td>
		            <td class="sBg"></td>
		            <td class="t2" width="60">
		            	<c:choose>
                      		<c:when test="${subjectList.scoregbn eq 'study'}">학습</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'attend'}">근태</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'research'}">현장학습</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'team'}">분임조</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'pra'}">실습/실기</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'foreign'}">외국어학습</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'conver'}">외국어회화</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'paper'}">연구논문</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'personal'}">개인강의</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'teamdisc' }">분임토의</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'hobby' }">취미소양</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'stamina' }">기초체력</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'info' }">정보화</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'value' }">핵심가치</c:when>
                      		<c:when test="${subjectList.scoregbn eq 'etc'}">기타</c:when>
                      		<c:otherwise></c:otherwise>
                   		</c:choose>
		            </td>
		            <td class="sBg"></td>
		            <td class="t2" width="60">${subjectList.estpt }</td>
		            <td class="sBg"></td>
		            <td class="t2" width="60" name="isu">
		            	<c:if test="${subjectList.esisu == 'Y'}">처리완료</c:if>
		            	<c:if test="${subjectList.esisu == 'N'}">미처리</c:if>
		            </td>
		            <td class="sBg"></td>
		            <td class="t2" style="text-align:left; vertical-align:middle;">&nbsp;
		            	<img src="/images/poll/btn_edit.gif" onclick="editSubject('${subjectList.cmidf }','${subjectList.sbidf }')" style="cursor:hand" alt="과목정보 수정화면으로 이동"/> 
		            	<img src="/images/poll/btn_s_mgmt.gif" onclick="modifyScore('${subjectList.cmidf }','${subjectList.sbidf }','${subjectList.esetp }')" style="cursor:hand" alt="평가처리화면으로 이동"/>
		            	<c:if test="${subjectList.esetp == '5110'}">
		            		<img src="/images/poll/btn_question.gif" onclick="QuestionMgmt('${subjectList.cmidf }','${subjectList.sbidf }','${subjectList.essrl }')" style="cursor:hand" alt="문항관리화면으로 이동"/>
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
	    <tr> 
	      <td height="10"></td>
	    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <!--하단버튼-->
    <table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
    <tr valign="bottom"> 
      <td>
        <img src="/images/poll/btn_add_subject.gif" onclick="addSubject()" style="cursor:hand" alt="과목등록 화면으로 이동"/>
        <img src="/images/poll/btn_sm_mgmt.gif" onclick="SubjectMasterMgmt()" style="cursor:hand" alt="과목마스터관리"/> 
        <img src="/images/board/btn_excel.gif" onclick="ExcelDownload()" style="cursor:hand" alt="엑셀다운로드"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
<script type="text/javascript">
<!--
	tresize(200);
//-->
</script>
