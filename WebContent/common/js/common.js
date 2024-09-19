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

	function  replace( target, replacee, replacer){
		/////////////////////////////////////////////////////
		// String 의 문자열을 다른 문자열로 치완한다.
		 var ret = "";
		 retStr = "" + target;

		 while (retStr.indexOf(replacee)>-1) {
		  pos= retStr.indexOf(replacee);
		  retStr = "" + (retStr.substring(0, pos) + replacer + retStr.substring((pos + replacee.length), retStr.length));
		 }
		 return retStr;
	}
	function div_size(num) 
	{
		var size = parent.document.all.iframe_Main.height;
		mainList.style.height = size - num;
	}
	// DIV 사이즈  조정
	function tresize(divTop)
	{
		var fHeight = parent.document.all.iframe_Main.height; 	// Frmae 높이
		var scHeight = mainList.scrollHeight; 					// Scroll 이 발생할 최소 높이
		var divHeight = replace(mainList.style.height,'px','');	//Div 높이

		if(divHeight=='') divHeight=0;

		if(fHeight < 300) return; // Div 최소 사이즈 지정
		if(fHeight > scHeight + divTop) // Frame 사이즈가 더 클경우
		{
		 	mainList.style.height = scHeight+'px';

		}
		else
		{
			mainList.style.height = (fHeight - divTop)+'px';

		}
	}

	// DIV 사이즈  조정
	function tresize_xyScroll(divTop)
	{
		var fHeight = parent.document.all.iframe_Main.height; 	// Frmae 높이
		var scHeight = Number(mainList.scrollHeight) + 17; 					// Scroll 이 발생할 최소 높이
		var divHeight = replace(mainList.style.height,'px','');	//Div 높이

		if(divHeight=='') divHeight=0;

		if(fHeight < 300) return; // Div 최소 사이즈 지정
		if(fHeight > scHeight + divTop) // Frame 사이즈가 더 클경우
		{
		 	mainList.style.height = scHeight+'px';

		}
		else
		{
			mainList.style.height = (fHeight - divTop)+'px';

		}
	}
	
	
	// DIV 사이즈  조정(팝업창)
	function tresize_pop(MainHeight, divTop)
	{
		var fHeight = MainHeight; 											// Frmae 높이
		var scHeight = mainList.scrollHeight; 					// Scroll 이 발생할 최소 높이
		var divHeight = replace(mainList.style.height,'px','');	//Div 높이

		if(divHeight=='') divHeight=0;

		if(fHeight < 300) return; // Div 최소 사이즈 지정
		if(fHeight > scHeight + divTop) // Frame 사이즈가 더 클경우
		{
		 	mainList.style.height = scHeight+'px';

		}
		else
		{
			mainList.style.height = (fHeight - divTop)+'px';
		}
	}

	// DIV 사이즈  조정
	function double_tresize(divTop)
	{

		var fHeight = parent.document.all.iframe_Main.height; 	// Frmae 높이
		var scHeight = mainList1.scrollHeight; 					// Scroll 이 발생할 최소 높이
		var divHeight = replace(mainList1.style.height,'px','');	//Div 높이

		if(divHeight == '') divHeight = 0;

		if(fHeight < 300) return; // Div 최소 사이즈 지정
		if(fHeight > scHeight + divTop) // Frame 사이즈가 더 클경우
		{
		 	mainList1.style.height = scHeight + 'px';
		 	mainList2.style.height = scHeight + 'px';
		}
		else
		{
			mainList1.style.height = (fHeight - divTop) + 'px';
			mainList2.style.height = (fHeight - divTop) + 'px';
		}
	}

	// DIV 사이즈  조정
	function triple_tresize(divTop, obj1, obj2, obj3)
	{
		var fHeight = parent.document.all.iframe_Main.height; 	// Frmae 높이
		var scHeight1 = 150 + obj1.scrollHeight; 					// Scroll 이 발생할 최소 높이
		var scHeight2 = 150 + obj2.scrollHeight; 					// Scroll 이 발생할 최소 높이
		var scHeight3 = 150 + obj3.scrollHeight; 					// Scroll 이 발생할 최소 높이
		var divHeight1 = replace(mainList1.style.height,'px','');	//Div 높이
		var divHeight2 = replace(mainList2.style.height,'px','');	//Div 높이
		var divHeight3 = replace(mainList3.style.height,'px','');	//Div 높이

		if(divHeight1 == '') divHeight1 = 0;
		if(divHeight2 == '') divHeight2 = 0;
		if(divHeight3 == '') divHeight3 = 0;

		if(fHeight < 300) return; // Div 최소 사이즈 지정
		
		if(fHeight > scHeight1 + divTop) // Frame 사이즈가 더 클경우
		 	mainList1.style.height = scHeight1 + 'px';
		else
			mainList1.style.height = (fHeight1 - divTop) + 'px';
			
		if(fHeight > scHeight2 + divTop) // Frame 사이즈가 더 클경우
		 	mainList2.style.height = scHeight2 + 'px';
		else
			mainList2.style.height = (fHeight2 - divTop) + 'px';
			
		if(fHeight > scHeight3 + divTop) // Frame 사이즈가 더 클경우
		 	mainList3.style.height = scHeight3 + 'px';
		else
			mainList3.style.height = (fHeight3 - divTop) + 'px';
	}

		// 앞뒤로 빈공백을 없앤다.
	String.prototype.trim = function()
	{
		return this.replace(/(^\s*)|(\s*$)/gi, "");
	}

	// 엔터키가 들어오면 텝키를 입력한것처럼 한다.
	function key_entertotab()
	{
		if (event.keyCode == '13') event.keyCode = '9';
	}

	// 숫자만 입력가능 하도록 하였다. 역시 엔터키는 텝키다.
	function key_num()	// BackSpace, DEL, TAB, 0 .. 9
	{
		key_entertotab();
		if (!
			(event.keyCode == '8' || event.keyCode == '9' || event.keyCode == '46' ||
			 event.keyCode == '39' || event.keyCode == '37' ||
			(event.keyCode >= '48' && event.keyCode <= '57') ||
			(event.keyCode >= '96' && event.keyCode <= '105'))
		   )
		{ event.returnValue = false; }
	}
	// 숫자만 입력가능하도록 한다..
	function only_number()	// BackSpace, DEL, TAB, 0 .. 9
	{
		if (event.keyCode < 48 || event.keyCode > 57)
		{
			event.returnValue = false;
		}
	}


	// 숫자에다가 보너스로 '-'까지 입력되도록 하였다.
	// 자판의 '-'는 코드가 189고 계산기패드의 '-'코드는 109다. 짜증나서 둘다 넣었다.
	function key_num_minus()	// BackSpace, DEL, TAB, -, 0 .. 9
	{
		key_entertotab();
		if (!
			(event.keyCode == '8' || event.keyCode == '9' || event.keyCode == '46' ||
			 event.keyCode == '109' || event.keyCode == '189' ||		// '-'가 키가 먼지 모름.
	  		 event.keyCode == '39' || event.keyCode == '37' ||
			(event.keyCode >= '48' && event.keyCode <= '57') ||
			(event.keyCode >= '96' && event.keyCode <= '105') )
		   )
		{ event.returnValue = false; }
	}

	//팝업위치 지정(중앙에 뜨기)
	// url:url 주소
	// target:target 지정
	//spec:창 width,height, top,left 를 제외한 속성
	//wid:창 width
	//hei:창 height
	function openWinSetPo(url,target,spec,wid,hei) {
		LeftPosition=screen.width/2-(wid/2);
		TopPosition=screen.height/2-(hei/2);

		window.open(url,target,spec+', width='+wid+',height='+hei+',top='+TopPosition+',left='+LeftPosition)
	}

	/*--------------------------------------------------
	  기능   : Check 주민등록번호 RETURN T/F
	  INPUT  : toCheck
	  RETURN : true  -> 올바른 번호
	           false ->
	----------------------------------------------------*/
	function checkJumin(jumin) {
			toCheck = jumin.value.replace('-','');
	    var isJumin = true;
	    if ( toCheck == '' ) {
	          return true;
	    } else if ( toCheck.length < 13 || toCheck.length > 13 ) {
	          return false;
	    } else if ( toCheck.substring(2,3) > "1" || toCheck.substring(6,7) > "2" || toCheck.substring(6,7) == "0" ) {
	          return false;
	    } else if ( toCheck.substring(2,3) == "1" && toCheck.substring(3,4) > "2" ){
	          return false;
	    } else if (!(toCheck.substring(4,6) >= "01" && toCheck.substring(4,6) <= "31")){
	          return false;
	    }
	   for (j = 0; isJumin && (j < toCheck.length); j++) {
	       if ( ( (toCheck.substring(j,j+1) < "0") || (toCheck.substring(j,j+1) > "9")) ) {
	           isJumin = false;
	       }
	   }

	  var a1=toCheck.substring(0,1)
	  var a2=toCheck.substring(1,2)
	  var a3=toCheck.substring(2,3)
	  var a4=toCheck.substring(3,4)
	  var a5=toCheck.substring(4,5)
	  var a6=toCheck.substring(5,6)
	  var check_digit=a1*2+a2*3+a3*4+a4*5+a5*6+a6*7
	  var b1=toCheck.substring(6,7)
	  var b2=toCheck.substring(7,8)
	  var b3=toCheck.substring(8,9)
	  var b4=toCheck.substring(9,10)
	  var b5=toCheck.substring(10,11)
	  var b6=toCheck.substring(11,12)
	  var b7=toCheck.substring(12,13)

	  var check_digit=check_digit+b1*8+b2*9+b3*2+b4*3+b5*4+b6*5
	  check_digit = check_digit%11
	  check_digit = 11 - check_digit
	  check_digit = check_digit%10
	  if (check_digit != b7){
	   isJumin = false;
	  }

	  return isJumin;
	}

	//주민번호 체크후 메세지 활성화
	function juminMsg(jumin){
		if(!checkJumin(jumin)){
			if(confirm('주민등록번호가 계산식에 맞지 않습니다.\n사용하시겠습니까?'))	{
				return;
			} else {
				jumin.value = '';
				jumin.focus();
			}
		}
	}
	//주민번호 앞자리(6)가 입력되면 자동으로 -입력
	function setdash(jumin){

		if(jumin.value.length == 6 && event.keyCode != '8'){
			jumin.value = jumin.value + '-';
		}
	}

	//전화번호 체크
	function check_tel(obj){
		var cellNumber = obj.value;

		if(cellNumber != ''){
			temp = cellNumber.substring(0,3);
			switch (temp)
			{
				case '011': case '010': case '016':
				case '017': case '018': case '019':
				 return;
				default :
				 alert('올바른 휴대전화번호를 입력하세요!');
				 obj.value = '';
				 obj.focus();
			}
		} else {
			return;
		}
	}


	/********************************************************************************************/
	/**  URI Encoding Function Add
	/********************************************************************************************/
	uriEncode = function (data) {
	    if(data != "") {
	        var encdata = '';
	        var datas = data.split('&');

	        for(i=0;i<datas.length;i++) {
	            var dataq = datas[i].split('=');
	            if (i != 0) {
	                encdata += '&';
	            }
	            encdata += encodeURIComponent(dataq[0])+'='+encodeURIComponent(dataq[1]);
	        }
	    } else {
	        encdata = "";
	    }
	    return encdata;
	}
	
	//input태그 text타입의 입력 글자수 제한하기
	function checkLength(objname, maxlength)
	{
		var objstr = objname.value;
		var objstrlen = objstr.length;
		
		var maxlen = maxlength;
		var i = 0;
		var bytesize = 0;
		var strlen = 0;
		var onechar = "";
		var objstr2 = "";
		
		for(i = 0; i < objstrlen; i++)
		{
			onechar = objstr.charAt(i);
			if(escape(onechar).length > 4)
			{
				bytesize +=2;
			}else{
				bytesize++;
			}
			
			if(bytesize <= maxlen)
			{
				strlen = i+1;
			}
		}
		
		if(bytesize > maxlen)
		{
			alert("허용된 문자열의 최대값("+maxlen+")을 초과하였습니다.");
			objstr2 = objstr.substr(0, strlen);
			objname.value = objstr2;
		}
		objname.focus();
	}
	
	
	
	/**
	* 천단위 콤마 표시
	* @param n
	* @return
	*/
	function setComma(n)
	{ 
		var commaNum= Number(String(n).replace(/\..*|[^\d]/g,"")).toLocaleString().slice(0,-3);
		return commaNum;
	}

	/**
	* 천단위 콤마 제거
	* @param n
	* @return
	*/
	function removeComma(n)
	{
 		str = parseInt(n.replace(/,/g, ""));
 		return str;  
	}
	
	/*
	 * 설 명 : 해당 문자열의 바이트수를  체크한다.
	 * 인자1 : str - str
	 * 리턴값 : 해당 문자열의 바이트수
	 */
	function byteCheck(str) {
		var tmpStr;
		var temp = 0;
		var onechar;
		var tcount;
		tcount = 0;
		tmpStr = new String(str);
		temp = tmpStr.length;
		for (var k = 0; k < temp; k++) {
			onechar = tmpStr.charAt(k);
			if (escape(onechar).length > 4) {
				tcount += 2;
			} else {
				tcount++;
			}
		}
		return tcount;
	}