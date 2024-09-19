<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf" %>
<script language="JavaScript">
	<!--
	function searchList(key)
	{
		selectFloor(key);
	}
	function selectFloor(floor)
	{									
		MM_swapImgRestore();
      	MM_swapImage('Image'+floor,'','${pageContext.request.contextPath}/images/course/'+floor+'_over.gif',1);
      	
  	document.all.floor.src 				= '${pageContext.request.contextPath}/images/course/floor_' + floor + '.gif';
  	document.all.floor_title.src 	= '${pageContext.request.contextPath}/images/course/text_' + floor + '.gif';
  	document.all.floor_title.alt 	= floor + '층';

	}
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="16"></td>
  </tr>
  <tr> 
    <td class="mBg"> 
      <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="38" background='<html:rewrite page="/images/board/title_bg.gif"/>'><img src='<html:rewrite page="/images/course/title_01.gif"/>' alt="교육장배치도" /></td>
        </tr>
        <tr> 
          <td height="15"></td>
        </tr>
        <tr> 
          <td> 
            <table width="700" border="0" cellspacing="0" cellpadding="0" align="center" height="385">
              <tr> 
                <td background='<html:rewrite page="/images/course/floor_bg.gif"/>'> 
                  <table width="680" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr> 
                      <td valign="top" width="110"> 
                        <table width="88" border="0" cellspacing="0" cellpadding="0" align="center">
                          <tr> 
                            <td height="80" align="center"><img id="floor_title" name="floor_title" src='<html:rewrite page="/images/course/text_3.gif"/>' alt="3층" /></td>
                          </tr>
                          <tr> 
                            <td height="30"><a href="#" onclick="selectFloor('3');" ><img name="Image3" src='<html:rewrite page="/images/course/3.gif"/>' alt="3층" /></a></td>
                          </tr>
                          <tr> 
                            <td height="30"><a href="#" onclick="selectFloor('2');" ><img name="Image2" src='<html:rewrite page="/images/course/2.gif"/>' alt="2층" /></a></td>
                          </tr>
                          <tr> 
                            <td height="30"><a href="#" onclick="selectFloor('1');" ><img name="Image1" src='<html:rewrite page="/images/course/1.gif"/>' alt="1층" /></a></td>
                          </tr>
                        </table>
                      </td>
                      <td background='<html:rewrite page="/images/course/dot_line.gif"/>' width="1"></td>
                      <td width="569" align="center"><img id="floor" name="floor" width="563" height="345" src='<html:rewrite page="/images/course/floor_3.gif"/>'/></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<script type="text/javascript">
<!--
	searchList(1);
//-->
</script>
