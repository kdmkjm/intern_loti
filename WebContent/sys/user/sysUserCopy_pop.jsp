<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script type="text/javascript">

	function copyAuth(cpJuminNo)
	{
		var deJuminNo = $('juminNo').value;

		if(confirm('이전 권한은 모두 삭제됩니다. 계속 하시겠습니까?'))
		{

			document.location.href = '${pageContext.request.contextPath}/sysUser.act?'
			+'task=copy_auth&cpJuminNo='+cpJuminNo+'&deJuminNo='+deJuminNo;

			self.close();
			opener.location.reload();
		}
	}

</script>

<form name="search" method="POST"  action='<html:rewrite page="/sysUser.act?task=copy_list"/>' class="boardSearchForm" >
<input type="hidden" name="juminNo" value="${juminNo}">
<table width="600" border="0" cellspacing="5" cellpadding="0" height="450" bgcolor="#E7E7E7">
  <tr> 
    <td valign="top"> 
      <table width="590" border="0" cellspacing="1" cellpadding="0" height="440" bgcolor="#D1D1D1">
        <tr> 
          <td bgcolor="#FFFFFF" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/board/popup_title_bg.gif"/>' height="42"><img src='<html:rewrite page="/images/system/title_01-3.gif"/>' alt="권한복사" /></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
              <tr> 
                <td> 
                  <table width="560" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td valign="top"> 
                        <table width="560" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="25" class="p1">
                            	<img src='<html:rewrite page="/images/board/dot_02.gif"/>' align="absmiddle" alt="" />이름 
                              <input type="text" name="searchKeyword" style="width:100px" value="${searchKeyword}">
                              <img src='<html:rewrite page="/images/board/btn_s_search.gif"/>' align="absmiddle" alt="검색" style="cursor:hand"/> 
                            </td>
                          </tr>
                          <tr> 
                            <td height="10px;"></td>
                          </tr>
                          <tr> 
                            <td> 
                              <table width="560" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_01.gif"/>' width="5" height="5" /></td>
                                  <td bgcolor="#F3F3F3" height="5" width="550"></td>
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_02.gif"/>' width="5" height="5" /></td>
                                </tr>
                                <tr> 
                                  <td bgcolor="#F3F3F3" width="5"></td>
                                  <td bgcolor="#F3F3F3" width="550" valign="top" height="290"> 
                                    <table width="537" border="0" cellspacing="0" cellpadding="0" align="center">
                                      <tr> 
                                        <td height="10"></td>
                                      </tr>
                                      <tr> 
                                        <td> 
                                        	<input type="hidden" name="task" value="ins_user"/>
																					<input type="hidden" name="rowCount" value=""/>
                                          <!--테이블 헤더 시작-->
                                          <table width="537" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
                                            <tr> 
                                              <td class="pt1" width="50">NO</td>
                                              <td class="pt1" width="128">근무부서</td>
                                              <td class="pt1" width="68">이름</td>
                                              <td class="pt1">그룹</td>
                                              <td class="pt1" width="66">&nbsp;</td>
                                            </tr>
                                          </table>
                                          <!--테이블 헤더 끝-->
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td height="257" valign="top"> 
                                          <!--리스트 시작-->
                                          <div id="Layer1" style="position:absolute; width:537px; height:250px; z-index:1; overflow: auto"> 
                                            <table width="520" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8">
                                            	<c:forEach var="userList" items="${rsSysUserAuthList}" varStatus="i" >
	                                              <tr> 
	                                                <td class="pt2" width="50"><c:out value="${userList.num}"/></td>
	                                                <td class="pt2" width="128"><c:out value="${userList.nodeNo}"/></td>
	                                                <td class="pt2" width="68"><c:out value="${userList.userName}"/></td>
	                                                <td class="pt2">사이버교육</td>
	                                                <td class="pt2" width="49"><img src='<html:rewrite page="/images/board/btn_s_select.gif"/>' alt="선택" align="absmiddle" style="cursor:hand" onclick="copyAuth('${userList.juminNo}');"/></td>
	                                              </tr>
																							</c:forEach>
                                            </table>
                                          </div>
                                          <!--리스트 끝-->
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                  <td bgcolor="#F3F3F3" width="5"></td>
                                </tr>
                                <tr> 
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_03.gif"/>' width="5" height="5"/></td>
                                  <td bgcolor="#F3F3F3" height="5" width="550"></td>
                                  <td width="5" height="5"><img src='<html:rewrite page="/images/board/round_04.gif"/>' width="5" height="5"/></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td> 
                        <!--하단 버튼-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" height="28">
                          <tr valign="bottom"> 
                            <td align="right"><img src='<html:rewrite page="/images/board/btn_selectup.gif"/>' align="absmiddle" alt="선택등록" style="cursor:hand" onclick="selUpdate();"/></td>
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
    </td>
  </tr>
</table>
</form>