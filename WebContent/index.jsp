<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%
//response.setContentType("text/html");
//response.setDateHeader("Expires", 0);
//response.setHeader("Location", request.getContextPath() + "/index.act");
//response.setStatus(301);
//response.sendRedirect("/extMylcResearchList.act");
//response.sendRedirect("/su_login.act");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
</head>
<body>
	<table border="0" align="center" cellspacing="0" cellpadding="0">
		<tr height="50">
			<td></td>
		</tr>
		<tr>
			<td height="25" class="stitle">* ����� �α���</td>
		</tr>
		<tr>
			<td>
				<table border="1" style="border:1px solid #D6D6D6">
					<tr height="30">
						<td width="150" class="s2">��ġ������������</td>
						<td width="100" class="s1">
							<a href="/index.act?no=1"><font color="blue">�ڿ���</font></a>
						</td>
					</tr>
					<tr>
						<td class="s2">��ġ������������</td>
						<td class="s1">
							<a href="/index.act?no=2"><font color="blue">�ڼ�ȭ</font></a>
						</td>
					</tr>
					<tr>
						<td class="s2">��ġ������������</td>
						<td class="s1">
							<a href="/index.act?no=3"><font color="blue">�����</font></a>
						</td>
					</tr><span>
						<input type="text" maxlength="13" value="" class="input" title="��üŰ �Է���" name="subkey" id="subkey" w/>
					</span>
<%-- ADD Start:2012/11/12:yunsh --%>
					<tr>
						<td class="s2">��ġ������������</td>
						<td class="s1">
							<a href="/index.act?no=4"><font color="blue">������</font></a>
						</td>
					</tr>
					<tr>
						<td class="s2">�򰡼������</td>
						<td class="s1">
							<a href="/index.act?no=5"><font color="blue">�念��</font></a>
						</td>
					</tr>
					<tr>
						<td class="s2">������</td>
						<td class="s1">
							<a href="/index.act?no=6"><font color="blue">������</font></a>
						</td>
					</tr>
					<tr>
						<td class="s2">�����׽�Ʈ��</td>
						<td class="s1">
							<a href="/index.act?no=7"><font color="blue">��ȿ��(�Ϲݻ����)</font></a>
						</td>
					</tr>
<%-- ADD End:2012/11/12:yunsh --%>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>