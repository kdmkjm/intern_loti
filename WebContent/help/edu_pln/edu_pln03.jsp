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
<table width="630" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding: 0px 0px 30px 0px;" align="center"><img src='<html:rewrite page="/images/help/edu_pln03.gif"/>' alt="3. ��ȹ��"></td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
�� �˻������� ����, �з��� �����ϰų� �������� �Է��ؼ� <img src='<html:rewrite page="/images/board/btn_search.gif"/>' align="absmiddle"> ��ư�� Ŭ���Ѵ�.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
�� ������ �����Ϸ� �� ��, ������ ������ ��ü����/��ü���������� �ȴ�.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
�� <img src='<html:rewrite page="/images/board/btn_modify.gif"/>' align="absmiddle"> ��ư�� Ŭ���ϸ� �ش��ϴ� ������ �����ϴ� ȭ������ �̵��Ѵ�.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
�� <img src='<html:rewrite page="/images/board/btn_import2.gif"/>' align="absmiddle"> ��ư�� Ŭ���ϸ� ���� �������翡�� ����� �����͸� ��������, �ش�⵵�� �Էµ� �ڷ�� ��� �����ȴ�.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
�� <img src='<html:rewrite page="/images/board/btn_new_up.gif"/>' align="absmiddle"> ��ư�� Ŭ���ϸ� �����հ��� �ű� ��ϡ� ȭ������ �̵��Ѵ�.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
�� <img src='<html:rewrite page="/images/board/btn_new_cyberup.gif"/>' align="absmiddle"> ��ư�� Ŭ���ϸ� �����̹����� �ű� ��ϡ� ȭ������ �̵��Ѵ�.
		</td>
	</tr>
	<tr>
		<td style="padding: 5px 10px 5px 10px;">
�� <img src='<html:rewrite page="/images/board/btn_print_process.gif"/>' align="absmiddle"> ��ư�� Ŭ���ϸ� ȭ�鿡�� ������ �������� �μ��Ѵ�.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 5px 10px 5px 10px;">
�� <img src='<html:rewrite page="/images/board/btn_print2.gif"/>' align="absmiddle"> ��ư�� Ŭ���ϸ� ���õ� ������ ������ �����Ʒð�ȹ���� �μ��Ѵ�.
		</td>
	</tr>
	<tr valign="middle">
		<td style="padding: 0px 0px 20px 0px;">&nbsp;</td>
	</tr>
</table>
</body>
</html>
