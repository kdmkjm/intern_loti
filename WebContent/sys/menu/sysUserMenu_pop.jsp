<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript">
	function selUser(juminNo, userName)
	{
		self.close();
		opener.selectMenu(juminNo, userName);

	}
</script>
</head>
<body>
<table width="480" border="0" cellspacing="5" cellpadding="0" height="650" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="470" border="0" cellspacing="1" cellpadding="0" height="635" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/system/title_02-4.gif"/>' width="111" height="42" alt="과정연결" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr height="250" valign="top" align="center"> 
              	<td>
              		<!--검색 -->
									<form method="POST"  action='<html:rewrite page="/sysMenu.act?task=sel_user"/>' class="boardSearchForm" >
									<table width="460" border="0" height="35" cellspacing="0" cellpadding="0">
									  <tr> 
									    <td width="70" class="pItem">사용자명</td>
									    <td align="left"> 
												<input type="text" name="searchKeyword" title="사용자명" class="inputText" value="${searchKeyword}"  />
												<input type="image" src='<html:rewrite page="/images/board/btn_s_search.gif"/>' width="34" height="18" alt="검색" align="absmiddle" border="0" />
											</td>
										</tr>
									</table>
									</form>
							    <!--검색된 과정 헤더 시작-->
									<table width="460" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
									  <tr> 
									    <td class="pt1" width="70">NO</td>
									    <td class="pt1" width="300">대체키</td>
									    <td class="pt1" width="150">이름</td>
									    <td class="pt1" width="17"></td>
									  </tr>
									</table>
									<div id="mainList" style="width:460px; height:500px; z-index:1; overflow-y:scroll ;overflow-x:hidden"> 
								  <table id="mainTable" width="443" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
									<c:set var="no" scope="request" value="1"/>
									<c:forEach var="userList" items="${rsSysUserList}" varStatus="i" >
										<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
										<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
										<tr class="${lineBg}">
						      		<td class="pt2" width="70"><c:out value="${userList.num}"/></td>
						      		<td class="pt2" width="300"><c:out value="${userList.juminNo}"/></td>
					            <td class="pt2" width="150">
					            <a href='#' onclick="selUser('${userList.juminNo}','${userList.userName}');"><span><c:out value="${userList.userName}"/></span></a></td>
						        </tr>
											<c:set value="${no+1}" var="no"></c:set>
										</c:forEach>
										<c:if test="${no==1}">
											<tr class="tbg3" height="21"><td class="t2" colspan="13">조회된 데이터가 없습니다.</td></tr>
										</c:if>
								  </table>
								  </div>
								</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>						
</body>
</html>