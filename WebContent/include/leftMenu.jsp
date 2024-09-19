<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>교육계획 서브메뉴</title>
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>

<script type="text/javascript">
<!--
function showMenu(menuNo)
{
	var div = $('subMenu'+menuNo);
	div.style.display = "";
}
goMenuLink = function(url)
{
	var obj = parent.iframe_Main;
	obj.location.href  = '${pageContext.request.contextPath}'+url;
}

//서브메뉴 롤오버
var open_cnt = "";
function showMenu1(menuNo, type)
{
	var submenu_div; 
	var sub1_div = "sub1"+menuNo; 
	var sub2_div = "sub2"+menuNo;
	 
	//onload시 
	if(menuNo == "0"){
		var menuNo;
		<c:forEach var="menuList" items="${rsLeftMenuList}" varStatus="i" >
			if(${menuList.level} == "2" || '${menuList.menuType}' == "F"){
				menuNo = ${menuList.menuNo};
			}
			if(${menuList.parent} == menuNo){
				submenu_div = "subMenu"+menuNo+'${menuList.num}';
				document.getElementById(submenu_div).style.display = "none";
			}
		</c:forEach>
	
	//서브메뉴 클릭시
	}else{
		<c:forEach var="menuList" items="${rsLeftMenuList}" varStatus="i" >
		if(type == "open"){
			document.getElementById(sub1_div).style.display = "none";
			document.getElementById(sub2_div).style.display = "";
		}else{
			document.getElementById(sub1_div).style.display = "";
			document.getElementById(sub2_div).style.display = "none";
		}
		
		if(${menuList.parent} == menuNo){
			submenu_div = "subMenu"+menuNo+'${menuList.num}';		
			
			if(type == "open"){
				document.getElementById(submenu_div).style.display = "";
			
			}else{
				document.getElementById(submenu_div).style.display = "none";
			}
		}
		
		if(open_cnt == menuNo){
			if(open_cnt != "")
			{ 
				sub1_div = "sub1"+open_cnt; 
				sub2_div = "sub2"+open_cnt;
				
				if(type == "open"){
					document.getElementById(sub1_div).style.display = "none";
					document.getElementById(sub2_div).style.display = "";
				}else{
					document.getElementById(sub1_div).style.display = "";
					document.getElementById(sub2_div).style.display = "none";
				}
				
				if(${menuList.parent} == open_cnt){
					submenu_div = "subMenu"+open_cnt+'${menuList.num}';	
					
					if(type == "open"){
						document.getElementById(submenu_div).style.display = "";
					}else{
						document.getElementById(submenu_div).style.display = "none";
					}
				}
			}
		}else{
			if(open_cnt != "")
			{ 
				sub1_div = "sub1"+open_cnt; 
				sub2_div = "sub2"+open_cnt;
				
				document.getElementById(sub1_div).style.display = "";
				document.getElementById(sub2_div).style.display = "none";
				
				if(${menuList.parent} == open_cnt){
					submenu_div = "subMenu"+open_cnt+'${menuList.num}';	
					document.getElementById(submenu_div).style.display = "none";
				}
			}
		
		}
		</c:forEach>
		open_cnt = menuNo;
	}
}
//-->
</script>
</head>
<body onload="showMenu1('0','close');">
<table width="225px" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td width="20px" rowspan="2"></td>
    <td valign="top">
      <table width="180" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="158" border="0" cellspacing="0" cellpadding="0" align="center">
			<c:forEach var="menuList" items="${rsLeftMenuList}" varStatus="i" >
				<c:if test="${menuList.level == '1'}">
					<c:if test="${menuList.menuType == 'F'}">
						<tr>
					  		<td><img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPathSub}"/>' alt="${menuList.menuName}" /></td>
						</tr>
					</c:if>
				</c:if>
				<c:if test="${menuList.level == '2'}">
					<c:if test="${menuList.menuType == 'F'}">
						<tr style="display:block" id="sub1${menuList.menuNo}">
					  		<td><a href="#" onclick="showMenu1('${menuList.menuNo}','open')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image${menuList.num}','','<html:rewrite page="${menuList.iconPathOn}"/>',1)">
					  			<img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPath}"/>' width="200" height="30" alt="${menuList.menuName}"/></a></td>
					  </tr>
						<tr style="display:none" id="sub2${menuList.menuNo}">
					  		<td><a href="#" onclick="showMenu1('${menuList.menuNo}','close')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image${menuList.num}','','<html:rewrite page="${menuList.iconPathOn}"/>',1)">
					  			<img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPathOn}"/>' width="200" height="30" alt="${menuList.menuName}"/></a></td>
					  </tr>
				</c:if>
				<c:if test="${menuList.menuType == 'M'}">			
					<tr>
					  	<td><a href="#" onclick="goMenuLink('${menuList.execPath}');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image${menuList.num}','','<html:rewrite page="${menuList.iconPathOn}"/>',1)" >
					  		<img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPath}"/>' width="200" height="30" alt="${menuList.menuName}" /></a></td>
					</tr>
				</c:if>
				</c:if>
				<c:if test="${menuList.level == '3'}">
					<c:if test="${menuList.menuType == 'F'}">
						<tr><td class="leftBg3"></td> </tr>
						<tr><td><img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPath}"/>' width="192" height="23" alt="${menuList.menuName}" style="margin-left:5px;"/></td></tr>
						<tr><td class="leftBg3"></td></tr>
					</c:if>
					<c:if test="${menuList.menuType == 'M'}">
						<tr style="display:none" id="subMenu${menuList.parent}${menuList.num}">
						  	<td><a href="#" onclick="goMenuLink('${menuList.execPath}');"		onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image${menuList.num}','','<html:rewrite page="${menuList.iconPathOn}"/>',1)">
						  		<img name="Image${menuList.num}" border="0" src='<html:rewrite page="${menuList.iconPath}"/>' width="192" height="23" alt="${menuList.menuName}" style="margin-left:5px;"/></a></td>
						</tr>
					</c:if> 	
				</c:if>
			</c:forEach>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td></td>
<%-- <td valign="bottom" background='<html:rewrite page="/images/sub_m_bg.gif"/>'><img src='<html:rewrite page="/images/sub_m_bottom.gif"/>' width="180" height="10"></td> --%>
  </tr>
  <!--
  <tr>
    <td valign="bottom" background='<html:rewrite page="/images/sub_m_bg.gif"/>'><img src='<html:rewrite page="/images/edu/sub_m_bottom.gif"/>' width="180" height="201"></td>
  </tr>
  -->
</table>
</body>
</html>

