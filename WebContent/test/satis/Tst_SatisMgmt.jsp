<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti" %>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script src="/common/js/CommonCourseSearch.js"></script>
<script language="JavaScript">
<!--
	function resultSurvey(surveyno, coursecode)
	{
		if(surveyno == "")
		{
			alert("해당설문이 존재하지 않습니다.")
			return;
		}
		document.location.href ='<html:rewrite page="/tstSatis.act?task=result&surveyno='+surveyno+'&coursecode='+coursecode+'"/>';
	}

	function viewSurvey(surveyno)
	{
		var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
		window.open('<html:rewrite page="/tstSurvey.act?task=preview&popflag=pop&surveyno='+surveyno+'"/>', 'popup', 'scrollbars=yes, menubar=no, width=667, height=600, status=yes top='+wint+', left='+winl);
	}
    
    function OMRUploadPopup(surveyno)
    {
    	size_w = 480;
  		size_h = 230;
  		
  		var url = '/tstSatis.act?task=uploadOMRPopup&surveyno=' + surveyno;
  		target = '_blank';
		openWinSetPo(url, target, '', size_w, size_h);
    }
    
    function DeleteSurveyResult(surveyno)
    {
    	if(confirm('설문 결과를 삭제하시겠습니까?'))
    	{
    		document.location.href = "/tstSatis.act?task=deleterspt&surveyno=" + surveyno + "&searchCourseCode=" + document.forms[0].searchCourseCode.value;
    	}
    }
  
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="만족도 관리" src="/images/poll/title_03.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
    <html:form action="tstSatis.act?task=info">
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
			  <html:hidden property="isCyber" value="N"/>
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
  <td> 
  <table>
	<tr> 
	  <td height="15"></td>
	</tr>
	</table>
	<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
	<tr>
	  <td>
		<!--테이블 헤더 시작-->
		<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
		<tr>
		  <td class="t1" width="29">번<br>호</td>
		  <td class="sBg"></td>
		  <td class="t1" width="220">설문지</td>
		  <td class="sBg"></td>
		  <td class="t1" width="79">설문대상자</td>
		  <td class="sBg"></td>
		  <td class="t1" width="70">응답자</td>
		  <td class="sBg"></td>
		  <td class="t1" width="70">참여율(%)</td>
		  <td class="sBg"></td>
		  <td class="t1" width="110">관리</td>
		</tr>
		</table>
		<!--테이블 헤더 끝-->
		</td>
	</tr>
  	<tr>
	  <td>
		<!--리스트  시작-->
		<div id="mainList" style="width:746px;" > 
		<table width="746" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<c:forEach items="${rsTst_SatisList}" var="surveyitem" varStatus="i">
				<c:if test="${i.count%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				<c:if test="${i.count%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				<tr>
				  <td class="t2" width="29">${i.count }</td>
				  <td class="sBg"></td>
				  <td class="t3" width="220">&nbsp;
				  	<a href="#" onclick="viewSurvey('${surveyitem.surveyno }')">${surveyitem.title }</a>
				  </td>
				  <td class="sBg"></td>
				  <td class="t2" width="79">${surveyitem.rsptcnt }<!-- ${surveyitem.rsptcnt } --></td>
				  <td class="sBg"></td>
				  <td class="t2" width="70">${surveyitem.replycnt }</td>
				  <td class="sBg"></td>
				  <td class="t2" width="70">
				  	<c:if test="${surveyitem.rsptcnt gt 0}">
				  		<fmt:formatNumber value="${surveyitem.replycnt/surveyitem.replycnt*100}" pattern="0.0" />
				  	</c:if>
				  	<c:if test="${surveyitem.rsptcnt le 0}">
				  		<fmt:formatNumber value="0" pattern="0.0" />
				  	</c:if>
				  </td>
				  <td class="sBg"></td>
				  <td class="t2" width="110" style="text-align:left;">&nbsp;
				  	<img src="/images/poll/btn_add_answer.gif" onclick="OMRUploadPopup('${surveyitem.surveyno }')" align="absmiddle" alt="설문답변등록" style="cursor:hand"/>
				  	<img src='<html:rewrite page="/images/poll/btn_del.gif"/>' alt="설문응답정보 삭제" align="absmiddle" onclick="DeleteSurveyResult(${surveyitem.surveyno })" style="cursor:hand"/>
				  </td>
				</tr>
				<tr> 
		            <td class="lbg3" colspan="11"></td>
		        </tr>   
				<c:set var="count" scope="request" value="${i.count + 1}"/>
			</c:forEach>
			<c:if test="${count==null}">
				<tr class="tbg3">
				  <td class="t2">조회된 데이터가 없습니다.</td>
				</tr>
	   		</c:if>
			</tbody>
		</table>
		</div>
		<!--리스트 끝-->	
	
    <!--인적사항 테이블 시작
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg"></td>
      <td class="cbg4" > 
        <table width="746" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="t1up" width="99">설문지</td>
          <td class="s3None" colspan="3">
          	  <input type="hidden" name="surveyno" value="${rsTst_Satis.surveyno }"/>
              <input type="hidden" name="coursecode" value="${rsTst_Satis.coursecode }"/>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="s3"><input type="text" name="title" readonly="readonly" value="${rsTst_Satis.title }" style="width:92%;"></td>
                <td width="45" class="s3Center">
                  <c:if test="${rsTst_Satis.rsptcnt ne '0' && rsTst_Satis.rsptcnt ne null }">
	                <c:if test="${rsTst_Satis.replycnt eq null || rsTst_Satis.replycnt eq '0'}">
	                  <img src='<html:rewrite page="/images/board/btn_s_select.gif"/>' width="34" height="18" alt="선택" align="absmiddle" onclick="setSurvey('${rsTst_Satis.coursecode }')" style="cursor:hand"/>
	                </c:if> 
	              </c:if>                                
                </td>	
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td class="t1up" width="99">설문대상자</td>
          <td class="s3" width="270">${rsTst_Satis.rsptcnt }</td>
          <td class="t1up2" width="99">응답자</td>
          <td class="s3">${rsTst_Satis.replycnt }</td>
        </tr>
        <tr> 
          <td class="t1up" width="99">참여율</td>
          <td class="s3" colspan="3"><fmt:formatNumber value="${(rsTst_Satis.replycnt/rsTst_Satis.rsptcnt)*100 }" pattern="##"></fmt:formatNumber>%</td>
        </tr>
		<tr> 
          <td class="t1up" width="99">만족도</td>
          <td class="s3" colspan="3">
            <fmt:formatNumber value="${rsTst_Satis.totrspt}" pattern="##.#"></fmt:formatNumber>
          </td>
        </tr>
		<tr> 
          <td class="t1up" width="99">강사만족도</td>
          <td class="s3" colspan="3"><fmt:formatNumber value="${rsTst_Satis.teacherrspt }" pattern="##.#"></fmt:formatNumber></td>
        </tr>
        </table>
      </td>
      <td class="lbg"></td>
    </tr>
    </table>
    <!--인적사항 테이블 끝-->
  </td>
</tr>

</table>
<iframe id="actionFrame" width="0" height="0"></iframe>
<script type="text/javascript">
<!--
	//tresize(182);
//-->
</script>
