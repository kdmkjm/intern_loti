<%@ page pageEncoding="EUC-KR" %>
<%@ include file="/include/jsp_common.jsp" %>
<% String code = request.getParameter("code"); %>

<script type="text/javascript">
<!--
	function showMenu(n)
	{
		if(n==1)
		{
			document.all.menu1.style.display = "";
			document.all.menu2.style.display = "none";
			document.all.menu3.style.display = "none";
			document.all.menu4.style.display = "none";
			document.all.menu5.style.display = "none";
		}

		if(n==2)
		{
			document.all.menu1.style.display = "none";
			document.all.menu2.style.display = "";
			document.all.menu3.style.display = "none";
			document.all.menu4.style.display = "none";
			document.all.menu5.style.display = "none";
		}

		if(n==3)
		{
			document.all.menu1.style.display = "none";
			document.all.menu2.style.display = "none";
			document.all.menu3.style.display = "";
			document.all.menu4.style.display = "none";
			document.all.menu5.style.display = "none";
		}

		if(n==4)
		{
			document.all.menu1.style.display = "none";
			document.all.menu2.style.display = "none";
			document.all.menu3.style.display = "none";
			document.all.menu4.style.display = "";
			document.all.menu5.style.display = "none";
		}

		if(n==5)
		{
			document.all.menu1.style.display = "none";
			document.all.menu2.style.display = "none";
			document.all.menu3.style.display = "none";
			document.all.menu4.style.display = "none";
			document.all.menu5.style.display = "";
		}

	}
//-->
</script>

<div class="submenu">
		<h3 class="skip"> ����޴� </h3>

        <ul>
          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image18','','<html:rewrite page="/images/system/sub_m_01_over.gif"/>',1)" onclick="javascript:showMenu(1)">
          <img name="Image18" border="0" src='<html:rewrite page="/images/system/sub_m_01.gif"/>' width="172" height="21" alt="�����/�׷����" /></a>

          <!--����� �׷����-->
			  <div id="menu1" class="submenu2" style="display:none">
			  <ul>

				  <li><a href='<html:rewrite page="/sysUser.act?task=list"/>'>����ڰ���</a></li>

				  <li><a href='<html:rewrite page="/sysGroup.act?task=list"/>'>�׷����</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image19','','<html:rewrite page="/images/system/sub_m_02_over.gif"/>',1)" onclick="javascript:showMenu(2)">
          <img name="Image19" border="0" src='<html:rewrite page="/images/system/sub_m_02.gif"/>' width="172" height="21" alt="�޴�/���� ����" /></a>

          	  <!--�޴�/���� ����-->
			  <div id="menu2" class="submenu2" style="display:none">
			  <ul>

				  <li><a href='<html:rewrite page="/sysMenu.act?task=list"/>'>�޴� ����</a></li>

				  <li><a href='<html:rewrite page="/sysMenu.act?task=group_menu"/>'>�׷캰 �޴�����</a></li>

				  <li><a href='<html:rewrite page="/sysMenu.act?task=user_menu"/>'>����ں� �޴�����</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image20','','<html:rewrite page="/images/system/sub_m_03_over.gif"/>',1)" onclick="javascript:showMenu(3)">
          <img name="Image20" border="0" src='<html:rewrite page="/images/system/sub_m_03.gif"/>' width="172" height="21" alt="������" /></a>

			  <!--������-->
			  <div id="menu3" class="submenu2" style="display:none">
			  <ul>

				  <li><a href="#">������ ��������</a></li>

				  <li><a href="#">������ ��ȸ</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image21','','<html:rewrite page="/images/system/sub_m_04_over.gif"/>',1)" onclick="javascript:showMenu(4)">
          <img name="Image21" border="0" src='<html:rewrite page="/images/system/sub_m_04.gif"/>' width="172" height="21" alt="�⺻�ڵ����" /></a>

				<!--�⺻�ڵ� ����-->
			  <div id="menu4" class="submenu2" style="display:none">
			  <ul>

				  <li><a href="#">�����ڵ� ����</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image22','','<html:rewrite page="/images/system/sub_m_05_over.gif"/>',1)" onclick="javascript:showMenu(5)">
          <img name="Image22" border="0" src='<html:rewrite page="/images/system/sub_m_05.gif"/>' width="172" height="21" alt="�ý��۷α�" /></a>

			<!--�޴�/���� ����-->
			  <div id="menu5" class="submenu2" style="display:none">
			  <ul>

				  <li><a href="#">�ý��۷α�</a></li>

			  </ul>
			  </div>
			  </li>
        </ul>
		</div>

<script>
		showMenu(<%=code%>);
</script>