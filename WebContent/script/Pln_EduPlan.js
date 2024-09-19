	function checkAll()
	{
		var max = Number(document.all.max.value);
		if(max == 0)
		{
			alert("조회된 데이터가 없습니다.");
			return;
		}
		
		if(max == 1)
		{
			if(document.all.checkbox.checked == false)
				document.all.checkbox.checked = true;
			else
				document.all.checkbox.checked = false;
		}
		else
		{
			if(document.all.checkbox[0].checked == false)
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = true;
			else
				for(var i=0; i<max; i++)
					document.all.checkbox[i].checked = false;
		}
	}
	
	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}

	function modify(code, isCyber)
	{
		var selPlanYear 	= document.forms[0].selPlanYear.value;
		var selCrsType 		= document.forms[0].selCrsType.value;
		var searchKeyword = document.forms[0].searchKeyword.value;
		
		if(isCyber=='Y')
		{
			document.location.href = 'eduPlan.act?task=modify_cyber&crsClumpCode='+code+'&selPlanYear='+selPlanYear+'&selCrsType='+selCrsType+'&searchKeyword='+searchKeyword;
		}
		else
		{
			document.location.href = 'eduPlan.act?task=modify&crsClumpCode='+code+'&selPlanYear='+selPlanYear+'&selCrsType='+selCrsType+'&searchKeyword='+searchKeyword;
		}		
	}

	function addCyber()
	{
		document.all.selPlanYear.value = document.all.searchYear.value;
		var selPlanYear = document.all.searchYear.value;
		var selCrsType 	= document.forms[0].selCrsType.value;
		
		document.location.href = "eduPlan.act?task=create_cyber&selPlanYear=" + selPlanYear + "&selCrsType=" +selCrsType;
	}

	function create()
	{
		document.all.selPlanYear.value = document.all.searchYear.value;
		var selPlanYear = document.all.searchYear.value;
		var selCrsType 	= document.forms[0].selCrsType.value;
		
		document.location.href = "eduPlan.act?task=create&selPlanYear=" + selPlanYear + "&selCrsType=" +selCrsType;
	}

	function copyPlan()
	{
		document.location.href = "eduPlan.act?task=create";
	}

	function addSurv()
	{
		var planYear = document.forms[0].selPlanYear.value;
		if(confirm(planYear+'년도 자료는 삭제됩니다. \n계속하시겠습니까?'))
		{
			var url = 'eduPlan.act?task=copy_plan&year='+planYear;
      var pars;

				new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onFailure: copyError,
                              onSuccess: copyComp

                        });
		}
	}

	function copyComp(request)
	{
		alert('저장이 완료되었습니다.');
		document.forms[0].submit();
	}

	function copyError(request)
	{
		alert('저장 중 오류가 발생하엿습니다. \\n관리자에게 문의하세요.');
	}
	
	function ozReport(gubun)
	{
	  var temp_jiphap = "";
	  var temp_cyber = "";
	  var max = document.all.max.value;
	 
	  document.forms[1].selPlanYear1.value =  document.all.selPlanYear.value;
	  document.forms[1].selCrsType1.value =  document.all.selCrsType.value;
	   
	  if(gubun == 1)
	  {
	  	//과정인쇄
	  	var check_count = 0; 	  	
	  	if(max == ""){
	  		alert('조회된 데이터가 없습니다.');
	  		return;
	  	} else if(max == 1)
	  	{
	  		//조회된 과정이 한 개일 경우 
	  		if(document.all.checkbox.checked == true)
	    	{
	    		check_count++;
	    		
	    		if(document.all.type1.value == '00003'){
	    			//사이버과정
	    			temp_cyber = temp_cyber + document.all.checkbox.value+ ",";
	    		} else {
	    			//집합과정
	    			temp_jiphap = temp_jiphap + document.all.checkbox.value+ ",";
	    		}				
	    	}
	  	}	else {
	  		//조회된 과정이 여러개일 경우
		   	for(var i=0; i < document.all.checkbox.length; i++)
		   	{    
					if(document.all.checkbox[i].checked == true)
		    	{	    		
						check_count++;
		    			
		    		if(document.all.type1[i].value == '00003')
		    		{
		    			//사이버과정
			    		temp_cyber	= temp_cyber + document.all.checkbox[i].value+ ",";	
		    		}	else {
		    			//집합과정
		    			temp_jiphap	= temp_jiphap + document.all.checkbox[i].value+ ",";		
		    		}
		    	}
		    }
		  }
	    document.all.check_array1.value = temp_jiphap.substring(0, temp_jiphap.length-1);   // 마지막 ','를 없애준다.(집합과정)
	    document.all.check_array2.value = temp_cyber.substring(0, temp_cyber.length-1);     // 마지막 ','를 없애준다.(사이버과정)
	  	
	  	if(check_count == 0)
	  	{
	    	alert("인쇄할 과정이 선택되어 있지 않습니다.\n인쇄할 과정을 선택하여 주시기 바랍니다..");
	    	return false;
	   	}  
	   
	   	document.forms[1].report.value = "crsInfo";    
	  } else {
	  	//과정별 교육훈련계획 인쇄
	  	document.forms[1].report.value = "eplan";
		}	
		
		var str 
	 	var winl = (screen.width - 700) / 2;
	 	var wint = (screen.height - 750) / 2;
	 	str = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=710,height=550,top="+wint+",left="+winl;  	
		window.open('','popup', str);
		document.forms[1].action = "ozMenu.act"
		document.forms[1].target = "popup";			
		document.forms[1].submit();		
		document.forms[1].target = "";
	}