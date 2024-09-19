<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">

	function goInitMenu(menuNo, grandNo, main_url) 
	{
		if(menuNo != "")
		{
			var num = menuNo;
			// 부모값이 0이 아니면 변경해준다. (부모값이 0일때가 1단계 메뉴 값임)
			if(grandNo != '0')
				num = grandNo;
				
			parent.iframe_Main.location.href = main_url;
			parent.iframe_Left.location.href = 'mainMenu.act?task=left_list&parent='+num;
		}else{
			parent.location.href = "/";
		}
	}
</script>
<div id="leftContent">
  <div class="request">
    <h2 class="hide">나의수강내역</h2>
    <p class="banner"> <a href="/extMylcLecture.act?task=list" target="iframe_Main"><img src='/images/banner_01.gif' alt="나의수강내역→수강하신 교육과정의 내역을 확인하세요" /></a></p>
    <div class="linkList">
      <ul>
        <li class="linkBanner01"><a href="http://cb21.coti.go.kr/client/index.html" target="_blank" title="사이버교육센터[새창]"><img src='/images/banner_02.gif' alt="사이버교육센터 자치연수원 사이버교육센터의 바로가기 링크입니다." /></a></li>
        <li class="linkBanner02"><a href="http://loti.cb21.net" target="_blank" title="자치연수원[새창]"><img src='/images/banner_03.gif' alt="자치연수원 홈페이지 자치연수원 홈페이지의 바로가기 링크입니다." /></a></li>
        <li class="linkBanner03"><a href="/mainMenu.act?task=left_list&parent=78" target="iframe_Left" onclick="parent.iframe_Main.location.href='/extBordQNA.act?task=list'"><img src='/images/banner_04.gif' alt="Q&amp;A 궁금하신 사항이 있으시면 언제든지 문의해주세요." /></a></li>
        <li class="linkBanner04"><a target="_blank" href="<html:rewrite page="/extFindRoad.act?task=list"/>" title="새창"><img src='/images/banner_05.gif' alt="찾아오시는 길 자치연수원의 약도와 교통편을 자세히 안내해드립니다." /></a></li>
      </ul>
    </div>
  </div>
    <div class="footer">
  <h2 class="hide">주소안내</h2>
  <div>
    <p class="logo"><img alt="충청북도 CHUNGCHEONGBUKDO" src="/images/footerLogo.gif" /></p>
    </div>
    </div>
</div>
<%--
<table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="20">&nbsp;</td>
    <td width="180" valign="top"> 
      <table width="170" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="100"> 
            <table width="170" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background='<html:rewrite page="/images/banner_bg.gif"/>' height="92"> 
                  <table width="162" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td><a href='<html:rewrite page="/extMylcLecture.act?task=list"/>' target="iframe_Main"><img src='<html:rewrite page="/images/banner_05.gif"/>' alt="수강내역"></a></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EEEEEE" height="1"></td>
                    </tr>
                    <tr>
                      <td>
                      	<c:if test="${rsExtMain_BeginLeft.execPath != null}">
                      		<a href='<html:rewrite page="${rsExtMain_BeginLeft.execPath}"/>' target="iframe_Main"><img src='<html:rewrite page="/images/banner_06.gif"/>' alt="나의 초기메뉴"></a>
                      	</c:if>
                      	<c:if test="${rsExtMain_BeginLeft.execPath == null}">
                      		<a href="extMainBegin.act?task=list" target="iframe_Main"><img src='<html:rewrite page="/images/banner_06.gif"/>' alt="나의 초기메뉴"></a>
                      	</c:if>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td bgcolor="#EEEEEE" height="1"></td>
              </tr>
            </table>
          </td>
        </tr>
        <tr height="5">
        	<td></td>
        </tr>
        <tr> 
          <td><img src='<html:rewrite page="/images/title_info.gif"/>' alt="문의처" /></td>
        </tr>
        <tr> 
          <td><img src='<html:rewrite page="/images/tel.gif"/>' alt="과정안내 직무과정:053-803-5256 정보화과정 : 053-803-5217 외국어과정 : 053-803-5246 사이버과정 : 053-803-5246 교육진행 입교안내 : 053-803-5243" /></td>
        </tr> 
        <tr height="8">
        	<td></td>
        </tr>      
        <tr> 
          <td height="34" align="center"><a href="http://daegu.coti.go.kr/" target="_blank"><img src='<html:rewrite page="/images/banner_01.gif"/>' alt="대구광역시 사이버교육센터" /></a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
--%>