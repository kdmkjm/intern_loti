<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<html>
<head>

<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script type="text/javascript">

</script>
</head>
  <frameset rows="140,*"  framespacing="0" frameborder="NO" border="0">
    <frame src="mainMenu.act?task=top_list" name="topFrame" scrolling="NO" noresize="noresize">
    <frameset rows="*" cols="237,*" framespacing="0" frameborder="NO" border="0">
      <frame src="extMainBegin.act?task=left_list" id="iframe_Left" name="iframe_Left" noresize="noresize" scrolling="no">
      <frame src="extMainBegin.act?task=list" name="iframe_Main" id="iframe_Main" noresize="noresize" scrolling="auto">
    </frameset>
  </frameset>
  <noframes>
  <p>�� �������� ���÷��� �������� �����ϴ� �������� ����ϼž� �մϴ�.</p>
  </noframes>
</html>
