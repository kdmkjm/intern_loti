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
			// �θ��� 0�� �ƴϸ� �������ش�. (�θ��� 0�϶��� 1�ܰ� �޴� ����)
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
    <h2 class="hide">���Ǽ�������</h2>
    <p class="banner"> <a href="/extMylcLecture.act?task=list" target="iframe_Main"><img src='/images/banner_01.gif' alt="���Ǽ�������������Ͻ� ���������� ������ Ȯ���ϼ���" /></a></p>
    <div class="linkList">
      <ul>
        <li class="linkBanner01"><a href="http://cb21.coti.go.kr/client/index.html" target="_blank" title="���̹���������[��â]"><img src='/images/banner_02.gif' alt="���̹��������� ��ġ������ ���̹����������� �ٷΰ��� ��ũ�Դϴ�." /></a></li>
        <li class="linkBanner02"><a href="http://loti.cb21.net" target="_blank" title="��ġ������[��â]"><img src='/images/banner_03.gif' alt="��ġ������ Ȩ������ ��ġ������ Ȩ�������� �ٷΰ��� ��ũ�Դϴ�." /></a></li>
        <li class="linkBanner03"><a href="/mainMenu.act?task=left_list&parent=78" target="iframe_Left" onclick="parent.iframe_Main.location.href='/extBordQNA.act?task=list'"><img src='/images/banner_04.gif' alt="Q&amp;A �ñ��Ͻ� ������ �����ø� �������� �������ּ���." /></a></li>
        <li class="linkBanner04"><a target="_blank" href="<html:rewrite page="/extFindRoad.act?task=list"/>" title="��â"><img src='/images/banner_05.gif' alt="ã�ƿ��ô� �� ��ġ�������� �൵�� �������� �ڼ��� �ȳ��ص帳�ϴ�." /></a></li>
      </ul>
    </div>
  </div>
    <div class="footer">
  <h2 class="hide">�ּҾȳ�</h2>
  <div>
    <p class="logo"><img alt="��û�ϵ� CHUNGCHEONGBUKDO" src="/images/footerLogo.gif" /></p>
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
                      <td><a href='<html:rewrite page="/extMylcLecture.act?task=list"/>' target="iframe_Main"><img src='<html:rewrite page="/images/banner_05.gif"/>' alt="��������"></a></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#EEEEEE" height="1"></td>
                    </tr>
                    <tr>
                      <td>
                      	<c:if test="${rsExtMain_BeginLeft.execPath != null}">
                      		<a href='<html:rewrite page="${rsExtMain_BeginLeft.execPath}"/>' target="iframe_Main"><img src='<html:rewrite page="/images/banner_06.gif"/>' alt="���� �ʱ�޴�"></a>
                      	</c:if>
                      	<c:if test="${rsExtMain_BeginLeft.execPath == null}">
                      		<a href="extMainBegin.act?task=list" target="iframe_Main"><img src='<html:rewrite page="/images/banner_06.gif"/>' alt="���� �ʱ�޴�"></a>
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
          <td><img src='<html:rewrite page="/images/title_info.gif"/>' alt="����ó" /></td>
        </tr>
        <tr> 
          <td><img src='<html:rewrite page="/images/tel.gif"/>' alt="�����ȳ� ��������:053-803-5256 ����ȭ���� : 053-803-5217 �ܱ������ : 053-803-5246 ���̹����� : 053-803-5246 �������� �Ա��ȳ� : 053-803-5243" /></td>
        </tr> 
        <tr height="8">
        	<td></td>
        </tr>      
        <tr> 
          <td height="34" align="center"><a href="http://daegu.coti.go.kr/" target="_blank"><img src='<html:rewrite page="/images/banner_01.gif"/>' alt="�뱸������ ���̹���������" /></a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
--%>