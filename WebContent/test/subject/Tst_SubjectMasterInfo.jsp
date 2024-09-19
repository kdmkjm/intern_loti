<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<script type="text/javascript" src='<html:rewrite page="/common/js/common.js"/>'></script>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script language="JavaScript">
	<!--
  function update()
  {
  	document.location.href = '/tstSubject.act?task=modifyM&subjectcode=' + "${tstSubjectForm.subjectcode}";
  }
  

  function toList()
  {
  	document.location.href = '/tstSubject.act?task=masterlist';
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="tbg2"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
	<td>
    <!--평가과목 기본정보 시작-->
      <table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr> 
	      <td class="lbg"></td>
	      <td class="cbg"> 
	          <table width="746" border="0" cellspacing="0" cellpadding="0">
	          <tr> 
	            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;교과목 기본정보</td>
	          </tr>
	          </table>
	      </td>
	      <td class="lbg"></td>
      </tr>
      <tr>
      	  <td class="lbg"></td>
	      <td>
	      	<table width="746" border="0" cellspacing="0" cellpadding="0">
	      	  
	          <tr>
	          	<td class="s1" width="20%">교과목코드</td>
	          	<td class="sBg"></td>
	          	<td width="30%" colspan="3">&nbsp;
	          		<bean:write name="tstSubjectForm" property="subjectcode"/>
	          	</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
		        <td class="s1" width="20%">교과목명</td>
		        <td class="sBg"></td>
		        <td width="30%" colspan="3">&nbsp;
		        	<bean:write name="tstSubjectForm" property="subjectname"/>
		        </td>
		      </tr>
		      <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
		      <tr>
	          	<td class="s1" width="20%">교과목분류</td>
	          	<td class="sBg"></td>
	          	<td colspan="5">&nbsp;
	          		<c:choose>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4501'}">소양과목</c:when>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4502'}">직무과목</c:when>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4503'}">행정사항</c:when>
	            		<c:when test="${tstSubjectForm.subjecttype eq '4509'}">해당없음</c:when>
	            	</c:choose>
          		</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
	          	<td class="s1" width="20%">교육구분</td>
	          	<td class="sBg"></td>
	          	<td width="30%">&nbsp;
	          		<c:if test="${tstSubjectForm.edugbn == 'Y'}">온라인</c:if>
	            	<c:if test="${tstSubjectForm.edugbn == 'N'}">오프라인</c:if>
	          	</td>
	          	<td class="sBg"></td>
	          	<td class="s1" width="20%">평가구분</td>
	          	<td class="sBg"></td>
	          	<td>&nbsp;
	          		<c:if test="${tstSubjectForm.testgbn == 'Y'}">온라인</c:if>
	            	<c:if test="${tstSubjectForm.testgbn == 'N'}">오프라인</c:if>
	          	</td>
	          </tr>
	        </table>
		  </td>
		  <td class="lbg"></td>
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
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td style="height:5px;"></td>
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
<tr>
	<td>
     <table width="750" border="0" cellspacing="0" cellpadding="0">
      <tr>
      	<td class="lbg"></td>
		 <td class="cbg"> 
          <table width="746" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="119" class="t1" colspan="99" style="text-align:left;">&nbsp;교과목 관리정보</td>
          </tr>
          </table>
         </td>
         <td class="lbg"></td>
      </tr>
      <tr>
      	<td class="lbg"></td>
         <td>
          <table width="746" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td class="s1" width="20%">사용여부</td>
            <td class="sBg"></td>
            <td colspan="5">&nbsp;
              <c:if test="${tstSubjectForm.inuse == 'Y'}">사용</c:if>
           	  <c:if test="${tstSubjectForm.inuse == 'N'}">미사용</c:if>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
          </tr>
          <tr>
          	<td class="s1" width="20%">등록일 </td>
           <td class="sBg"></td>
            <td width="30%">&nbsp;
              <bean:write name="tstSubjectForm" property="insdate"/>
       		</td>
       		<td class="sBg"></td>
       		<td class="s1" width="20%">수정일 </td>
            <td class="sBg"></td>
            <td>&nbsp;
              <bean:write name="tstSubjectForm" property="upddate"/>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
          </tr>
          <tr>
          	<td class="s1" width="20%">등록자 </td>
            <td class="sBg"></td>
            <td width="30%">&nbsp;
              <bean:write name="tstSubjectForm" property="insuser"/>
       		</td>
       		<td class="sBg"></td>
       		<td class="s1" width="20%">수정자 </td>
            <td class="sBg"></td>
            <td>&nbsp;
              <bean:write name="tstSubjectForm" property="upduser"/>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
          </tr>
          </table>
      	</td>
      	<td class="lbg"></td>
      </tr>
      </table>
      
      <!--평가과목 기본정보 끝-->
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
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td style="height:5px;"></td>
    </tr>
    </table>
  </td>
</tr>
<tr> 
  <td> 
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td>
      <img src="/images/board/btn_modify4.gif" onclick="update()" alt="수정" style="cursor:hand"/>
      <img src="/images/board/btn_list.gif" onclick="toList()" alt="목록" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>


<script type="text/javascript">
<!--
	//페이지 로드 완료 후 평가방법 셋팅

//-->
</script>
