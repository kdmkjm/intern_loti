<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인정보 처리방침</title>
<style type="text/css">
*{margin:0; padding:0;}
body, input, textarea, select, button{color:#5E5E5E; font-family: dotum,"돋움",NanumGothic; font-size: 12px; letter-spacing: 0px; line-height: 120%; margin:10px 10px;}
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
						<li class="on"><a href="/extMainBegin.act?task=privacyPolicy&num=1"><span>홈페이지 이용자의 개인정보보호</span></a></li>
						<li><a href="/extMainBegin.act?task=privacyPolicy&num=2"><span>컴퓨터에 의해 처리되는 개인정보보호</span></a></li>
						<li><a href="/extMainBegin.act?task=privacyPolicy&num=3"><span>영상정보처리기기 설치 &#183; 운영</span></a></li>
					
				</ul>
		</div>
  <div class="top_mar20 info" id="info1" style="display:none;">
		<div><img alt="충청북도자치연수원 개인정보처리방침" src="/images/info_title.gif"></div>
				<p class="ttbox">
				충청북도자치연수원에서 취급하는 모든 개인정보는 관련법령에 근거하거나 정보주체의 동의에 의하여 수집·보유 및 처리되고 있습니다.<br>
				『개인정보보호법』은 이러한 개인정보의 취급에 대한 일반적 규범을 제시하고 있으며, 충청북도자치연수원은 이러한 법령의 규정에 따라 수집·보유 및 처리하는 개인정보를 공공업무의 적절한 수행과 국민의 권익을 보호하기 위해 적법하고 적정하게 취급할 것입니다.<br><br>
				또한, 충청북도자치연수원은 개인정보보호법 등 관련법령상의 개인정보보호 규정을 준수하며, 개인정보처리방침은 아래와 같습니다.
				이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항<strong class="color_Bgreen"> 시행 7일 전부터 공지사항을 통하여 고지</strong>할 것입니다.<br><br>충청북도자치연수원의 개인정보보호방침은홈페이지에서 이용자 여러분의 개인정보를 보호하기 위한<strong class="color_Bgreen"> 『홈페이지 이용자의 개인정보보호』</strong>와 교육관련 업무를 수행하는데 필요한 교육관리시스템 개인정보 보호를 위한 <strong class="color_blue">『컴퓨터에 의해 처리되는 개인정보보호』</strong>, 교육운영 및 공익을 목적으로 설치ㆍ운영하는<strong class="color_blue">『CCTV에 의해 처리되는 영상정보보호』</strong>등 세 가지로 구성되어 있으며, 이는 현행『개인정보보호법』및
			『개인정보보호법 시행령』에 근거를 두고 있습니다.<br><br>
			<strong>충청북도자치연수원은 별도의 설명이 없는 한 충청북도의 개인정보처리방침을 준수합니다.</strong> </p>

		<h2 class="top_mar10">홈페이지 이용자의 개인정보보호</h4>
		<h3 class="top_mar10">홈페이지 회원관리 </h3>
		     <p class="left_mar20">개인정보를 다음의 목적을 위해 처리합니다. <br>처리한 개인정보는 다음 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.</p>
		<h4 class="top_mar10">홈페이지 회원관리</h4>
	      	<p class="left_mar40 top_mar5">회원가입 및 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인 식별, 부정이용 방지, 비인가 사용방지, 
	가입의사 확인, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 
	기록보존, 불만처리 등 민원처리, 고지사항 전달 등을 목적으로 처리합니다.</p>    
		<h3 class="top_mar10">개인정보의 보존근거 및 보존기간, 목적외 사용금지</h3>
		 <p class="left_mar20">개인정보의 보존근거 및 보존기간은 아래와 같이 처리되며 회원가입 시 동의에 의해 수집되고 회원 탈퇴시 즉시 삭제되며 
	홈페이지 운영 이외에는 사용이 금지됩니다.</p>
		<ul class="ico001h3 top_mar5">
			<li>보존근거 : 정보통신망 이용촉진 및 정보보호 등에 관한법률 제22조</li>
			<li>보존기간 : 탈퇴 의사 후 즉시 삭제</li>
			<li>수집하는 개인정보는 성명/주소/전화번호/e-mail/휴대폰번호</li>
		</ul>

		<h3 class="top_mar10">개인정보의 제3자 제공에 관한 사항(해당되는 경우에만 적용)</h3>
		<p class="left_mar20 ">충청북도에서는 개인정보를 제3자에게 제공할 경우 제공목적 및 범위는 다음과 같습니다</p>
		<ul class="ico001h3  top_mar5">
			<li>제공받는 기관(자)/제공근거및목적/제공하는 개인정보의 항목/  제공받는 자의 개인정보 보유 및 이용 기간</li>
		</ul>

		<h3 class="top_mar20">개인정보처리의 위탁에 관한 사항</h3>
		<p class="left_mar20 ">충청북도자치연수원 홈페이지의 안정적 운영을 위하여 아래와 같이 유지보수 계약을 체결하여 운영하고 있으며 다음 사항을준수할 것입니다.</p>
		<h4>유지보수 계약자 현황</h4>
			 <ul class="ico001h3 top_mar5">
				<li>사업자명 : 주식회사 인포빌</li>
				<li>주    소 : 충북 청주시 상당구 상당로 314(내덕동) 청주문화산업단지</li>
				<li>전화번호 : 043-294-6643</li>
				<li>근무시간 : 09:00 ~ 18:00</li>
			</ul>
		 <p class="left_mar10  top_mar10">위탁계약 시 개인정보보호 관련 법규의 준수, 개인정보에 관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 서면 및 전자 보관하고 있으며, 업체 변경시 공지사항 및 개인정보처리 방침을 통해 고지하겠습니다.</p>

		<h3 class="top_mar20">정보주체의 권리 · 의무 및 그 행사에 관한 사항</h3>
		<p class="left_mar20 ">홈페이지 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>
			<ul class="ico001h3 top_mar5">
				<li>자신 및 14세 미만 아동의 개인정보의 조회, 수정 및 가입 해지의 요청</li>
				<li>개인정보의 오류에 대한 정정 및 삭제의 요청</li>
				<li>개인정보의 조회, 수정 및 해지, 삭제 등의 요청은 개인정보 변경/회원정보수정 및 가입해지/회원탈퇴/동의철회 등을클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정, 혹은 탈퇴가 가능합니다.</li>
				<li>이용자가 개인정보의 오류에 대한 정정 및 삭제를 요청한 경우에는 정정 및 삭제를 완료할 때 까지 당해 개인정보를 이용 또는 제공하지 않습니다. 이 경우, 잘못된 개인정보를 이용 또는 제공한 경우 지체 없이 수정하겠습니다.</li>
				 <li>이용자의 요청에 의해 해지 또는 삭제되는 개인정보는 개인정보의 처리 및 보유 기간에 따라 처리합니다.</li>
			</ul>
	   <h3 class="top_mar20">처리하는 개인정보 항목</h3>
		<p class="left_mar20 ">충청북도자치연수원이 운영하는 홈페이지는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적/물리적 조치를 하고 있습니다.</p>
			<ul class="ico002 top_mar5">
				<li>개인정보의 암호화 
					 <ul>
						 <li>이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등 별도 보안기능을 사용하고 있습니다.</li>
					 </ul>
				</li>
				 <li>해킹 등에 대비한 기술적 대책
					 <ul>
						 <li>해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</li>
					 </ul>
				</li>
				 <li>개인정보처리시스템 접근 제한
					 <ul>
						 <li>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통해 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</li>
					 </ul>
				</li>
				 <li>개인정보 취급 직원의 최소화 및 교육
					 <ul>
						 <li>개인정보를 취급하는 직원을 지정하고 담당자의 권한을 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.</li>
					 </ul>
				</li>     
			</ul>
		<h3 class="top_mar20">개인정보 유출사고 대응절차 및 유출신고, 정보제공 중단</h3>
		<p class="left_mar20 ">개인정보의 유출이라 함은 법령이나 개인정보처리자의 자유로운 의사에 의하지 않고, 정보주체의 개인정보에 대하여 개인정보처리자가 통제를 상실하거나 또는 권한 없는 자의 접근을 허용한것으로서, 다음 각 호의 어느 하나에 해당하는 경우를 말합니다. </p>
		<h4>개인정보가 포함된 서면, 이동식 저장장치, 휴대용 컴퓨터 등을 분실하거나 도난당한 경우</h4>
		<h4>개인정보가 저장된 데이터베이스 등 개인정보처리시스템에 정상적인 권한이 없는 자가 접근한 경우</h4>
		<h4>개인정보처리자의 고의 또는 과실로 인해 개인정보가 포함된 파일 또는 종이문서, 기타 저장매체가 권한이 없는 자에게 잘못 전달된경우</h4>
		<h4>기타 권한이 없는 자에게 개인정보가 전달되거나 개인정보처리시스템등에 접근 가능하게 된 경우</h4>
			<ul class="ico002 top_mar10">
				<li>대응절차
					 <ul>
						 <li class="ico002No">개인정보 유출 사고가 발생한 것으로 확인된 때에는정당한  사유가 없는 한 5일 이내에 해당 정보주체에게 다음 각호의 사항을 알려드리겠습니다.</li>
						 <li>유출된 개인정보의 항목</li>
						 <li>유출된 시점과 그 경위</li>
						 <li>유출로 발생할 수 있는 피해를 최소화하기 위하여 정보주체가 할 수 있는 방법 등에 관한 정보</li>
						 <li>개인정보처리자의 대응조치 및 피해구제절차</li>
						 <li>피해가 발생한 경우 신고 등을 접수할 수 있는 담당부서 및 연락처 개인정보 유출사실을 통지할 때에는 서면, 전자우편, 모사전송,전화, 휴대전화 문자전송 또는 이와 유사한 방법을 통하여 지체없이 정보주체에게 알려드리고 홈페이지에 공지 하겠습니다.</li>
					 </ul>
				</li> 
			</ul>
			<ul class="ico002 top_mar10">
				<li>개인정보 유출사고 신고절차
					 <ul>
						 <li class="ico002No">1만명 이상 개인정보가 유출된 경우에는 정보주체에 대한 통지 및 조치결과를 5일 이내에 행정안전부장관 또는 한국인터넷진흥원장에게 신고하고 홈페이지에 정보주체가 알아보기 쉽도록 7일 이상        게재하겠습니다.</li>
					 </ul>
				</li> 
			</ul> 
			<ul class="ico002 top_mar10">
				<li>개인정보 유출시 정보제공 중단
					 <ul>
						 <li class="ico002No">개인정보를 연계?제공한 대상기관이 다른 기관에 개인정보를 재 제공한 사실이 확인되거나 개인정보 유출로 인한 사고가 발생하였음을 인지한 경우 즉시 제공을 중단하겠습니다.</li>
					 </ul>
				</li> 
			</ul>     
		 
		 <h3 class="top_mar20">권익침해 구제방법</h3>  
		 <p class="left_mar20 ">개인정보주체는 개인정보 침해로 인한 구제를 받기 위하여 개인  정보 분쟁조정위원회, 한국인터넷진흥원 개인정보 침해신고센터,개인정보보호 종합지원시스템 등에 분쟁 해결이나 상담 등을 신청할 수 있습니다.
		이 밖에 기타 개인정보침해의 신고 및 상담에 대하여는 아래기관에  문의하시기 바랍니다.</p> 
			<h4>개인분쟁조정위원회        :  118번(ARS 내선 3번) </h4> 
			<h4>정보보호마크인증위원회    : 02-580-0533~4</h4>
			<h4>대검찰청 첨단범죄수사과   : 02-3480-2000</h4>
			<h4>경찰청 사이버테러대응센터 : 02-392-0330 </h4>
			<h4>인터넷신고 : 개인정보보호 종합지원시스템 홈페이지<a target="_blank" href="http://www.privacy.go.kr">(www.privacy.go.kr)</a></h4>
		 <h3 class="top_mar20">개인정보 분야별 책임자 및 담당자 연락처</h3>  
		  <p class="left_mar20 ">충청북도자치연수원의 홈페이지 이용 중 개인정보의 유출 가능성 등 정보주체의 권익이 침해될 우려가 있는 사실을 발견하였을 경우 다음 연락처로 알려주시기 바랍니다. </p> 
		   <ul class="ico002 top_mar10">
				<li>충청북도자치연수원 개인정보 보호책임자(CPO)
					 <ul>
						 <li>충청북도 자치연수원장 오 진 섭</li>
					 </ul>
				</li>
				<li>충청북도자치연수원 개인정보 보호담당자
					 <ul>
						 <li>성    명 : 오 경 선</li>
						 <li>전화번호 : 043)220-5462 / 팩스번호 : 043)220-5439 </li>
						 <li>이 메 일 : oks126@korea.kr</li>
					 </ul>
				</li>  
			</ul>
