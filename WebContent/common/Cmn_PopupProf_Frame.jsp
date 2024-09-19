<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>강사지정</title>
<link rel="stylesheet" href='<html:rewrite page="/style/main.css"/>' type="text/css" />
</head>
<body>
<table width="335" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_01.gif"/>' width="5" height="5" alt="" /></td>
    <td bgcolor="#F3F3F3" height="5" width="272"></td>
    <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_02.gif"/>' width="5" height="5" alt="" /></td>
  </tr>
  <tr> 
    <td bgcolor="#F3F3F3" width="5"></td>
    <td bgcolor="#F3F3F3" width="325" height="275" valign="top"> 
			<table width="325" border="0" cellspacing="0" cellpadding="0" align="center">
			  <tr> 
			    <td height="30"> 
			      <!--검색 테이블-->
			      <html:form action='cmnProf.act?task=frame'>
			      <table width="325" border="0" cellspacing="0" cellpadding="0" align="right">
			        <tr> 
			          <td width="115" class="p2">ㆍ성명 또는 소속</td>
			          <td> 
			          	<html:text property="searchKeyword" style="width:100px; ime-mode:active"/>
			            <input type="image" src='<html:rewrite page="/images/board/btn_s_search.gif"/>' width="34" height="18" alt="검색" align="absmiddle">
			          </td>
			        </tr>
			      </table>
			      </html:form>
			    </td>
			  </tr>
			  <tr> 
			    <td height="200" valign="top"> 
			      <!--검색 리스트 시작-->
			      <div id="Layer2" style="position:absolute; width:325px; height:240px; z-index:1;overflow-y:scroll ;overflow-x:hidden"> 
				      <!--검색 헤더 시작-->
				      <table width="308" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
				        <tr> 
				          <td class="pt1" width="30">선택</td>
				          <td class="pt1" width="60">이름</td>
				          <td class="pt1">소속</td>
				          <td class="pt1" width="55">생년월일</td>
				        </tr>
				      </table>
				      <!--검색 헤더 시작-->
			      	<form id="searchForm">
			        <table id="searchList" width="310" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
			        	<c:forEach var="profList" items="${rsCrs_SearchProfList}" varStatus="i" >
			      			<tr> 		
				            <td class="pt2" width="30"><input type="checkbox" id="chkuser" name="chkuser" value="${profList.profno}"></td>     			        	  			           
				            <td class="pt2" width="60"><c:out value="${profList.profname}"/>
				              <input type="hidden" name="profnamearray" value="${profList.profname}">
				            	<input type="hidden" name="profnoarray" value="${profList.profno}">
				            	<input type="hidden" name="profassignarray" value="${profList.workplace}">
				            	<input type="hidden" name="profbirtharray" value="${profList.birth}">
				            	<input type="hidden" name="proflevelarray" value="${profList.proflevel}">
				           	</td>
				            <td class="pt2Left">&nbsp;<c:out value="${profList.workplace}"/></td>
				            <td class="pt2Left" width="55">&nbsp;<c:out value="${profList.birth}"/></td>
				            <!-- 
				            <td class="pt2" width="60"><c:out value="${profList.workpos}"/></td>
				             -->
				          </tr>
			        	</c:forEach>
			        </table>
			        </form>
			      </div>
			      <!--검색 리스트 끝-->
			    </td>
			  </tr>
			</table>
		</td>
    <td bgcolor="#F3F3F3" width="5"></td>
  </tr>
  <tr> 
    <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_03.gif"/>' width="5" height="5" alt="" /></td>
    <td bgcolor="#F3F3F3" height="5" width="352"></td>
    <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_04.gif"/>' width="5" height="5" alt="" /></td>
  </tr>
</table>			
</body>
</html>
