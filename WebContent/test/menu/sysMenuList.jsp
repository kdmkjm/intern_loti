<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>


		<!---------- ���� ȭ��  ----------->

		<div class="main">
		<div class="mainText">

		<!--�˻� -->
		<form method="POST"  action="" class="boardSearchForm" >
		<table border="0" cellspacing="0" width="660">
		<tr>
			<td>
			�޴��� <input type="text" name="searchKeyword" title="�޴���"  class="inputText "  />
			</td>
			<td width="50">
			<a href="#"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="45" height="20" alt="�˻�" align="absmiddle" border="0" /></a>
			</td>
		</tr>
		</table>
		</form>
		<hr class="displayNone" />
		<!--�˻� ��-->

		<!--�Խù� ��� ����-->
		<fieldset>
		 <table border="1" cellspacing="0" class="boardList" summary="�޴����">
		  <caption>�޴����</caption>
				<thead>
				<tr bgcolor="#FFFFFF" height="27" align="center">
					<th scope="col">�޴��ڵ�</th>
					<th scope="col">�����ڵ�</th>
					<th scope="col">�޴���</th>
					<th scope="col">���α׷���</th>
					<th scope="col">���α׷�ID</th>
					<th scope="col"  class="end">����</th>
				</tr>
				</thead>
				<tbody>

        <tr >
      		<td>1</td>
      		<td>0</td>
            <td class="subject" >
            <a href=''><span>�ý��۰���</span></a></td>
          	<td class="subject">�ý��۰���</td>
            <td></td>
            <td><a href=''>����</a></td>
        </tr>
         <tr>
				<td colspan="6" bgcolor="efefef" height="1"></td>
		</tr>

        <tr >
      		<td>2</td>
      		<td>1</td>
            <td class="subject" >
            <a href=''><span>�����/�׷����</span></a></td>
          	<td class="subject">�����/�׷����</td>
            <td></td>
            <td><a href=''>����</a></td>
        </tr>

         <tr>
				<td colspan="6" bgcolor="efefef" height="1"></td>
		</tr>

		<tr>
				<td colspan="6" bgcolor="efefef" height="1"></td>
		</tr>
				</tbody>
			  </table>

			</fieldset>

    <!--�Խù� ��� ��-->

		<!--�Խù� �Ʒ� ��ư ����-->
		<div class="boardBottom">
		  <div class="buttonRight">
            <input type="button" name="Submit3" value="�űԵ��" class="button" onclick="location.href='<html:rewrite page="/sysMenuAdd.jsp"/>'">
          </div>
		 </div>

		<!--�Խù� �Ʒ� ��ư ��-->
		</div>

		<!------ ����ȭ�� ��------>

	</div>

