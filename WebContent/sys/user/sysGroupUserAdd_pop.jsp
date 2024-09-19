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
window.onresize = function(){
	//윈도우 사이즈 변경 셋팅 코드
	tresize_pop(720, 200);
}
function selUpdate()
{
	if(confirm('저장하시겠습니까?'))
	{
		var f = document.userList;
		var i = 0 ;
		var count = 0;
		if(!document.all.select)
		{
			alert('조회된 값이 없습니다.');
			return;
		}
		//여러건일경우
		if(document.all.select.length)
		{

			while(document.all.select[i])
			{
					if(document.all.select[i].checked)
					{

						document.all.isCheck[i].value='Y';
						count++;
					}

					i++;
			}

		}
		//단건일경우
		else
		{
			if(document.all.select.checked)
			{

				document.all.isCheck.value='Y';
				count++;
			}

			i++;
		}
		if(count==0)
		{
			alert('선택된 값이 없습니다..');
			return;
		}
		
		f.rowCount.value = i;
		f.action = 'sysGroup.act';
		f.submit();
		
		
		//self.close();
		
		/*
		f.submit();
		self.close();
		opener.location.reload();
		*/
	}
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
									<form name="search" method="POST"  action='<html:rewrite page="/sysGroup.act?task=add_list"/>' class="boardSearchForm" >
									<table width="460" border="0" height="35" cellspacing="0" cellpadding="0">
									<input type="hidden" name="groupNo" value="${groupNo}">
										<tr>
									  	<td width="70" class="pItem">사용자명</td>
									  	<td align="left"> 
												<input type="text" name="searchKeyword" title="사용자명"  class="inputText" value="${searchKeyword}"  />
												<input type="image" src='<html:rewrite page="/images/board/btn_s_search.gif"/>' width="34" height="18" alt="검색" align="absmiddle" border="0" />
											</td>
											<td align="right">
												<img src='<html:rewrite page="/images/board/btn_selectup.gif"/>' align="absmiddle" alt="선택등록" style="cursor:hand" onclick="selUpdate();"/>
											</td>
										</tr>
									</table>
									</form>
									<!--검색 끝-->
									<table width="460" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
									  <tr> 
									    <td class="pt1" width="70">선택</td>
									    <td class="pt1" width="170">부서</td>
									    <td class="pt1" width="130">대체키</td>
									    <td class="pt1" width="150">이름</td>
									  </tr>
									</table>
							  	<!--게시물 목록 시작-->
									<form name="userList" action=''>
									<input type="hidden" name="task" value="ins_user"/>
									<input type="hidden" name="rowCount" value=""/>
									<div id="mainList" style="width:460px;z-index:0;overflow-y:scroll;overflow-x:hidden"> 
								  <table id="mainTable" width="460" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
										<c:set var="no" scope="request" value="1"/>
										<c:forEach var="userList" items="${rsSysUserGroupList}" varStatus="i" >
											<c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
											<c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
											<tr class="${lineBg}">	
							      		<td class="pt2" width="70"><input type="checkbox" name="select" id="select">
							      			<input type="hidden" name="insGroupNo" id="insGroupNo" value="${groupNo}">
							      			<input type="hidden" name="isCheck" id="isCheck">
							      			<input type="hidden" name="insJuminNo" id="insJuminNo" value="${userList.juminNo}">
							      		</td>
							      		<td class="pt2Left" width="170">&nbsp;<c:out value="${userList.position}"/></td>
							      		<td class="pt2" width="130"><c:out value="${userList.jumin}"/></td>
							      		<td class="pt2" width="150"><c:out value="${userList.userName}"/></td>
							        </tr>
											<c:set value="${no+1}" var="no"></c:set>
										</c:forEach>
										<c:if test="${no==1}">
											<tr class="tbg3" height="21"><td class="t2" colspan="13">조회된 데이터가 없습니다.</td></tr>
										</c:if>
								  </table>
									</div>
									</form>
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

<script type="text/javascript">
<!--
	tresize_pop(720, 200);
	document.all.searchKeyword.focus();
//-->
</script>