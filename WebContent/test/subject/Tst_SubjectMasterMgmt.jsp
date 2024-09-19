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
	
	function search()
	{
		document.forms[0].submit();
	}
	
	function reSorting(obj)
	{
		var objs = new Array();
		objs[0] = 'Name';
		objs[1] = 'Code';
		objs[2] = 'Type';
		objs[3] = 'Edu';
		objs[4] = 'Test';
		objs[5] = 'Inuse';
		for(var i=0; i<objs.length; i++)
		{
			var ele = eval('document.forms[0].searchSort' + objs[i]);
			if(obj == objs[i])
			{
				if(ele.value == '')
				{
					ele.value = 'asc';
				}
				else if(ele.value == 'asc')
				{
					ele.value = 'desc';
				}
				else if(ele.value == 'desc')
				{
					ele.value = 'asc';
				}
			}
			else
			{
				ele.value = '';
			}
		}
		
		search();
	}
  	
  	function modify(subjectcode)
  	{
  		document.location.href="/tstSubject.act?task=modifyM&subjectcode=" + subjectcode;
  	}
  	
  	function del(subjectcode)
  	{
  		if(confirm("삭제하시겠습니까?"))
  		{
  			document.location.href="/tstSubject.act?task=deleteM&subjectcode=" + subjectcode;
  		}
  	}
  	
  	function view(subjectcode)
  	{
  		document.location.href="/tstSubject.act?task=subjectmasterinfo&subjectcode=" + subjectcode;
  	}
  	
  	function addSubject()
  	{
  		document.location.href="/tstSubject.act?task=insertmasterform";
  	}
  	
  	function movePage(page)
  	{
  		document.forms[0].action += "&page=" + page;
  		document.forms[0].submit();
  	}
  	
  	function prevBlock(curblock)
  	{
  		document.forms[0].action += "&page=" + ((curblock-1)*10+1);
  		document.forms[0].submit();
  	}
  	
  	function nextBlock(curblock)
  	{
  		document.forms[0].action += "&page=" + ((curblock+1)*10+1);
  		document.forms[0].submit();
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
 <html:form action="tstSubject.act?task=masterlist"> 
<tr>
  <td>
    <!--검색 테이블 시작-->
      <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
      <tr> 
        <td bgcolor="#FFFFFF"> 
          <table width="748" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="119" class="s1">과정</td>
            <td class="sBar"></td>
			<td class="s2" width="320"> 
				<html:select name="tstSubjectForm" property="searchgbn">
           			<html:option value="SUBJECTNAME">교과목명</html:option>
           			<html:option value="SUBJECTCODE">교과목코드</html:option>
           		</html:select>
           		<html:text name="tstSubjectForm" property="searchWord"/>
			</td>
			<td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" onclick="document.forms[0].submit()" style="cursor:hand"/></td>
		  </tr>
		  <tr>
            <td width="89" class="s1">정렬기준</td>
            <td class="sBar"></td>
            <td class="s2"> 
              <html:select name="tstSubjectForm" property="subjecttype" style="width:80px;" onchange="search()">
                <html:option value="">교과목분류</html:option>
                <html:option value="">-------</html:option>
                <html:option value="4501">소양과목</html:option>
                <html:option value="4502">직무과목</html:option>
                <html:option value="4503">행정사항</html:option>
                <html:option value="4509">해당없음</html:option>
              </html:select>
              <html:select name="tstSubjectForm" property="edugbn" style="width:80px;" onchange="search()">
                <html:option value="">교육구분</html:option>
                <html:option value="">-------</html:option>
                <html:option value="Y">온라인</html:option>
                <html:option value="N">오프라인</html:option>
              </html:select>
              <html:select name="tstSubjectForm" property="testgbn" style="width:80px;" onchange="search()">
                <html:option value="">평가구분</html:option>
                <html:option value="">-------</html:option>
                <html:option value="Y">온라인</html:option>
                <html:option value="N">오프라인</html:option>
              </html:select>
              <html:select name="tstSubjectForm" property="inuse" style="width:80px;" onchange="search()">
                <html:option value="">평가구분</html:option>
                <html:option value="">-------</html:option>
                <html:option value="Y">사용</html:option>
                <html:option value="N">미사용</html:option>
              </html:select>
            </td>
            
          </tr>
          </table>
        </td>
      </tr>
      </table>
      <!--검색 테이블 끝-->
  </td>
</tr>
<tr> 
  <td height="10"> 
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
    <!--테이블 헤더 시작-->
    <table width="750" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="lbg"></td>
      <td class="cbg"> 
        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr> 
          <td class="t1" width="80">
          	<a href="#" onclick="reSorting('Code')">
          		<html:hidden name="tstSubjectForm" property="searchSortCode"/>
          		교과목코드
          	</a>
          </td>
          <td class="sBg"></td>
          <td class="t1">	
			<a href="#" onclick="reSorting('Name')">
          		<html:hidden name="tstSubjectForm" property="searchSortName"/>
          		교과목명
          	</a>
          </td>
          <td class="sBg"></td>
          <td class="t1" width="100">
          	<a href="#" onclick="reSorting('Type')">
          		<html:hidden name="tstSubjectForm" property="searchSortType"/>
          		교과목분류
          	</a>
          </td>
          <td class="sBg"></td>
          <td class="t1" width="60">
          	<a href="#" onclick="reSorting('Edu')">
          		<html:hidden name="tstSubjectForm" property="searchSortEdu"/>
          		교육구분
          	</a>
          </td>
          <td class="sBg"></td>
          <td class="t1" width="60">
		  	<a href="#" onclick="reSorting('Test')">
          		<html:hidden name="tstSubjectForm" property="searchSortTest"/>
          		평가구분
          	</a>
		  </td>
          <td class="sBg"></td>
          <td class="t1" width="60">
          	<a href="#" onclick="reSorting('Inuse')">
          		<html:hidden name="tstSubjectForm" property="searchSortInuse"/>
          		사용
          	</a>
          </td>
          <td class="sBg"></td>
          <td class="t1" width="80">관리</td>
          <td width="17"></td>
        </tr>
        </table>
      </td>
      <td class="lbg"></td>
    </tr>
    </table>
    <!--테이블 헤더 -->
  </td>
</tr>
</html:form>

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
              	<c:set var="trclass" value=""/>
                <c:if test="${i.count%2 ==0}"><c:set var="trclass" value="tbg3"/></c:if>
				  <tr class="${trclass }"> 
		            <td class="t2" width="80">${subjectList.subjectcode }</td>
		            <td class="sBg"></td>
		            <td class="t3">&nbsp;<a href="#" onclick="view('${subjectList.subjectcode }')" style="cursor:hand">${subjectList.subjectname }</a></td>
		            <td class="sBg"></td>
		            <td class="t3" width="100">&nbsp;
		            	<c:choose>
		            		<c:when test="${subjectList.subjecttype eq '4501'}">소양과목</c:when>
		            		<c:when test="${subjectList.subjecttype eq '4502'}">직무과목</c:when>
		            		<c:when test="${subjectList.subjecttype eq '4503'}">행정사항</c:when>
		            		<c:when test="${subjectList.subjecttype eq '4509'}">해당없음</c:when>
		            	</c:choose>	
					</td>
		            <td class="sBg"></td>
		            <td class="t2" width="60">
		            	<c:if test="${subjectList.edugbn == 'Y'}">온라인</c:if>
		            	<c:if test="${subjectList.edugbn == 'N'}">오프라인</c:if>
		            </td>
		            <td class="sBg"></td>
		            <td class="t2" width="60">
		            	<c:if test="${subjectList.testgbn == 'Y'}">온라인</c:if>
		            	<c:if test="${subjectList.testgbn == 'N'}">오프라인</c:if>
		            </td>
		            <td class="sBg"></td>
		            <td class="t2" width="60">
		            	<c:if test="${subjectList.inuse == 'Y'}">사용</c:if>
		            	<c:if test="${subjectList.inuse == 'N'}">미사용</c:if>
		            </td>
		            <td class="sBg"></td>
		            <td class="t2" width="80">
		            	<a href="#" onclick="modify('${subjectList.subjectcode }')" style="cursor:hand">수정</a> 
		            	<a href="#" onclick="del('${subjectList.subjectcode }')" style="cursor:hand">삭제 </a>
		            </td>
		            <td class="sBg"></td>
		          </tr>
		          <tr> 
		            <td class="lbg3" colspan="29"></td>
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
    <tr valign="top"> 
      <td width="10%">
      	<img src="/images/poll/btn_add_m.gif" onclick="addSubject()" style="cursor:hand" alt="과목마스터 신규등록"/>
      </td>
      <td width="80%" style="text-align:center">
	      <c:set var="block" value="${curblock*10}"/>
	      <c:set var="eop" value="${block+10 }"/>
	      <c:if test="${eop ge pages}"><c:set var="eop" value="${block+pages%10}"/></c:if>
	      <c:choose>
	      	<c:when test="${curblock eq 0}"></c:when>
	      	<c:otherwise><img src="/images/board/btn_pre.gif" onclick="prevBlock(${curblock})" alt="이전목록" style="cursor:hand"/></c:otherwise>
	      </c:choose>
		  <c:forEach begin="${block+1}" end="${eop}" step="1" varStatus="i">
		  	<c:choose>
		  		<c:when test="${curpage eq i.current }">${i.current}</c:when>
		  		<c:otherwise><a href="#" onclick="movePage(${i.current })" style="cursor:hand">[${i.current }]</a></c:otherwise>
		  	</c:choose>
		  </c:forEach>
		  <c:choose>
		  	<c:when test="${pages/10 le curblock+1}"></c:when>
		  	<c:otherwise><img src="/images/board/btn_next.gif"  onclick="nextBlock(${curblock})" alt="다음목록" style="cursor:hand"/></c:otherwise>
		  </c:choose>
      </td>
      <td width="10%"></td>
    </tr>
    </table>
  </td>
</tr>
</table>

<script type="text/javascript">
<!--
//-->
</script>