</div>
<div class="top_mar20 info" id="info2" style="display:none;">

		<h2 class="top_mar10">컴퓨터에 의해 처리되는 개인정보보호</h2>
        <p>충청북도자치연수원은 법령의 규정과 정보주체의 동의에 의해서만 개인정보를 수집·보유하고 있습니다.<br>
    충청북도자치연수원이 수집·보유하고 있는 개인정보보유파일 명칭, 법적근거, 보유목적, 기록되는 주요항목, 수집방법, 보유기간 등은 다음과 같습니다.</p>
		<h3 class="top_mar10">수집·보유하고 있는 개인정보파일</h3>
           <table cellspacing="0" cellpadding="0" class="center" summary="구분,과목명,비고에 대한 정보테이블 입니다.">
  <caption>
  소양교과 운영
  </caption>
    <colgroup>
                <col width="30%">
                <col width="*%">
            </colgroup>
  <tbody>
    <tr>
      <th class="first">개인정보파일명</th>
      <td>교육관리(교육관리시스템)</td>
    </tr>
    <tr>
      <th class="first">보 유 (법 적) 근 거</th>
      <td>지방공무원교육법 제8조, 동법 시행령 제11조</td>
    </tr>
    <tr>
      <th class="first">보 유 목 적</th>
      <td>교육관리업무(교육계획, 교육운영, 강사관리 등) 추진</td>
    </tr>
    <tr>
      <th class="first">주 요 항 목</th>
      <td>성명, 주민번호, 주소, 이메일, 연락처, 소속정보, 계좌번호(강사)</td>
    </tr>
    <tr>
      <th class="first">수 집 방 법</th>
      <td>공무원 : 시스템 연계를 통한 수집<br />
