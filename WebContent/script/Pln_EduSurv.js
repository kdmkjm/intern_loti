	// ���踶�� ��ư Ŭ����
	function survFinish()
	{
	  var selPlanYear = document.forms[0].selPlanYear.value;
	  
	  if(confirm(selPlanYear+'�⵵ �������� ���踦 �����Ͻðڽ��ϱ�?'))
	  {
			document.location.href = "/plnSurv.act?task=finish&selPlanYear="+selPlanYear;
	  }
	}
	
	// ���踶�� ��ư Ŭ����
	function survCancel()
	{
	  var selPlanYear = document.forms[0].selPlanYear.value;
	  
	  if(confirm(selPlanYear+'�⵵ ��������  �������� �Ͻðڽ��ϱ�?'))
	  {
			document.location.href = "/plnSurv.act?task=cancel&selPlanYear="+selPlanYear;
	  }
	}	
	
	// ���⵵ �ڷ� ��������
	function copySurvey()
	{

		var year = document.forms[0].selPlanYear.value;

		if(confirm(year+'�⵵ �ڷ�� ��� �����˴ϴ�. \n����Ͻðڽ��ϱ�?'))
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

	//���� �ٿ�ε�
	function excelDown()
	{
		var form = document.forms[0];
		var url = '/plnSurv.act?task=excel&';
    var pars = Form.serialize(form);
    document.location.href = url+pars;
	}
	
	// ������ư Ŭ����
	function modifySurv(row)
	{ 
		var max = document.all.max.value;
		var chptCount = "";
		var apvHour = "";
		
		// ��ȸ�Ǽ��� �ϳ��� ��
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
		// ��ȸ�Ǽ��� �������� ��
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

	// ���� ���μ���
	function saveSurv()
	{
		var frm = document.forms[1];

		if(frm.crsClumpName.value == '')
		{
			alert('�������� �Է��ϼ���');
			frm.crsClumpName.focus();
			return;
		}
		var courseNameLength = byteCheck(frm.crsClumpName.value)
		if(courseNameLength > 70)
		{
			alert('�������� 70�ڸ� �ʰ��Ͽ� �Է��� �� �����ϴ�.\n���:�ѱ�(2)+����(1)+Ư������(1)\n���� �Էµ� ���� : ' + courseNameLength);
			frm.crsClumpName.focus();
			return;
		}
		if(document.forms[0].selCrsType.value == '')
		{
			alert('�з��� �Է��ϼ���');
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

	// ����Ϸ�
	saveComp = function(request)
	{
		alert('������ �Ϸ�Ǿ����ϴ�.');
		document.forms[0].submit();

	}

	//���� ����
	reportError = function(request)
	{
		alert('���� �� ������ �߻��Ͽ����ϴ�. \\n�����ڿ��� �����ϼ���.');
		document.forms[0].submit();
	}

	function deleteSurv(crsClumpCode)
	{
		if(confirm('�����Ͻðڽ��ϱ�?'))
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

	// �����Ϸ�
	function deleteComp(request)
	{
		alert('������ �Ϸ�Ǿ����ϴ�.');
		document.forms[0].submit();

	}


	// �ű� Ŭ���� �Է�â �ʱ�ȭ
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

	// ������ ó�� ������� �⺻������ ��ȸ
	function searchList(key)
	{
		if(key=="move")
		{
			document.forms[0].submit();
		}
	}