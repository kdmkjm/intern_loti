<%-- 
- 모듈명: 처리중 표시 레이어
- 설명: 다음단계로 진행 중 처리시간이 오래 걸릴경우 메시지 출력

- 작성자: 사원 서동찬
- 작성일: 2008.04.24
--%>
<%@ page contentType="text/html;charset=euc-kr" %>

<script language="javascript">
function processingShow() {
	processingLayer.style.display = "block";
	
	var selectObj = document.getElementsByTagName("select");
	for(var i = 0; i < selectObj.length; i++) {
		selectObj[i].onresizestart = selectObj[i].onmousedown;
		selectObj[i].ondblclick = selectObj[i].onmousedown = function() {
			event.srcElement.disabled = true;
			setTimeout("var selectObj = document.getElementsByTagName(\"select\");" +
								 "for(var i = 0; i < selectObj.length; i++) {" +
								 "	selectObj[i].disabled = false;" +
								 "}", 0);
		}
		if(selectObj[i].onresizestart == null) {
			selectObj[i].onresizestart = "NO_EVENT";
		}
	}
}
function processingHide() {
	processingLayer.style.display = "none";
	
	var selectObj = document.getElementsByTagName("select");
	for(var i = 0; i < selectObj.length; i++) {
		if(selectObj[i].onresizestart == "NO_EVENT") {
			selectObj[i].onresizestart = selectObj[i].ondblclick = null;
			selectObj[i].onmousedown = selectObj[i].onresizestart;
		} else if(selectObj[i].onresizestart != null) {
			selectObj[i].onmousedown = selectObj[i].onresizestart;
			selectObj[i].onresizestart = selectObj[i].ondblclick = null;
		} 
	}
}
//flashShow(파일경로, 가로, 세로, 이름, 배경색, 윈도우모드)
function flashShow(url,w,h,name,bg,win){
	var flashStr=
		"<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' id='"+name+"' align='middle'>"+
		"<param name='movie' value='"+url+"' />"+
		"<param name='wmode' value='"+win+"' />"+
		"<param name='menu' value='false' />"+
		"<param name='quality' value='high' />"+
		"<param name='bgcolor' value='"+bg+"' />"+
		"</object>";
		//네스케이프
		//"<embed src='"+url+"' wmode='"+win+"' menu='false' quality='high' bgcolor='"+bg+"' width='"+w+"' height='"+h+"' name='"+name+"' align='middle' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />";
	document.write(flashStr);
}
</script>

<div id="processingLayer" style="width:100%;height:100%;left:0;top:0;position:absolute;display:none">
<table width="100%" height="100%" border="0" style="left:0;top:0;position:absolute;">
	<tr align="center" valign="center">
		<td><iframe name="processingFrame" width="381" height="171" frameborder="0" marginwidth="0" marginheight="0"></iframe></td>
	</tr>
</table>
<table width="100%" height="100%" border="0" style="left:0;top:0;position:absolute;">
	<tr align="center" valign="center">
		<td><script language="javascript">flashShow("/images/loading.swf", 381, 171, "", "", "transparent")</script></td>
	</tr>
</table>
</div>