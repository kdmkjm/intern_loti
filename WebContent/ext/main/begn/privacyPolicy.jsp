<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� ó����ħ</title>
<style type="text/css">
*{margin:0; padding:0;}
body, input, textarea, select, button{color:#5E5E5E; font-family: dotum,"����",NanumGothic; font-size: 12px; letter-spacing: 0px; line-height: 120%; margin:10px 10px;}
img{border:0;}
li, dd {list-style: none outside none;}
#contenttabmenu {background: url(/images/tabListLine.gif) repeat-x scroll 0 29px transparent; padding: 0 0 15px;}
#contenttabmenu ul {}
#contenttabmenu ul:after {clear: both; content: ""; display: block;}
#contenttabmenu li {background: url(/images/tabListBg.gif) no-repeat scroll 0 bottom transparent; color: #888787; float: left;}
#contenttabmenu a {background: url(/images/tabListBg.gif) no-repeat scroll right bottom transparent; color: #767676; display: inline-block; height: 35px; padding: 0 11px; text-align: center; text-decoration: none;}
#contenttabmenu a:visited {color: #767676;}
#contenttabmenu a:hover, #contenttabmenu a:active, #contenttabmenu a:focus {color: #454545;}
#contenttabmenu a span {display: block; padding: 8px 0 0;}
#contenttabmenu li.on {background-position: 0 0;}
#contenttabmenu li.on a {background-position: right 0; color: #FFFFFF; font-weight: bold; letter-spacing: -1px;}
#contenttabmenu li.on a:hover, #contenttabmenu li.on a:active, #contenttabmenu li.on a:visited, #contenttabmenu li.on a:focus {color: #FFFFFF;}
#contenttabmenu li.on a span {background: url(/images/tabListOn.gif) no-repeat scroll 50% 21px transparent; display: block; padding: 5px 0 12px;}
.info {line-height:18px; width:720px;}
.info div {background: url(/images/info_titlebg.gif) no-repeat scroll 0 0 transparent; height: 35px; padding: 13px 0 0 33px;}
.info div img{margin-top:10px; margin-left:-15px;}
.info p.ttbox {background: url(/images/info_box.gif) no-repeat scroll 0 bottom transparent; height: 304px; padding: 10px 20px;}
h2 {background: url(/images/hIconBg.png) no-repeat scroll left 10px transparent; color: #00639A; font-size: 14px; padding: 10px 0 10px 20px;}
h3 {background: url(/images/hIconBg.png) no-repeat scroll 0 -51px transparent; color: #0C88A1; font-size: 13px; line-height: 140%; margin: 0 0 0 8px; padding: 0 0 5px 18px;}
h4 {background: url(/images/hIconBg.png) no-repeat scroll 8px -98px transparent; color: #666666; font-size: 12px; line-height: 140%; margin: 0 0 0 15px; padding: 0 0 5px 20px;}
.ico001h3 ul {list-style: none outside none; margin: 3px 0 0; padding: 0 15px;}
.ico001h3 li {color:#6C7A8A; background: url(/images/liImg.gif) no-repeat scroll 25px 3px transparent; line-height: 140%; padding: 0 0 0 40px;}
.ico002 li {background: url(/images/ico_ul.gif) no-repeat scroll 0 2px transparent; color: #409F00; font-weight: bold; line-height: 17px; margin-left: 40px; padding-left: 17px;}
.ico002 li ul li {background: url(/images/ico_li02.gif) no-repeat scroll 0 5px transparent; clear: both; color: #6A6A6A; font-weight: normal; line-height: 17px; margin-left: auto; padding-bottom: 3px; padding-left: 7px;}
.ico002 li ul .ico002No {background: none repeat scroll 0 0 transparent; color: #638684; padding-left: 0;}
caption {font-size: 0; height: 1px; line-height: 0; overflow: hidden; position: absolute; visibility: hidden; width: 1px;}
#info1 table {-moz-border-bottom-colors: none; -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none; background: none repeat scroll 0 0 transparent; border-color: #1F7CE9 -moz-use-text-color -moz-use-text-color; border-image: none; border-right: 0 none; border-style: solid none none; border-width: 3px 0 0; margin-bottom: 10px; width: 100%;}
#info1 table th {background: none repeat scroll 0 0 transparent; border-left: 1px solid #E8E8E5; color: #1F7CE9; font-family: NanumGothicExtraBold; line-height: 130%; padding: 0; text-align: center;}
 table td {background: none repeat scroll 0 0 transparent; border-bottom: 1px solid #E8E8E5; border-left: 1px solid #E8E8E5; color: #555555; letter-spacing: 0; line-height: 130%; padding: 7px; text-align: left;}
#info1 table th.first {background: none repeat scroll 0 0 transparent; border-left: medium none;}
#info1 table tbody th.first {border-bottom: 1px solid #E8E8E5;}
#info2 table {-moz-border-bottom-colors: none; -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none; background: none repeat scroll 0 0 transparent; border-color: #1F7CE9 -moz-use-text-color -moz-use-text-color; border-image: none; border-right: 0 none; border-style: solid none none; border-width: 3px 0 0; margin-bottom: 10px; width: 100%;}
#info2 table th {background: none repeat scroll 0 0 transparent; border-left: 1px solid #E8E8E5; color: #1F7CE9; font-family: NanumGothicExtraBold; line-height: 130%; padding: 0; text-align: center;}
 table td {background: none repeat scroll 0 0 transparent; border-bottom: 1px solid #E8E8E5; border-left: 1px solid #E8E8E5; color: #555555; letter-spacing: 0; line-height: 130%; padding: 7px; text-align: left;}
#info2 table th.first {background: none repeat scroll 0 0 transparent; border-left: medium none;}
#info2 table tbody th.first {border-bottom: 1px solid #E8E8E5;}
#info3 table {-moz-border-bottom-colors: none; -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none; background: none repeat scroll 0 0 transparent; border-color: #1F7CE9 -moz-use-text-color -moz-use-text-color; border-image: none; border-right: 0 none; border-style: solid none none; border-width: 3px 0 0; margin-bottom: 10px; width: 100%;}
#info3 table th {background: none repeat scroll 0 0 transparent; border-left: 1px solid #E8E8E5; color: #1F7CE9; font-family: NanumGothicExtraBold; line-height: 130%; padding: 0; text-align: center; border-bottom:1px solid #E8E8E5; padding:10px 0;}
#info3 table td {background: none repeat scroll 0 0 transparent; border-bottom: 1px solid #E8E8E5; border-left: 1px solid #E8E8E5; color: #555555; letter-spacing: 0; line-height: 130%; padding: 7px; text-align: left;}
#info3 table td.first {background: none repeat scroll 0 0 transparent; border-left: medium none;}
#info3 table th.first {background: none repeat scroll 0 0 transparent; border-left: medium none; border-bottom:1px solid #E8E8E5;}
#info3 table tbody th.first {border-bottom: 1px solid #E8E8E5;}
.top_mar5 {margin-top: 5px;}
.top_mar10 {margin-top: 10px;}
.top_mar15 {margin-top: 15px;}
.top_mar20 {margin-top: 20px;}
.top_mar25 {margin-top: 25px;}
.top_mar30 {margin-top: 30px;}
.btm_mar5 {margin-bottom: 5px;}
.btm_mar10 {margin-bottom: 10px;}
.btm_mar15 {margin-bottom: 15px;}
.btm_mar20 {margin-bottom: 20px;}
.btm_mar25 {margin-bottom: 25px;}
.btm_mar30 {margin-bottom: 30px;}
.left_mar10 {margin-left: 10px;}
.left_mar15 {margin-left: 15px;}
.left_mar20 {margin-left: 20px;}
.left_mar30 {margin-left: 30px;}
.left_mar40 {margin-left: 40px;}
.left_mar65 {margin-left: 65px;}
.left_mar70 {margin-left: 70px;}
.left_mar105 {margin-left: 105px;}
.color_blue {color: #0553AA;}
.color_skyblue {color: #009AD0;}
.color_orang {color: #FF6C00;}
.color_green {color: #5B9106;}
.color_white {color: #FFFFFF;}
.color_Bgreen {color: #0B7C75;}
.bold {font-weight: bold;}
.left {text-align: left;}
.center {text-align: center;}
.right {text-align: right;}
</style>
<script src="/common/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#info'+"${num}").show();
		
		$('#contenttabmenu ul li').attr('class','').eq(parseInt("${num}")-1).attr('class', 'on');
	});
</script>
</head>
<body>
<div id="contenttabmenu">
				<ul>
						<li class="on"><a href="/extMainBegin.act?task=privacyPolicy&num=1"><span>Ȩ������ �̿����� ����������ȣ</span></a></li>
						<li><a href="/extMainBegin.act?task=privacyPolicy&num=2"><span>��ǻ�Ϳ� ���� ó���Ǵ� ����������ȣ</span></a></li>
						<li><a href="/extMainBegin.act?task=privacyPolicy&num=3"><span>��������ó����� ��ġ &#183; �</span></a></li>
					
				</ul>
		</div>
  <div class="top_mar20 info" id="info1" style="display:none;">
		<div><img alt="��û�ϵ���ġ������ ��������ó����ħ" src="/images/info_title.gif"></div>
				<p class="ttbox">
				��û�ϵ���ġ���������� ����ϴ� ��� ���������� ���ù��ɿ� �ٰ��ϰų� ������ü�� ���ǿ� ���Ͽ� ���������� �� ó���ǰ� �ֽ��ϴ�.<br>
				������������ȣ������ �̷��� ���������� ��޿� ���� �Ϲ��� �Թ��� �����ϰ� ������, ��û�ϵ���ġ�������� �̷��� ������ ������ ���� ���������� �� ó���ϴ� ���������� ���������� ������ ����� ������ ������ ��ȣ�ϱ� ���� �����ϰ� �����ϰ� ����� ���Դϴ�.<br><br>
				����, ��û�ϵ���ġ�������� ����������ȣ�� �� ���ù��ɻ��� ����������ȣ ������ �ؼ��ϸ�, ��������ó����ħ�� �Ʒ��� �����ϴ�.
				�� ��������ó����ħ�� �����Ϸκ��� ����Ǹ�, ���� �� ��ħ�� ���� ���泻���� �߰�, ���� �� ������ �ִ� ��쿡�� �������<strong class="color_Bgreen"> ���� 7�� ������ ���������� ���Ͽ� ����</strong>�� ���Դϴ�.<br><br>��û�ϵ���ġ�������� ����������ȣ��ħ��Ȩ���������� �̿��� �������� ���������� ��ȣ�ϱ� ����<strong class="color_Bgreen"> ��Ȩ������ �̿����� ����������ȣ��</strong>�� �������� ������ �����ϴµ� �ʿ��� ���������ý��� �������� ��ȣ�� ���� <strong class="color_blue">����ǻ�Ϳ� ���� ó���Ǵ� ����������ȣ��</strong>, ����� �� ������ �������� ��ġ����ϴ�<strong class="color_blue">��CCTV�� ���� ó���Ǵ� ����������ȣ��</strong>�� �� ������ �����Ǿ� ������, �̴� ���ࡺ����������ȣ������
			������������ȣ�� ����ɡ��� �ٰŸ� �ΰ� �ֽ��ϴ�.<br><br>
			<strong>��û�ϵ���ġ�������� ������ ������ ���� �� ��û�ϵ��� ��������ó����ħ�� �ؼ��մϴ�.</strong> </p>

		<h2 class="top_mar10">Ȩ������ �̿����� ����������ȣ</h4>
		<h3 class="top_mar10">Ȩ������ ȸ������ </h3>
		     <p class="left_mar20">���������� ������ ������ ���� ó���մϴ�. <br>ó���� ���������� ���� �����̿��� �뵵�δ� ������ ������ �̿� ������ ����� �ÿ��� ���� ���Ǹ� ���� �����Դϴ�.</p>
		<h4 class="top_mar10">Ȩ������ ȸ������</h4>
	      	<p class="left_mar40 top_mar5">ȸ������ �� ȸ���� ���� �̿� �� ������ ���� Ȯ������ ���� ����Ȯ��, ���� �ĺ�, �����̿� ����, ���ΰ� ������, 
	�����ǻ� Ȯ��, ��14�� �̸� �Ƶ� �������� ���� �� �����븮�� ���ǿ��� Ȯ��, ���� ���� �븮�� ����Ȯ��, ���� ������ ���� 
	��Ϻ���, �Ҹ�ó�� �� �ο�ó��, �������� ���� ���� �������� ó���մϴ�.</p>    
		<h3 class="top_mar10">���������� �����ٰ� �� �����Ⱓ, ������ ������</h3>
		 <p class="left_mar20">���������� �����ٰ� �� �����Ⱓ�� �Ʒ��� ���� ó���Ǹ� ȸ������ �� ���ǿ� ���� �����ǰ� ȸ�� Ż��� ��� �����Ǹ� 
	Ȩ������ � �̿ܿ��� ����� �����˴ϴ�.</p>
		<ul class="ico001h3 top_mar5">
			<li>�����ٰ� : ������Ÿ� �̿����� �� ������ȣ � ���ѹ��� ��22��</li>
			<li>�����Ⱓ : Ż�� �ǻ� �� ��� ����</li>
			<li>�����ϴ� ���������� ����/�ּ�/��ȭ��ȣ/e-mail/�޴�����ȣ</li>
		</ul>

		<h3 class="top_mar10">���������� ��3�� ������ ���� ����(�ش�Ǵ� ��쿡�� ����)</h3>
		<p class="left_mar20 ">��û�ϵ������� ���������� ��3�ڿ��� ������ ��� �������� �� ������ ������ �����ϴ�</p>
		<ul class="ico001h3  top_mar5">
			<li>�����޴� ���(��)/�����ٰŹ׸���/�����ϴ� ���������� �׸�/  �����޴� ���� �������� ���� �� �̿� �Ⱓ</li>
		</ul>

		<h3 class="top_mar20">��������ó���� ��Ź�� ���� ����</h3>
		<p class="left_mar20 ">��û�ϵ���ġ������ Ȩ�������� ������ ��� ���Ͽ� �Ʒ��� ���� �������� ����� ü���Ͽ� ��ϰ� ������ ���� �������ؼ��� ���Դϴ�.</p>
		<h4>�������� ����� ��Ȳ</h4>
			 <ul class="ico001h3 top_mar5">
				<li>����ڸ� : �ֽ�ȸ�� ������</li>
				<li>��    �� : ��� û�ֽ� ��籸 ���� 314(������) û�ֹ�ȭ�������</li>
				<li>��ȭ��ȣ : 043-294-6643</li>
				<li>�ٹ��ð� : 09:00 ~ 18:00</li>
			</ul>
		 <p class="left_mar10  top_mar10">��Ź��� �� ����������ȣ ���� ������ �ؼ�, ���������� ���� ��3�� ���� ���� �� å�Ӻδ� ���� ��Ȯ�� �����ϰ�, ���� ��೻���� ���� �� ���� �����ϰ� ������, ��ü ����� �������� �� ��������ó�� ��ħ�� ���� �����ϰڽ��ϴ�.</p>

		<h3 class="top_mar20">������ü�� �Ǹ� �� �ǹ� �� �� ��翡 ���� ����</h3>
		<p class="left_mar20 ">Ȩ������ �̿��ڴ� ����������ü�μ� ������ ���� �Ǹ��� ����� �� �ֽ��ϴ�.</p>
			<ul class="ico001h3 top_mar5">
				<li>�ڽ� �� 14�� �̸� �Ƶ��� ���������� ��ȸ, ���� �� ���� ������ ��û</li>
				<li>���������� ������ ���� ���� �� ������ ��û</li>
				<li>���������� ��ȸ, ���� �� ����, ���� ���� ��û�� �������� ����/ȸ���������� �� ��������/ȸ��Ż��/����öȸ ����Ŭ���Ͽ� ���� Ȯ�� ������ ��ġ�� �� ���� ����, ����, Ȥ�� Ż�� �����մϴ�.</li>
				<li>�̿��ڰ� ���������� ������ ���� ���� �� ������ ��û�� ��쿡�� ���� �� ������ �Ϸ��� �� ���� ���� ���������� �̿� �Ǵ� �������� �ʽ��ϴ�. �� ���, �߸��� ���������� �̿� �Ǵ� ������ ��� ��ü ���� �����ϰڽ��ϴ�.</li>
				 <li>�̿����� ��û�� ���� ���� �Ǵ� �����Ǵ� ���������� ���������� ó�� �� ���� �Ⱓ�� ���� ó���մϴ�.</li>
			</ul>
	   <h3 class="top_mar20">ó���ϴ� �������� �׸�</h3>
		<p class="left_mar20 ">��û�ϵ���ġ�������� ��ϴ� Ȩ�������� ����������ȣ�� ��29���� ���� ������ ���� ������ Ȯ���� �ʿ��� �����/������/������ ��ġ�� �ϰ� �ֽ��ϴ�.</p>
			<ul class="ico002 top_mar5">
				<li>���������� ��ȣȭ 
					 <ul>
						 <li>�̿����� ���������� ��й�ȣ�� ��ȣȭ �Ǿ� ���� �� �����ǰ� ���θ��� �� �� ������ �߿��� �����ʹ� ���� �� ���۵����͸� ��ȣȭ �ϰų� ���� ��� ����� ����ϴ� �� ���� ���ȱ���� ����ϰ� �ֽ��ϴ�.</li>
					 </ul>
				</li>
				 <li>��ŷ � ����� ����� ��å
					 <ul>
						 <li>��ŷ�̳� ��ǻ�� ���̷��� � ���� �������� ���� �� �Ѽ��� ���� ���Ͽ� �������α׷��� ��ġ�ϰ� �ֱ����� ���š������� �ϸ� �ܺηκ��� ������ ������ ������ �ý����� ��ġ�ϰ� �����/���������� ���� �� �����ϰ� �ֽ��ϴ�.</li>
					 </ul>
				</li>
				 <li>��������ó���ý��� ���� ����
					 <ul>
						 <li>���������� ó���ϴ� �����ͺ��̽��ý��ۿ� ���� ���ٱ����� �ο�, ����, ���Ҹ� ���� ���������� ���� ���������� ���Ͽ� �ʿ��� ��ġ�� �ϰ� ������ ħ�����ܽý����� �̿��Ͽ� �ܺηκ����� ���� ������ �����ϰ� �ֽ��ϴ�.</li>
					 </ul>
				</li>
				 <li>�������� ��� ������ �ּ�ȭ �� ����
					 <ul>
						 <li>���������� ����ϴ� ������ �����ϰ� ������� ������ �ּ�ȭ�Ͽ� ���������� �����ϴ� ��å�� �����ϰ� �ֽ��ϴ�.</li>
					 </ul>
				</li>     
			</ul>
		<h3 class="top_mar20">�������� ������ �������� �� ����Ű�, �������� �ߴ�</h3>
		<p class="left_mar20 ">���������� �����̶� ���� �����̳� ��������ó������ �����ο� �ǻ翡 ������ �ʰ�, ������ü�� ���������� ���Ͽ� ��������ó���ڰ� ������ ����ϰų� �Ǵ� ���� ���� ���� ������ ����Ѱ����μ�, ���� �� ȣ�� ��� �ϳ��� �ش��ϴ� ��츦 ���մϴ�. </p>
		<h4>���������� ���Ե� ����, �̵��� ������ġ, �޴�� ��ǻ�� ���� �н��ϰų� �������� ���</h4>
		<h4>���������� ����� �����ͺ��̽� �� ��������ó���ý��ۿ� �������� ������ ���� �ڰ� ������ ���</h4>
		<h4>��������ó������ ���� �Ǵ� ���Ƿ� ���� ���������� ���Ե� ���� �Ǵ� ���̹���, ��Ÿ �����ü�� ������ ���� �ڿ��� �߸� ���޵Ȱ��</h4>
		<h4>��Ÿ ������ ���� �ڿ��� ���������� ���޵ǰų� ��������ó���ý��۵ ���� �����ϰ� �� ���</h4>
			<ul class="ico002 top_mar10">
				<li>��������
					 <ul>
						 <li class="ico002No">�������� ���� ��� �߻��� ������ Ȯ�ε� ������������  ������ ���� �� 5�� �̳��� �ش� ������ü���� ���� ��ȣ�� ������ �˷��帮�ڽ��ϴ�.</li>
						 <li>����� ���������� �׸�</li>
						 <li>����� ������ �� ����</li>
						 <li>����� �߻��� �� �ִ� ���ظ� �ּ�ȭ�ϱ� ���Ͽ� ������ü�� �� �� �ִ� ��� � ���� ����</li>
						 <li>��������ó������ ������ġ �� ���ر�������</li>
						 <li>���ذ� �߻��� ��� �Ű� ���� ������ �� �ִ� ���μ� �� ����ó �������� �������� ������ ������ ����, ���ڿ���, �������,��ȭ, �޴���ȭ �������� �Ǵ� �̿� ������ ����� ���Ͽ� ��ü���� ������ü���� �˷��帮�� Ȩ�������� ���� �ϰڽ��ϴ�.</li>
					 </ul>
				</li> 
			</ul>
			<ul class="ico002 top_mar10">
				<li>�������� ������ �Ű�����
					 <ul>
						 <li class="ico002No">1���� �̻� ���������� ����� ��쿡�� ������ü�� ���� ���� �� ��ġ����� 5�� �̳��� ������������� �Ǵ� �ѱ����ͳ�������忡�� �Ű��ϰ� Ȩ�������� ������ü�� �˾ƺ��� ������ 7�� �̻�        �����ϰڽ��ϴ�.</li>
					 </ul>
				</li> 
			</ul> 
			<ul class="ico002 top_mar10">
				<li>�������� ����� �������� �ߴ�
					 <ul>
						 <li class="ico002No">���������� ����?������ ������� �ٸ� ����� ���������� �� ������ ����� Ȯ�εǰų� �������� ����� ���� ��� �߻��Ͽ����� ������ ��� ��� ������ �ߴ��ϰڽ��ϴ�.</li>
					 </ul>
				</li> 
			</ul>     
		 
		 <h3 class="top_mar20">����ħ�� �������</h3>  
		 <p class="left_mar20 ">����������ü�� �������� ħ�ط� ���� ������ �ޱ� ���Ͽ� ����  ���� ������������ȸ, �ѱ����ͳ������ �������� ħ�ؽŰ���,����������ȣ ���������ý��� � ���� �ذ��̳� ��� ���� ��û�� �� �ֽ��ϴ�.
		�� �ۿ� ��Ÿ ��������ħ���� �Ű� �� ��㿡 ���Ͽ��� �Ʒ������  �����Ͻñ� �ٶ��ϴ�.</p> 
			<h4>���κ�����������ȸ        :  118��(ARS ���� 3��) </h4> 
			<h4>������ȣ��ũ��������ȸ    : 02-580-0533~4</h4>
			<h4>�����û ÷�ܹ��˼����   : 02-3480-2000</h4>
			<h4>����û ���̹��׷��������� : 02-392-0330 </h4>
			<h4>���ͳݽŰ� : ����������ȣ ���������ý��� Ȩ������<a target="_blank" href="http://www.privacy.go.kr">(www.privacy.go.kr)</a></h4>
		 <h3 class="top_mar20">�������� �оߺ� å���� �� ����� ����ó</h3>  
		  <p class="left_mar20 ">��û�ϵ���ġ�������� Ȩ������ �̿� �� ���������� ���� ���ɼ� �� ������ü�� ������ ħ�ص� ����� �ִ� ����� �߰��Ͽ��� ��� ���� ����ó�� �˷��ֽñ� �ٶ��ϴ�. </p> 
		   <ul class="ico002 top_mar10">
				<li>��û�ϵ���ġ������ �������� ��ȣå����(CPO)
					 <ul>
						 <li>��û�ϵ� ��ġ�������� �� �� ��</li>
					 </ul>
				</li>
				<li>��û�ϵ���ġ������ �������� ��ȣ�����
					 <ul>
						 <li>��    �� : �� �� ��</li>
						 <li>��ȭ��ȣ : 043)220-5462 / �ѽ���ȣ : 043)220-5439 </li>
						 <li>�� �� �� : oks126@korea.kr</li>
					 </ul>
				</li>  
			</ul>
</div>
<div class="top_mar20 info" id="info2" style="display:none;">

		<h2 class="top_mar10">��ǻ�Ϳ� ���� ó���Ǵ� ����������ȣ</h2>
        <p>��û�ϵ���ġ�������� ������ ������ ������ü�� ���ǿ� ���ؼ��� ���������� �����������ϰ� �ֽ��ϴ�.<br>
    ��û�ϵ���ġ�������� �����������ϰ� �ִ� ���������������� ��Ī, �����ٰ�, ��������, ��ϵǴ� �ֿ��׸�, �������, �����Ⱓ ���� ������ �����ϴ�.</p>
		<h3 class="top_mar10">�����������ϰ� �ִ� ������������</h3>
           <table cellspacing="0" cellpadding="0" class="center" summary="����,�����,��� ���� �������̺� �Դϴ�.">
  <caption>
  �Ҿ米�� �
  </caption>
    <colgroup>
                <col width="30%">
                <col width="*%">
            </colgroup>
  <tbody>
    <tr>
      <th class="first">�����������ϸ�</th>
      <td>��������(���������ý���)</td>
    </tr>
    <tr>
      <th class="first">�� �� (�� ��) �� ��</th>
      <td>��������������� ��8��, ���� ����� ��11��</td>
    </tr>
    <tr>
      <th class="first">�� �� �� ��</th>
      <td>������������(������ȹ, �����, ������� ��) ����</td>
    </tr>
    <tr>
      <th class="first">�� �� �� ��</th>
      <td>����, �ֹι�ȣ, �ּ�, �̸���, ����ó, �Ҽ�����, ���¹�ȣ(����)</td>
    </tr>
    <tr>
      <th class="first">�� �� �� ��</th>
      <td>������ : �ý��� ���踦 ���� ����<br />
�� �� : ������ü�� ����(�������� ���Ǽ�)</td>
    </tr>
    <tr>
      <th class="first">�� �� �� ��</th>
      <td>�ؿ���</td>
    </tr>
    
  </tbody>
</table>

        <h3 class="top_mar10">���������� ó������, ������ ��� ����</h3>
        <p class="left_mar40 top_mar5">��û�ϵ���ġ�������� ���������ý��� ���������� ������ ���������� ó���մϴ�. ó���� ���������� ���� �����̿��� �뵵�δ� ������ ������ �̿� ������ ����� �ÿ��� ���� ���Ǹ� ����       �����Դϴ�.<br>
        ��û�ϵ���ġ�������� ���� ��� �����Ʒÿ� ���� ������ȹ, �����, �̼��� �� ���ñ�� �뺸�� ���Ͽ� ���������� ó���մϴ�.</p>  
        <h3 class="top_mar10">���������� �����ٰ� �� �����Ⱓ</h3>
        <p class="left_mar40 top_mar5">��û�ϵ���ġ������ ���������ý����� �������� �����ٰ� �� �����Ⱓ�� �Ʒ��� �����ϴ�.</p>    
		<h3 class="top_mar10">���������� �����ٰ� �� �����Ⱓ, ������ ������</h3>
        <ul class="ico001h3 top_mar5">
			<li>�����ٰ� : ������Ÿ� �̿����� �� ������ȣ � ���ѹ��� ��22�� ��������������� ��8��, ���� ����� ��11��</li>
			<li>�����Ⱓ : �ؿ���(������Ϲ� ������ ���� ������ �ǰ�)<br>�����Ⱓ�� ����� ����������  "������� ��Ϲ�������"�� ���� �ı�Ǹ�, �����Ⱓ ���ῡ�� �ı�ñ����� ������ DB�� �������� �˷��帳�ϴ�.</li>
		</ul>
  <h3 class="top_mar10">���������� ��3�� ������ ���� ����</h3>
		<p class="left_mar20 ">��û�ϵ���ġ������������ ���������ý��� ���������� ��3�ڿ��� ������ ��� �������� �� ������ ������ �����ϴ�.</p>
        <ul class="ico001h3 top_mar5">
			<li>�����޴� ���(��) : ����ȸ��</li>
			<li>�����ٰŹ׸��� : ����������� ���� �����н� ���� ������   �� �μ��ڿ� ���� ������ ���� ����</li>
            <li>�����ϴ� ���������� �׸� : �Ҽ�, ����, �ֹε�Ϲ�ȣ</li>
            <li>�����޴� ���� �������� ���� �� �̿� �Ⱓ : ������Ⱓ ����ñ���</li>
		</ul>
		<p class="left_mar20 ">��û�ϵ���ġ�������� ��3�� ������ ���� �� �������� ó������ �� ���������� ���� �������� �� ������ Ȯ����ġ�� ���� ���׵��� ��༭�� �����ϰ�, ������ü�� ���Ǿ��� �ٸ� ����� ���������� �� ������ ����� Ȯ�εǰų� �������� ����� ���� ��� �߻��Ͽ����� ������ ��� ��� ������ �ߴ��ϰڽ��ϴ�.</p>

  <h3 class="top_mar20">��������ó���� ��Ź�� ���� ����</h3>
		<p class="left_mar20 ">��û�ϵ���ġ������ ���������ý����� ������ ��� ���Ͽ� �Ʒ��� ���� �������� ����� ü���Ͽ� ��ϰ� ������ ���� ������ �ؼ��� ���Դϴ�.</p>
		<h3>�������� ����� ��Ȳ</h3>
			 <ul class="ico001h3 top_mar5">
				<li>����ڸ� : �ֽ�ȸ�� ������</li>
				<li>��    �� : ��� û�ֽ� ��籸 ���� 314(������) û�ֹ�ȭ�������</li>
				<li>��ȭ��ȣ : 043-294-6643</li>
				<li>�ٹ��ð� : 09:00 ~ 18:00</li>
			</ul>
		 <p class="left_mar10  top_mar10">��Ź��� �� ����������ȣ ���� ������ �ؼ�, ���������� ���� ��3�� ���� ���� �� å�Ӻδ� ���� ��Ȯ�� �����ϰ�, ���� ��೻���� ���� �� ���� �����ϰ� ������, ��ü ����� �������� �� ��������ó�� ��ħ�� ���� �����ϰڽ��ϴ�.</p>

		<h3 class="top_mar20">������ü�� �Ǹ����ǹ� �� �� ��翡 ���� ����</h3>
		<p class="left_mar20 ">���������ý��� �̿��ڴ� ����������ü�μ� ������ ���� �Ǹ��� ����� �� �ֽ��ϴ�.</p>
			<ul class="ico001h3 top_mar5">
				<li>���������� ��ȸ, ���� �� ������ ���� ���� �� ������ ��û</li>
				<li>���������� ��ȸ, ���� ���� ������ �ý��� �α��� �� ������������������ ���� �����մϴ�.</li>
				<li>�̿��ڰ� ���������� ������ ���� ���� �� ������ ��û�� ���  ���� ���� �� ������ �Ϸ��� �� ���� ���� ���������� �̿�  �Ǵ� �������� �ʽ��ϴ�. �� ���, �߸��� ���������� �̿� �Ǵ� ������ ��� ��ü ���� �����ϰڽ��ϴ�.</li>
				<li>�̿����� ��û�� ���� ���� �Ǵ� �����Ǵ� ���������� ����  ������ ó�� �� ���� �Ⱓ�� ���� ó���մϴ�.</li>
			</ul>
	   <h3 class="top_mar20">�������� �ı����� �� ���</h3>
		<p class="left_mar20 ">���������ý��� �̿����� ���������� ��������� ��Ϲ����������� ���� �ı������� ��Ĩ�ϴ�. </p>
			<ul class="ico002 top_mar5">
				<li>�ı� ���� 
				  <ul>
						 <li>������ �޼��� ���������� ��Ϲ� �ı���Ǹ� ��ġ�� ���� ������ DB�� �Ű���(������ ��쿡�� ������ �����Կ� ����) �����Ⱓ ���� �� �ı�˴ϴ�.</li>
					 </ul>
				</li>
				 <li>�ı� ���
				   <ul>
						 <li>���̿� ��µ� ���������� �м��� �м��ϰų� �Ұ��� ���Ͽ� �ı��մϴ�.</li>
                         <li>���������� ���·� ����� ���������� ����� ����� �� ���� ����� ����� ����Ͽ� �����մϴ�.</li>
					 </ul>
				</li>     
			</ul>
		<h3 class="top_mar20">���������� ������ Ȯ����ġ</h3>
		<p class="left_mar20 ">��û�ϵ���ġ�������� ��ϴ� ���������ý����� ����������ȣ�� ��29���� ���� ������ ���� ������ Ȯ���� �ʿ��� �����/������/������ ��ġ�� �ϰ� �ֽ��ϴ�.</p>
		<h3>���������� ��ȣȭ</h3>
  <p class="left_mar40 ">�̿����� ���������� ��й�ȣ�� ��ȣȭ �Ǿ� ���� �� ���� �ǰ� ���θ��� �� �� ������ �߿��� �����ʹ� ���� �� ���۵����͸� ��ȣȭ �ϰų� ���� ��� ����� ����ϴ� �� ���� ���ȱ���� ����ϰ� �ֽ��ϴ�.</p>
		<h3>��ŷ � ����� ����� ��å</h3>
  <p class="left_mar40 ">��ŷ�̳� ��ǻ�� ���̷��� � ���� �������� ���� �� �Ѽ��� ���� ���Ͽ� �������α׷��� ��ġ�ϰ� �ֱ����� ���š������� �ϸ� �ܺηκ��� ������ ������ ������ �ý����� ��ġ�ϰ� �����/���������� ���� �� �����ϰ� �ֽ��ϴ�.</p>
        <h3>��������ó���ý��� ���� ����</h3>
        <p class="left_mar40 ">���������� ó���ϴ� �����ͺ��̽��ý��ۿ� ���� ���ٱ����� �ο�, ����, ���Ҹ� ���� ���������� ���� ���������� ���Ͽ� �ʿ��� ��ġ�� �ϰ� ������ ħ�����ܽý����� �̿��Ͽ� �ܺηκ����� ���� ������ �����ϰ� �ֽ��ϴ�.</p>
        <h3>�������� ��� ������ �ּ�ȭ �� ����</h3>
        <p class="left_mar40 ">���������� ����ϴ� ������ �����ϰ� ������� ������ �ּ�ȭ �Ͽ� ���������� �����ϴ� ��å�� �����ϰ� �ֽ��ϴ�.</p>
        <h3 class="top_mar20">�������� ������ �������� �� ����Ű�, �������� �ߴ�</h3>
        <p class="left_mar20 ">���������� �����̶� ���� �����̳� ��������ó������ �����ο� �ǻ翡 ������ �ʰ�, ������ü�� ���������� ���Ͽ� ��������ó���ڰ� ������ ����ϰų� �Ǵ� ���� ���� ���� ������ ����� �����μ�,���� �� ȣ�� ��� �ϳ��� �ش��ϴ� ��츦 ���մϴ�.</p>
        <h3>���������� ���Ե� ����, �̵��� ������ġ, �޴�� ��ǻ�� ���� �н��ϰų� �������� ���</h3>
        <h3>���������� ����� �����ͺ��̽� �� ��������ó���ý��ۿ� �������� ������ ���� �ڰ� ������ ���</h3>
        <h3>��������ó������ ���� �Ǵ� ���Ƿ� ���� ���������� ���Ե� ���� �Ǵ� ���̹���, ��Ÿ �����ü�� ������ ���� �ڿ��� �߸� ���޵� ���</h3>
        <h3>��Ÿ ������ ���� �ڿ��� ���������� ���޵ǰų� ��������ó���ý��� � ���� �����ϰ� �� ���</h3>
  <ul class="ico002 top_mar5">
				<li>��������
					 <ul>
						 <li>�������� ���� ��� �߻��� ������ Ȯ�ε� ������������ ������ ���� �� 5�� �̳��� �ش� ������ü���� ���� ��ȣ�� ������ �˷��帮�ڽ��ϴ�.</li>
                         <li>����� ���������� �׸�</li>
                         <li>����� ������ �� ����</li>
                         <li>����� �߻��� �� �ִ� ���ظ� �ּ�ȭ�ϱ� ���Ͽ� ������ü�� �� �� �ִ� ��� � ���� ����</li>
                         <li>��������ó������ ������ġ �� ���ر�������</li>
                         <li>���ذ� �߻��� ��� �Ű� ���� ������ �� �ִ� ���μ� �� ����ó �������� �������� ������ ������ ����, ���ڿ���, �������, ��ȭ, �޴���ȭ �������� �Ǵ� �̿� ������ ����� ���Ͽ� ��ü���� ������ü���� �˷��帮�� Ȩ�������� ���� �ϰڽ��ϴ�.</li>
					 </ul>
				</li>  
                <li>�������� ������ �Ű�����
					 <ul>
						 <li>1���� �̻� ���������� ����� ��쿡�� ������ü�� ���� ���� �� ��ġ����� 5�� �̳��� ������������� �Ǵ� �ѱ����ͳ�������忡�� �Ű��ϰ� Ȩ�������� ������ü�� �˾ƺ��� ������ 7�� �̻�        �����ϰڽ��ϴ�.</li>
					 </ul>
				</li> 
                <li>�������� ����� �������� �ߴ�
					 <ul>
						 <li>���������� ����?������ ������� ������ü�� ���Ǿ��� �ٸ� ����� ���������� �� ������ ����� Ȯ�εǰų� �������� ����� ���� ��� �߻��Ͽ����� ������ ��� ��� ������ �ߴ��ϰڽ��ϴ�.</li>
					 </ul>
				</li>    
  </ul>
        <h3 class="top_mar20">����ħ�� �������</h3>
        <p class="left_mar20 ">����������ü�� �������� ħ�ط� ���� ������ �ޱ� ���Ͽ� ����  ���� ������������ȸ, �ѱ����ͳ������ �������� ħ�ؽŰ���,����������ȣ ���������ý��� � ���� �ذ��̳� ��� ���� ��û�� �� �ֽ��ϴ�.<br>�� �ۿ� ��Ÿ ��������ħ���� �Ű� �� ��㿡 ���Ͽ��� �Ʒ������ �����Ͻñ� �ٶ��ϴ�.</p>
        <h3>���κ�����������ȸ : 118��(ARS ���� 3��)</h3>
        <h3>������ȣ��ũ��������ȸ : 02-580-0533~4</h3>
        <h3>�����û ÷�ܹ��˼���� : 02-3480-2000</h3>
        <h3>����û ���̹��׷��������� : 02-392-0330 </h3>
        <h3>���ͳݽŰ� :����������ȣ ���������ý��� Ȩ������ <a target="_blank" href="http://www.privacy.go.kr/">(www.privacy.go.kr)</a></h3>
        <h3 class="top_mar20">�������� �оߺ� å���� �� ����� ����ó</h3>
        <p class="left_mar20 ">��û�ϵ���ġ�������� ���������ý��� �̿� �� ���������� ���� ���ɼ� �� ������ü�� ������ ħ�ص� ����� �ִ� ����� �߰� �Ͽ��� ��� ���� ����ó�� �˷��ֽñ� �ٶ��ϴ�.</p>
            <ul class="ico002 top_mar5">
                <li>��û�ϵ���ġ������ �������� ��ȣå����(CPO)
                     <ul>
                         <li>��û�ϵ� ��ġ�������� �� �� ��</li>
                     </ul>
                </li>  
                <li>��û�ϵ���ġ������ �������� ��ȣ�����
                     <ul>
                         <li>��    �� : �� �� ��</li>
                         <li>��ȭ��ȣ : 043)220-5462 / �ѽ���ȣ : 043)220-5439 </li>
                         <li>�� �� �� : oks126@korea.kr</li>
                     </ul>
                </li>    
            </ul>
			
</div>
<div class="top_mar20 info" id="info3" style="display:none;">
		<h2 class="top_mar10">��������ó����� ��ġ���  </h2>
        <h3 class="top_mar10">��������ó������� ��ġ </h3>
        <ul class="ico002 top_mar5">
                <li>������� 
                     <ul>
                         <li>������ ��ҿ� ��������ó����⸦ ��ġ ��ϰų� �� ��⸦ ���Ͽ� ���ο��������� ó���ϴ� ��츦 ������� �մϴ�. </li>
                     </ul>
                </li>  
                <li>��������ó����� ������� ��ħ
                     <ul>
                         <li>��������ó����� ��ڴ� ��������ó����� ������� ��ħ�� �����ϰų� �����ϴ� ��쿡�� ������ü�� ���� Ȯ���� �� �ֵ��� �����Ͽ��� �մϴ�. </li>
                         <li>��������ó����� ��ġ?��� ���� ������ ����������ȣ�� ��30���� ���� �������� ó����ħ�� �����Ͽ� ���� �� ������, ��������ó����� �?���� ��ħ�� ������ ��쿡�� ����
       ������ȣ�� ��30���� ���� ��������ó����ħ�� ������ �ƴ� �� �� �ֽ��ϴ�.</li>
                     </ul>
                </li> 
                <li>����å������ ����
                     <ul>
                         <li>��������ó����� ��ڴ� �� ������ ���� ���ο��������� ó���� ���� ������ �Ѱ��ϴ� ���ο������� ��ȣå���ڸ� �����ϰ� �ֽ��ϴ�.</li>
                         <li>��1���� ��ȣå���ڴ� ����������ȣ�� ��31�� ��2�׿� ���� �������� ��ȣ�� ���� ���� �� ȣ�� ������ �����մϴ�.<br>
                            1. ���ο������� ��ȣ ��ȹ�� ���� �� ����<br>
                            2. ���ο������� ó�� ���� �� ������ �������� ���� �� ����<br>
                            3. ���ο������� ó���� ������ �Ҹ��� ó�� �� ���ر���<br>
                            4. ���ο������� ���� �� ����?���� ������ ���� �������� �ý����� ����<br>
                            5. ���ο������� ��ȣ ���� ��ȹ ���� �� ����<br>
                            6. ���ο������� ������ ��ȣ �� �ı⿡ ���� ����?����<br>
                            7. �� �ۿ� ���ο��������� ��ȣ�� ���Ͽ� �ʿ��� ����
                         </li>
                         <li>����������ȣ�� ��31���� ���� ������ �������� ��ȣå���ڴ� ���ο������� ��ȣ������ �����մϴ�. </li>
                     </ul>
                </li>
                <li>�����ǰ� ����
                     <ul>
                         <li>��������ó������� ��ġ, ��ġ���� ���濡 ���� �߰� ��ġ�� ������ ���� ������ �� ���ذ������� �ǰ��� �����ϰ� �ֽ��ϴ�.</li>
                     </ul>
                </li> 
                <li>�ȳ����� ��ġ
                     <ul>
                         <li>��������ó����� ��ڴ� ������ü�� ��������ó����Ⱑ ��ġ��� ������ ���� �˾ƺ� �� �ֵ��� ����������ȣ�� ��25����4�� ������ ���� ���� �� ȣ�� ������ ������ �ȳ��� ��ġ �� �ʿ��� ��ġ�ϰ� �ֽ��ϴ�.<br>
                        1. ��ġ���� �� ���<br>
                        2. �Կ����� �� �ð�<br>
                        3. ����å������ ���� �Ǵ� ��å �� ����ó  <br>
                        4. ��������ó����� ��ġ����� ���� �繫�� ��Ź�ϴ� ���, ��Ź ��ü��/�ּ�/��ȭ��ȣ/�ٹ��ð��� �ۼ�</li>
                        <li>��1�׿� ���� �ȳ����� �Կ����� ������ ������ü�� �˾ƺ��⽬�� ��ҿ� ������ �����ϰ� �ǵ��� �� �ְ� ��ġ�Ǿ�� �ϸ�, ��������ó����� �ȳ��� ũ��, ��ġ��ġ ���� ���������� ���� �� �ֽ��ϴ�.</li>
                     </ul>
                </li>        
            </ul>
            
            
		<h3 class="top_mar10">�������� ���� �� ����</h3>
		     <p class="left_mar20">��û�ϵ���ġ�������� CCTV ��ġ������ ���յǴ� �ʿ��ּ����� ���� �ȿ����� ȭ�� ������ �����ϸ�, CCTV�� ���Ͽ� ������ ���������� ���� �� ����� �����Ⱓ ���� �� ��� �����ϰ� �ֽ��ϴ�. ��ġ���������� ����� �� ���� ������ ���� ��ġ � ���� ���ȸ�� �ڷ�����(CCTV) ��Ȳ�� �Ʒ��� �����ϴ�. </p>
             <h4 class="top_mar10">û�� ����� ���ȸ�� �ڷ�����(CCTV)</h6>
                <table cellpadding="0" summary="û�� ����� ���ȸ�� �ڷ�����(CCTV) ���� �������̺� �Դϴ�." class="tb_list">
                <caption><span>û�� ����� ���ȸ�� �ڷ�����(CCTV)</span></caption>
                <colgroup>
                    <col width="30%">
                    <col width="*%">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="first">��    ��    ��    ��</th>
                        <td>����������</td>
                    </tr>
                    <tr>
                        <th class="first">å �� ��  ��  �� �� ó</th>
                        <td>������������(�� 043-220-5412)</td>
                    </tr>
                    <tr>
                        <th class="first">ī �� ��  �� ��  ��  �� ġ</th>
                        <td>6��(û�� �� ������, �ܰ��ֺ�, ��������, �ʼ��Ա�)</td>
                    </tr>
                    <tr>
                        <th class="first">C C T V   ��  ��  ��  ��</th>
                        <td>���(24�ð�)</td>
                    </tr>
                    <tr>
                        <th  class="first">ȭ �� �� ��  �� �� �� ��</th>
                        <td>30��</td>
                    </tr>
                    <tr>
                        <th class="first">�ȳ��� �԰�(����*����)</th>
                        <td>420*300</td>
                    </tr>
                </tbody>
                </table>
                
                <h4 class="top_mar10">������ ���������� ����͸� ���ȸ�� �ڷ�����(CCTV)</h6>
                <table cellpadding="0" summary="������ ���������� ����͸� ���ȸ�� �ڷ�����(CCTV) ���� �������̺� �Դϴ�." class="tb_list">
                <caption><span>������ ���������� ����͸� ���ȸ�� �ڷ�����(CCTV)</span></caption>
                <colgroup>
                    <col width="30%">
                    <col width="*%">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="first">��    ��    ��    ��</th>
                        <td>�������</td>
                    </tr>
                    <tr>
                        <th class="first">å �� ��  ��  �� �� ó</th>
                        <td>���������(�� 043-220-5445)</td>
                    </tr>
                    <tr>
                        <th class="first">ī �� ��  �� ��  ��  �� ġ</th>
                        <td>10��(�밭��, 2~7 ���ǽ�, 1,2����ȭ������, ���н�)</td>
                    </tr>
                    <tr>
                        <th class="first">C C T V   ��  ��  ��  ��</th>
                        <td>�������� ���(�� 9�ð�)</td>
                    </tr>
                    <tr>
                        <th class="first">ȭ �� �� ��  �� �� �� ��</th>
                        <td>������ġ ����</td>
                    </tr>
                    <tr>
                        <th class="first">�ȳ��� �԰�(����*����)</th>
                        <td>297*210</td>
                    </tr>
                </tbody>
                </table>
              
		 <h3 class="top_mar10">CCTV ���������� ���� ���� ��û</h3>
		 <p class="left_mar20">������ü�� ��û�ϵ���ġ�������� �����ϰ� �ִ� CCTV ���������� ����������ȣ��(�ٸ� ������ ������ �ִ� ���� �ش� ����)�� ������ ���ϴ� �ٿ� ���� ���������� ����Ȯ�� �� ������������ ��û�� �� �ֽ��ϴ�.<br>�ٸ�, ���� ���׿� �ش��ϴ� ��쿡�� û�����׿� ���Ͽ� ������ �� ������, �� ��� 10�� �̳��� �������� ���� ������ü���� �����Ͽ� �帳�ϴ�. </p>
		<ul class="ico001h3 top_mar5">
			<li>���˼��硤��������?���Ǽ��࿡ �ߴ��� ������ �ʷ��ϴ� ���</li>
			<li>Ư�� ������ü�� ������������ �����ϴ� ���� ��������� ������ ����� ��� </li>
			<li>���� ���� ��û�� ���� �ʿ��� ��ġ�� �������ν� Ÿ���� ���Ȱ���� ħ�ص� ����� ū ��� </li>
            <li>��Ÿ ���� ���� ��û�� ������ ���� ������ ������ ������ �����ϴ� ���</li>
		</ul>
        <h4 class="top_mar10"> [���ο������� ���� �� ���ǻ���]</h4>
		<p class="left_mar20 ">������ü�� ��û�� ���� ���ο��������� ������ ��� CCTV ��ȭ ȭ�鿡 ������ü�� �ƴ� Ÿ���� ���������� ���� ��� Ÿ���� ���������� Masking�� ó���� �� ������ �� �ֽ��ϴ�.</p>
        <p class="left_mar20 "> �� Masking : CCTV�� ���� ������ ����� �������� Ȯ������ ���ϵ��� ȭ���� �帮�� �ϰų� ������ũ ó���� ���� �ĺ��� �� ������ �ϴ� ��</p>

		<h3 class="top_mar20">���ο������� �̿롤��3�� ���� �� ����</h3>
		<p class="left_mar20 ">��û�ϵ���ġ�������� �����ϰ� �ִ� CCTV ���������� CCTV ��ġ���� ���� �뵵�� Ȱ��ǰų� ���ٱ����� �ο����� �� �̿��� Ÿ�ο��� �������������� �ʰ� ������ �޸� �̿� �� ������ �� ������ ���� ó���ϰ� �ֽ��ϴ�.<br>���������� ��3�ڿ��� ������ ��� �������� �� ������ ������ �����ϴ�. </p>
		<h4>�����޴� ���(��)/�����ٰŹ׸���/�����ϴ� ���������� �׸�/   �����޴� ���� �������� ���� �� �̿� �Ⱓ</h4>
			 

		<h3 class="top_mar20"> CCTV ��Ź����</h3>
		<p class="left_mar20 ">��û�ϵ���ġ�������� CCTV ��ġ �� ������ ���� �繫�� ���� �� ����� ���� �ٸ� ��������̳� CCTV ���� �ΰ���ü ���� ��������� ��Ź�� �� �ֽ��ϴ�.<br>
        ��Ź��� �� ����������ȣ ���� ������ �ؼ�, ���������� ����  ��3�� ���� ���� �� ��Ź���� �ؼ����� �� ��Ź���� å�Ӻδ� ���� ��Ȯ�� �����ϰ� ������, ���� ��� ������ ���� �� ���� �����ϰ� ������, ��ü ����� �������� �� ��������ó�� ��ħ�� ���� �����ϰڽ��ϴ�.</p>
			 <ul class="ico002 top_mar5">
                <li>[��Ź����� ���]
                     <ul>
                         <li>����������ȣ�� �ʿ��� ���� ��� �� ����� ���� ��� </li>
                         <li>��Ź���� ������ �����ϴµ� �ʿ��� ���� �η��� ���� ��� </li>
                     </ul>
                </li>     
            </ul>
	   <h3 class="top_mar20"> CCTV �ȳ��� ��ġ</h3>
		<p class="left_mar20 ">��û�ϵ���ġ�������� CCTV�� ��ġ�� ��Ҹ��� <strong>��ġ ���������, �Կ� �������ð�, ���� å���ڡ�����ó </strong>���� ����� �ȳ����� ��ġ�Ͽ� �����е��� ���� �ν��� �� �ֵ��� �ϰ� �ֽ��ϴ�.<br>�ٸ�, ������ ���� ���� ���������� ó���ϰ� �ֽ��ϴ�.</p>
        
         <table cellpadding="0" summary="�ȳ��� ��ġ ���ܻ���,��ġ��� ���� �������̺� �Դϴ�." class="center">
                <caption>CCTV �ȳ��� ��ġ</caption>
                <colgroup>
                    <col width="60%">
                    <col width="*%">
                </colgroup>
                <thead>
                     <tr>
                          <th class="first" scope="col">�ȳ��� ��ġ ���ܻ���</th>
                          <th scope="col">��ġ���</th>
                      </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="first">������� �ǹ� �ȿ� �ټ��� CCTV�� ��ġ�� ���</td>
                        <td>�ǹ��Ա����� ��ġ</td>
                    </tr>
                    <tr>
                        <td class="first">��������ħ�� ������ ���� ��� �Ǵ� �ȳ��� ��ġ�� ����� ���</td>
                        <td>�ȳ��� �̼�ġ ���ͳ� ����Ʈ�� ���� ��� ����</td>
                    </tr>
                    <tr>
                        <td class="first">�ȳ��� ��ġ�� ���� ��������� ������ ����Ǵ� ����ü�, �����߿�ü�, ���ȸ�ǥ �ü� ��</td>
                        <td>�ȳ��� �̼�ġ</td>
                    </tr>
                </tbody>
                </table>
                
		<h3 class="top_mar20">CCTV �Ѱ���� å�Ӱ��� ����</h3>
		<p class="left_mar20 ">��û�ϵ���ġ�������� CCTV ���������� ���� ������ ������ ���� �Ѱ�å���ڿ� �å�Ӱ��� ��������ϰ� �ֽ��ϴ�.<br>�Ѱ�å���ڴ� ���� ��������� CCTV ��ġ?�, CCTV ���� �ο��� ���� �� ó��, ���������� ������ó���� ���� ����������ȣ ������ �Ѱ��ϸ� �å���ڴ� CCTV ��ġ����� ������ ������ �����ϰ� �ֽ��ϴ�.</p>
			<ul class="ico002 top_mar10">
				<li>��û�ϵ���ġ������ �������� ��ȣå����(CPO)
					 <ul>
						 <li class="ico002No">��û�ϵ���ġ�������� �� �� ��</li>
					 </ul>
				</li> 
                <li>CCTV �å�Ӱ� : �� CCTV ��ġ��� �μ��� ��</li> 
			</ul>
		 
		 
</div>
</body>
</html>