<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<link rel="StyleSheet" href="/common/css/checktree.css" type="text/css" />
<script type="text/javascript" src='<html:rewrite page="/common/js/checkTree.js"/>'></script>
<script language="JavaScript">
<!--
function insertMenu()
{
	if($('selGroup').value=='0')
	{
		alert('그룹을 선택하세요');
		return;
	}
	
	var f = ${'menu'};
	// 체크박스의 체크여부를 확인하여 checkYn 값 부여
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
                             onComplete:saveComp,
                             onFailure: reportError

                             });

	f.submit();

}

reportError = function(request)
{
	alert('저장 중 오류가 발생하였습니다. \\n관리자에게 문의하세요.');
}

function saveComp(request)
{
	//alert(request.status);
	alert('저장이 완료되었습니다.');
	selectMenu();
}

function selectMenu()
{
	var groupNo = $('selGroup');
	if(groupNo=='0') return;
	var f = $('groupForm');
	f.action = "sysMenu.act";
	f.task.value = "group_menu_list";
	f.submit();
}

function selectGroup(selGroup)
{
	$('selGroup').value = selGroup;
}

//-->
</script>

<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">현재경로정보</h2>
	<h1><img alt="그룹별 메뉴권한" src="/images/system/title_02-2.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td>
		<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--테이블 헤더 시작-->
			<form name="groupForm" action="" method="post" id="groupForm">
			  <input type="hidden" name="groupNo"/>
			  <input type="hidden" name="task"/>
			  <table width="746" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td class="t1 cbg4" width="75" class="s1" height="25">그룹선택</td>
				<td class="sBg" width="1"></td>
				<td class="s2">
				  <select name="selGroup" onchange="selectMenu();" id="selGroup">
					<option value="0" >그룹을 선택하세요</option>
					<c:forEach var="groupList" items="${rsSysGroupList}" varStatus="i" >
					  <option value="${groupList.groupNo}"><c:out value="${groupList.groupName}"/></option>
					</c:forEach>
				  </select>
				</td>
			  </tr>
			  <tr>
				<td colspan="13" class="lbg3"></td>
			  </tr>
			  </table>
			</form>
			<!--게시물 목록 시작-->
			<div id="mainList" style="width:746px; z-index:0;"> 
			  <form name="menu" action="sysMenu.act?task=ins_group_menu" method="post" id="menu">
				<input type="hidden" name="task" value="ins_group_menu"/>
				<input type="hidden" name="insGroupNo" value="${selGroup}"/>
				<input type="hidden" name="count" />
				<table id="mainTable" width="746" border="0" cellspacing="0" cellpadding="0">
				<tr height="10">
				  <td class="t1 cbg4" width="75" class="s1">그룹별<br>메뉴권한</td>
				  <td class="sBg" width="1"></td>
				  <td class="s2">
					<div id="menuTree">
					  <script type="text/javascript">
						var menuTree = new dTree('menuTree');
						<c:forEach var="menuList" items="${rsSysMenuList}" varStatus="i" >
							menuTree.add(
								${menuList.menuNo},
								${menuList.parent},
								'${menuList.levels}',
								'${menuList.menuName}',
								'${menuList.checkYn}',
								'${menuList.menuType}',
								'${menuList.menuNo}');
						</c:forEach>
						document.write(menuTree);
					  </script>
					</div>
				  </td>
				</tr>
				</table>
			  </form>
			</div>
		  </td>
		</tr>
		</table>
		<!--게시물 목록 끝-->
		<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
		<tr valign="bottom"> 
		  <td align="right"><img src='<html:rewrite page="/images/board/btn_save.gif"/>' align="absmiddle" alt="저장" onclick="insertMenu();" style="cursor:hand"/></td>
		</tr>
		</table>
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<script type="text/javascript">
	getCheck();
	selectGroup(${selGroup});
	tresize(210);
</script>
