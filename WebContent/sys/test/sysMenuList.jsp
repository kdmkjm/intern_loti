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

<script language="JavaScript">
<!--

//-->
</script>
</head>

<body>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="16" background='<html:rewrite page="/images/sub_bg.gif"/>'></td>
  </tr>
  <tr>
    <td>
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/edu/title_03.gif"/>' alt="��ȹ��" width="74" height="18" /></td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
            <table width="750" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
            <html:form action="/testMenu.act?task=list">
 			<!--�˻� ���̺� ����-->
             <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                 <tr>
                      <td bgcolor="#FFFFFF">
			            <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td width="74" class="s1">�޴���</td>
                            <td bgcolor="#E6E6E6" width="1"></td>
                            <td class="s2"><html:text property="searchKeyword" style="width:150px;"/></td>
			                <td width="60" align="center"><input type="image" src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="�˻�" /></td>
                          </tr>
                        </table>
            			</td>
                    </tr>
                  </table>
                  <!--�˻� ���̺� ��-->
				</html:form>
          		</td>
              </tr>
              <tr>
                <td height="15"></td>
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
                  <!--���̺� ��� ����-->
                  <table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="lbg"></td>
                      <td class="cbg">
                        <table width="746" border="0" cellspacing="0" cellpadding="0" height="100%">
                          <tr bgcolor="#FFFFFF" height="27" align="center">
							<td class="t1" width="87">�޴��ڵ�</td>
							<td class="sBg"></td>
							<td class="t1" width="87">�����ڵ�</td>
							<td class="sBg"></td>
							<td class="t1" width="87">�޴���</td>
							<td class="sBg"></td>
							<td class="t1" width="87">���α׷���</td>
							<td class="sBg"></td>
							<td class="t1" width="87">���α׷�ID</td>
							<td class="sBg"></td>
							<td class="t1" width="87">����</td>
						 </tr>

						<c:forEach var="menuList" items="${rsSysMenuList}" varStatus="i" >
					        <tr >
					      		<td class="t2"><c:out value="${menuList.menuNo}"/></td>
					      		<td class="sBg"></td>
					      		<td class="t2"><c:out value="${menuList.parent}"/></td>
					      		<td class="sBg"></td>
					            <td><a href='<html:rewrite page="/testMenu.act?task=modify&menuNo=${menuList.menuNo} "/>'><span><c:out value="${menuList.menuName}"/></span></a></td>
					          	<td class="sBg"></td>
					          	<td class="t2"><c:out value="${menuList.progName}"/></td>
					          	<td class="sBg"></td>
					            <td class="t2"><c:out value="${menuList.progId}"/></td>
					            <td class="sBg"></td>
					            <td class="t2"><a href='<html:rewrite page="/testMenu.act?task=delete&menuNo=${menuList.menuNo} "/>'>����</a></td>
					        </tr>
					         <tr>
									<td colspan="6" bgcolor="efefef" height="1"></td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="99">${page }</td>
							</tr>

			  </table>



    <!--�Խù� ��� ��-->
                              <!--����Ʈ ��-->
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
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>


    <!--�Խù� ��� ��-->

		<!--�Խù� �Ʒ� ��ư ��-->
</body>
</html>