강 사 : 정보주체의 동의(오프라인 동의서)</td>
    </tr>
    <tr>
      <th class="first">보 유 기 간</th>
      <td>준영구</td>
    </tr>
    
  </tbody>
</table>

        <h3 class="top_mar10">개인정보의 처리목적, 목적외 사용 금지</h3>
        <p class="left_mar40 top_mar5">충청북도자치연수원은 교육관리시스템 개인정보를 다음의 목적을위해 처리합니다. 처리한 개인정보는 다음 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할       예정입니다.<br>
        충청북도자치연수원을 통한 모든 교육훈련에 대한 교육계획, 과정운영, 이수평가 및 관련기관 통보를 위하여 개인정보를 처리합니다.</p>  
        <h3 class="top_mar10">개인정보의 보존근거 및 보존기간</h3>
        <p class="left_mar40 top_mar5">충청북도자치연수원 교육관리시스템의 개인정보 보존근거 및 보존기간은 아래와 같습니다.</p>    
		<h3 class="top_mar10">개인정보의 보존근거 및 보존기간, 목적외 사용금지</h3>
        <ul class="ico001h3 top_mar5">
			<li>보존근거 : 정보통신망 이용촉진 및 정보보호 등에 관한법률 제22조 지방공무원교육법 제8조, 동법 시행령 제11조</li>
			<li>보존기간 : 준영구(공공기록물 관리에 관한 법률에 의거)<br>보존기간이 만료된 개인정보는  "공공기관 기록물관리법"에 따라 파기되며, 보존기간 만료에서 파기시까지는 별도의 DB에 관리함을 알려드립니다.</li>
		</ul>
  <h3 class="top_mar10">개인정보의 제3자 제공에 관한 사항</h3>
		<p class="left_mar20 ">충청북도자치연수원에서는 교육관리시스템 개인정보를 제3자에게 제공할 경우 제공목적 및 범위는 다음과 같습니다.</p>
        <ul class="ico001h3 top_mar5">
			<li>제공받는 기관(자) : 보험회사</li>
			<li>제공근거및목적 : 교육과정운영을 위한 현장학습 참가 교육생   및 인솔자에 대한 여행자 보험 가입</li>
            <li>제공하는 개인정보의 항목 : 소속, 성명, 주민등록번호</li>
            <li>제공받는 자의 개인정보 보유 및 이용 기간 : 보험계약기간 만료시까지</li>
		</ul>
		<p class="left_mar20 ">충청북도자치연수원은 제3자 제공시 목적 외 개인정보 처리금지 및 개인정보에 대한 접근제한 등 안전성 확보조치에 관한 사항등을 계약서에 포함하고, 정보주체의 동의없이 다른 기관에 개인정보를 재 제공한 사실이 확인되거나 개인정보 유출로 인한 사고가 발생하였음을 인지한 경우 즉시 제공을 중단하겠습니다.</p>

  <h3 class="top_mar20">개인정보처리의 위탁에 관한 사항</h3>
		<p class="left_mar20 ">충청북도자치연수원 교육관리시스템의 안정적 운영을 위하여 아래와 같이 유지보수 계약을 체결하여 운영하고 있으며 다음 사항을 준수할 것입니다.</p>
		<h3>유지보수 계약자 현황</h3>
			 <ul class="ico001h3 top_mar5">
				<li>사업자명 : 주식회사 인포빌</li>
				<li>주    소 : 충북 청주시 상당구 상당로 314(내덕동) 청주문화산업단지</li>
				<li>전화번호 : 043-294-6643</li>
				<li>근무시간 : 09:00 ~ 18:00</li>
			</ul>
		 <p class="left_mar10  top_mar10">위탁계약 시 개인정보보호 관련 법규의 준수, 개인정보에 관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 서면 및 전자 보관하고 있으며, 업체 변경시 공지사항 및 개인정보처리 방침을 통해 고지하겠습니다.</p>

		<h3 class="top_mar20">정보주체의 권리·의무 및 그 행사에 관한 사항</h3>
		<p class="left_mar20 ">교육관리시스템 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>
			<ul class="ico001h3 top_mar5">
				<li>개인정보의 조회, 수정 및 오류에 대한 정정 및 삭제의 요청</li>
				<li>개인정보의 조회, 수정 등은 본인이 시스템 로그인 후 ‘개인정보수정’을 통해 가능합니다.</li>
				<li>이용자가 개인정보의 오류에 대한 정정 및 삭제를 요청한 경우  에는 정정 및 삭제를 완료할 때 까지 당해 개인정보를 이용  또는 제공하지 않습니다. 이 경우, 잘못된 개인정보를 이용 또는 제공한 경우 지체 없이 수정하겠습니다.</li>
				<li>이용자의 요청에 의해 해지 또는 삭제되는 개인정보는 개인  정보의 처리 및 보유 기간에 따라 처리합니다.</li>
			</ul>
	   <h3 class="top_mar20">개인정보 파기절차 및 방법</h3>
		<p class="left_mar20 ">교육관리시스템 이용자의 개인정보는 “공공기관 기록물관리법”에 따라 파기절차를 거칩니다. </p>
			<ul class="ico002 top_mar5">
				<li>파기 절차 
				  <ul>
						 <li>목적이 달성된 개인정보는 기록물 파기심의를 거치는 동안 별도의 DB로 옮겨져(종이의 경우에는 별도의 서류함에 보관) 일정기간 보관 후 파기됩니다.</li>
					 </ul>
				</li>
				 <li>파기 방법
				   <ul>
						 <li>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
                         <li>전자적파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
					 </ul>
				</li>     
			</ul>
		<h3 class="top_mar20">개인정보의 안전성 확보조치</h3>
		<p class="left_mar20 ">충청북도자치연수원이 운영하는 교육관리시스템은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적/물리적 조치를 하고 있습니다.</p>
		<h3>개인정보의 암호화</h3>
  <p class="left_mar40 ">이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리 되고 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등 별도 보안기능을 사용하고 있습니다.</p>
		<h3>해킹 등에 대비한 기술적 대책</h3>
  <p class="left_mar40 ">해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</p>
        <h3>개인정보처리시스템 접근 제한</h3>
        <p class="left_mar40 ">개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통해 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</p>
        <h3>개인정보 취급 직원의 최소화 및 교육</h3>
        <p class="left_mar40 ">개인정보를 취급하는 직원을 지정하고 담당자의 권한을 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</p>
        <h3 class="top_mar20">개인정보 유출사고 대응절차 및 유출신고, 정보제공 중단</h3>
        <p class="left_mar20 ">개인정보의 유출이라 함은 법령이나 개인정보처리자의 자유로운 의사에 의하지 않고, 정보주체의 개인정보에 대하여 개인정보처리자가 통제를 상실하거나 또는 권한 없는 자의 접근을 허용한 것으로서,다음 각 호의 어느 하나에 해당하는 경우를 말합니다.</p>
        <h3>개인정보가 포함된 서면, 이동식 저장장치, 휴대용 컴퓨터 등을 분실하거나 도난당한 경우</h3>
        <h3>개인정보가 저장된 데이터베이스 등 개인정보처리시스템에 정상적인 권한이 없는 자가 접근한 경우</h3>
        <h3>개인정보처리자의 고의 또는 과실로 인해 개인정보가 포함된 파일 또는 종이문서, 기타 저장매체가 권한이 없는 자에게 잘못 전달된 경우</h3>
        <h3>기타 권한이 없는 자에게 개인정보가 전달되거나 개인정보처리시스템 등에 접근 가능하게 된 경우</h3>
  <ul class="ico002 top_mar5">
				<li>대응절차
					 <ul>
						 <li>개인정보 유출 사고가 발생한 것으로 확인된 때에는정당한 사유가 없는 한 5일 이내에 해당 정보주체에게 다음 각호의 사항을 알려드리겠습니다.</li>
                         <li>유출된 개인정보의 항목</li>
                         <li>유출된 시점과 그 경위</li>
                         <li>유출로 발생할 수 있는 피해를 최소화하기 위하여 정보주체가 할 수 있는 방법 등에 관한 정보</li>
                         <li>개인정보처리자의 대응조치 및 피해구제절차</li>
                         <li>피해가 발생한 경우 신고 등을 접수할 수 있는 담당부서 및 연락처 개인정보 유출사실을 통지할 때에는 서면, 전자우편, 모사전송, 전화, 휴대전화 문자전송 또는 이와 유사한 방법을 통하여 지체없이 정보주체에게 알려드리고 홈페이지에 공지 하겠습니다.</li>
					 </ul>
				</li>  
                <li>개인정보 유출사고 신고절차
					 <ul>
						 <li>1만명 이상 개인정보가 유출된 경우에는 정보주체에 대한 통지 및 조치결과를 5일 이내에 행정안전부장관 또는 한국인터넷진흥원장에게 신고하고 홈페이지에 정보주체가 알아보기 쉽도록 7일 이상        게재하겠습니다.</li>
					 </ul>
				</li> 
                <li>개인정보 유출시 정보제공 중단
					 <ul>
						 <li>개인정보를 연계?제공한 대상기관이 정보주체의 동의없이 다른 기관에 개인정보를 재 제공한 사실이 확인되거나 개인정보 유출로 인한 사고가 발생하였음을 인지한 경우 즉시 제공을 중단하겠습니다.</li>
					 </ul>
				</li>    
  </ul>
        <h3 class="top_mar20">권익침해 구제방법</h3>
        <p class="left_mar20 ">개인정보주체는 개인정보 침해로 인한 구제를 받기 위하여 개인  정보 분쟁조정위원회, 한국인터넷진흥원 개인정보 침해신고센터,개인정보보호 종합지원시스템 등에 분쟁 해결이나 상담 등을 신청할 수 있습니다.<br>이 밖에 기타 개인정보침해의 신고 및 상담에 대하여는 아래기관에 문의하시기 바랍니다.</p>
        <h3>개인분쟁조정위원회 : 118번(ARS 내선 3번)</h3>
        <h3>정보보호마크인증위원회 : 02-580-0533~4</h3>
        <h3>대검찰청 첨단범죄수사과 : 02-3480-2000</h3>
        <h3>경찰청 사이버테러대응센터 : 02-392-0330 </h3>
        <h3>인터넷신고 :개인정보보호 종합지원시스템 홈페이지 <a target="_blank" href="http://www.privacy.go.kr/">(www.privacy.go.kr)</a></h3>
        <h3 class="top_mar20">개인정보 분야별 책임자 및 담당자 연락처</h3>
        <p class="left_mar20 ">충청북도자치연수원의 교육관리시스템 이용 중 개인정보의 유출 가능성 등 정보주체의 권익이 침해될 우려가 있는 사실을 발견 하였을 경우 다음 연락처로 알려주시기 바랍니다.</p>
            <ul class="ico002 top_mar5">
                <li>충청북도자치연수원 개인정보 보호책임자(CPO)
                     <ul>
                         <li>충청북도 자치연수원장 오 진 섭</li>
                     </ul>
                </li>  
                <li>충청북도자치연수원 개인정보 보호담당자
                     <ul>
                         <li>성    명 : 오 경 선</li>
                         <li>전화번호 : 043)220-5462 / 팩스번호 : 043)220-5439 </li>
                         <li>이 메 일 : oks126@korea.kr</li>
                     </ul>
                </li>    
            </ul>
			
