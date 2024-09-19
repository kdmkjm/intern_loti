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
		<h3 class="skip"> 서브메뉴 </h3>

        <ul>
          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image18','','<html:rewrite page="/images/system/sub_m_01_over.gif"/>',1)" onclick="javascript:showMenu(1)">
          <img name="Image18" border="0" src='<html:rewrite page="/images/system/sub_m_01.gif"/>' width="172" height="21" alt="사용자/그룹관리" /></a>

          <!--사용자 그룹관리-->
			  <div id="menu1" class="submenu2" style="display:none">
			  <ul>

				  <li><a href='<html:rewrite page="/sysUser.act?task=list"/>'>사용자관리</a></li>

				  <li><a href='<html:rewrite page="/sysGroup.act?task=list"/>'>그룹관리</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image19','','<html:rewrite page="/images/system/sub_m_02_over.gif"/>',1)" onclick="javascript:showMenu(2)">
          <img name="Image19" border="0" src='<html:rewrite page="/images/system/sub_m_02.gif"/>' width="172" height="21" alt="메뉴/권한 관리" /></a>

          	  <!--메뉴/권한 관리-->
			  <div id="menu2" class="submenu2" style="display:none">
			  <ul>

				  <li><a href='<html:rewrite page="/sysMenu.act?task=list"/>'>메뉴 관리</a></li>

				  <li><a href='<html:rewrite page="/sysMenu.act?task=group_menu"/>'>그룹별 메뉴관리</a></li>

				  <li><a href='<html:rewrite page="/sysMenu.act?task=user_menu"/>'>사용자별 메뉴관리</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image20','','<html:rewrite page="/images/system/sub_m_03_over.gif"/>',1)" onclick="javascript:showMenu(3)">
          <img name="Image20" border="0" src='<html:rewrite page="/images/system/sub_m_03.gif"/>' width="172" height="21" alt="조직도" /></a>

			  <!--조직도-->
			  <div id="menu3" class="submenu2" style="display:none">
			  <ul>

				  <li><a href="#">조직도 가져오기</a></li>

				  <li><a href="#">조직도 조회</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image21','','<html:rewrite page="/images/system/sub_m_04_over.gif"/>',1)" onclick="javascript:showMenu(4)">
          <img name="Image21" border="0" src='<html:rewrite page="/images/system/sub_m_04.gif"/>' width="172" height="21" alt="기본코드관리" /></a>

				<!--기본코드 관리-->
			  <div id="menu4" class="submenu2" style="display:none">
			  <ul>

				  <li><a href="#">내부코드 관리</a></li>

			  </ul>
			  </div>
			  </li>

          <li><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image22','','<html:rewrite page="/images/system/sub_m_05_over.gif"/>',1)" onclick="javascript:showMenu(5)">
          <img name="Image22" border="0" src='<html:rewrite page="/images/system/sub_m_05.gif"/>' width="172" height="21" alt="시스템로그" /></a>

			<!--메뉴/권한 관리-->
			  <div id="menu5" class="submenu2" style="display:none">
			  <ul>

				  <li><a href="#">시스템로그</a></li>

			  </ul>
			  </div>
			  </li>
        </ul>
		</div>

<script>
		showMenu(<%=code%>);
</script>