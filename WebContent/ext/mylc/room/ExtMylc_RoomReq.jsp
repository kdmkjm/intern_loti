<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style type="text/css">
*{margin:0; padding:0;}
body, input, textarea, select, button{color:#5E5E5E; font-family: dotum,"����",NanumGothic; font-size: 12px; letter-spacing: 0px; line-height: 120%; margin:10px 10px;}
img{border:0;}
li, dd {list-style: none outside none;}
h2 {background: url(/images/resources/hIconBg.png) no-repeat scroll left 8px transparent; color: #00639A; font-size: 14px; padding: 10px 0 10px 20px; margin-top:20px; font-weight:bold;}
h3 {background: url(/images/resources/hIconBg.png) no-repeat scroll 0 -51px transparent; color: #0C88A1; font-size: 13px; line-height: 140%; margin: 0 0 0 8px; padding: 0 0 5px 18px; font-weight:bold;}
h4 {background: url(/images/resources/hIconBg.png) no-repeat scroll 8px -99px transparent; color: #666666; font-size: 12px; line-height: 140%; margin:5px 0 10px 25px; padding: 0 0 5px 20px; font-weight:bold;}
.ico001h5 li {background: url(/images/resources/liImg.gif) no-repeat scroll 0 3px transparent; line-height: 17px; margin-left: 20px; padding-left: 15px;}
ul.con_tab{border: 1px solid #B2CFE1; height: 15px; padding: 10px; width: 688px;}
ul.con_tab li {background: url(/images/resources/icodot.gif) no-repeat scroll left 5px transparent; float: left; height: 20px; padding: 0 15px 0 8px;}
a:link{color:#666; text-decoration:none;}
a:hover{color:#0030AE; text-decoration:underline;}
.top_mar10 {margin-top: 10px;}
</style>
<script language="JavaScript">
	<!--
	window.onresize = function(){
	//   ������ ������ ���� ���� �ڵ�
		tresize(185);
	}
	
	function viewintro(id){
		for(var i=1; i<9; i++){
			document.getElementById('ta0'+i).style.display = "none";
		}
		document.getElementById('ta0'+id).style.display="block";
	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="�ü���Ȳ" src="/images/resources/title_13.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td height="38" width="550" valign="bottom">
		<ul class="con_tab">
	<li><a href="#" onclick="viewintro(1);return false;">������������ </a></li>
	<li><a href="#" onclick="viewintro(2);return false;">���α�����</a></li>
    <li><a href="#" onclick="viewintro(3);return false;">��Ȱ��</a></li>
    <li><a href="#" onclick="viewintro(4);return false;">���</a></li>
    <li><a href="#" onclick="viewintro(5);return false;">������</a></li>
    <li><a href="#" onclick="viewintro(6);return false;">�Ĵ�</a></li>
    <li><a href="#" onclick="viewintro(7);return false;">�ǹ���</a></li>
    <li><a href="#" onclick="viewintro(8);return false;">������</a></li>
</ul>


<div id="ta01">
<h2 class="top_mar20">������������</h2>
<h3 class="top_mar10">�밭��</h3>
<ul class="ico001h5">
	<li>���� : 1�� �����( 200�� )</li>
</ul>
<p class="center top_mar10"><img alt="�밭�� " src="/images/resources/photo01.gif"></p>
<h3 class="top_mar10">���ǽ�</h3>
<ul class="ico001h5">
	<li>�� 2���ǽ� : 80��90��, -�� 3���ǽ� : 40��50��, -�� 4���ǽ� : 40��50��,</li>
	<li>�� 5���ǽ� : 40��50��, -�� 6���ǽ� : 30��, -�� 7���ǽ� : 50��</li>
</ul>
<p class="center top_mar10"><img alt="���ǽ�" src="/images/resources/photo02.gif"></p>
<h3 class="top_mar10">����ȭ������</h3> 
<ul class="ico001h5">
	<li>�� 1,2 ���걳���� (��50��) </li>
</ul>
<p class="center top_mar10"><img alt="����ȭ������" src="/images/resources/photo03.gif"></p>

</div>

<div id="ta02" style="display:none;">
<h2 class="top_mar20">���α�����</h2>
<h3 class="top_mar10">�밭��</h3>
<ul class="ico001h5">
	<li>���� : 1�� �����(210��)</li>
</ul>
<p class="center top_mar10"><img alt="�밭��" src="/images/resources/photo04.gif"></p>
<h3 class="top_mar10">���ǽ�</h3>
<ul class="ico001h5">
	<li>�� 1���ǽ� : 80��, -�� 2���ǽ� : 40��</li>
</ul>
<p class="center top_mar10"><img alt="���ǽ�" src="/images/resources/photo05.gif"></p>
</div>
<div id="ta03" style="display:none;">
<h2 class="top_mar20">��Ȱ��</h2>
<h3 class="top_mar10">��������Ȱ��</h3>
<ul class="ico001h5">
	<li>�Ը� : 100�� 200�� ���� (3��)</li>
	<li>�Ǳ��� : 2�� 1��, �̱�ħ�� 2��, �ó��� �� �¼�</li>
	<li>�δ�ü� : �ްԽ�, ��Ź��, ���̹�Ž���(PC��), ü�´ܷý�</li>
</ul>
<h4>���� </h4>
<p class="center top_mar10"><img alt="����" src="/images/resources/photo06.gif"></p>
<h4>���̹� Ž���</h4>
<p class="center top_mar10"><img alt="���̹� Ž���" src="/images/resources/photo07.gif"></p>
<h4>ü�´ܷý� </h4>
<p class="center top_mar10"><img alt="ü�´ܷý� " src="/images/resources/photo08.gif"></p>
<h3 class="top_mar10">���λ�Ȱ��</h3>
<ul class="ico001h5">
	<li>�Ը� : 25�� 100�� ���� (3��)</li>
	<li>�Ǳ��� : 4�� 1��, �̱�ħ�� 4��, �ó��� �� �¼� </li>
	<li>�δ�ü� : �ްԽ�, Ź����, ���̹�Ž���(PC��)��</li>
</ul>
<h4>���� </h4>
<p class="center top_mar10"><img alt="���� " src="/images/resources/photo09.gif"></p>
</div>
<div id="ta04" style="display:none;">
<h2 class="top_mar20">���</h2>
<ul class="ico001h5">
	<li>�Ը� : 5.115�� (1,547 ��) / ���� �԰ݿ���� �ƴ�(�뵵 : �౸ �� ������)</li>
</ul>
<p class="center top_mar10"><img alt="��� " src="/images/resources/photo10.gif"></p>
</div>
<div id="ta05" style="display:none;">
<h2 class="top_mar20">������</h2>
<ul class="ico001h5">
		<li>��Ȱ�� ����</li>
	</ul>
<p class="center top_mar10"><img alt="������ " src="/images/resources/photo11.gif"></p>
</div>
<div id="ta06" style="display:none;">
<h2 class="top_mar20">�Ĵ�</h2>
<ul class="ico001h5">
		<li>�Ը� : 795.6 �� / ���� : 200��</li>
	</ul>
<p class="center top_mar10"><img alt="�Ĵ� " src="/images/resources/photo12.gif"></p>
</div>
<div id="ta07" style="display:none;">
<h2 class="top_mar20">�ǹ���</h2>
<ul class="ico001h5">
			<li>��ġ : ������ ������ 1��</li>
			<li>�Ը� : ���� 2�� </li>
			<li>��ǰ : 40�� ǰ��</li>
			<li>��ȣ�� ����  </li>
	</ul>
<p class="center top_mar10"><img alt="�ǹ��� " src="/images/resources/photo13.gif"></p>
</div>
<div id="ta08" style="display:none;">
<h2 class="top_mar20">������ (����, 3�� ����)</h2>
<ul class="ico001h5">
				<li>�����弭 : 17,600�� ����(�Ϲݵ���, �����Ʒ��ڷ�, ��, ���Ⱓ�๰ ��) </li>
				<li>�̿��� : ���Ѿ���(�ź��� ����) </li>
		</ul>
<h2 class="top_mar20">�̿�ȳ�</h2>
<ul class="ico001h5">
			<li>������(11������) �̿�ð� 09:00 ~17:00</li>
			<li>������(4������) �̿�ð� 09:00 ~18:00 </li>
			<li>���� : 1��1ȸ 3��, ����Ⱓ : 7�� </li>
			<li>�����ڷ� : ��, ���Ⱓ�๰(����, ���簡��) </li>
	</ul>
<p class="center top_mar10"><img alt="������ " src="/images/resources/photo14.gif"></p>
</div>
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>
<%-- 
<table width="790" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td>
	<div class="ccGroup">
	<h2 class="hide">����������</h2>
	<h1><img alt="������ �뿩��û" src="/images/resources/title_09-3.gif" /></h1>
	</div>
  </td>
</tr>
<tr>
  <td>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="550" valign="bottom">
		<table width="308" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr> 
		  <td width="103">
			<img name="Image10" border="0" src='<html:rewrite page="/images/resources/tab_01.gif"/>' alt="������ �뿩�ȳ�" 
				onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=lentInfo"/>'"  
				onMouseOut="MM_swapImgRestore()" 
				onMouseOver="MM_swapImage('Image10','','<html:rewrite page="/images/resources/tab_01_over.gif"/>',1)" style="cursor:hand"/>
		  </td>
		  <td width="103">
			<img name="Image11" border="0" src='<html:rewrite page="/images/resources/tab_02.gif"/>' alt="�뿩��Ȳ"
				onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=month"/>'"  
				onMouseOut="MM_swapImgRestore()" 
				onMouseOver="MM_swapImage('Image11','','<html:rewrite page="/images/resources/tab_02_over.gif"/>',1)" style="cursor:hand"/>
		  </td>
		  <td width="102">
			<img name="Image12" border="0" src='<html:rewrite page="/images/resources/tab_03_over.gif"/>' alt="�뿩��û" 
				onClick="location.href='<html:rewrite page="/extMylcRoom.act?task=list"/>'"  
				onMouseOut="MM_swapImgRestore()" 
				onMouseOver="MM_swapImage('Image12','','<html:rewrite page="/images/resources/tab_03_over.gif"/>',1)" style="cursor:hand"/>
		  </td>
		</tr>
        </table>
	  </td>
	  <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>' width="200"></td>
	</tr>
	<tr>
	  <td colspan="2" height="10"></td>
	</tr>
	<tr>
	  <td colspan="2" >
		<!--	��� �˻� ���̺� ����	-->
		<html:form method="POST" action="extMylcRoom.act?task=list">
		  <table width="750" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #D6D6D6">
		  <tr>
			<td class="s1" width="104">���ǽ�</td>
			<td class="sBg" width="1"></td>
            <td class="s2"> 
              <html:select property="searchKeyword" style="width:100px" onchange="document.forms[0].submit();">
				<html:optionsCollection name="roomNoCode" property="beanCollection" />
			  </html:select>
			</td>
		  </tr>
		  </table>
		</html:form>
		<!--	��� �˻� ���̺� ��	-->
		<table>
		<tr>
		  <td height="10"></td>
		</tr>
		</table>
		<table width="750" border="0" cellspacing="0" cellpadding="0" style="border:2px solid #50a1f0">
		<tr>
		  <td>
			<!--	���̺� ��� ����	-->
			<table width="746" border="0" cellspacing="0" cellpadding="0" class="cbg">
			<tr> 
			  <td class="t1" width="59">���ǽ�</td>
			  <td class="sBg"></td>
			  <td class="t1" width="79">�뿩����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="79">�뿩����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="79">�뿩��</td>
			  <td class="sBg"></td>
			  <td class="t1" width="115">����ó</td>
			  <td class="sBg"></td>
			  <td class="t1">�뿩����</td>
			  <td class="sBg"></td>
			  <td class="t1" width="110">�뿩����</td>
			  <td width="17"></td>
			</tr>
			</table>
	        <!--	���̺� ��� ��	-->
	        <!--	��� ����		-->
			<html:form method="POST" action="extMylcRoom.act?task=list">
			  <div id="mainList" style="width:746px; z-index:1; overflow-y:scroll ;overflow-x:hidden">
				<c:set var="no" scope="request" value="1"/>
				<table id="mainTable" width="729" border="0" cellspacing="0" cellpadding="0">
				<c:forEach var="list" items="${rsExtMylc_RoomReqList}" varStatus="i" >
				  <!-- �� ������ ó�� -->
				  <c:if test="${no%2 == 0}"><c:set var="lineBg" scope="request" value="tbg3"/></c:if>
				  <c:if test="${no%2 == 1}"><c:set var="lineBg" scope="request" value=""/></c:if>
				  <!-- �뿩���� ���ڻ��� ó�� -->
				  <c:set var="fontColor" scope="request" value="lend2"/>
				  <c:if test="${list.status == '����'}"><c:set var="fontColor" scope="request" value="lend1"/></c:if>
				  <tr class="${lineBg}"> 
					<td class="t2" width="59"><c:out value="${list.roomNo}"/></td>
					<td class="sBg"></td>
					<td class="t2" width="79"><c:out value="${list.lendFrom}"/></td>
					<td class="sBg"></td>
					<td class="t2" width="79"><c:out value="${list.lendTo}"/></td>
					<td class="sBg"></td>
					<td class="t2" width="79">
					  <a href="extMylcRoom.act?task=info&lendSeq=${list.lendSeq}">
						<u><c:out value="${list.reqName}"/></u>
					  </a>
					</td>
					<td class="sBg"></td>
					<td class="t2" width="115"><c:out value="${list.reqPhone}"/></td>
					<td class="sBg"></td>
					<td class="t3">
					  <c:if test="${fn:length(list.lendWhy) > 15}">&nbsp;<span title="${list.lendWhy}"><c:out value="${fn:substring(list.lendWhy, 0, 15)}��"/></span></c:if>
					  <c:if test="${fn:length(list.lendWhy) < 15}">&nbsp;<c:out value="${list.lendWhy}"/></c:if>
					</td>
					<td class="sBg"></td>
					<td class="t2" width="110"><span class="${fontColor}"><c:out value="${list.status}"/></span></td>
				  </tr>
				  <tr>
					<td colspan="13" class="lbg3"></td>
				  </tr>
				  <c:set var="no" scope="request" value="${no + 1}"/>
				</c:forEach>
				<c:if test="${no==1}">
				  <tr class="tbg3" height="21">
					<td class="t2" colspan="13">��ȸ�� �����Ͱ� �����ϴ�.</td>
				  </tr>
				</c:if>
				</table>
			  </div>
			</html:form>
			<!--	��� ��		-->
		  </td>
		</tr>
		</table>
		<!--	�Խù� �Ʒ� ��ư ����	-->
		<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
		<tr valign="bottom">
		  <td align="right">
			<img src='<html:rewrite page="/images/board/btn_up2.gif"/>' align="absmiddle" style="cursor:hand" alt="�űԵ��" onclick="location.href='<html:rewrite page="/extMylcRoom.act?task=create"/>'" /> 
		  </td>
		</tr>
		</table>
		<!--�Խù� �Ʒ� ��ư ��-->
	  </td>
	</tr>
	</table>
  </td>
</tr>
</table>

<script type="text/javascript">
<!--
	tresize(220);
//-->
</script>
--%>