	// 집계마감 버튼 클릭시
	function survFinish()
	{
	  var selPlanYear = document.forms[0].selPlanYear.value;
	  
	  if(confirm(selPlanYear+'년도 수요조사 집계를 마감하시겠습니까?'))
	  {
			document.location.href = "/plnSurv.act?task=finish&selPlanYear="+selPlanYear;
	  }
	}
	
	// 집계마감 버튼 클릭시
	function survCancel()
	{
	  var selPlanYear = document.forms[0].selPlanYear.value;
	  
	  if(confirm(selPlanYear+'년도 수요조사  마감해제 하시겠습니까?'))
	  {
			document.location.href = "/plnSurv.act?task=cancel&selPlanYear="+selPlanYear;
	  }
	}	
	
	// 전년도 자료 가져오기
	function copySurvey()
	{

		var year = document.forms[0].selPlanYear.value;

		if(confirm(year+'년도 자료는 모두 삭제됩니다. \n계속하시겠습니까?'))
		{
				var url = '/plnSurv.act';
      			var pars = 'task=copy&year='+year;

				new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onFailure: reportError,
                              onComplete: saveComp

                        });
		}
	}

	//엑셀 다운로드
	function excelDown()
	{
		var form = document.forms[0];
		var url = '/plnSurv.act?task=excel&';
    var pars = Form.serialize(form);
    document.location.href = url+pars;
	}
	
	// 수정버튼 클릭시
	function modifySurv(row)
	{ 
		var max = document.all.max.value;
		var chptCount = "";
		var apvHour = "";
		
		// 조회건수가 하나일 때
		if(max == 1)
		{
			$('crsClumpCode').value = document.all.crsClumpCd.value;
	
			$('crsClumpName').value = document.all.cellCrsName.innerHTML.replace("&nbsp;", "").replace("&amp;", "&");
			$('eduTarget').value 		= document.all.cellEduTarget.innerHTML.replace("&nbsp;", "").replace("&amp;", "&");
			$('dayCount').value 		= document.all.cellDayCount.innerHTML.replace("&nbsp;", "");
			$('stdNumber').value 		= document.all.cellStdNumber.innerHTML.replace("&nbsp;", "");
			
			if(document.all.cellChptCount.innerHTML != "&nbsp;")
				chptCount = document.all.cellChptCount.innerHTML;
			$('chptCount').value 		= chptCount;
			
			if(document.all.cellApvHour.innerHTML != "&nbsp;")
				apvHour = document.all.cellApvHour.innerHTML;
			$('apvHour').value 			= apvHour;
	
			var type = document.all.type.value;
		}
		// 조회건수가 여러개일 때
		else
		{
			row = row-1;
			$('crsClumpCode').value = document.all.crsClumpCd[row].value;
	
			$('crsClumpName').value = document.all.cellCrsName[row].innerHTML.replace("&nbsp;", "").replace("&amp;", "&");
			$('eduTarget').value 		= document.all.cellEduTarget[row].innerHTML.replace("&nbsp;", "").replace("&amp;", "&");
			$('dayCount').value 		= document.all.cellDayCount[row].innerHTML.replace("&nbsp;", "");
			$('stdNumber').value 		= document.all.cellStdNumber[row].innerHTML.replace("&nbsp;", "");
			
			if(document.all.cellChptCount[row].innerHTML != "&nbsp;")
				chptCount = document.all.cellChptCount[row].innerHTML;
			$('chptCount').value 		= chptCount;
			
			if(document.all.cellApvHour[row].innerHTML != "&nbsp;")
				apvHour = document.all.cellApvHour[row].innerHTML;
			$('apvHour').value 			= apvHour;
	
			var type = document.all.type[row].value;
		}
		document.forms[0].selCrsType.value = type;
		
	}

	// 저장 프로세스
	function saveSurv()
	{
		var frm = document.forms[1];

		if(frm.crsClumpName.value == '')
		{
			alert('과정명을 입력하세요');
			frm.crsClumpName.focus();
			return;
		}
		var courseNameLength = byteCheck(frm.crsClumpName.value)
		if(courseNameLength > 70)
		{
			alert('과정명은 70자를 초과하여 입력할 수 없습니다.\n계산:한글(2)+영어(1)+특수문자(1)\n현재 입력된 길이 : ' + courseNameLength);
			frm.crsClumpName.focus();
			return;
		}
		if(document.forms[0].selCrsType.value == '')
		{
			alert('분류를 입력하세요');
			document.forms[0].selCrsType.focus();
			return;
		}

		frm.crsType.value = document.forms[0].selCrsType.value;


		var url = frm.action;
      	var pars = Form.serialize(frm);

		new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onFailure: reportError,
                              onSuccess: saveComp

                              });

		//frm.submit();
	}

	// 저장완료
	saveComp = function(request)
	{
		alert('저장이 완료되었습니다.');
		document.forms[0].submit();

	}

	//저장 실패
	reportError = function(request)
	{
		alert('저장 중 오류가 발생하였습니다. \\n관리자에게 문의하세요.');
		document.forms[0].submit();
	}

	function deleteSurv(crsClumpCode)
	{
		if(confirm('삭제하시겠습니까?'))
		{
			var url = 'plnSurv.act'
			var pars = 'task=delete&crsClumpCode='+crsClumpCode;
			new Ajax.Updater(
						 '',
                           url,
                            {
                              method: 'post',
                              parameters: pars,
                              evalScripts: true,
                              onSuccess: deleteComp

                              });


		}
	}

	// 삭제완료
	function deleteComp(request)
	{
		alert('삭제가 완료되었습니다.');
		document.forms[0].submit();

	}


	// 신규 클릭시 입력창 초기화
	function formReset()
	{
		$('crsClumpName').value = "";
		$('eduTarget').value = "";
		$('dayCount').value = "";
		//$('turnCount').value = "";
		$('stdNumber').value = "";
		$('chptCount').value = "";
		$('apvHour').value = "";

		$('insert').style.display = "";
		$('update').style.display = "none";
	}
	
	function excelUpload()
	{
		var selOrganCode = document.forms[0].selOrganCode.value;
		var selPlanYear  = document.forms[0].selPlanYear.value;
		document.location.href = "/plnSurv.act?task=excel_view&selOrganCode="+selOrganCode+"&selPlanYear="+selPlanYear;
	}

	// 페이지 처음 열릴경우 기본값으로 조회
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}