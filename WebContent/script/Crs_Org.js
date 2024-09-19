	function createCourse()
	{
		document.all.selPlanYear.value = document.all.searchYear.value;
		document.forms[0].action = 'crsOrg.act?task=create';
		document.forms[0].submit();
	}

	function createCyber()
	{
		document.all.selPlanYear.value = document.all.searchYear.value;
		document.forms[0].action = 'crsOrg.act?task=create_cyber';
		document.forms[0].submit();
	}

	function modify(code, isCyber, modifyFlag)
	{
		document.all.searchCode.value = code;
		document.all.modifyFlag.value = modifyFlag;
	
		if(isCyber=='Y')
		{
			document.forms[0].action = 'crsOrg.act?task=modify_cyber';
		}
		else
		{
			document.forms[0].action = 'crsOrg.act?task=modify';
		}
		document.forms[0].submit();
	}

	function fixCourse()
	{
	  var year = document.forms[0].selPlanYear.value;
		var frm = $('fixForm');
		var i = 0;

		if(frm.check.length)
		{
			for(var i = 0; i<frm.check.length; i++)
			{
				if(frm.check[i].checked == true)
				{
					frm.isCheck[i].value = 'Y';
				}
			}

			frm.count.value = frm.check.length;
		}
		else
		{
			if(frm.check.checked == true)
			{
				frm.isCheck.value = 'Y';
			}

			frm.count.value = 1;
		}
		frm.year.value = year;

		frm.submit();
	}