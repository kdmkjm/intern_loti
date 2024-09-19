//$.noConflict();
	function newProf()
	{
		document.forms[0].professorNo.value = "";
		document.forms[0].action = 'prfBaseInfo.act?task=create';
		document.forms[0].submit();
	}
	function modifyProf(num)
	{
		document.all.professorNo.value = num;

		document.forms[0].action = 'prfBaseInfo.act?task=modify';
		document.forms[0].submit();
	}
	function showLectList(num)
	{
		document.all.professorNo.value = num;
		document.forms[0].action = 'prfBaseInfo.act?task=lecInfo';
		document.forms[0].submit();
	}

	function showSatis(num, courseCode)
	{
		document.all.professorNo.value = num;
		document.all.courseCode.value = courseCode;
		document.forms[0].action = 'prfSatis.act?task=info';
		document.forms[0].submit();
	}

	String.prototype.trim = function()
	{
	 return this.replace(/(^\s*)|(\s*$)/gi, "");
	}
	// �˻�
	function doSearch(frm)
	{
		var profLevel = frm.searchProfLevel.value;
		var jobCode = frm.searchGradeCode.value;
		var profName 	= frm.searchName.value.trim();
		var searchCourseName = frm.searchCourseName.value.trim();
		var searchSubjName = frm.searchSubjName.value.trim();
		var searchFromDate = frm.searchFromDate.value.trim();
		var searchToDate = frm.searchToDate.value.trim();
		var searchLecType = frm.searchLecType.value.trim();
		var areaCode = frm.searchAreaCode.value;

		if(profLevel == "" && jobCode == "" && profName == "" && searchCourseName == '' && areaCode == ""
			&& searchFromDate == '' && searchToDate == '' && searchSubjName == '' && searchLecType == '')
		{
//			alert("�˻� ������ �Է��ϼ���."); frm.searchName.focus(); return;
			if(!confirm("�˻������� ��ü�� �����Ͻø� �ð��� ���� �ҿ�� �� �ֽ��ϴ�.\n����Ͻðڽ��ϱ�?")) {
				return;
			}
		}

		frm.action = "prfBaseInfo.act?task=list";
		frm.submit();
	}
	// ����
	function doExcel(frm)
	{
		var profLevel = frm.searchProfLevel.value;
		var jobCode = frm.searchGradeCode.value;
		var profName 	= frm.searchName.value.trim();
		var searchCourseName = frm.searchCourseName.value.trim();
		var searchSubjName = frm.searchSubjName.value.trim();
		var searchFromDate = frm.searchFromDate.value.trim();
		var searchToDate = frm.searchToDate.value.trim();
		var searchLecType = frm.searchLecType.value.trim();
		var areaCode = frm.searchAreaCode.value;

		if(profLevel == "" && jobCode == "" && profName == "" && searchCourseName == '' && areaCode == ""
			&& searchFromDate == '' && searchToDate == '' && searchSubjName == '' && searchLecType == '')
		{
//			alert("�˻� ������ �Է��ϼ���."); frm.searchName.focus(); return;
			if(!confirm("�˻������� ��ü�� �����Ͻø� �ð��� ���� �ҿ�� �� �ֽ��ϴ�.\n����Ͻðڽ��ϱ�?")) {
				return;
			}
		}
		frm.action = "prfBaseInfo.act?task=excelInfo";
		frm.submit();
	}