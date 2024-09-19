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

  
  function checkComplete()
  {
  		var frm = document.forms[0];
  		
		if(frm.subjectname.value == '')
		{
			alert('과정명을 입력해주세요');
			frm.subjectname.focus();
			return;
		}

		
		frm.submit();
  }

	function del()
	{
		if(!confirm("삭제하시겠습니까?"))
  		{
  			return;
  		}
		document.location.href="/tstSubject.act?task=deleteM&subjectcode=" + "${tstSubjectForm.subjectcode}";
	}
  function toList()
  {
  	document.location.href = '/tstSubject.act?task=masterlist';
  }
  
//-->
</script>
<html:form action="/tstSubject.act?task=updatemaster" method="post"> 
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
	          	<td class="s1" width="20%">교과목코드<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td colspan="5">&nbsp;
	          		<html:text name="tstSubjectForm" property="subjectcode" readonly="true"/>
	          	</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
		        <td class="s1" width="20%">교과목명<font color=red>*</font></td>
		        <td class="sBg"></td>
		        <td colspan="5">&nbsp;
		        	<html:text name="tstSubjectForm" property="subjectname" style="width:80%"/>
		        </td>
		      </tr>
		      <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
		      <tr>
	          	<td class="s1" width="20%">교과목분류<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td colspan="5">&nbsp;
	          		<html:select name="tstSubjectForm" property="subjecttype">
	          			<html:option value="">선택</html:option>
	          			<html:option value="">---------</html:option>
	          			<html:option value="4501">소양과목</html:option>
	          			<html:option value="4502">직무과목</html:option>
	          			<html:option value="4503">행정사항</html:option>
	          			<html:option value="4509">해당없음</html:option>
	          		</html:select>
          		</td>
	          </tr>
	          <tr> 
	            <td class="lbg3" colspan="29"></td>
	          </tr>
	          <tr>
	          	<td class="s1" width="20%">교육구분<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td width="30%">&nbsp;
	          		<html:select name="tstSubjectForm" property="edugbn">
	          			<html:option value="">선택</html:option>
	          			<html:option value="">----------</html:option>
	          			<html:option value="Y">온라인교육</html:option>
	          			<html:option value="N">오프라인교육</html:option>
	          		</html:select>
	          	</td>
	          	<td class="sBg"></td>
	          	<td class="s1" width="20%">평가구분<font color=red>*</font></td>
	          	<td class="sBg"></td>
	          	<td>&nbsp;
	          		<html:select name="tstSubjectForm" property="testgbn">
	          			<html:option value="">선택</html:option>
	          			<html:option value="">----------</html:option>
	          			<html:option value="Y">온라인평가</html:option>
	          			<html:option value="N">오프라인평가</html:option>
	          		</html:select>
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
          	<td class="s1" width="20%">사용여부 <font color=red>*</font></td>
          	<td class="sBg"></td>
            <td colspan="5">&nbsp;
              <html:select name="tstSubjectForm" property="inuse">
               <html:option value="">선택</html:option>
               <html:option value="">- - - - - - -</html:option>
               <html:option value="Y">사용</html:option>
               <html:option value="N">사용안함</html:option>
              </html:select>
       		</td>
          </tr>
          <tr> 
            <td class="lbg3" colspan="29"></td>
          </tr>
          <tr>
          	<td class="s1" width="20%">등록일 </td>
          	<td class="sBg"></td>
            <td width="30%">&nbsp;
            	<html:hidden name="tstSubjectForm" property="insdate"/>
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
            	<html:hidden name="tstSubjectForm" property="insuser"/>
              <bean:write name="tstSubjectForm" property="insuser"/>
       		</td>
       		<td class="sBg"></td>
       		<td class="s1" width="20%">수정자 </td>
       		<td class="sBg"></td>
            <td>&nbsp;
              <bean:write name="tstSubjectForm" property="upduser"/>
       		</td>
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
	      <img src="/images/board/btn_save.gif" onclick="checkComplete()" alt="저장" style="cursor:hand"/>
	      <img src="/images/board/btn_del.gif" onclick="del()" alt="삭제" style="cursor:hand">
	      <img src="/images/board/btn_list.gif" onclick="toList()" alt="목록" style="cursor:hand"/>
      </td>
    </tr>
    </table>
  </td>
</tr>
</table>
</html:form>

<script type="text/javascript">
<!--
	//페이지 로드 완료 후 평가방법 셋팅

//-->
</script>
