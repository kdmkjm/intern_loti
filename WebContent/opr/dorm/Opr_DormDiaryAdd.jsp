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
	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}

	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}

	function MM_findObj(n, d) { //v4.01
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && d.getElementById) x=d.getElementById(n); return x;
	}

	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}



//-->
</script>
</head>

<body>
<!--// ��ǥ 13 - ��ŵ�׺���̼� -->
<div id="accessibility">
  <ul>
    <li><a href="#gnb">�ָ޴� �ٷΰ���</a></li>
    <li><a href="#content">������ �ٷΰ���</a></li>
  </ul>
</div>
<hr />

<div id="wrap">

	<div id="header">
		<h1><a href="#"><img src='<html:rewrite page="/images/logo.gif"/>' alt="�뱸������" /></a></h1>


    <ul class="lnb">
      <li><a href="#"><strong>ȫ�浿 [����������]</strong></a></li>
      <li><a href="#">�α׾ƿ�</a></li>
    </ul>

		<!------ ���� �޴� �κ� ------->
		<h2 class="skip">�ָ޴�</h2>

    <ul id="topmenu" class="gnb">
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','<html:rewrite page="/images/m_01_over.gif"/>',1)">
      <img name="Image15" border="0" src='<html:rewrite page="/images/m_01.gif"/>' width="42" height="35" alt="������ȹ" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li> <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','<html:rewrite page="/images/m_02_over.gif"/>',1)">
      <img name="Image16" border="0" src='<html:rewrite page="/images/m_02.gif"/>' width="42" height="35" alt="��������" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','<html:rewrite page="/images/m_03_over.gif"/>',1)">
      <img name="Image11" border="0" src='<html:rewrite page="/images/m_03.gif"/>' width="42" height="35" alt="��������" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','<html:rewrite page="/images/m_04_over.gif"/>',1)">
      <img name="Image12" border="0" src='<html:rewrite page="/images/m_04.gif"/>' width="42" height="35" alt="�������" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','<html:rewrite page="/images/m_05_over.gif"/>',1)">
      <img name="Image13" border="0" src='<html:rewrite page="/images/m_05.gif"/>' width="43" height="35" alt="�򰡼���" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','<html:rewrite page="/images/m_06_over.gif"/>',1)">
      <img name="Image14" border="0" src='<html:rewrite page="/images/m_06.gif"/>' width="42" height="35" alt="�ڿ�����" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
      <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','<html:rewrite page="/images/m_07_over.gif"/>',1)">
      <img name="Image17" border="0" src='<html:rewrite page="/images/m_07.gif"/>' width="53" height="35" alt="�ý��۰���" /></a></li>
      <li><img src='<html:rewrite page="/images/menu_bar.gif"/>' alt="" /></li>
    </ul>
	</div>

	<hr />

		<!------ ���� �޴� �κ� ��    ------->

		<!----------- Left�޴�  ----------->

	<div id="img">
    <p><img src='<html:rewrite page="/images/system/img.jpg"/>' alt="�ý��۰���" /></p>
    </div>
	<hr />


	<div id="container">
	<div id="mainContent">

		<jsp:include page="/include/sysLeftMenu.jsp?code=2" flush="true"/>

		<!----------- Left�޴� �� --------->

		<!---------- ���� ȭ��  ----------->

		<div class="main">
		<div class="mainText">


		<!--�˻� -->

		<!--�˻� ��-->

		<!--�Խù� ��� ����-->
		&nbsp&nbsp&nbsp&nbsp<B>�� ��Ȱ���������</B><br><br>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>�ۼ��� : ȫ�浿<br>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp������ : �ű� �ӿ��� ���� 1��</b><br><br>

		&nbsp&nbsp&nbsp&nbsp<B>��Ȱ������
		<fieldset>
		<table border="1" cellspacing="0" width="660" height = "50" class="boardList">
			<tr bgcolor="#FFFFFF" height="27" align="center">
				<th scope="col">��¥</th>
				<td>
					<select name="">
    					<option value=""></option>
					</select>
				</td>
				<th scope="col">����</th>
				<td><input type="text" name="member_name"></td>
				<td></td>
				<td></td>
			</tr>

			<tr bgcolor="#FFFFFF" height="27" align="center">
				<th scope="col">ȣ��</th>
				<td><input type="text" name="member_name"></td>
				<th scope="col">����</th>
				<td><input type="text" name="member_name"></td>
				<th scope="col">�����</th>
				<td><input type="text" name="member_name"></td>
			</tr>

		</table>
		</fieldset>

		<br><br>
		&nbsp&nbsp&nbsp&nbsp<b>�ο���Ȳ
		<fieldset>
		<table border="1" cellspacing="0" width="660" height = "50"  class="boardList">
			<tr>
				<th scope="col">����</th>
				<th scope="col">�ѿ�</th>
				<th scope="col">�����</th>
				<th scope="col">�����</th>
				<th scope="col">�������</th>
			</tr>

			<tr>
				<th scope="col">��ħ��ȣ</th>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<th scope="col">������ȣ</th>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

		</table>
		</fieldset>

		<br><br>
		&nbsp&nbsp&nbsp&nbsp<b>ȯ�ڹ߻�
		<fieldset>
		<table border="1" cellspacing="0" width="660" height = "50"  class="boardList">
			<tr>
				<th scope="col">����</th>
				<th scope="col">����</th>
				<th scope="col">����</th>
				<th scope="col">ó������</th>
			</tr>

			<tr>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>
		</table>
		</fieldset>
		<right><b>[+][-]

		<fieldset>
		<table border="1" cellspacing="0" width="660" height = "50"  class="boardList">
			<tr>
				<th scope="col">���˻���</th>
				<th scope="col">���˰��</th>
				<th scope="col">���</th>
			</tr>

			<tr>
				<td>1. �ٴ� û�� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>2. ħ�� ���� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>3. ��Ź�� ���� �� ���� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>4. �Ź� ���� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>5. ����, Ź�� ���� ����
				</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>6. �繰�� ���� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>7. ������ ���� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>8. ����� û�� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>9. ȭ��� û�� ����</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>

			<tr>
				<td>10. ��Ÿ</td>
				<td><input type="text" name="member_name"></td>
				<td><input type="text" name="member_name"></td>
			</tr>


		</table>
		</fieldset>

    <!--�Խù� ��� ��-->

		<!--�Խù� �Ʒ� ��ư ����-->
		<div class="boardBottom">
		  <div class="buttonRight">
		   <input type="button" name="Submit3" value="���" class="button" onclick="location.href='<html:rewrite page="/sysMenuAdd.jsp"/>'">
            <input type="button" name="Submit3" value="����" class="button" onclick="location.href='<html:rewrite page="/sysMenuAdd.jsp"/>'">
          </div>
          </div>

		<!--�Խù� �Ʒ� ��ư ��-->
		</div>

		<!------ ����ȭ�� ��------>

	</div>
	  </div>

	</div>
	</div>


</body>
</html>
