<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<html>
<head>

<title>�¶��� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="javascript"> 
<!-- 
	function viewMenu(which, menuID)
	{ 
		if (which.style.display == 'none')
		{ 
			which.style.display = '';
			
			if(menuID == '01')
					document.all.menu01.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '02')
					document.all.menu02.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '03')
					document.all.menu03.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '04')
					document.all.menu04.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '05')
					document.all.menu05.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '06')
					document.all.menu06.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '07')
					document.all.menu07.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
			else if(menuID == '08')
					document.all.menu08.src = "${pageContext.request.contextPath}/images/tree/folderopen.gif"; 
		} 
		else
		{ 
			which.style.display = 'none' 
			
			if(menuID == '01')
				document.all.menu01.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '02')
				document.all.menu02.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '03')
				document.all.menu03.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '04')
				document.all.menu04.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '05')
				document.all.menu05.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '06')
				document.all.menu06.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '07')
				document.all.menu07.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
			else if(menuID == '08')
				document.all.menu08.src = "${pageContext.request.contextPath}/images/tree/folder.gif"; 
		}
	} 
--> 
</script>
</head>
<body>
<table width="254" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="3"></td>
	</tr>
	<tr>
		<td width="5"></td>
		<td>
			<!--ù��° �޴� ����-->
			<a href="#" onclick="viewMenu(menu1outline, '01')"><img id="menu01" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="������ȹ"/> <b>������ȹ</b></a><br>
			<span id="menu1outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln01.jsp" 	target="iframe_Main"> <b>1. ���� ��������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln01-1.jsp" target="iframe_Main"> <b>����� �������ε�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln02.jsp" 	target="iframe_Main"> <b>2. ���� �������� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln02-1.jsp" target="iframe_Main"> <b>���� ���ε�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03.jsp" 	target="iframe_Main"> <b>3. ��ȹ��</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03-1.jsp" target="iframe_Main"> <b>�űԵ�� �� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln03-2.jsp" target="iframe_Main"> <b>�űԵ�� �� ����(���̹�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln04.jsp" 	target="iframe_Main"> <b>4. ��ȹ��Ȯ�� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05.jsp" 	target="iframe_Main"> <b>5. ����������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05-1.jsp" target="iframe_Main"> <b>�űԵ�� �� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln05-2.jsp" target="iframe_Main"> <b>�űԵ�� �� ����(���̹�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln06.jsp" 	target="iframe_Main"> <b>6. ���������˻�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln06-1.jsp" target="iframe_Main"> <b>��������</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln07.jsp" 	target="iframe_Main"> <b>7. ������������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln07-1.jsp" target="iframe_Main"> <b>��������</b></a><br>  
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln08.jsp" 	target="iframe_Main"> <b>8. �����������ȳ�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/edu_pln/edu_pln08-1.jsp" target="iframe_Main"> <b>��������</b></a><br>  
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--�ι�° �޴� ����-->
			<a href="#" onclick="viewMenu(menu2outline, '02')"><img id="menu02" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="�����"/> <b>�����</b></a><br> 
			<span id="menu2outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr01.jsp" target="iframe_Main"> <b>1. �˻�-������ȸ (�˾�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr02.jsp" target="iframe_Main"> <b>2. ������ȸ</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr02-1.jsp" target="iframe_Main"> <b>��������</a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>3. �����ð�ǥ</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-1.jsp" target="iframe_Main"> <b>�ð�ǥ ��ȸ - ���ں�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-2.jsp" target="iframe_Main"> <b>�ð�ǥ ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-2-1.jsp" target="iframe_Main"> <b>1) �������� (�˾�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr03-3.jsp" target="iframe_Main"> <b>�ð�ǥ ��ȸ - ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr04.jsp" 	target="iframe_Main"> <b>4. �������߸�� �Է�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr05.jsp" 	target="iframe_Main"> <b>5. ���� �ο� Ȯ��</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr05-1.jsp" target="iframe_Main"> <b>���� �ο� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr06.jsp" 	target="iframe_Main"> <b>6. ������ ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr06-1.jsp" target="iframe_Main"> <b>���� �̷�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>7. ������ �˻�</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr07-1.jsp" target="iframe_Main"> <b>�˻�-��������ȸ (�˾�)</b></a><br>
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr07-2.jsp" target="iframe_Main"> <b>������ �˻�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr08.jsp" 	target="iframe_Main"> <b>8. ���°���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr08-1.jsp" target="iframe_Main"> <b>���°��� - ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr09.jsp" 	target="iframe_Main"> <b>9. �̼�����</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr10.jsp" 	target="iframe_Main"> <b>10. ���̹� �̼�����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr10-1.jsp" target="iframe_Main"> <b>�������ε�</b></a><br>
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr10-2.jsp" target="iframe_Main"> <b>�������ε�(��������)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr11.jsp" 	target="iframe_Main"> <b>11. �̼�������ȸ</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr12.jsp" 	target="iframe_Main"> <b>12. ���̹� ���̼��� ����</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr13.jsp" 	target="iframe_Main"> <b>13. ������ ��� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr13-1.jsp" target="iframe_Main"> <b>���� ���ε�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/crs_opr/crs_opr14.jsp" 	target="iframe_Main"> <b>14. �����ο� Ȯ�� �� �̼�����</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--����° �޴� ����-->
			<a href="#" onclick="viewMenu(menu3outline, '03')"><img id="menu03" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="�������" style="cursor:hand"/> <b>�������</b></a><br> 
			<span id="menu3outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf01.jsp"		target="iframe_Main"> <b>1. �˻�-������ȸ (�˾�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf02.jsp" 	target="iframe_Main"> <b>2. �������� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/prf/prf02-1.jsp" target="iframe_Main"> <b>��������ȸ</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/prf/prf02-2.jsp" target="iframe_Main"> <b>�Ⱝ������ȸ</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf02-3.jsp" target="iframe_Main"> <b>��� �� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf03.jsp" 	target="iframe_Main"> <b>3. �Ⱝ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf03-1.jsp" target="iframe_Main"> <b>�������� (�˾�) </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf04.jsp" 	target="iframe_Main"> <b>4. ������� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/prf/prf05.jsp" 	target="iframe_Main"> <b>5. ����� ���ޱ��� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf05-1.jsp" target="iframe_Main"> <b>���� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/prf/prf06.jsp" 	target="iframe_Main"> <b>6. ���ǽ���Ȯ�� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/prf/prf06-1.jsp" target="iframe_Main"> <b>�˻�-������ȸ (�˾�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/prf/prf06-2.jsp" target="iframe_Main"> <b>�ű�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/prf/prf06-3.jsp" target="iframe_Main"> <b>��</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--�׹�° �޴� ����-->
			<a href="#" onclick="viewMenu(menu4outline, '04')"><img id="menu04" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="������" style="cursor:hand"/> <b>������</b></a><br> 
			<span id="menu4outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost01.jsp"		target="iframe_Main"> <b>1. �˻�-������ȸ (�˾�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost02.jsp" 	target="iframe_Main"> <b>2. ���������� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost02-1.jsp" target="iframe_Main"> <b>�ű�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost02-2.jsp" target="iframe_Main"> <b>����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/cost/cost02-3.jsp" target="iframe_Main"> <b>�󼼳���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost03.jsp" 	target="iframe_Main"> <b>3. �������� (���̹��ΰ�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost03-1.jsp" target="iframe_Main"> <b>�ű�(���̹��ΰ�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/cost/cost03-2.jsp" target="iframe_Main"> <b>����(���̹��ΰ�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/cost/cost03-3.jsp" target="iframe_Main"> <b>�󼼳���(���̹��ΰ�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost04.jsp" 	target="iframe_Main"> <b>4. ������ ������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/cost/cost05.jsp" 	target="iframe_Main"> <b>5. �����񿹻���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/cost/cost06.jsp" 	target="iframe_Main"> <b>6. ���������</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--�ټ���° �޴� ����-->
			<a href="#" onclick="viewMenu(menu5outline, '05')"><img id="menu05" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="�򰡼���" style="cursor:hand"/> <b>�򰡼���</b></a><br> 
			<span id="menu5outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/test/test01.jsp"		target="iframe_Main"> <b>1. �˻�-������ȸ (�˾�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/test/test02.jsp" 	target="iframe_Main"> <b>2. ��������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/test/test02-1.jsp" target="iframe_Main"> <b>���Ӻ������Է� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test02-2.jsp" target="iframe_Main"> <b>�������Է�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/test/test03.jsp" 	target="iframe_Main"> <b>3. ������ �ۼ�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/test/test03-1.jsp" target="iframe_Main"> <b>���� �̸����� (�˾�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test03-2.jsp" target="iframe_Main"> <b>�������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-1.jsp" target="iframe_Main"> <b>���� ���/����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-2.jsp" target="iframe_Main"> <b>��������(����)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-3.jsp" target="iframe_Main"> <b>��������(����)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-4.jsp" target="iframe_Main"> <b>��������(�ܴ�)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test03-2-5.jsp" target="iframe_Main"> <b>��������(�幮)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test03-2-6.jsp" target="iframe_Main"> <b>��������(���縸����)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test04.jsp" 	target="iframe_Main"> <b>4. ����������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test04-1.jsp" target="iframe_Main"> <b>�������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/test/test04-2.jsp" target="iframe_Main"> <b>�����亯 ��� (��������)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/test/test04-3.jsp" target="iframe_Main"> <b>���� �����ϱ� (�˾�)</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--������° �޴� ����-->
			<a href="#" onclick="viewMenu(menu6outline, '06')"><img id="menu06" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="��������" style="cursor:hand"/> <b>��������</b></a><br> 
			<span id="menu6outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc01.jsp"		target="iframe_Main"> <b>1. ���������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc01-1.jsp" target="iframe_Main"> <b>�ű� ��� �� ���� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc01-2.jsp" target="iframe_Main"> <b>�����纰 ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc02.jsp" 	target="iframe_Main"> <b>2. �������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-1.jsp" target="iframe_Main"> <b>���� ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-2.jsp" target="iframe_Main"> <b>���� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-3.jsp" target="iframe_Main"> <b>���� ����� �̷�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc02-4.jsp" target="iframe_Main"> <b>���� �԰�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc02-5.jsp" target="iframe_Main"> <b>���� ���</b></a><br>  
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc03.jsp" 	target="iframe_Main"> <b>3. ��������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-1.jsp" target="iframe_Main"> <b>���� �ű�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-2.jsp" target="iframe_Main"> <b>���� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-3.jsp" target="iframe_Main"> <b>���� ���� �� �ݳ�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc03-4.jsp" target="iframe_Main"> <b>���� ���� ��Ȳ</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc03-5.jsp" target="iframe_Main"> <b>���� �з��� ��� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc04.jsp" 	target="iframe_Main"> <b>4. ���� �˻�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>5. ���������</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc05-1.jsp" target="iframe_Main"> <b>������ �� �����Ȳ</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc05-2.jsp" target="iframe_Main"> <b>������ �뿩</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<b>6. ������뿩��û</b><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc06-1.jsp" target="iframe_Main"> <b>������뿩�ȳ� </b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc06-2.jsp" target="iframe_Main"> <b>������뿩��Ȳ</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc06-3.jsp" target="iframe_Main"> <b>������뿩��û</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/rsc/rsc06-3-1.jsp" target="iframe_Main"> <b>���� �� ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/2nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc06-3-2.jsp" target="iframe_Main"> <b>��</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc07.jsp" 	target="iframe_Main"> <b>7. ������������</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc08.jsp" 	target="iframe_Main"> <b>8. ������ʱ�޴�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc09.jsp" 	target="iframe_Main"> <b>9. �����μ�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/rsc/rsc10.jsp" 	target="iframe_Main"> <b>10. SMS/EMAIL�߼�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/rsc/rsc10-1.jsp" target="iframe_Main"> <b>SMS�߼�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc10-2.jsp" target="iframe_Main"> <b>EMAIL�߼�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/rsc/rsc11.jsp" 	target="iframe_Main"> <b>11. SMS�߼���Ȳ</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/rsc/rsc11-1.jsp" target="iframe_Main"> <b>SMS�߼���Ȳ��</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
	<tr>
		<td width="3"></td>
		<td>
			<!--�ϰ���° �޴� ����-->
			<a href="#" onclick="viewMenu(menu7outline, '07')"><img id="menu07" src='<html:rewrite page="/images/tree/folder.gif"/>' align="absmiddle" alt="�Խ���" style="cursor:hand"/> <b>�Խ���</b></a><br> 
			<span id="menu7outline" style="display:none;" class="t2"> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board01.jsp"		target="iframe_Main"> <b>1. Q&A �Խ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board01-1.jsp" target="iframe_Main"> <b>�ű� ��� �� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board01-2.jsp" target="iframe_Main"> <b>�� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board02.jsp" 	target="iframe_Main"> <b>2. �ڷ�� �Խ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board02-1.jsp" target="iframe_Main"> <b>�ű� ��� �� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board02-2.jsp" target="iframe_Main"> <b>�� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board03.jsp" 	target="iframe_Main"> <b>3. �����ı� �Խ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board03-1.jsp" target="iframe_Main"> <b>�ű� ��� �� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board03-2.jsp" target="iframe_Main"> <b>�� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/join.gif"/>' align="absmiddle"/>					<a href="${pageContext.request.contextPath}/help/board/board04.jsp" 	target="iframe_Main"> <b>4. �������� (���)</b></a><br> 
				<img src='<html:rewrite page="/images/tree/subjoin.gif"/>' align="absmiddle"/>			<a href="${pageContext.request.contextPath}/help/board/board04-1.jsp" target="iframe_Main"> <b>���� �����ϱ�</b></a><br> 
				<img src='<html:rewrite page="/images/tree/joinbottom.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/board/board05.jsp" 	target="iframe_Main"> <b>5. ������û �Խ���</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoin.gif"/>' align="absmiddle"/>		<a href="${pageContext.request.contextPath}/help/board/board05-1.jsp" target="iframe_Main"> <b>�ű� ��� �� ����</b></a><br> 
				<img src='<html:rewrite page="/images/tree/nosubjoinbottom.gif"/>' align="absmiddle"/><a href="${pageContext.request.contextPath}/help/board/board05-2.jsp" target="iframe_Main"> <b>�� ����</b></a><br> 
			<br>
			</span>
		</td>
	</tr>
</table>
</body>
</html>
