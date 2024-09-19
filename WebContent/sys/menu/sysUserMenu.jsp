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
<script type="text/javascript" src='<html:rewrite page="/common/js/checkTree.js"/>'></script>
<script language="JavaScript">
<!--
function insertMenu()
{
	if($('userName').value=='')
	{
		alert('����ڸ� �����ϼ���');
		return;
	}
	var f = ${'menu'};
	// üũ�ڽ��� üũ���θ� Ȯ���Ͽ� checkYn �� �ο�
	var i = 0;
	while(document.all.select[i])
	{
		if(document.all.select[i].checked)
		{

			document.all.isCheck[i].value='Y';

		}
		else
		{
			document.all.isCheck[i].value='N';
		}

		i++;
	}
	f.count.value = i;

	var url = '${pageContext.request.contextPath}/sysMenu.act';
     	var pars = Form.serialize($('menu'));

	new Ajax.Updater(
					 '',
                          url,
                           {
                             method: 'post',
                             parameters: pars,
                             evalScripts: true,
                             onFailure: reportError,
                             onComplete: saveComp

                             });
	//f.submit();
}

function selectMenu(juminNo, userName)
{

	if(!juminNo) return;
	var f = $('selMenu');

	f.action = 'sysMenu.act';
	f.task.value = 'user_menu_list';
	f.searchKeyword.valule =juminNo; 
	f.juminNo.value = juminNo;
	f.userName.value = userName;

	f.submit();

}

function searchUser()
{
		frm = document.forms[0];
		var str;
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "height=645,width=480,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top="+wint+",left="+winl;  
	  window.open('','searchUser', str);
		frm.action = "sysMenu.act"
		frm.task.value = "sel_user";	
		frm.target = "searchUser";
		frm.submit();		
		frm.target = "";
		
		/*
			window.open('${pageContext.request.contextPath}/sysMenu.act?task=sel_user','searchUser',
	  	'height=645,width=480,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no,top=300,left=700');
	 */
}

function saveComp(request)
{
	alert(request.status);
	alert('������ �Ϸ�Ǿ����ϴ�.');
}
function reportError(request)
{
	alert('���� �� ������ �߻��Ͽ����ϴ�. \\n�����ڿ��� �����ϼ���.');
}
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
					<td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/system/title_02-3.gif"/>' alt="����ں� �޴�����"/></td>
				</tr>
				<tr><td height="15"></td></tr>
				<tr>
					<td>
						<div class="main">
						<div class="mainText">
						<!---->
						<form name="selMenu" method="post" id="selMenu" onsubmit="return false">
			  		<input type="hidden" name="juminNo"/>
			  		<input type="hidden" name="task"/>
						<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
							<tr>
								<td class="t1 cbg4" width="75" class="s1" height="25">�����</td>
								<td class="sBg" width="1"></td>
								<td class="s2">
						  		<input type="text" name="searchKeyword" value="${userName}" onKeyDown="javascript:if(event.keyCode == 13){searchUser();}"/>
						  		<input type="hidden" name="userName" value="${userName}"/>
						  		<img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle" alt="����" onclick="searchUser();" style="cursor:hand"/>
						  	</td>
							</tr>
						</table>
						</form>
				    </div>
					 	</div>
	 			</td>
	 		</tr>
			<tr>
				<td>
					<!--->
					<!--�Խù� ��� ����-->
					<div class="main">
					<div class="mainText">
					<form name="menu" action="sysMenu.act?task=ins_user_menu" method="post">
					<input type="hidden" name="task" value="ins_user_menu"/>
					<input type="hidden" name="insJuminNo" value="${juminNo }" />
					<input type="hidden" name="count" />
					<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
						<tr>
							<td class="t1 cbg4" width="75" class="s1">����ں�<br>�޴�����</td>
							<td class="sBg" width="1"></td>
							<td class="s2">
								<fieldset>
								<div id="menuTree">
								<script type="text/javascript">
								
									var menuTree = new dTree('menuTree');
								
								
									<c:forEach var="menuList" items="${rsSysMenuList}" varStatus="i" >
										menuTree.add(
											${menuList.menuNo},
											${menuList.parent},
											'${menuList.menuName}',
											'${menuList.checkYn}',
											'${menuList.menuType}',
											'${menuList.menuNo}');
								
									</c:forEach>
								
									document.write(menuTree);
								</script>
								</div>
								</fieldset>
							</td>
						</tr>
					</table>
					<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
						<tr valign="bottom"> 
							<td align="right"><img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="����" onclick="insertMenu();" style="cursor:hand"/></td>
						</tr>
					</table>
					</form>
					</div></div>
   				<!--�Խù� ��� ��-->
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
	getCheck();
</script>
</body>
</html>