</div>
<div class="top_mar20 info" id="info3" style="display:none;">
		<h2 class="top_mar10">영상정보처리기기 설치·운영  </h2>
        <h3 class="top_mar10">영상정보처리기기의 설치 </h3>
        <ul class="ico002 top_mar5">
                <li>적용범위 
                     <ul>
                         <li>공개된 장소에 영상정보처리기기를 설치 운영하거나 이 기기를 통하여 개인영상정보를 처리하는 경우를 대상으로 합니다. </li>
                     </ul>
                </li>  
                <li>영상정보처리기기 운영·관리 방침
                     <ul>
                         <li>영상정보처리기기 운영자는 영상정보처리기기 운영·관리 방침을 수립하거나 변경하는 경우에는 정보주체가 쉽게 확인할 수 있도록 공개하여야 합니다. </li>
                         <li>영상정보처리기기 설치?운영에 관한 사항을 개인정보보호법 제30조에 따른 개인정보 처리방침에 포함하여 정할 수 있으며, 영상정보처리기기 운영?관리 방침을 마련한 경우에는 개인
       정보보호법 제30조에 따른 개인정보처리방침을 정하지 아니 할 수 있습니다.</li>
                     </ul>
                </li> 
                <li>관리책임자의 지정
                     <ul>
                         <li>영상정보처리기기 운영자는 법 규정에 따라 개인영상정보의 처리에 관한 업무를 총괄하는 개인영상정보 보호책임자를 지정하고 있습니다.</li>
                         <li>제1항의 보호책임자는 개인정보보호법 제31조 제2항에 따른 개인정보 보호를 위한 다음 각 호의 업무를 수행합니다.<br>
                            1. 개인영상정보 보호 계획의 수립 및 시행<br>
                            2. 개인영상정보 처리 실태 및 관행의 정기적인 조사 및 개선<br>
                            3. 개인영상정보 처리와 관련한 불만의 처리 및 피해구제<br>
                            4. 개인영상정보 유출 및 오용?남용 방지를 위한 내부통제 시스템의 구축<br>
                            5. 개인영상정보 보호 교육 계획 수립 및 시행<br>
                            6. 개인영상정보 파일의 보호 및 파기에 대한 관리?감독<br>
                            7. 그 밖에 개인영상정보의 보호를 위하여 필요한 업무
                         </li>
                         <li>개인정보보호법 제31조에 따라 지정된 개인정보 보호책임자는 개인영상정보 보호업무를 수행합니다. </li>
                     </ul>
                </li>
                <li>사전의견 수렴
                     <ul>
                         <li>영상정보처리기기의 설치, 설치목적 변경에 따른 추가 설치시 사전에 관계 전문가 및 이해관계인의 의견을 수렴하고 있습니다.</li>
                     </ul>
                </li> 
                <li>안내판의 설치
                     <ul>
                         <li>영상정보처리기기 운영자는 정보주체가 영상정보처리기기가 설치·운영 중임을 쉽게 알아볼 수 있도록 개인정보보호법 제25조제4항 본문에 따라 다음 각 호의 사항을 기재한 안내판 설치 등 필요한 조치하고 있습니다.<br>
                        1. 설치목적 및 장소<br>
                        2. 촬영범위 및 시간<br>
                        3. 관리책임자의 성명 또는 직책 및 연락처  <br>
                        4. 영상정보처리기기 설치·운영에 관한 사무를 위탁하는 경우, 수탁 업체명/주소/전화번호/근무시간을 작성</li>
                        <li>제1항에 따른 안내판은 촬영범위 내에서 정보주체가 알아보기쉬운 장소에 누구라도 용이하게 판독할 수 있게 설치되어야 하며, 영상정보처리기기 안내판 크기, 설치위치 등은 자율적으로 정할 수 있습니다.</li>
                     </ul>
                </li>        
            </ul>
            
            
		<h3 class="top_mar10">영상정보 수집 및 보유</h3>
		     <p class="left_mar20">충청북도자치연수원은 CCTV 설치목적에 부합되는 필요최소한의 범위 안에서만 화상 정보를 수집하며, CCTV에 의하여 수집된 영상정보는 수집 시 명시한 보유기간 만료 시 즉시 삭제하고 있습니다. 자치연수원에서 교육운영 및 공익 목적을 위해 설치 운영 중인 폐쇄회로 텔레비전(CCTV) 현황은 아래와 같습니다. </p>
             <h4 class="top_mar10">청사 방범용 폐쇄회로 텔레비전(CCTV)</h6>
                <table cellpadding="0" summary="청사 방범용 폐쇄회로 텔레비전(CCTV) 대한 정보테이블 입니다." class="tb_list">
                <caption><span>청사 방범용 폐쇄회로 텔레비전(CCTV)</span></caption>
                <colgroup>
                    <col width="30%">
                    <col width="*%">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="first">담    당    부    서</th>
                        <td>행정지원과</td>
                    </tr>
                    <tr>
                        <th class="first">책 임 관  및  연 락 처</th>
                        <td>행정지원과장(☎ 043-220-5412)</td>
                    </tr>
                    <tr>
                        <th class="first">카 메 라  대 수  및  위 치</th>
                        <td>6대(청사 각 모퉁이, 외곽주변, 본관내부, 초소입구)</td>
                    </tr>
                    <tr>
                        <th class="first">C C T V   촬  영  시  간</th>
                        <td>상시(24시간)</td>
                    </tr>
                    <tr>
                        <th  class="first">화 상 정 보  보 유 기 간</th>
                        <td>30일</td>
                    </tr>
                    <tr>
                        <th class="first">안내판 규격(가로*세로)</th>
                        <td>420*300</td>
                    </tr>
                </tbody>
                </table>
                
                <h4 class="top_mar10">조정실 교육기자재 모니터링 폐쇄회로 텔레비전(CCTV)</h6>
                <table cellpadding="0" summary="조정실 교육기자재 모니터링 폐쇄회로 텔레비전(CCTV) 대한 정보테이블 입니다." class="tb_list">
                <caption><span>조정실 교육기자재 모니터링 폐쇄회로 텔레비전(CCTV)</span></caption>
                <colgroup>
                    <col width="30%">
                    <col width="*%">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="first">담    당    부    서</th>
                        <td>교육운영과</td>
                    </tr>
                    <tr>
                        <th class="first">책 임 관  및  연 락 처</th>
                        <td>교육운영과장(☎ 043-220-5445)</td>
                    </tr>
                    <tr>
                        <th class="first">카 메 라  대 수  및  위 치</th>
                        <td>10대(대강당, 2~7 강의실, 1,2정보화교육장, 어학실)</td>
                    </tr>
                    <tr>
                        <th class="first">C C T V   촬  영  시  간</th>
                        <td>교육과정 운영시(일 9시간)</td>
                    </tr>
                    <tr>
                        <th class="first">화 상 정 보  보 유 기 간</th>
                        <td>저장장치 없음</td>
                    </tr>
                    <tr>
                        <th class="first">안내판 규격(가로*세로)</th>
                        <td>297*210</td>
                    </tr>
                </tbody>
                </table>
              
		 <h3 class="top_mar10">CCTV 영상정보의 열람 등의 요청</h3>
		 <p class="left_mar20">정보주체는 충청북도자치연수원이 보유하고 있는 CCTV 영상정보를 개인정보보호법(다른 법률에 규정이 있는 경우는 해당 법률)의 규정이 정하는 바에 따라 영상정보의 존재확인 및 열람·삭제를 요청할 수 있습니다.<br>다만, 다음 사항에 해당하는 경우에는 청구사항에 대하여 거절할 수 있으며, 이 경우 10일 이내에 거절사유 등을 정보주체에게 통지하여 드립니다. </p>
		<ul class="ico001h3 top_mar5">
			<li>범죄수사·공소유지?재판수행에 중대한 지장을 초래하는 경우</li>
			<li>특정 정보주체의 영상정보만을 삭제하는 것이 기술적으로 현저히 곤란한 경우 </li>
			<li>열람 등의 요청에 따른 필요한 조치를 취함으로써 타인의 사생활권이 침해될 우려가 큰 경우 </li>
            <li>기타 열람 등의 요청을 거절할 만한 정당한 공익적 사유가 존재하는 경우</li>
		</ul>
        <h4 class="top_mar10"> [개인영상정보 열람 시 유의사항]</h4>
		<p class="left_mar20 ">정보주체의 요청에 의해 개인영상정보를 열람할 경우 CCTV 녹화 화면에 정보주체가 아닌 타인의 영상정보가 있을 경우 타인의 영상정보는 Masking을 처리한 후 열람할 수 있습니다.</p>
        <p class="left_mar20 "> ※ Masking : CCTV에 의해 포착된 사람을 육안으로 확인하지 못하도록 화면을 흐리게 하거나 모자이크 처리를 통해 식별할 수 없도록 하는 것</p>

		<h3 class="top_mar20">개인영상정보 이용·제3자 제공 등 제한</h3>
		<p class="left_mar20 ">충청북도자치연수원이 보유하고 있는 CCTV 영상정보는 CCTV 설치목적 외의 용도로 활용되거나 접근권한을 부여받은 자 이외의 타인에게 열람·제공하지 않고 있으며 달리 이용 및 제공시 법 규정에 따라 처리하고 있습니다.<br>개인정보를 제3자에게 제공할 경우 제공목적 및 범위는 다음과 같습니다. </p>
		<h4>제공받는 기관(자)/제공근거및목적/제공하는 개인정보의 항목/   제공받는 자의 개인정보 보유 및 이용 기간</h4>
			 

		<h3 class="top_mar20"> CCTV 위탁관리</h3>
		<p class="left_mar20 ">충청북도자치연수원은 CCTV 설치 및 관리에 관한 사무를 일정 한 요건을 갖춘 다른 공공기관이나 CCTV 전문 민간업체 등의 전문기관에 위탁할 수 있습니다.<br>
        위탁계약 시 개인정보보호 관련 법규의 준수, 개인정보에 관한  제3자 제공 금지 등 위탁자의 준수사항 및 위탁자의 책임부담 등을 명확히 규정하고 있으며, 당해 계약 내용은 서면 및 전자 보관하고 있으며, 업체 변경시 공지사항 및 개인정보처리 방침을 통해 고지하겠습니다.</p>
			 <ul class="ico002 top_mar5">
                <li>[수탁기관의 요건]
                     <ul>
                         <li>개인정보보호에 필요한 전문 장비 및 기술을 갖춘 기관 </li>
                         <li>수탁받은 업무를 수행하는데 필요한 전문 인력을 갖춘 기관 </li>
                     </ul>
                </li>     
            </ul>
	   <h3 class="top_mar20"> CCTV 안내판 설치</h3>
		<p class="left_mar20 ">충청북도자치연수원은 CCTV를 설치한 장소마다 <strong>설치 목적·장소, 촬영 범위·시간, 관리 책임자·연락처 </strong>등을 명시한 안내판을 설치하여 여러분들이 쉽게 인식할 수 있도록 하고 있습니다.<br>다만, 다음과 같은 경우는 예외적으로 처리하고 있습니다.</p>
        
         <table cellpadding="0" summary="안내판 설치 예외사항,설치장소 대한 정보테이블 입니다." class="center">
                <caption>CCTV 안내판 설치</caption>
                <colgroup>
                    <col width="60%">
                    <col width="*%">
                </colgroup>
                <thead>
                     <tr>
                          <th class="first" scope="col">안내판 설치 예외사항</th>
                          <th scope="col">설치장소</th>
                      </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="first">공공기관 건물 안에 다수의 CCTV를 설치한 경우</td>
                        <td>건물입구에만 설치</td>
                    </tr>
                    <tr>
                        <td class="first">개인정보침해 위험이 적은 경우 또는 안내판 설치가 어려운 경우</td>
                        <td>안내판 미설치 인터넷 사이트에 관련 사실 게재</td>
                    </tr>
                    <tr>
                        <td class="first">안내판 설치로 인해 보안취약점 노출이 우려되는 군사시설, 국가중요시설, 보안목표 시설 등</td>
                        <td>안내판 미설치</td>
                    </tr>
                </tbody>
                </table>
                
		<h3 class="top_mar20">CCTV 총괄·운영 책임관의 지정</h3>
		<p class="left_mar20 ">충청북도자치연수원은 CCTV 영상정보에 대한 안전한 관리를 위해 총괄책임자와 운영책임관을 지정·운영하고 있습니다.<br>총괄책임자는 당해 공공기관의 CCTV 설치?운영, CCTV 관련 민원의 접수 및 처리, 영상정보의 수집·처리에 따른 개인정보보호 업무를 총괄하며 운영책임자는 CCTV 설치·운영과 관련한 업무를 수행하고 있습니다.</p>
			<ul class="ico002 top_mar10">
				<li>충청북도자치연수원 개인정보 보호책임자(CPO)
					 <ul>
						 <li class="ico002No">충청북도자치연수원장 오 진 섭</li>
					 </ul>
				</li> 
                <li>CCTV 운영책임관 : 각 CCTV 설치·운영 부서의 장</li> 
			</ul>
		 
		 
</div>
</body>
</html>